#!/usr/bin/env python3
"""Stage 3 gate (ARCHITECTURE.md §5): feature files parse; each UC has
happy + edge + failure scenarios. Deterministic, no network, no LLM.
Throwaway check for Stage 3 signoff; the permanent runner is issue #8."""
import glob
import re
import sys

from gherkin.parser import Parser
from gherkin.token_scanner import TokenScanner

KINDS = {"happy", "edge", "failure"}
errors = []
specs = sorted(glob.glob("specs/UC-*.feature"))

if len(specs) != 6:
    errors.append(f"expected 6 spec files (one per UC), found {len(specs)}")

covered_ucs = set()
for path in specs:
    with open(path, encoding="utf-8") as f:
        text = f.read()

    # 1. parses with the official Cucumber parser
    try:
        doc = Parser().parse(text)
    except Exception as e:  # noqa: BLE001 — any parse failure is a gate failure
        errors.append(f"{path}: does not parse: {e}")
        continue

    # 2. front-matter block names the UC it specifies
    m = re.search(r"^# uc: (UC-\d{4})$", text, re.MULTILINE)
    if not m:
        errors.append(f"{path}: missing '# uc: UC-xxxx' front-matter")
        continue
    uc = m.group(1)
    covered_ucs.add(uc)
    if not path.endswith(f"{uc}.feature"):
        errors.append(f"{path}: front-matter uc {uc} does not match filename")

    # 3. collect scenarios (Scenario and Scenario Outline both arrive as 'scenario')
    scenarios = [c["scenario"] for c in doc["feature"]["children"] if "scenario" in c]
    if not scenarios:
        errors.append(f"{path}: no scenarios")
        continue

    kinds_seen = set()
    for sc in scenarios:
        tags = {t["name"].lstrip("@") for t in sc["tags"]}
        id_tags = {t for t in tags if re.fullmatch(rf"{uc}-S\d+", t)}
        kind_tags = tags & KINDS
        if len(id_tags) != 1:
            errors.append(f"{path}: scenario '{sc['name']}' needs exactly one "
                          f"@{uc}-Sn tag, found {sorted(id_tags) or 'none'}")
        if len(kind_tags) != 1:
            errors.append(f"{path}: scenario '{sc['name']}' needs exactly one of "
                          f"@happy/@edge/@failure, found {sorted(kind_tags) or 'none'}")
        kinds_seen |= kind_tags
        steps = [s["keyword"].strip() for s in sc["steps"]]
        if not any(k in ("Given", "When", "Then") for k in steps):
            errors.append(f"{path}: scenario '{sc['name']}' lacks Given/When/Then")

    missing = KINDS - kinds_seen
    if missing:
        errors.append(f"{path}: UC {uc} missing scenario kinds: {sorted(missing)}")

expected = {f"UC-{i:04d}" for i in range(1, 7)}
for uc in sorted(expected - covered_ucs):
    errors.append(f"no spec file covers {uc}")

if errors:
    print("GATE FAIL")
    for e in errors:
        print(f"  - {e}")
    sys.exit(1)
print(f"GATE PASS: {len(specs)} specs parse, all cover happy+edge+failure, "
      f"all scenarios tagged and structured")
