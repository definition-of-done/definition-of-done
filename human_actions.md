# Human Actions

Everything waiting on a human (you) right now, with exact steps. Ordered by urgency.
When you finish an item, either comment on the linked issue or just say so in session —
the agent records it. This file is kept current; delete rows as they land.

| # | Action | Where | Urgency |
| --- | --- | --- | --- |
| 1 | Run 5 market-validation conversations | [issue #7](https://github.com/pappes/definition-of-done/issues/7) | Before Stage 4 investment |
| 2 | Signoff at every later stage gate | Each stage issue | Recurring |

---

## 1. Market validation — 5 conversations (issue #7)

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

## 2. Every later stage gate

Standing rule (AGENTS.md §5): no stage advances without human signoff. Expect a
signoff request on each stage issue (architecture extraction #10, gate runner #8,
templates #6, …). Same drill: review the linked artifacts, comment `approved` (or
objections — they get fixed and re-requested).

---

## Completed

- **2026-11-07 — Identity claimed (issue #5 closed).** GitHub org `definition-of-done`
  created · PyPI `definition-of-done` 0.0.1.dev0 placeholder live · npm
  `definition-of-done` 0.0.1 placeholder published · session-shared PyPI API token
  revoked. Naming pair locked in practice: package `definition-of-done` on PyPI/npm,
  CLI command `dod`. Optional whenever: transfer `pappes/definition-of-done` into the
  org (Settings → General → Transfer ownership; GitHub redirects old URLs).
