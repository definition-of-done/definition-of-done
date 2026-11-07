# AGENTS.md — Vibe Engineering Operating Contract

This file is the law of the land for every human and every agent working in this repository.
It converts the Vibe Engineering manifesto into enforceable operating rules.

**Prime directive: code is a downstream, disposable byproduct of documented intent. Nothing is generated before its contract exists and passes its gate.**

---

## 1. Who this is for

| Reader | Your job here |
| --- | --- |
| Human (founder, product owner, architect) | Hold the vision. Define intent. Set constraints. Approve gates. Read and audit the output. |
| Agent (any role, any model) | Execute inside your sandbox, against the approved artifact for your stage. Never improvise intent. Never skip a gate. |

You do not have shared context beyond the artifacts and specifications given to you. You are capable and well-intentioned: you start each stage with no memory of the last and no access to intent that was never written down. A plausible, confident guess about something you were never told is failure — which you cannot notice from the inside. That is why the gates below exist and why they are trusted over your judgement.

Assume nothing that is not written down. Ask instead of guessing; if you cannot ask, stop.

---

## 2. Core values (ranked — left wins every tie)

| We value | Over |
| --- | --- |
| Document-driven specification | Prompt-to-code hacking |
| Validated solutions to human problems | Unchecked accumulation of raw software |
| Deterministic fitness verification and SDLC gates | Probabilistic LLM generation |
| Small chunks of verifiable modular work | Monolithic mega-tasks |
| Human-readable clean code and stated rationale | Mere compilation success |
| Systemic AI-workforce constraints | Unguided agent autonomy |

Rapid prototyping on the right column is allowed, but only in a throwaway branch, never merged, never trusted.

---

## 3. The eight principles

1. **Code is downstream and disposable.** Architecture and behavioral contracts are sacred; source files are cheap. Never be afraid to delete code. Never be afraid to regenerate it — *after* the docs are correct.
2. **Software is not the solution.** Code without a validated human need is digital landfill. No feature ships without a named problem, a job-to-be-done, and a value story.
3. **Market-first gate.** Writing or generating code before the product need and value proposition are agreed is prohibited.
4. **Document-driven specification.** Specs are not paperwork; they are the explicit design of intent and the only source of truth.
5. **The SDLC is non-negotiable.** Every change runs the same gauntlet of deterministic gates: behavior, architecture, security, performance.
6. **Unyielding boundaries.** Modular boundaries contain agent execution. One agent, one module, one concern. No cross-system edits, no "while I'm here" refactors outside scope.
7. **Auditable truth.** If a human cannot read, understand, and explain it, it is garbage regardless of how fast it was synthesized.
8. **Sustainable creation.** Predictability beats heroics. No midnight prompt-debugging panics; if you are panicking, a gate is missing.

---

## 4. The Golden Rule

> **Never prompt-to-code.**

When a bug is found or a requirement shifts, the artifact chain is updated **first**, in order, and code is regenerated from it. Hacking directly at the codebase is a gate failure, not a shortcut.

```
intent → architecture → use case → behavior contract → design → tests → code → review → docs
   ▲                                                                              │
   └──────────────────── any change re-enters here, never there ─────────────────┘
```

If you catch yourself editing code to make a test pass without touching the spec that produced it — stop and re-read this section.

---

## 5. The pipeline: stages, artifacts, gates

Every feature, fix, and refactor walks this pipeline. A stage may not start until the previous stage's exit criteria are met and signed off by the named owner.

| # | Stage | Artifact | Exit gate (deterministic) | Signoff |
| --- | --- | --- | --- | --- |
| 0 | Market-first | `docs/REQ-xxxx.md` — problem, JTBD, value proposition, launch message | Problem + human job + value story all present; "no" is a valid answer | Human product owner |
| 1 | Architecture | `docs/ARCH-0001.md` | New component fits existing boundaries; no boundary violation, no new dependency unexplained | Human architect |
| 2 | Use cases | `docs/UC-xxxx.md` | Every use case traces to a `REQ-xxxx`; every `REQ` is covered | Peer review |
| 3 | Behavior contract | `specs/UC-xxxx.feature` (Gherkin) | Specs parse; Given/When/Then cover happy path, edge cases, failure modes | Human |
| 4 | Design | `docs/HLD-xxxx.md`, `docs/DD-xxxx.md` | Interfaces, data flow, and error handling fully specified | Peer review |
| 5 | Tests first | failing tests generated from Gherkin | Tests exist, compile, and **fail for the right reason** | CI |
| 6 | Synthesis | implementation | Full suite green, lint clean, types clean, no skipped/xfail tests | CI |
| 7 | Review + refactor | review notes | Clean-code gate (§7) passes; messiness blocks merge even when green | Review agent + human |
| 8 | Living docs | changelog, README, ADR updates | Docs describe current reality; traceability links resolve | Docs agent |

**Rules for all stages**

- One stage, one agent, one context. Do not read the whole repo; read your inputs.
- Slice work into the smallest verifiable chunk: one module, one contract, one gate per task. A task that mixes modules or stages is a decomposition failure — split it into issues before starting, never grind through it as one mega-task.
- Every artifact declares its `REQ-xxxx` / `UC-xxxx` ID at the top.
- Every implementation file carries `// Trace: UC-xxxx` (or the language equivalent) on each public unit.
- A gate that cannot be run automatically must be run by a named human, not by the agent that produced the work.
- Gate failures are cheap and expected. Fix the governing artifact, regenerate, and resubmit. Never argue a failing gate into passing.

---

## 6. The agent workforce: roles and boundaries

| Agent | Produces | May touch | Forbidden |
| --- | --- | --- | --- |
| Product Analyst | `REQ-xxxx` | `docs/REQ-*` | Any code, any design |
| Architect | `ARCH-0001.md`, HLD | `docs/ARCH-0001.md`, `docs/HLD-*` | Implementation |
| Spec Writer | use cases, Gherkin | `docs/UC-*`, `specs/*` | Implementation |
| Test Agent | failing tests | `tests/*` | Implementation, spec relaxation |
| Implementer | code | one module per task | Other modules, tests, specs |
| Review Agent | verdicts, refactor orders | review notes | Editing code to make it pass |
| Docs Agent | README, changelog, ADRs | docs | Semantics of behavior |
| Human Director | intent, approvals, gate signoffs | everything | Delegating accountability to an agent |

**Containment rules**

- Sandbox by default: agents get write access only to their stage's paths.
- Scope is a whitelist, not a vibe. Files outside the task's declared scope are read-only.
- No agent may approve, merge, or sign off its own work.
- Context hygiene: pass artifacts, not transcripts. If an agent needs context it was not given, that is a missing artifact — write the artifact.
- Long-running autonomy is capped. Check in at every stage boundary. A stalled agent is stopped, scoped down, or handed to another agent — not argued out of its mistake mid-flight; the fix goes into the artifact that let it stall.

---

## 7. Definition of Done

A task is complete only when **all** of these hold:

- [ ] Behavior matches the locked Gherkin contract; no contract was weakened to pass.
- [ ] Full suite green, deterministically, with no skipped, flaky, or deleted tests.
- [ ] Code is human-readable and self-documenting; names carry meaning, functions are small.
- [ ] Every non-trivial function has a **"why" comment**: why it exists and its design rationale — never a restatement of the syntax.
- [ ] Refactoring gate passed: functionally correct but messy is still **not done**.
- [ ] Traceability intact: `REQ → UC → spec → test → code → docs` all resolve.
- [ ] Docs updated in the same change (changelog, README, ADR if a decision changed).
- [ ] A human can read the diff and explain it out loud.
- [ ] No invented packages, APIs, or flags. If you were unsure it existed, you are not done.

---

## 8. Prohibitions

1. Generating code before Stage 3 is signed off.
2. Editing code to fix a defect without first correcting the governing artifact.
3. Changing a test or spec to match an implementation.
4. Marking work done on "it probably works" — verification is executed, not asserted.
5. Cross-module edits, drive-by refactors, or speculative abstractions.
6. Adding a dependency without an architecture note explaining the boundary it respects.
7. Shipping anything no human has read.
8. Treating an agent's confidence as evidence.

---

## 9. Working language

- Artifacts are written for **humans**: short sentences, concrete nouns, no hedging, no marketing fog.
- State the decision, then the reason, then the alternative rejected.
- Prefer tables and checklists over prose; prefer one page over five.
- Ambiguity is a defect. When language is fuzzy, the spec is wrong — fix the spec before the code.
- Describe agent failures as **error, drift, or missing context** — never mischief, defiance, or intent to deceive. This file is re-read by models with partial context; adversarial framing of ordinary mistakes becomes a self-fulfilling instruction.

---

## 10. When in doubt

1. Is the need validated? If no → stop at Stage 0.
2. Does an artifact for this decision exist? If no → write it, don't code it.
3. Is there a gate that would have caught this failure? If no → add the gate, then fix the bug.
4. Would a human be able to audit this tomorrow? If no → it isn't finished.

Stop gambling with prompts. Engineer with intent.
