# Make.com Scenario Test Script

## Purpose

Provide the reusable test script for validating Strategic OS specialist runtimes implemented through Make.

The script reflects the runtime pattern proven across all five priority specialists:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

This file tests the operational runtime boundary.

It does not define future multi-agent orchestration.

Current operating principle:

> Operate the validated specialist runtimes through real work before expanding orchestration.

---

## Status

**Specialist runtime validation:** Complete

**Validated specialist set:**

- [x] Sensemaking Agent
- [x] Stakeholder Journey Agent
- [x] Career Architect
- [x] Shipping Coach
- [x] Chief of Staff Agent

**Current phase:**

> Use, observation and evidence.

This script remains the regression-test reference for maintaining or deliberately changing the validated specialist runtime.

---

# 1. Test boundary

## Validated common runtime

Each specialist follows:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener → approved state`

The common runtime includes:

- specialist-specific webhook intake;
- common intake schema;
- `privacy_confirmed = true` privacy gate;
- shared `strategic_os_beta_workflows` Data Store;
- specialist reasoning in Relevance AI;
- Make used for orchestration only;
- specialist output persisted to `latest_output`;
- transition from `processing` to `human-review-required`;
- Slack human review;
- strict `P <workflow_id>` parsing;
- workflow record lookup;
- approved-state persistence;
- Slack approval confirmation.

## Current human-review boundary

The supported approval command is:

`P <workflow_id>`

Strict parser:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

Do not document other response commands as operational until they have been implemented and validated.

---

# 2. System responsibilities

## Make

Make is responsible for:

- intake;
- privacy gating;
- workflow-state persistence;
- invoking the selected specialist;
- persisting specialist output;
- sending Slack review messages;
- parsing the supported approval command;
- retrieving the workflow record;
- persisting approval;
- sending approval confirmation.

Make should remain thin.

Do not reproduce specialist reasoning in Make.

## Relevance AI

Relevance AI is responsible for specialist reasoning according to the selected Strategic OS agent contract.

## Slack

Slack is the human-review surface.

Slack messages are useful human-facing evidence but are not authoritative for persisted workflow state.

## Shared Data Store

`strategic_os_beta_workflows`

The final Data Store record is authoritative for workflow state.

---

# 3. Test evidence hierarchy

Use this evidence hierarchy when validating runtime behaviour:

1. final Make Data Store record;
2. Make execution history;
3. Slack review or confirmation message;
4. safe manual observations.

The Data Store record is authoritative for:

- `workflow_name`;
- `active_agent`;
- preserved intake fields;
- workflow state;
- decision status;
- approval status;
- completion time;
- privacy status.

Slack confirms human-facing delivery.

A Slack message alone does not prove that state was persisted successfully.

---

# 4. Privacy and evidence rules

Use only synthetic or privacy-safe content for technical validation.

Do not place the following in this file or other repository evidence:

- webhook URLs;
- credentials;
- tokens;
- secrets;
- customer records;
- identifiable case details;
- raw organisational data;
- sensitive operational extracts;
- unrestricted execution logs;
- screenshots containing sensitive configuration.

Evidence should use:

- safe workflow references;
- safe execution references;
- safe summaries;
- pass / fail observations;
- field names;
- expected and observed state transitions.

Do not record credential values even partially.

---

# 5. Common webhook intake contract

The validated specialist intake structure is:

    name
    workflow_name
    decision_question
    opportunity_summary
    evidence
    known_assumptions
    constraints
    requested_output
    requested_outcome
    submitted_by
    slack_destination
    privacy_confirmed

`name` remains part of the current webhook structure detected by Make.

Do not redesign the common intake contract unless repeated operational use identifies a genuine need.

---

# 6. Standard safe test intake

Use a synthetic intake based on this pattern:

    {
      "name": "Synthetic Strategic OS runtime test",
      "workflow_name": "<specialist-workflow>",
      "decision_question": "What is the most useful next strategic decision?",
      "opportunity_summary": "Synthetic context for testing the specialist runtime.",
      "evidence": "Safe synthetic evidence.",
      "known_assumptions": "Known assumptions that remain unvalidated.",
      "constraints": "Use synthetic data only. Human review is required.",
      "requested_output": "A reviewable specialist recommendation.",
      "requested_outcome": "Confirm the runtime produces useful decision support.",
      "submitted_by": "approved-initiator",
      "slack_destination": "approved-test-destination",
      "privacy_confirmed": true
    }

Field names must match the active Make mapping.

Use live Make mapping tokens.

Do not use copied black or plain-text placeholders where live mapping tokens are required.

---

# 7. Shared Data Store structure

Use:

`strategic_os_beta_workflows`

Primary lookup key:

`workflow_id`

Maintain the shared fields in this logical order:

    workflow_name
    active_agent

    decision_question
    opportunity_summary
    evidence
    known_assumptions
    constraints
    requested_output
    requested_outcome

    submitted_by
    slack_destination
    privacy_confirmed
    privacy_status

    previous_state
    current_state
    decision_status
    human_action_required

    review_code
    review_sequence
    latest_output
    last_error_summary

    retry_count
    rework_count
    output_version

    created_at
    updated_at
    completed_at

Do not create separate agent-specific Data Stores.

---

# 8. Validated state model

The minimum validated path is:

    intake
      ↓
    privacy gate
      ↓
    processing
      ↓
    human-review-required
      ↓
    approved

The validated approval transition is:

    human-review-required
    → approved

Do not treat earlier exploratory states as current runtime requirements unless they are deliberately implemented and retested.

---

# 9. Expected approved state

After successful approval, verify:

    previous_state = human-review-required
    current_state = approved
    decision_status = approved
    human_action_required = false
    completed_at = now
    updated_at = now
    privacy_status = confirmed

No additional specialist should execute automatically after approval.

---

# 10. Specialist runtime configuration

## Sensemaking Agent

Scenario:

`Strategic OS Beta — Sensemaking Review`

Runtime values:

    workflow_name = sensemaking
    active_agent = sensemaking-agent

Status:

> Validated end to end.

This runtime established the original specialist pattern.

---

## Stakeholder Journey Agent

Scenario:

`Strategic OS Beta — Stakeholder Journey Review`

Runtime values:

    workflow_name = stakeholder-journey
    active_agent = stakeholder-journey-agent

Status:

> Validated end to end.

Implementation learning:

- replace the selected Relevance AI agent when cloning;
- replace inherited specialist wrapper text;
- check Data Store labels;
- check Slack labels;
- use live Make mapping tokens.

---

## Career Architect

Scenario:

`Strategic OS Beta — Career Architect Review`

Webhook:

`Strategic OS Beta — Career Architect Intake`

Runtime values:

    workflow_name = career-architect
    active_agent = career-architect-agent

Validated Relevance AI Agent ID:

`24e39803-109a-423b-a7d9-02c22acdc5f8`

Status:

> Validated end to end.

---

## Shipping Coach

Scenario:

`Strategic OS Beta — Shipping Coach Review`

Webhook:

`Strategic OS Beta — Shipping Coach Intake`

Runtime values:

    workflow_name = shipping-coach
    active_agent = shipping-coach-agent

Validated Relevance AI Agent ID:

`f34c1e33-ce57-4d8b-bc2b-a4fe24f5ed24`

Status:

> Validated end to end.

---

## Chief of Staff Agent

Scenario:

`Strategic OS Beta — Chief of Staff Review`

Webhook:

`Strategic OS Beta — Chief of Staff Intake`

Runtime values:

    workflow_name = chief-of-staff
    active_agent = chief-of-staff-agent

Validated Relevance AI Agent ID:

`cea451dc-641c-4d3e-9e18-c1d0fb1dc57c`

Status:

> Validated end to end.

---

# 11. Standard specialist regression test

Run this test when:

- creating a new specialist scenario;
- changing shared Data Store mappings;
- changing the webhook schema;
- changing approval parsing;
- modifying Slack review messages;
- changing state-transition logic;
- modifying the Relevance AI invocation;
- investigating a runtime regression.

Do not rerun the complete test suite after documentation-only changes.

---

## TEST-01 — Intake received

### Objective

Confirm that the specialist webhook receives the expected safe intake.

### Check

- [ ] specialist webhook receives the request;
- [ ] expected common fields are available;
- [ ] `privacy_confirmed` is Boolean;
- [ ] no sensitive data is present;
- [ ] correct specialist scenario receives the request.

### Pass condition

> The expected specialist receives the safe common intake without schema loss.

---

## TEST-02 — Privacy gate

### Objective

Confirm that specialist execution requires:

`privacy_confirmed = true`

### Check

- [ ] true value passes the gate;
- [ ] gate occurs before specialist reasoning;
- [ ] privacy status is preserved correctly;
- [ ] no alternative route silently bypasses the gate.

### Pass condition

> Specialist execution occurs only through the confirmed privacy path.

### Caveat

Detailed privacy-rejection feedback remains outside the validated runtime.

Do not describe it as implemented.

---

## TEST-03 — Correct specialist mapping

### Objective

Confirm that the intended specialist is invoked.

### Check

- [ ] correct `workflow_name`;
- [ ] correct `active_agent`;
- [ ] correct Relevance AI agent;
- [ ] correct specialist wrapper;
- [ ] no inherited specialist labels;
- [ ] no inherited specialist instructions.

### Pass condition

> The intended specialist contract is invoked without contamination from the scenario used as the cloning source.

---

## TEST-04 — Workflow record persisted

### Objective

Confirm that the shared Data Store contains the expected safe workflow context.

### Check

- [ ] workflow record exists;
- [ ] workflow ID exists;
- [ ] correct `workflow_name`;
- [ ] correct `active_agent`;
- [ ] decision question preserved;
- [ ] opportunity summary preserved;
- [ ] evidence preserved;
- [ ] assumptions preserved;
- [ ] constraints preserved;
- [ ] requested output preserved;
- [ ] requested outcome preserved;
- [ ] privacy fields preserved.

### Pass condition

> The shared Data Store contains the correct safe specialist context.

---

## TEST-05 — Processing state

### Objective

Confirm the workflow enters the active specialist-processing state.

### Expected state

    current_state = processing

### Check

- [ ] state is persisted before or during specialist execution according to the active scenario mapping;
- [ ] active specialist remains identifiable;
- [ ] workflow ID remains unchanged.

### Pass condition

> The workflow is traceable while specialist reasoning is running.

---

## TEST-06 — Specialist output

### Objective

Confirm that Relevance AI returns the intended specialist output.

### Check

- [ ] specialist executes successfully;
- [ ] response reflects the correct specialist contract;
- [ ] response is available to Make;
- [ ] response is not automatically treated as an approved decision;
- [ ] human review remains required.

### Pass condition

> A reviewable specialist output is returned without bypassing human judgement.

---

## TEST-07 — Output persistence and review state

### Objective

Confirm that specialist output is persisted and the workflow moves into human review.

### Expected mapping

    latest_output = <Relevance AI answer>
    previous_state = processing
    current_state = human-review-required
    human_action_required = true

### Check

- [ ] output stored in `latest_output`;
- [ ] previous state correct;
- [ ] current state correct;
- [ ] human action required;
- [ ] updated timestamp populated.

### Pass condition

> Specialist output is persisted and explicitly awaits human review.

---

## TEST-08 — Slack review message

### Objective

Confirm that Slack presents the correct specialist review request.

### Expected pattern

    Strategic OS — <Specialist> review

    Workflow ID:
    <workflow_id>

    Agent:
    <Specialist Agent>

    Output:
    <Relevance AI answer>

    Human review required.

    Approve:
    P <workflow_id>

### Check

- [ ] correct specialist label;
- [ ] correct workflow ID;
- [ ] correct specialist output;
- [ ] human-review requirement visible;
- [ ] only the implemented approval instruction is presented;
- [ ] no internal credential or sensitive information displayed.

### Pass condition

> Slack provides a clear and safe human-review checkpoint.

---

## TEST-09 — Strict approval parsing

### Objective

Confirm that the approval listener recognises only the supported command structure.

Use:

`P <workflow_id>`

Regex:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

### Check

- [ ] valid command matches;
- [ ] workflow ID extracted correctly;
- [ ] unrelated Slack text does not match;
- [ ] malformed command does not trigger approval;
- [ ] obsolete `APPROVE <workflow_id>` wording is not required by the current runtime.

### Pass condition

> Only the strict current approval format reaches workflow lookup.

---

## TEST-10 — Workflow lookup

### Objective

Confirm that the extracted workflow ID retrieves the intended shared Data Store record.

### Check

- [ ] matching workflow retrieved;
- [ ] active workflow state available;
- [ ] specialist context preserved;
- [ ] no unrelated record updated.

### Pass condition

> Approval operates on the intended workflow record.

---

## TEST-11 — Approval-state guard

### Objective

Confirm that approval is applied only to a workflow awaiting human review.

Required state:

    current_state = human-review-required

### Check

- [ ] pending workflow can proceed;
- [ ] already approved workflow is not updated again;
- [ ] completion timestamp is not refreshed by duplicate approval;
- [ ] duplicate confirmation is not generated.

### Pass condition

> Approval cannot silently rewrite an already completed workflow.

---

## TEST-12 — Approved-state persistence

### Objective

Confirm successful human approval is persisted correctly.

Expected state:

    previous_state = human-review-required
    current_state = approved
    decision_status = approved
    human_action_required = false
    completed_at = now
    updated_at = now
    privacy_status = confirmed

### Check

- [ ] all expected fields updated;
- [ ] workflow ID unchanged;
- [ ] specialist output preserved;
- [ ] no downstream specialist triggered.

### Pass condition

> The Data Store authoritatively records explicit human approval.

---

## TEST-13 — Slack approval confirmation

### Objective

Confirm that the reviewer receives acknowledgement of successful approval.

### Check

- [ ] confirmation delivered;
- [ ] correct workflow reference;
- [ ] no sensitive data exposed;
- [ ] confirmation follows successful Data Store update.

### Pass condition

> Human-facing confirmation is consistent with the persisted approved state.

---

# 12. Defensive controls retained from initial runtime validation

The original Sensemaking runtime exposed several useful controls that remain relevant to the shared specialist pattern.

## Invalid workflow ID

Previously validated behaviour:

    invalid workflow ID
    → Data Store lookup error
    → Skip error handler
    → no Data Store update
    → no approval confirmation
    → scenario remains active

Status:

> Validated in the original runtime boundary.

Retest this control if the approval-listener lookup or error-handler design changes.

Explicit invalid-ID user feedback remains paused.

---

## Duplicate approval

Previously validated behaviour:

- an approved record is not updated again;
- `completed_at` is not overwritten;
- no second approval confirmation is delivered;
- fresh pending workflows remain approvable.

Status:

> Validated in the original runtime boundary.

Retest if approval-state filtering changes.

---

## Original exposed webhook retirement

An earlier exposed intake webhook was deleted and excluded from repository evidence.

Status:

> Historical corrective control completed.

Do not store current webhook URLs in Strategic OS.

---

# 13. Specialist cloning regression checklist

When cloning a validated specialist runtime:

- [ ] clone a known working specialist scenario;
- [ ] rename the scenario;
- [ ] use the intended specialist-specific webhook;
- [ ] confirm common intake fields;
- [ ] set correct `workflow_name`;
- [ ] set correct `active_agent`;
- [ ] select correct Relevance AI agent;
- [ ] replace inherited wrapper text;
- [ ] inspect every Data Store mapping;
- [ ] inspect every Slack label;
- [ ] use live Make tokens;
- [ ] test privacy gate;
- [ ] test specialist execution;
- [ ] confirm `latest_output`;
- [ ] confirm `human-review-required`;
- [ ] send `P <workflow_id>`;
- [ ] confirm approved-state persistence;
- [ ] confirm Slack approval acknowledgement.

A specialist is not operational merely because the correct Relevance AI agent is selected.

The complete runtime path must pass.

---

# 14. Test result template

Use this lightweight record when a regression test or runtime change requires evidence.

## Test result

**Test ID:**  
`TEST-XX`

**Specialist:**  
[Add specialist]

**Scenario:**  
[Add scenario name]

**Execution date:**  
[Add date]

**Workflow reference:**  
[Add privacy-safe workflow reference]

**Change being validated:**  
[Describe the runtime change or reason for retesting]

**Expected state sequence:**  

    processing
    → human-review-required
    → approved

**Observed state sequence:**  
[Add observed sequence]

**Specialist result:**  
[Pass / Fail / Not invoked]

**Slack review:**  
[Delivered / Failed / Not applicable]

**Human action:**  
[P approval / Not applicable]

**Final Data Store state:**  
[Add state]

**Privacy result:**  
[Pass / Fail]

**Observed issue:**  
[Safe summary only]

**Result:**  
[Pass / Fail / Partial]

**Corrective action:**  
[Add action or `None`]

**Evidence references:**  
[Privacy-safe references only]

---

# 15. Validated specialist summary

| Specialist | Intake | Specialist execution | Human review | P approval | Approved state | Status |
|---|---|---|---|---|---|---|
| Sensemaking Agent | Passed | Passed | Passed | Passed | Passed | Validated |
| Stakeholder Journey Agent | Passed | Passed | Passed | Passed | Passed | Validated |
| Career Architect | Passed | Passed | Passed | Passed | Passed | Validated |
| Shipping Coach | Passed | Passed | Passed | Passed | Passed | Validated |
| Chief of Staff Agent | Passed | Passed | Passed | Passed | Passed | Validated |

Behavioural validation:

> Complete

Specialist runtime implementation:

> Complete

---

# 16. Current implemented controls

| Control | Status |
|---|---|
| Specialist-specific webhook intake | Validated |
| Common intake schema | Validated |
| `privacy_confirmed = true` gate | Validated |
| Shared Data Store | Validated |
| Correct specialist invocation | Validated |
| Specialist output persistence | Validated |
| `processing → human-review-required` transition | Validated |
| Slack human review | Validated |
| Strict `P <workflow_id>` parsing | Validated |
| Workflow lookup | Validated |
| Approval-state persistence | Validated |
| Slack approval confirmation | Validated |
| Invalid workflow ID containment | Previously validated |
| Duplicate approval prevention | Previously validated |
| Automatic downstream agent execution | Not implemented |
| Automatic GitHub writes | Not implemented |

---

# 17. Known but not implemented

Do not mark the following as test failures merely because they are absent.

They are outside the validated minimum runtime:

- `L` rework command;
- `M` stop command;
- approve with correction;
- pause and resume;
- privacy rejection feedback;
- authorised-responder validation;
- explicit invalid-ID feedback;
- duplicate-attempt business logging;
- advanced output validation;
- automated correction retries;
- Relevance AI failure recovery;
- retry-limit handling;
- Slack notification failure recovery;
- sensitive-content safeguards beyond the current privacy gate;
- workflow ID cleanup;
- multi-agent router;
- automatic specialist sequencing;
- automatic GitHub writes.

These are backlog items or future signals.

They should be implemented only when repeated real use demonstrates a need.

---

# 18. Runtime hardening rule

Do not turn every unimplemented safeguard into an immediate build requirement.

A hardening item should move into active implementation when one or more of the following is true:

- repeated real use exposes the weakness;
- the operating boundary expands;
- more users gain access;
- the workflow moves into an organisational environment;
- the consequence of failure materially increases;
- an existing control proves unreliable;
- privacy, security or governance requires the change.

Use the smallest adequate control.

Retest only the affected runtime behaviour plus the core approval regression path.

---

# 19. Wider-use review triggers

Reassess the current runtime boundary before:

- adding other Slack workspace members;
- moving to a shared organisational Slack environment;
- allowing broader beta access;
- processing higher-risk information;
- allowing agents to trigger other agents automatically;
- automating external publication;
- automating repository writes;
- granting agents action authority beyond decision support.

These are review triggers, not current requirements.

---

# 20. Regression gate

A specialist runtime remains operational when:

- [ ] safe intake is received;
- [ ] privacy confirmation is required;
- [ ] correct specialist runs;
- [ ] shared workflow record remains traceable;
- [ ] specialist output is persisted;
- [ ] workflow enters `human-review-required`;
- [ ] Slack review reaches the human;
- [ ] strict `P <workflow_id>` approval is recognised;
- [ ] the intended workflow is retrieved;
- [ ] approval is allowed only from the review state;
- [ ] approved state is persisted;
- [ ] Slack confirmation is delivered;
- [ ] no automatic downstream specialist runs;
- [ ] no sensitive evidence is retained.

If a runtime change breaks one of these controls:

> Fix the smallest relevant runtime element and rerun the affected regression tests.

Do not redesign the wider architecture by default.

---

# 21. Current release decision

**Outcome:**

> Five priority specialist runtimes validated for contained use.

**Operating decision:**

> Operate the validated specialist runtimes through real work before expanding orchestration.

**Current priority:**

> Use, observation and evidence.

Do not progress automatically to:

- a multi-agent router;
- specialist chaining;
- autonomous workflow sequencing;
- automatic publication;
- automatic GitHub writes.

Those capabilities require separate evidence and a separate decision.

---

# 22. Next evidence threshold

Technical validation is no longer the main constraint.

The next question is whether the validated runtime produces durable value through repeated real work.

Observe:

- whether the right specialist is easy to select;
- whether the common intake contract remains sufficient;
- whether Slack review remains lightweight;
- whether approval-state persistence remains reliable;
- whether specialist outputs improve real decisions;
- whether any failure pattern recurs;
- whether manual orchestration creates meaningful friction.

Only repeated evidence should trigger runtime expansion.

> A working specialist runtime is infrastructure. Its value is proven by the decisions it improves.
