# Human Actions

Everything waiting on a human (you) right now, with exact steps. Ordered by urgency.
When you finish an item, either comment on the linked issue or just say so in session —
the agent records it. This file is kept current; delete rows as they land.

| # | Action | Where | Urgency |
| --- | --- | --- | --- |
| 1 | Stage-4 signoff — review HLD-0001/0002 + DD-0001..0005, comment `approved` on #10 — **nothing pending on the agent side; the ball is yours** | [issue #10](https://github.com/definition-of-done/definition-of-done/issues/10) | **Now — blocks all Stage-5 work** |
| 2 | Run the remaining 4 market-validation conversations — **1 done** (steve, 3/5 signals; see `market-surveys/steve survey`) | [issue #7](https://github.com/definition-of-done/definition-of-done/issues/7) | Before Stage 5 investment |
| 3 | Signoff at every later stage gate | Each stage issue | Recurring |

---

## 1. Stage-4 signoff (issue #10)

**Hold lifted:** the review feedback that paused this request —
[#28](https://github.com/definition-of-done/definition-of-done/issues/28), error messages
must carry 3 bits for the human (problem / cause / next action) — is complete and closed:
the standard is normative in HLD-0001 §9.3, every defined message now names what/why/
next-step, and the full audit is on #28. ([#27](https://github.com/definition-of-done/definition-of-done/issues/27),
the regex readability fix, landed in `733bb82` and is closed.)

All agent-side work is done and re-verified (repo clean, spec gate exits 0). The set to
review: `docs/HLD-0001.md`, `docs/HLD-0002.md`, `docs/DD-0001.md` … `docs/DD-0005.md` —
it passed self-review plus two independent subagent reviews; every finding was fixed
(commit history and review notes are on the issue).

Same drill as Stages 1–3: read what you have time for (the issue has a reading-order
TOC), then comment `approved` or `approved-with-conditions <conditions>` — objections
get fixed and re-requested. On approval the agent does the closeout mechanics (ARCH v3
pointer, REQ-0001 front matter → `stage: stage-5`) and starts #15.

## 2. Market validation — 5 conversations (issue #7)

Goal: test the REQ-0001 value story before we build the runner. 5 conversations,
15–20 min each. Mix: **2–3 vibe coders** (Cursor/Copilot/Lovable-style users) and
**1–2 skeptical engineers** who'd never trust AI output without checks.

**Progress: 1 of 5 done.** steve (vibe coder) filled 3 boxes: confirmed the
prototype-to-zombie-app problem, could repeat the difference, yes to star/try.
Raw notes: `market-surveys/steve survey`. Still empty: the two "skeptical engineer"
boxes and the concrete-app quote — prioritize those personas next.

Pitch to open with (then shut up and listen):
> "An open-source agent workforce that takes you from vibe-coded prototype to
> production-grade software — requirements, tests, review — with human signoff gates
> at every stage, so you can actually maintain what you generated. Works with any
> agent harness."

Confirm each checklist box from the issue:

- [x] They confirm the prototype-to-zombie-app problem (ask: "what broke in your
      weekend project and could you fix it?") — *steve*
- [x] They can repeat the difference from LangChain/Spec Kit/Cursor in one sentence — *steve*
- [x] Star/waitlist/pilot signal — ask directly: "would you star or try this?" — *steve*
- [ ] At least one skeptical engineer calls artifact-gates **credible** (push on:
      "gates are deterministic checks, agents never auto-pass a stage")
- [ ] At least one vibe coder names a **concrete app they could not fix**

Log results as a comment on [#7](https://github.com/definition-of-done/definition-of-done/issues/7)
(one line per person: persona, reaction, quote). If someone flatly contradicts
REQ-0001, say so in the comment — we open a new issue rather than editing the
approved REQ.

---

## 3. Every later stage gate

Standing rule (AGENTS.md §5): no stage advances without human signoff. Expect a
signoff request on each stage issue — after #10 closes: Stage-5 pairs #15–#24,
review #25, docs #26 (plus gate runner #8, templates #6). Same drill: review the
linked artifacts, comment `approved` (or objections — they get fixed and re-requested).
