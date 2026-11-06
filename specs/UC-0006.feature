# ---
# id: SPEC-UC-0006
# uc: UC-0006
# req: REQ-0001
# status: draft
# ---

Feature: The same work runs on different harnesses with the same outcomes

  # S1 — the portability case: same artifacts, different harness, same gate results
  @UC-0006-S1 @happy
  Scenario: A project runs on two harnesses with identical gate results
    Given a project whose artifacts pass all gates on harness A
    When the same project directory is opened on harness B
    Then all gates produce the same pass-fail results as on harness A
    And the artifacts are unchanged by the move
    And the only harness-specific files are the adapter configurations

  # S2 — the adoption case: an existing project is onboarded without rewriting
  @UC-0006-S2 @happy
  Scenario: An existing project adopts the artifact structure incrementally
    Given a project with an existing docs directory and no requirement artifacts
    When the human adopts the artifact structure
    Then existing documents are linked from the index as-is
    And requirement artifacts are created only when a new need is captured
    And no gate fails because of the project's pre-adoption history

  # S3 — the drift case: an adapter lags behind the core contract
  @UC-0006-S3 @edge
  Scenario: A lagging adapter degrades to manual mode instead of failing silently
    Given harness B's adapter does not support a gate added in the current core version
    When the project runs its gates on harness B
    Then the unsupported gate is reported as skipped with a reason
    And the human is told which gates were not enforced on harness B
    And no gate is reported as passed when it did not run

  # S4 — the vendor-lock case: the project must survive its tooling disappearing
  @UC-0006-S4 @failure
  Scenario: A project survives its harness being discontinued
    Given a project maintained for a year on harness A
    And harness A is discontinued
    When the project is opened with any other harness or a text editor
    Then all artifacts remain readable and versionable
    And the gates still run from the command line without any harness
    And no artifact references a vendor-specific format
