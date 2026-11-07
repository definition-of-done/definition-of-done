# Human Actions

Everything waiting on a human (you) right now, with exact steps. Ordered by urgency.
When you finish an item, either comment on the linked issue or just say so in session —
the agent records it. This file is kept current; delete rows as they land.

| # | Action | Where | Urgency |
| --- | --- | --- | --- |
| 1 | Identity: org ✅ PyPI ✅ token revoked ✅ — remaining: npm placeholder | [issue #5](https://github.com/pappes/definition-of-done/issues/5) | **Now** — 5 min |
| 2 | Run 5 market-validation conversations | [issue #7](https://github.com/pappes/definition-of-done/issues/7) | Before Stage 4 investment |
| 3 | Signoff at every later stage gate | Each stage issue | Recurring |

---

## 1. Claim the identity (issue #5)

Progress 2026-11-07: **GitHub org `definition-of-done` created** (you) and
**PyPI name reserved** — `definition-of-done` 0.0.1.dev0 placeholder uploaded, live at
<https://pypi.org/project/definition-of-done/>. Dev-version placeholder, so real
releases still start at `0.1.0`. One thing left:

*(Done 2026-11-07: the session-shared PyPI API token was revoked by owner. Create a
new one only when the first real release ships.)*

### a. npm placeholder (~5 min)

1. Sign up: <https://www.npmjs.com/signup> (or `npm signup`).
2. Confirm free: <https://registry.npmjs.org/definition-of-done> → **404** means free.
3. Publish a README-only placeholder:

   ```bash
   mkdir /tmp/dod-npm && cd /tmp/dod-npm
   npm init -y   # set name "definition-of-done", version "0.0.1"
   npm login
   npm publish   # unscoped names are public by default
   ```

   Same caveat as PyPI: npm won't let the name be reused after unpublish, so `0.0.1`
   as a reservation is permanent and harmless; the real shim starts at `0.1.0`.

### b. Later: move the repo under the org

When you want the public face to be the org: repo **Settings → General → Transfer
ownership** → transfer `pappes/definition-of-done` to org `definition-of-done`.
GitHub redirects old URLs, so doing it early is cheap. Not urgent — nothing in the
pipeline depends on the repo's owner path.

### c. Naming pair — confirmed by action

You created the org and the PyPI token under `definition-of-done`, so the pair is
locked in practice: package `definition-of-done` on PyPI/npm, CLI command `dod`
(`dod` is taken on PyPI — irrelevant, the command name is independent). Say the word
on #5 if you ever want it revisited.

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

## 3. Every later stage gate

Standing rule (AGENTS.md §5): no stage advances without human signoff. Expect a
signoff request on each stage issue (architecture extraction #10, gate runner #8,
templates #6, …). Same drill: review the linked artifacts, comment `approved` (or
objections — they get fixed and re-requested).
