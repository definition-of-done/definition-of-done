# ---
# id: SPEC-UC-0004
# uc: UC-0004
# req: REQ-0001
# status: draft
# ---

Feature: Collateral accrues as a by-product of work

  Background:
    Given the project is configured with a "collateral/" directory
    And the agent runtime records tool calls and file edits

  # S1 — the by-product case: work happens, material accrues without asking
  @UC-0004-S1 @happy
  Scenario: Routine work accrues claims and evidence without extra steps
    Given the agent completes a task that adds a retry mechanism to the payment client
    When the task ends
    Then a claim is recorded that the payment client retries transient failures
    And the claim links to the commit and test files that prove it
    And the claim records the date it was made
    And no separate collateral-writing step was required during the task

  # S2 — the compounding case: the compiler assembles publishable copy from receipts
  @UC-0004-S2 @happy
  Scenario: The compiler assembles collateral into publishable copy
    Given the collateral store holds claims with evidence from the last month of work
    When the marketing bot compiles a changelog entry for the release
    Then the entry states only claims that carry evidence links
    And each claim in the entry links to its evidence
    And a human reviews the entry before it is published

  # S3 — the honest case: no evidence, no claim
  @UC-0004-S3 @edge
  Scenario: A claim without evidence is excluded from compiled copy
    Given the collateral store holds one claim with evidence and one claim without
    When the marketing bot compiles collateral for publication
    Then the compiled copy excludes the claim without evidence
    And the excluded claim is reported to the human with its missing-evidence reason

  # S4 — the stale case: evidence that no longer exists is flagged, not trusted
  @UC-0004-S4 @failure
  Scenario: A claim whose evidence has disappeared is flagged stale
    Given the collateral store holds a claim linking to a test file
    And the test file has since been deleted
    When the collateral store is validated
    Then the claim is flagged stale
    And stale claims are excluded from compiled copy until re-evidenced
