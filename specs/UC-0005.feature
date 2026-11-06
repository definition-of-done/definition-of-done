# ---
# id: SPEC-UC-0005
# uc: UC-0005
# req: REQ-0001
# status: draft
# ---

Feature: Work arrives as a vague intention and leaves as a traceable artifact

  @UC-0005-S1 @happy
  Scenario Outline: A request is routed to the stage that matches its shape
    Given the request "<request>" arrives from the human
    When the orchestrator classifies it
    Then it is routed to "<stage>"
    And the routed stage produces or updates the artifact for "<uc>"

    Examples:
      | request                                                  | stage        | uc            |
      | add a delete-account button to settings                  | implementation | SPEC-UC-0003  |
      | how would we handle rate limiting                        | architecture | ARCHITECTURE  |
      | users want a way to export their data                    | requirements | REQ-0003      |
      | the export feature works but feels wrong                 | requirements | REQ-0003      |

  # S2 — the ambiguous case: classification is not obvious, so the human decides
  @UC-0005-S2 @edge
  Scenario: An ambiguous request is clarified before routing
    Given the request "make the export faster" arrives from the human
    And the request could be a requirement change or an implementation task
    When the orchestrator classifies it
    Then the orchestrator asks one clarifying question before routing
    And after the answer the request is routed to the chosen stage
    And the routing decision and its reason are recorded

  # S3 — the out-of-scope case: not everything belongs in the pipeline
  @UC-0005-S3 @edge
  Scenario: A request outside the project is declined with a reason
    Given the request "book our flights for the conference" arrives from the human
    When the orchestrator classifies it
    Then the request is not routed to any stage
    And the human is told the request is outside the project scope

  # S4 — the misrouted case: wrong stage, caught before work starts
  @UC-0005-S4 @failure
  Scenario: A misrouted request is corrected when the stage finds no matching artifact
    Given the request "fix the typo in the README" is routed to the requirements stage
    And the requirements stage finds no requirement artifact to update
    When the stage reports the mismatch
    Then the orchestrator re-routes the request to the implementation stage
    And the misrouting is recorded so routing can learn from it
