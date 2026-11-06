# ---
# id: SPEC-UC-0002
# uc: UC-0002
# req: REQ-0001
# status: Draft — Stage 3, awaiting human signoff
# ---
# Behavior contract for UC-0002 — Six months later, the app is still fixable.
# 1:1 with docs/UC-0002.md scenarios S1–S4 (ARCHITECTURE §4).

Feature: A shipped app stays changeable because every line traces to approved intent

  @UC-0002-S1 @happy
  Scenario: A change request goes through the artifact chain, not the code
    Given a shipped app with an approved "UC-0001"
    When a change request arrives
    Then the use case and behavior contract are updated first
    And tests are regenerated from the updated spec
    And code is regenerated from the tests (Golden Rule, AGENTS.md §4)
    And the resulting diff cites the UC

  @UC-0002-S2 @happy
  Scenario: "Why does this exist?" resolves to a written intent
    Given an unfamiliar part of the app
    When the maintainer runs "dod trace" or reads the living docs
    Then every module resolves through code, DD, HLD, and REQ to a written intent
    And the docs describe current reality, kept honest by the Stage 8 gate

  @UC-0002-S3 @edge
  Scenario: Orphan code is flagged with both fixes offered
    Given code exists with no "// Trace: DD-xxxx §N" marker, pasted, hand-hacked, or forgotten
    When "dod trace" runs
    Then the orphan is reported with its location
    And the choice offered is "write the artifact" or "delete the code"

  @UC-0002-S4 @failure
  Scenario: Docs that drifted from reality fail the release
    Given docs or changelog that no longer match shipped behavior
    When the release gate runs its Stage 8 checks: traceability fully resolves and docs were updated in the same diff
    Then the release fails until docs and code agree
