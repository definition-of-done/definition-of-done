# ---
# id: SPEC-UC-0003
# uc: UC-0003
# req: REQ-0001
# status: Draft — Stage 3, awaiting human signoff
# ---
# Behavior contract for UC-0003 — Approve the work, don't redo it.
# 1:1 with docs/UC-0003.md scenarios S1–S4 (ARCH-0001 §4).

Feature: Agent work arrives specified, scoped, and reviewable so approval is a check, not a rewrite

  @UC-0003-S1 @happy
  Scenario: Failing tests exist before any implementation, inside declared scope
    Given Priya has approved the HLD and DD for a module
    When she hands a task to an implementer agent
    Then tests are generated from the Gherkin spec and fail for the right reason before any implementation exists (Stage 5)
    And the implementing agent may write only inside its declared module scope (role "write:" scope, AGENTS.md §6)

  @UC-0003-S2 @happy
  Scenario: A green suite alone does not merge; review notes must predate the merge
    Given an agent's branch passes the full suite
    When a merge is attempted
    Then the Stage 7 gate mechanically refuses until review notes exist that predate the merge
    And the notes' judgment — Review Agent verdict plus Priya's signoff — blocks the merge for unreadable names, missing "why" comments, or drive-by refactors
    And the gate checks the notes exist while the Review Agent and human decide what they say

  @UC-0003-S3 @edge
  Scenario: Moving the goalposts is mechanically refused, not discouraged
    Given a failing test
    When an agent marks it skipped or xfail
    Then the Stage 6 gate fails its no-skipped/xfail check
    And when the agent instead edits the spec or test to match its code, that write lands outside the Implementer's declared scope
    And the write is flagged as a containment violation, because roles may not touch tests or specs (AGENTS.md §6)

  @UC-0003-S4 @failure
  Scenario: Every line of a PR cites an approved design section or is already flagged
    Given a PR reaches Priya's review
    When she reads it
    Then every public code unit cites a "DD-xxxx §N" section she approved
    And anything that does not cite is already flagged by "dod trace" as an orphan
    And her audit is a check, not an excavation
