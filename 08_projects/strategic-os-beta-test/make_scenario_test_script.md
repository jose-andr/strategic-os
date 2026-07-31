# Make.com Scenario Test Script

## Purpose

Validate the first Strategic OS beta scenario before extending it to the Stakeholder Journey Agent.

This test script covers:

- intake validation;
- Sensemaking Agent execution;
- output validation;
- Slack review;
- human actions;
- workflow-state transitions;
- retries;
- failure visibility;
- version traceability; and
- privacy controls.

## Test boundary

Test these scenarios:

- `Strategic OS Beta — Sensemaking Review`
- `Strategic OS Beta — Human Review Response`

Do not test the Stakeholder Journey Agent, Shipping Coach or automated GitHub commits in this cycle.

## Test principle

A test passes only when:

- the expected state transition occurs;
- the expected Slack message is visible;
- no unauthorised action occurs;
- failure behaviour is understandable;
- the workflow record remains traceable; and
- no sensitive information is stored.

A technically completed run is not sufficient if the workflow state, notification or human-control behaviour is unclear.

## Test environment

Record the environment before testing.

| Field | Value |
|---|---|
| Test date | |
| Tester | José Andrade |
| Make.com environment | |
| Scenario version | |
| Relevance AI agent version | |
| Slack workspace | |
| Slack destination | |
| Data Store name | `strategic_os_beta_workflows` |
| Test data classification | Synthetic / Safe summary |
| Production integrations disabled | Yes / No |

## Safety pre-check

Confirm before running any test:

- synthetic or privacy-safe content is being used;
- no customer personal information is present;
- no credentials or secrets appear in the payload;
- the Slack destination is approved;
- the Relevance AI connection is approved;
- the Make.com Data Store is accessible;
- scenario logging does not expose authentication details;
- automated GitHub commits are disabled;
- no stakeholder-facing publication is possible.

Do not continue if any pre-check fails.

# Standard test intake

Use this safe synthetic intake unless a test requires a modified payload.

    {
      "workflow_name": "Bitbucket knowledge pilot test",
      "decision_question": "Should the proposal move into a contained stakeholder working session?",
      "opportunity_summary": "Test whether an existing enterprise repository capability could support governed and reusable project knowledge without replacing existing systems of record.",
      "known_evidence": [
        "An enterprise repository capability already exists.",
        "Project knowledge is distributed across several tools."
      ],
      "known_assumptions": [
        "A contained pilot may be possible within existing governance."
      ],
      "constraints": [
        "Do not move all documentation into Git.",
        "Existing organisational platforms remain systems of record.",
        "Use synthetic or safe summary information only."
      ],
      "requested_output": "A structured decision framing for human review.",
      "submitted_by": "jose-andrade",
      "slack_destination": "APPROVED_TEST_DESTINATION",
      "privacy_confirmed": true
    }

# Evidence to capture

For every test, record:

- test ID;
- workflow ID;
- start timestamp;
- end timestamp;
- input variation;
- state transitions;
- agent result;
- Slack notification result;
- human action result;
- retry count;
- output version;
- observed failure;
- privacy result;
- pass or fail;
- corrective action.

Do not paste raw sensitive logs into this file.

Use safe summaries and references only.

# Test 01 — Happy path approval

## Objective

Confirm that a valid intake reaches human review and can be approved.

## Input

Use the standard test intake.

## Steps

1. Submit the intake webhook.
2. Confirm that a workflow ID is created.
3. Confirm that the workflow record enters `intake-received`.
4. Confirm that the start notification appears in Slack.
5. Confirm that the workflow enters `sensemaking-running`.
6. Confirm that the Sensemaking Agent returns all required sections.
7. Confirm that the workflow enters `sensemaking-review`.
8. Confirm that the Slack review notification contains the correct workflow ID.
9. Submit the authorised `approve` action.
10. Confirm that the decision status becomes `approved`.
11. Confirm that no further agent runs.

## Expected result

- one workflow record exists;
- the workflow ID remains consistent;
- required state transitions occur in sequence;
- Slack notifications are clear;
- the output is reviewable;
- approval is recorded;
- human action is no longer required;
- no further agent executes.

## Required evidence

- workflow ID;
- state-transition summary;
- start-notification reference;
- review-notification reference;
- approval timestamp;
- final decision status.

# Test 02 — Missing decision question

## Objective

Confirm that incomplete intake is rejected before agent execution.

## Input variation

Remove:

`decision_question`

## Steps

1. Submit the invalid intake.
2. Confirm that validation fails.
3. Confirm that the Sensemaking Agent is not invoked.
4. Confirm that the workflow becomes `failed`.
5. Confirm that Slack explains the validation failure.

## Expected result

- no agent invocation;
- visible failure;
- safe workflow record;
- clear corrective action;
- no silent continuation.

# Test 03 — Privacy not confirmed

## Objective

Confirm that the workflow does not process an intake without human privacy confirmation.

## Input variation

Set:

`privacy_confirmed = false`

## Steps

1. Submit the intake.
2. Confirm that validation fails.
3. Confirm that no agent executes.
4. Confirm that Slack explains why the workflow stopped.
5. Confirm that no unsafe payload is copied into operational logs.

## Expected result

- workflow stops before agent execution;
- privacy failure is visible;
- no raw intake is stored beyond the approved minimum;
- corrective action is clear.

# Test 04 — Missing required agent section

## Objective

Confirm that invalid Sensemaking output receives one structured correction attempt.

## Test setup

Temporarily configure the test agent or mock response to omit:

`Caveats:`

## Steps

1. Submit the standard intake.
2. Allow the first invalid output to return.
3. Confirm that validation detects the missing section.
4. Confirm that `retry_count` increments to `1`.
5. Confirm that one correction request is sent.
6. Confirm that the workflow remains `sensemaking-running`.
7. Return a valid corrected response.
8. Confirm that the workflow reaches `sensemaking-review`.

## Expected result

- invalid output does not reach human review;
- one correction attempt occurs;
- retry count is visible;
- corrected output is validated;
- no unlimited loop occurs.

# Test 05 — Repeated invalid agent output

## Objective

Confirm that a second invalid output causes a visible failure.

## Test setup

Return an invalid output twice.

## Steps

1. Submit the standard intake.
2. Return the first invalid response.
3. Confirm that one correction request is issued.
4. Return a second invalid response.
5. Confirm that `retry_count` reaches `2`.
6. Confirm that the workflow becomes `failed`.
7. Confirm that Slack notifies José.
8. Confirm that automatic execution stops.

## Expected result

- no third automatic attempt;
- failure is visible;
- the error summary is safe and understandable;
- José can decide whether to retry manually or stop.

# Test 06 — Approve with correction

## Objective

Confirm that human corrections are traceable and do not overwrite the original output.

## Steps

1. Run the workflow to `sensemaking-review`.
2. Submit an authorised `correct` action.
3. Include a precise correction.
4. Confirm that output version 1 remains stored.
5. Confirm that output version 2 is created.
6. Confirm that the correction source is recorded.
7. Confirm that version 2 is marked approved.

## Expected result

- original and corrected outputs remain distinguishable;
- correction text is preserved;
- output version increments;
- approval status is clear;
- no silent overwrite occurs.

# Test 07 — Request rework

## Objective

Confirm that one human-directed rework cycle can occur.

## Steps

1. Run the workflow to `sensemaking-review`.
2. Submit an authorised `rework` action.
3. Provide a specific instruction.
4. Confirm that the workflow returns to `sensemaking-running`.
5. Confirm that `rework_count` becomes `1`.
6. Confirm that the previous output is labelled unapproved.
7. Confirm that the agent receives the original intake, prior output and exact rework instruction.
8. Confirm that the revised output is validated.
9. Confirm that the workflow returns to `sensemaking-review`.
10. Confirm that a new Slack review message is sent.

## Expected result

- one controlled rework cycle occurs;
- prior output remains traceable;
- the human instruction is not treated as evidence unless explicitly labelled;
- revised output returns to review.

# Test 08 — Repeated rework request

## Objective

Confirm that the minimum scenario does not enter an unlimited rework loop.

## Steps

1. Complete Test 07.
2. Submit a second `rework` action.
3. Confirm that automatic rework is blocked.
4. Confirm that the workflow pauses or requires manual intervention.
5. Confirm that José receives a clear notification.

## Expected result

- no second automatic rework cycle;
- workflow control remains with José;
- the reason for the block is visible.

# Test 09 — Pause and resume

## Objective

Confirm that a workflow can pause without losing review context.

## Steps

1. Run the workflow to `sensemaking-review`.
2. Submit an authorised `pause` action.
3. Confirm that the state becomes `paused`.
4. Confirm that no agent runs while paused.
5. Confirm that the current output remains unchanged.
6. Submit an authorised `resume` action.
7. Confirm that the state returns to `sensemaking-review`.
8. Confirm that the agent is not rerun.
9. Confirm that the existing output remains available.

## Expected result

- state and output are preserved;
- no execution occurs during pause;
- resume restores the review checkpoint;
- the agent is not invoked again.

# Test 10 — Stop

## Objective

Confirm that an authorised stop command ends execution.

## Steps

1. Run the workflow to `sensemaking-review`.
2. Submit an authorised `stop` action with a reason.
3. Confirm that the state becomes `stopped`.
4. Confirm that `completed_at` is recorded.
5. Confirm that no further module runs.
6. Confirm that Slack acknowledges the stop.
7. Attempt another action.
8. Confirm that the later action is rejected.

## Expected result

- stop is terminal;
- the reason is recorded;
- no later action changes the workflow;
- no further agent executes.

# Test 11 — Temporary technical timeout

## Objective

Confirm that a temporary Relevance AI failure follows the retry rule.

## Test setup

Simulate a timeout or temporary service failure.

## Steps

1. Submit the standard intake.
2. Trigger the temporary failure.
3. Confirm that the error handler activates.
4. Confirm that the retry count increments.
5. Confirm that the configured delay occurs.
6. Allow the next attempt to succeed.
7. Confirm that the workflow continues normally.
8. Confirm that the retry remains visible in the operational record.

## Expected result

- retry behaviour is transparent;
- the workflow recovers;
- no duplicate workflow record is created;
- the workflow ID remains unchanged.

# Test 12 — Retry limit reached

## Objective

Confirm that repeated technical failure stops safely.

## Test setup

Force the Relevance AI call to fail beyond the configured retry limit.

## Steps

1. Submit the standard intake.
2. Confirm that the allowed retries occur.
3. Confirm that retries stop at the configured limit.
4. Confirm that the workflow becomes `failed`.
5. Confirm that Slack identifies the failed step and retry count.
6. Confirm that no hidden retries continue.

## Expected result

- retry limit is enforced;
- failure is visible;
- automatic execution stops;
- José receives a clear next action.

# Test 13 — Unauthorised responder

## Objective

Confirm that unauthorised Slack actions cannot change workflow state.

## Steps

1. Run the workflow to `sensemaking-review`.
2. Submit an action from an unauthorised responder.
3. Confirm that the action is rejected.
4. Confirm that the workflow remains in `sensemaking-review`.
5. Confirm that the attempted action is logged safely.
6. Confirm that no agent executes.

## Expected result

- workflow state is unchanged;
- the attempted action is visible;
- no approval or correction is recorded.

# Test 14 — Mismatched workflow ID

## Objective

Confirm that a human action cannot update the wrong workflow.

## Steps

1. Create two test workflows.
2. Send a review action using an incorrect or mismatched workflow ID.
3. Confirm that the response is rejected.
4. Confirm that neither workflow is changed.
5. Confirm that the mismatch is logged.

## Expected result

- no cross-workflow update;
- no output overwrite;
- no incorrect approval;
- rejection reason is visible.

# Test 15 — Unsupported state transition

## Objective

Confirm that invalid state transitions are blocked.

## Steps

1. Stop a test workflow.
2. Submit an `approve` action for the stopped workflow.
3. Confirm that the action is rejected.
4. Confirm that the workflow remains `stopped`.
5. Confirm that the attempted transition is logged.

## Expected result

- terminal state is preserved;
- no workflow data is overwritten;
- invalid transition is visible.

# Test 16 — Slack start notification failure

## Objective

Confirm that a failed start notification does not unnecessarily stop agent execution.

## Test setup

Temporarily make the start notification unavailable.

## Steps

1. Submit the standard intake.
2. Confirm that the start notification fails.
3. Confirm that the notification failure is logged.
4. Confirm that Sensemaking execution continues.
5. Confirm that the review notification is still attempted.

## Expected result

- the start-message failure is visible;
- the core workflow continues;
- no duplicate agent call occurs.

# Test 17 — Slack review notification failure

## Objective

Confirm that a review-notification failure does not create an invisible pending decision.

## Test setup

Temporarily make the review notification unavailable.

## Steps

1. Submit the standard intake.
2. Allow Sensemaking execution to complete.
3. Confirm that the state reaches `sensemaking-review`.
4. Trigger the Slack delivery failure.
5. Confirm that retries occur where permitted.
6. Confirm that José is alerted through the approved fallback or operational monitoring method.
7. Confirm that the workflow does not proceed automatically.

## Expected result

- human review remains required;
- the workflow does not continue;
- the notification failure is visible;
- the output remains available.

# Test 18 — Sensitive-content safeguard

## Objective

Confirm that obviously unsafe input is blocked or escalated.

## Test input

Use a synthetic placeholder representing a prohibited content type.

Do not use real customer data or real credentials.

Example:

`TEST-CREDENTIAL-PLACEHOLDER`

## Steps

1. Submit the test payload.
2. Confirm that the safety rule detects or flags the prohibited pattern.
3. Confirm that the agent is not invoked when the rule is configured as blocking.
4. Confirm that the failure message does not repeat the prohibited value.
5. Confirm that logs contain only a safe summary.

## Expected result

- unsafe content does not reach the agent;
- the value is not repeated in Slack or logs;
- the workflow stops or requires human review;
- the failure is understandable.

# Test result template

Copy this section for every test execution.

## Test result

**Test ID:**  
`TEST-XX`

**Test name:**  
[Add name]

**Execution date:**  
[Add date and time]

**Workflow ID:**  
[Add workflow ID]

**Scenario version:**  
[Add version]

**Input variation:**  
[Describe only the variation from the standard test intake]

**Expected state sequence:**  
[Add expected states]

**Observed state sequence:**  
[Add observed states]

**Agent result:**  
[Valid / Invalid / Not invoked / Technical failure]

**Slack result:**  
[Delivered / Failed / Retried / Not applicable]

**Human action:**  
[Approve / Correct / Rework / Pause / Resume / Stop / Not applicable]

**Retry count:**  
[Add count]

**Rework count:**  
[Add count]

**Output version:**  
[Add version]

**Privacy result:**  
[Pass / Fail]

**Observed issue:**  
[Safe summary only]

**Result:**  
[Pass / Fail / Partial]

**Corrective action:**  
[Add action or `None`]

**Evidence references:**  
[Add safe references to Make.com execution, Slack message or workflow record]

# Test summary

Complete after all tests.

| Test ID | Test name | Result | Material issue | Retest required |
|---|---|---|---|---|
| TEST-01 | Happy path approval | | | |
| TEST-02 | Missing decision question | | | |
| TEST-03 | Privacy not confirmed | | | |
| TEST-04 | Missing required agent section | | | |
| TEST-05 | Repeated invalid agent output | | | |
| TEST-06 | Approve with correction | | | |
| TEST-07 | Request rework | | | |
| TEST-08 | Repeated rework request | | | |
| TEST-09 | Pause and resume | | | |
| TEST-10 | Stop | | | |
| TEST-11 | Temporary technical timeout | | | |
| TEST-12 | Retry limit reached | | | |
| TEST-13 | Unauthorised responder | | | |
| TEST-14 | Mismatched workflow ID | | | |
| TEST-15 | Unsupported state transition | | | |
| TEST-16 | Slack start notification failure | | | |
| TEST-17 | Slack review notification failure | | | |
| TEST-18 | Sensitive-content safeguard | | | |

# Release gate

The first scenario may progress to Stakeholder Journey Agent integration only when:

- Test 01 passes;
- Tests 02 and 03 pass;
- Tests 04 and 05 pass;
- Tests 06 to 10 pass;
- Tests 11 and 12 pass;
- Tests 13 to 15 pass;
- Test 17 passes;
- Test 18 passes;
- no silent failure remains;
- no unauthorised state change is possible;
- no sensitive test content is retained;
- all material defects have an owner and disposition.

Test 16 may remain a documented non-blocking issue only when the failed start notification is visible through operational monitoring and the later human-review checkpoint remains reliable.

# Release decision

Record one outcome:

- `Proceed`
- `Proceed with contained corrections`
- `Retest required`
- `Stop`

## Decision record

**Outcome:**  
[Add outcome]

**Decision owner:**  
José Andrade

**Date:**  
[Add date]

**Evidence:**  
[Add safe references]

**Material caveats:**  
[Add caveats]

**Required corrections:**  
[Add corrections or `None`]

**Next authorised step:**  
[Add next step]
