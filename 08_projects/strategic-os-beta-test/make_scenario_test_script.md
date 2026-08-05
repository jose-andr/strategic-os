# Make.com Scenario Test Script

## Purpose

Validate the minimum executable Strategic OS beta workflow before extending it to additional human-response routes, downstream agents or automated publication.

This script distinguishes:

- controls that are implemented and validated;
- controls that are implemented but not yet validated;
- planned controls that are not yet implemented; and
- release-gate conditions that remain open.

## Test boundary

The current beta includes these Make.com scenarios:

- `Strategic OS Beta — Sensemaking Review`
- `Strategic OS Beta — Slack Review Response`

Current implemented flow:

```text
Webhook intake
→ workflow record creation
→ intake context preservation
→ sensemaking-running
→ Relevance Sensemaking Agent
→ human-review-required
→ Slack review message
→ APPROVE response detection
→ workflow record lookup
→ state validation
→ workflow record approval
→ privacy-safe Slack approval confirmation
```

The current human-response boundary supports only:

```text
APPROVE [workflow ID]
```

Do not treat the following as implemented in this test cycle:

- `CORRECT`;
- `REWORK`;
- `PAUSE`;
- `RESUME`;
- `STOP`;
- authorised-responder validation;
- explicit invalid-ID feedback;
- duplicate-attempt logging;
- automated GitHub commits;
- downstream `ready-for-use`;
- Stakeholder Journey Agent execution; or
- Shipping Coach execution.

## Test principle

A test passes only when:

- the expected state transition occurs;
- the final Data Store record confirms the authoritative state;
- the expected Slack message is visible where applicable;
- no unsupported or invalid action changes a workflow;
- failure behaviour is contained and understandable;
- the workflow record remains traceable;
- no sensitive information is stored; and
- the result is supported by privacy-safe evidence.

A technically completed Make.com run is not sufficient if the workflow state, notification or human-control behaviour is unclear.

## Evidence hierarchy

Use the following evidence hierarchy:

1. The final Make.com Data Store record is authoritative for workflow state and field preservation.
2. Make.com execution history demonstrates module routing and error-handler behaviour.
3. Slack demonstrates that a human-facing message was delivered or that a supported command was received.
4. Slack output alone does not prove the authoritative workflow state.

Do not paste raw logs, webhook URLs, credentials, access tokens, sensitive identifiers or customer information into this file.

## Test environment

Record the environment before each validation session.

| Field | Value |
|---|---|
| Test date | |
| Tester | José Andrade |
| Make.com environment | Beta |
| Intake scenario | `Strategic OS Beta — Sensemaking Review` |
| Response scenario | `Strategic OS Beta — Slack Review Response` |
| Scenario version | |
| Relevance AI agent version | |
| Slack workspace | |
| Slack destination | Private beta channel |
| Data Store name | `strategic_os_beta_workflows` |
| Test data classification | Synthetic / Safe summary |
| Production integrations disabled | Yes |
| Automated GitHub commits disabled | Yes |

## Safety pre-check

Confirm before running any test:

- synthetic or privacy-safe content is being used;
- no customer personal information is present;
- no credentials or secrets appear in the payload;
- no webhook URL is recorded in evidence;
- the Slack destination is the approved private beta channel;
- the Relevance AI connection is approved;
- the Make.com Data Store is accessible;
- scenario logging does not expose authentication details;
- automated GitHub commits are disabled;
- no stakeholder-facing publication is possible;
- the replacement intake webhook is active; and
- the original exposed webhook has been deleted.

Do not continue if any pre-check fails.

# Standard test intake

Use a synthetic intake containing the active workflow fields.

```json
{
  "workflow_name": "Bitbucket knowledge pilot test",
  "decision_question": "Should the proposal move into a contained stakeholder working session?",
  "opportunity_summary": "Test whether an existing enterprise repository capability could support governed and reusable project knowledge without replacing existing systems of record.",
  "evidence": [
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
  "requested_outcome": "A decision on whether to proceed to a contained working session.",
  "submitted_by": "jose-andrade",
  "slack_destination": "APPROVED_TEST_DESTINATION",
  "privacy_confirmed": true
}
```

Field names must match the active Make.com mapping. Do not silently substitute `known_evidence` for `evidence` unless the intake schema is deliberately changed and retested.

# Workflow states

## Implemented states

```text
not-started
intake-received
sensemaking-running
human-review-required
approved
```

## Current approval transition

```text
human-review-required
→ approved
```

The response scenario must block approval from any other state.

## Planned or inactive states

The following states may appear in earlier design material but are not validated as active in the current minimum workflow:

```text
sensemaking-review
paused
stopped
failed
ready-for-use
```

Do not record these as operational until the matching route and evidence have been implemented and tested.

# Evidence to capture

For every executed test, record:

- test ID;
- workflow ID or safe reference;
- execution date;
- input variation;
- expected state sequence;
- observed state sequence;
- agent result;
- Slack result;
- human action;
- retry or rework count where relevant;
- final Data Store state;
- completion timestamp where relevant;
- privacy result;
- observed issue;
- pass, fail, partial or not run;
- corrective action; and
- privacy-safe evidence references.

# Test 01 — Intake context preservation

## Status

Passed.

## Objective

Confirm that the minimum Sensemaking Review scenario preserves the complete intake context required by the Relevance Sensemaking Agent.

## Fields validated

```text
decision_question
opportunity_summary
evidence
known_assumptions
constraints
requested_output
privacy_confirmed
requested_outcome
```

## Validation path

The fields were checked through:

```text
webhook intake
→ initial Data Store record
→ sensemaking-running update
→ Relevance Sensemaking Agent prompt
→ human-review-required update
→ final Data Store record
```

## Result

| Check | Outcome |
|---|---|
| All required fields submitted | Yes |
| Fields preserved through both Data Store updates | Yes |
| Fields available to the Sensemaking Agent | Yes |
| `privacy_confirmed` retained as a Boolean | Yes |
| `privacy_status` retained separately as text | Yes |
| Final record contained expected context | Yes |
| Result | Pass |

## Evidence caveat

Slack confirms receipt and review-message delivery but does not prove complete field preservation.

The final Data Store record is the authoritative evidence for schema preservation.

## Historical issue

An earlier configuration did not preserve `privacy_confirmed` correctly through the complete workflow.

The mapping was corrected and validated using a fresh workflow record.

The corrected result applies only to the fresh retest. It must not be inferred from an older record created before the mapping change.

# Test 02 — Happy path approval

## Status

Passed within the current minimum boundary.

## Objective

Confirm that a valid intake reaches human review and can be approved using the supported Slack command.

## Steps

1. Submit the standard test intake.
2. Confirm that a workflow ID is created.
3. Confirm that the record enters `intake-received`.
4. Confirm that the workflow enters `sensemaking-running`.
5. Confirm that the Sensemaking Agent returns a reviewable output.
6. Confirm that the workflow enters `human-review-required`.
7. Confirm that Slack displays the workflow ID and only the supported instruction.
8. Submit `APPROVE [workflow ID]`.
9. Confirm that the response scenario retrieves the correct Data Store record.
10. Confirm that the existing state is `human-review-required`.
11. Confirm that the record becomes `approved`.
12. Confirm that `completed_at` is recorded.
13. Confirm that one privacy-safe approval confirmation is delivered.
14. Confirm that no downstream agent or publication step runs.

## Expected result

```text
intake-received
→ sensemaking-running
→ human-review-required
→ approved
```

## Recorded result

| Check | Outcome |
|---|---|
| Only supported response displayed | Yes |
| Workflow ID displayed | Yes |
| APPROVE command detected | Yes |
| Previous state | `human-review-required` |
| Updated state | `approved` |
| `completed_at` recorded | Yes |
| Approval confirmation delivered | Yes |
| Further agent execution | No |
| Result | Pass |
| Corrective action | None |

## Evidence rule

The Slack confirmation demonstrates response delivery.

The final Data Store record is authoritative for `approved` and `completed_at`.

# Test 03 — Invalid workflow ID

## Status

Passed after corrective control.

## Objective

Confirm that an invalid workflow ID cannot change a workflow record or disable the Slack response scenario.

## Initial failure

Before the defensive control was added:

```text
invalid workflow ID
→ Data Store lookup error
→ unhandled scenario error
→ response scenario automatically deactivated
```

| Check | Initial outcome |
|---|---|
| Invalid command detected | Yes |
| Data Store lookup result | Error |
| Existing workflow record changed | No |
| Approval confirmation delivered | No |
| Scenario stopped safely | No |
| Scenario automatically deactivated | Yes |
| Result | Fail |

## Risk identified

One malformed approval command could disable the response route for later valid reviews.

## Corrective control

A `Skip` error handler was added to:

```text
Data Store — Get a record
```

Current behaviour:

```text
invalid workflow ID
→ lookup error handled by Skip
→ no Data Store update
→ no approval confirmation
→ scenario remains active
```

## Retest result

| Check | Outcome |
|---|---|
| Scenario remained active | Yes |
| Lookup error handled by Skip | Yes |
| Existing workflow record changed | No |
| Approval confirmation delivered | No |
| Unhandled scenario error | No |
| Valid approval still worked after retest | Yes |
| Result | Pass |
| Corrective action | None |

## Current caveat

The invalid command is safely contained, but the user does not receive an explicit privacy-safe error message.

This remains a paused usability improvement.

# Test 04 — Duplicate approval

## Status

Passed after corrective control.

## Objective

Confirm that a repeated APPROVE command cannot update a workflow that is already `approved`.

## Initial failure

Before state validation was added:

```text
approved record retrieved
→ record updated again
→ completion timestamp refreshed or overwritten
→ second approval confirmation delivered
```

| Check | Initial outcome |
|---|---|
| Duplicate approval detected | Yes |
| Existing state | `approved` |
| Record updated again | Yes |
| Second confirmation delivered | Yes |
| Scenario remained active | Yes |
| Result | Fail |

## Risk identified

Repeated approval commands could:

- create misleading audit history;
- overwrite completion timestamps;
- make repeated approvals appear meaningful; and
- reduce confidence in workflow state.

## Corrective control

The route now requires:

```text
Slack text starts with APPROVE
AND
Slack channel equals the configured beta channel
AND
Data Store current_state equals human-review-required
```

The state filter is positioned after the Data Store lookup because `current_state` is not available before the record is retrieved.

Recommended filter label:

```text
Valid APPROVE for pending review
```

## Regression-test result

| Check | Outcome |
|---|---|
| Duplicate approval blocked | Yes |
| Already-approved record updated again | No |
| Second confirmation delivered | No |
| Fresh pending workflow approved | Yes |
| Fresh record updated to `approved` | Yes |
| Valid Slack confirmation delivered | Yes |
| Scenario remained active | Yes |
| Result | Pass |
| Corrective action | None |

## Current caveat

Duplicate attempts are silently blocked and are not separately logged as a business event.

This remains a paused auditability improvement.

# Test 05 — Original webhook retirement

## Status

Passed.

## Objective

Confirm that the original exposed webhook no longer accepts intake and the replacement webhook remains the only active beta intake route.

## Recorded result

| Check | Outcome |
|---|---|
| Original webhook deleted | Yes |
| Synthetic request accepted by original webhook | No |
| Replacement webhook remains active | Yes |
| Result | Pass |
| Corrective action | None |

## Evidence rule

Do not record either webhook URL in this file, Slack or repository history.

# Test 06 — Slack review-message boundary

## Status

Passed.

## Objective

Confirm that the human-facing Slack review message advertises only the response route that is implemented.

## Expected message instruction

```text
Reply with:
APPROVE [workflow ID]
```

## Recorded result

| Check | Outcome |
|---|---|
| `APPROVE` displayed | Yes |
| Inactive response options removed | Yes |
| Workflow ID displayed | Yes |
| Internal schema names hidden from human-facing output | Yes |
| Result | Pass |

# Test 07 — Missing decision question

## Status

Not run.

## Objective

Confirm that incomplete intake is rejected before agent execution.

## Input variation

Remove:

```text
decision_question
```

## Expected behaviour

- validation fails;
- the Sensemaking Agent is not invoked;
- no review message is sent;
- the workflow stops safely;
- a safe failure summary is available;
- no silent continuation occurs.

## Implementation dependency

This test must not be marked passed until an explicit intake-validation route is confirmed in the active scenario.

# Test 08 — Privacy not confirmed

## Status

Not run.

## Objective

Confirm that the workflow does not process an intake when human privacy confirmation is false.

## Input variation

```text
privacy_confirmed = false
```

## Expected behaviour

- workflow stops before agent execution;
- privacy failure is visible;
- no unsafe payload is copied into Slack or repository content;
- only the approved minimum is retained;
- corrective action is clear.

## Implementation dependency

The active scenario must include an explicit Boolean validation rule before this test can pass.

# Test 09 — Missing required agent section

## Status

Not run.

## Objective

Confirm that invalid Sensemaking output does not reach human review.

## Test setup

Use a synthetic or mock response that omits one required output section.

## Expected behaviour

- output validation detects the missing section;
- no invalid output reaches Slack review;
- any correction attempt is bounded;
- retry count is visible;
- no unlimited loop occurs.

## Implementation dependency

Advanced output validation and correction routing are not yet confirmed in the current minimum scenario.

# Test 10 — Repeated invalid agent output

## Status

Not run.

## Objective

Confirm that repeated invalid agent output stops safely after the configured limit.

## Expected behaviour

- no unlimited correction loop;
- failure is visible;
- the error summary is safe;
- automatic execution stops;
- José retains the decision to retry or stop.

# Test 11 — Temporary Relevance AI failure

## Status

Not run.

## Objective

Confirm that a temporary Relevance AI failure follows a bounded retry rule without creating a duplicate workflow.

## Expected behaviour

- error handling is visible;
- retry count is recorded;
- workflow ID remains unchanged;
- no duplicate record is created;
- successful recovery returns to the normal path.

# Test 12 — Retry limit reached

## Status

Not run.

## Objective

Confirm that repeated technical failure stops safely at the configured limit.

## Expected behaviour

- retry limit is enforced;
- failure is visible;
- automatic execution stops;
- no hidden retries continue;
- José receives a clear next action through an approved monitoring route.

# Test 13 — Unauthorised responder

## Status

Not implemented / Not run.

## Objective

Confirm that a Slack action from an unauthorised responder cannot change workflow state.

## Expected behaviour

- workflow state remains unchanged;
- no approval is recorded;
- the attempted action is logged safely;
- no agent executes.

## Current caveat

The response route currently validates command text, channel and workflow state.

Authorised-responder validation remains paused and is required before wider beta use.

# Test 14 — Invalid or mismatched workflow reference

## Status

Partially covered.

## Objective

Confirm that an invalid workflow reference cannot update another workflow.

## Validated boundary

An invalid workflow ID:

- causes no record update;
- sends no approval confirmation;
- is handled by the `Skip` error handler; and
- leaves the scenario active.

## Not yet validated

A deliberate two-workflow mismatch test has not been separately recorded.

## Result

Partial.

# Test 15 — Unsupported state transition

## Status

Passed for duplicate approval; other states not run.

## Objective

Confirm that approval is allowed only from `human-review-required`.

## Validated boundary

A repeated APPROVE command for an `approved` workflow is blocked.

## Expected route rule

```text
current_state = human-review-required
```

## Not yet validated

Other unsupported or terminal states have not been separately tested because they are not active in the minimum workflow.

## Result

Partial.

# Test 16 — Slack review notification failure

## Status

Not run.

## Objective

Confirm that a failed review notification does not create an invisible pending decision.

## Expected behaviour

- `human-review-required` is preserved;
- the workflow does not approve automatically;
- the output remains available;
- notification failure is visible through approved operational monitoring;
- retries are bounded where configured.

# Test 17 — Sensitive-content safeguard

## Status

Not run.

## Objective

Confirm that obviously unsafe synthetic input is blocked or escalated without repeating the unsafe value.

## Test input

Use a synthetic placeholder only.

```text
TEST-CREDENTIAL-PLACEHOLDER
```

## Expected behaviour

- unsafe input does not reach the agent when configured as blocking;
- the placeholder is not repeated in Slack;
- logs contain only a safe summary;
- the workflow stops or requires human intervention;
- no real credential or customer information is used.

# Planned human-response tests

The following tests are retained as future test requirements but are not part of the current executable boundary.

## Approve with correction

Status: Not implemented.

Required future behaviour:

- original and corrected outputs remain distinguishable;
- correction text is preserved;
- output version increments;
- approval is explicit;
- no silent overwrite occurs.

## Request rework

Status: Not implemented.

Required future behaviour:

- one bounded human-directed rework cycle;
- prior output remains traceable;
- human instruction is not treated as evidence unless labelled;
- revised output returns to review.

## Repeated rework request

Status: Not implemented.

Required future behaviour:

- no unlimited rework loop;
- second automatic rework is blocked;
- control returns to José;
- the reason is visible.

## Pause and resume

Status: Not implemented.

Required future behaviour:

- state and output are preserved;
- no agent executes while paused;
- resume restores the review checkpoint;
- existing output remains available.

## Stop

Status: Not implemented.

Required future behaviour:

- stop is terminal;
- reason and completion time are recorded;
- later actions cannot change the workflow;
- no further agent executes.

# Test result template

Copy this section for each future execution.

## Test result

**Test ID:**  
`TEST-XX`

**Test name:**  
[Add name]

**Execution date:**  
[Add date and time]

**Workflow reference:**  
[Add privacy-safe workflow reference]

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
[APPROVE / Not applicable]

**Retry count:**  
[Add count or `Not applicable`]

**Final Data Store state:**  
[Add state]

**Completion timestamp recorded:**  
[Yes / No / Not applicable]

**Privacy result:**  
[Pass / Fail]

**Observed issue:**  
[Safe summary only]

**Result:**  
[Pass / Fail / Partial / Not run]

**Corrective action:**  
[Add action or `None`]

**Evidence references:**  
[Add safe references to Make.com execution, Slack message or Data Store record]

# Test summary

| Test ID | Test name | Status | Result | Material issue | Retest required |
|---|---|---|---|---|---|
| TEST-01 | Intake context preservation | Completed | Pass | None | No |
| TEST-02 | Happy path approval | Completed | Pass | None | No |
| TEST-03 | Invalid workflow ID | Completed after correction | Pass | Initial error deactivated scenario | No |
| TEST-04 | Duplicate approval | Completed after correction | Pass | Initial duplicate update | No |
| TEST-05 | Original webhook retirement | Completed | Pass | None | No |
| TEST-06 | Slack review-message boundary | Completed | Pass | None | No |
| TEST-07 | Missing decision question | Not run | — | Validation route not confirmed | Yes |
| TEST-08 | Privacy not confirmed | Not run | — | Blocking rule not validated | Yes |
| TEST-09 | Missing required agent section | Not run | — | Output validation not confirmed | Yes |
| TEST-10 | Repeated invalid agent output | Not run | — | Retry limit not confirmed | Yes |
| TEST-11 | Temporary Relevance AI failure | Not run | — | Retry behaviour not confirmed | Yes |
| TEST-12 | Retry limit reached | Not run | — | Failure route not confirmed | Yes |
| TEST-13 | Unauthorised responder | Not implemented | — | Responder identity not validated | Yes |
| TEST-14 | Invalid or mismatched workflow reference | Partial | Partial | Two-record mismatch not separately tested | Yes |
| TEST-15 | Unsupported state transition | Partial | Partial | Only approved-state duplicate tested | Yes |
| TEST-16 | Slack review notification failure | Not run | — | Failure visibility not confirmed | Yes |
| TEST-17 | Sensitive-content safeguard | Not run | — | Blocking safeguard not confirmed | Yes |

# Current control summary

| Control | Status | Evidence basis |
|---|---|---|
| Complete intake context preserved | Passed | Final Data Store record |
| `privacy_confirmed` preserved as Boolean | Passed | Final Data Store record |
| Valid pending workflow can be approved | Passed | Data Store state and Slack confirmation |
| `completed_at` recorded on approval | Passed | Final Data Store record |
| Invalid workflow ID changes no record | Passed | Data Store inspection |
| Invalid workflow ID leaves scenario active | Passed | Make.com execution status |
| Already-approved workflow cannot be approved again | Passed | No second update or confirmation |
| Fresh pending workflow still passes after controls | Passed | Regression test |
| Original exposed webhook retired | Passed | Deletion and rejection test |
| Only implemented Slack response advertised | Passed | Slack review message |
| Authorised-responder validation | Not implemented | Paused |
| Explicit invalid-ID feedback | Not implemented | Paused |
| Duplicate-attempt logging | Not implemented | Paused |
| Advanced output validation | Not confirmed | Future test |
| Retry and broader failure handling | Not confirmed | Future test |
| Automated GitHub publication | Disabled | Outside boundary |
| Downstream agent execution | Disabled | Outside boundary |

# Security and privacy status

## Completed

- replacement webhook created;
- replacement webhook used successfully;
- original exposed webhook deleted;
- webhook URLs excluded from repository content;
- approver identity removed from Slack confirmation;
- synthetic evidence used;
- `privacy_confirmed` preserved as a Boolean;
- `privacy_status` retained separately as text;
- invalid workflow IDs handled without record changes;
- duplicate approval blocked;
- internal schema names excluded from human-facing Slack output;
- automated GitHub commits disabled; and
- production use excluded.

## Still to confirm

- the rotated intake scenario is saved and Active;
- any previously exposed Relevance credential has been revoked and replaced;
- authorised-responder validation before wider beta use;
- explicit intake rejection when privacy confirmation is false;
- bounded retry and failure handling; and
- sensitive-content blocking behaviour.

# Release gate

## Minimum APPROVE-route gate

The contained APPROVE route is considered validated only when:

- intake context preservation passes;
- valid approval passes;
- `completed_at` is recorded;
- invalid workflow IDs cannot change records or disable the scenario;
- duplicate approvals cannot update completed records;
- the original exposed webhook is deleted;
- only the supported Slack instruction is displayed;
- synthetic test content is used;
- no sensitive evidence is retained; and
- regression testing confirms that a fresh pending workflow can still be approved.

This contained gate has passed within the tested boundary.

## Wider beta gate

Do not extend the workflow to wider beta use until:

- authorised-responder validation is implemented and tested;
- missing-decision-question handling is tested;
- `privacy_confirmed = false` is blocked and tested;
- output-validation behaviour is tested;
- retry and retry-limit behaviour are tested;
- Slack review-notification failure is visible and recoverable;
- sensitive-content safeguard behaviour is tested;
- any exposed Relevance credential has been revoked and replaced;
- the rotated intake scenario is confirmed saved and Active;
- no silent failure remains;
- no unauthorised state change is possible; and
- all material defects have an owner and disposition.

## Downstream integration gate

Do not progress to Stakeholder Journey Agent integration, Shipping Coach execution, `ready-for-use` or automated GitHub publication until the wider beta gate passes and José explicitly authorises the next step.

# Release decision

Record one outcome:

- `Proceed with contained APPROVE beta`
- `Proceed with contained corrections`
- `Retest required`
- `Stop`

## Current decision record

**Outcome:**  
`Proceed with contained APPROVE beta`

**Decision owner:**  
José Andrade

**Date:**  
[Add date]

**Evidence:**  
Privacy-safe Make.com execution references, Slack message references and final Data Store records.

**Material caveats:**  

- Only the APPROVE route is implemented.
- Authorised-responder validation is not implemented.
- Invalid workflow IDs are silently contained.
- Duplicate attempts are silently blocked.
- Advanced validation, retries and wider failure handling remain untested.
- Downstream automation remains disabled.

**Required corrections:**  

- Confirm the rotated intake scenario is saved and Active.
- Confirm any exposed Relevance credential has been revoked and replaced.
- Implement and test authorised-responder validation before wider beta use.

**Next authorised step:**  
Continue contained beta testing only. Do not add downstream automation or additional response routes without a separate decision.
