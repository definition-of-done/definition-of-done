# Human Actions

Everything waiting on a human (you) right now, with exact steps. Ordered by urgency.
When you finish an item, either comment on the linked issue or just say so in session —
the agent records it. This file is kept current; delete rows as they land.

| # | Action | Where | Urgency |
| --- | --- | --- | --- |
| 1 | Claim the `definition-of-done` identity (GitHub, PyPI, npm) | [issue #5](https://github.com/pappes/definition-of-done/issues/5) | **Now** — free ≠ ours, squatting risk |
| 2 | Run 5 market-validation conversations | [issue #7](https://github.com/pappes/definition-of-done/issues/7) | Before Stage 4 investment |
| 3 | Stage 3 signoff — behaviour specs | Stage 3 issue (coming) | When requested |
| 4 | Signoff at every later stage gate | Each stage issue | Recurring |

---

## 1. Claim the identity (issue #5)

Name was verified free on 2026-11-06. Claim all three today; each takes minutes.

### a. GitHub handle/org `definition-of-done`

1. Confirm still free: open <https://github.com/definition-of-done> — a **404** means free.
2. Create a free org: <https://github.com/organizations/plan> → **Free** plan →
   organization name `definition-of-done`, contact email yours.
3. Later (not now): transfer or mirror this repo under the org when you want public
   presence; keep `pappes/definition-of-done` as-is until then.

### b. PyPI placeholder

1. Register an account: <https://pypi.org/account/register/> (use your normal email).
2. Confirm free: <https://pypi.org/pypi/definition-of-done/json> → **404** means free.
3. PyPI has no name reservation — you must upload a placeholder to block squatters:

   ```bash
   mkdir /tmp/dod-placeholder && cd /tmp/dod-placeholder
   cat > pyproject.toml <<'EOF'
   [project]
   name = "definition-of-done"
   version = "0.0.1"
   description = "Placeholder reservation for the definition-of-done CLI (real releases start at 0.1.0). Repo: https://github.com/pappes/definition-of-done"
   requires-python = ">=3.12"
   EOF
   echo "# definition-of-done" > README.md
   mkdir src/definition_of_done && touch src/definition_of_done/__init__.py
   pipx run build   # or: python -m pip install build && python -m build
   pipx run twine upload dist/*   # uses an API token from pypi.org/account -> API tokens
   ```

   Note: PyPI never lets a deleted name be reused, and `0.0.1` can't be re-uploaded —
   that's fine, real releases start at `0.1.0`.

### c. npm placeholder

1. Sign up: <https://www.npmjs.com/signup>.
2. Confirm free: <https://registry.npmjs.org/definition-of-done> → **404** means free.
3. Publish a README-only placeholder:

   ```bash
   mkdir /tmp/dod-npm && cd /tmp/dod-npm
   npm init -y   # set name "definition-of-done", version "0.0.1"
   npm login
   npm publish   # unscoped names are public by default
   ```

   Same caveat: npm won't let the name be reused after unpublish, so `0.0.1` as a
   reservation is permanent and harmless; the real shim starts at `0.1.0`.

### d. Decide the naming pair (needed before b/c)

Proposed: package name `definition-of-done` on both registries, CLI command `dod`
(the command name is independent of the package name). Re-verified free 2026-11-07:
GitHub handle, PyPI, and npm all 404. `dod` itself is **taken** on PyPI — doesn't
matter unless you want that exact package name. Reply here or on #5 to confirm.

---

## 2. Market validation — 5 conversations (issue #7)

Goal: test the REQ-0001 value story before we build the runner. 5 conversations,
15–20 min each. Mix: **2–3 vibe coders** (Cursor/Copilot/Lovable-style users) and
**1–2 skeptical engineers** who'd never trust AI output without checks.

Pitch to open with (then shut up and listen):
> "An open-source agent workforce that takes you from vibe-coded prototype to
> production-grade software — requirements, tests, review — with human signoff gates
> at every stage, so you can actually maintain what you generated. Works with any
> agent harness."

Confirm each checklist box from the issue:

- [ ] They confirm the prototype-to-zombie-app problem (ask: "what broke in your
      weekend project and could you fix it?")
- [ ] They can repeat the difference from LangChain/Spec Kit/Cursor in one sentence
- [ ] Star/waitlist/pilot signal — ask directly: "would you star or try this?"
- [ ] At least one skeptical engineer calls artifact-gates **credible** (push on:
      "gates are deterministic checks, agents never auto-pass a stage")
- [ ] At least one vibe coder names a **concrete app they could not fix**

Log results as a comment on [#7](https://github.com/pappes/definition-of-done/issues/7)
(one line per person: persona, reaction, quote). If someone flatly contradicts
REQ-0001, say so in the comment — we open a new issue rather than editing the
approved REQ.

---

## 3. Stage 3 signoff — behaviour specs (upcoming)

The agent is writing `specs/UC-0001.feature` … `specs/UC-0006.feature` (Gherkin
behaviour contracts derived from the UCs you just approved) and will post them in a
Stage 3 issue with a signoff request.

What to review (~10 min): each feature file's scenarios should read like the approved
UC scenarios — happy path, edge cases, failure modes — phrased as observable
behaviour (Given/When/Then), not implementation.

To sign off: comment `approved` on the Stage 3 issue.

---

## 4. Every later stage gate

Standing rule (AGENTS.md §5): no stage advances without human signoff. Expect a
signoff request on each stage issue (architecture extraction #10, gate runner #8,
templates #6, …). Same drill: review the linked artifacts, comment `approved` (or
objections — they get fixed and re-requested).
