# ---
# id: SPEC-UC-0001
# uc: UC-0001
# req: REQ-0001
# status: Draft — Stage 3, awaiting human signoff
# ---
# Behavior contract for UC-0001 — Idea to software that stays changeable.
# 1:1 with docs/UC-0001.md scenarios S1–S4 (ARCHITECTURE §4).

Feature: A plain-language idea becomes software through the full artifact chain

  @UC-0001-S1 @happy
  Scenario: An everyday-words idea becomes an approved requirement before any work starts
    Given Vera describes her idea to her harness in everyday words
    When the Product Analyst role drafts "REQ-0101" with problem, JTBD, and value
    Then Vera receives a one-page requirement she can read aloud
    And she approves it in plain language
    And no design or code work begins before that approval exists

  @UC-0001-S2 @happy
  Scenario: A feature request updates the chain in order before code changes
    Given a project with an approved requirement
    When Vera asks for a new feature in plain words, such as "add dark mode"
    Then agents update the chain in order: requirement delta, use case, behavior contract, and HLD or DD if the design moves
    And each stage's gate passes mechanically before the next stage starts
    And the Test Agent generates failing tests from the spec before any implementation exists
    And the implementer writes code against those tests
    And Vera is asked only to approve the requirement in plain words and confirm the result matches what she asked for

  @UC-0001-S3 @edge
  Scenario: A throwaway prototype may exist but may not merge
    Given Vera asks for a throwaway prototype to "just see if it works"
    When the harness prompt-to-codes on a throwaway branch
    Then the prototype is allowed to exist on that branch
    And "dod gate" blocks merging the branch into the mainline
    And the branch is either promoted through the artifact chain or deleted

  @UC-0001-S4 @failure
  Scenario: A merge with a missing or unapproved artifact fails with a plain-language reason
    Given an agent or Vera tries to merge code whose UC or spec is missing or unapproved
    When CI or a local run executes "dod gate --stage N"
    Then the merge fails
    And the failure names the missing artifact and the role that produces it
    And the message is plain language, never a stack trace
    And the gate never passes silently
