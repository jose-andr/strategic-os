# Make.com Scenario Build Specification

## Purpose

Provide a build-ready specification for the first Strategic OS beta scenario in Make.com.

This file translates:

- `automation_and_slack_workflow.md`
- `beta_component_mapping.md`
- `minimum_make_scenario.md`

into a practical module sequence.

The scenario covers intake through the first Sensemaking Agent human-review checkpoint.

## Build principle

Build the smallest reliable scenario first.

Do not add the Stakeholder Journey Agent, Shipping Coach, automated GitHub commits or advanced reporting until this scenario passes its minimum test cases.

## Scenario architecture

Use two Make.com scenarios:

1. `Strategic OS Beta — Sensemaking Review`
2. `Strategic OS Beta — Human Review Response`

Separating agent execution from human response handling avoids leaving one scenario waiting indefinitely for Slack input.

## Scenario boundary

### Starts when

An approved intake payload is received through a Make.com custom webhook.

### Ends when

José selects one of the following review actions:

- Approve
- Approve with correction
- Request rework
- Pause
- Stop

## Required connections

Configure these connections before building:

| Connection | Purpose | Required validation |
|---|---|---|
| Make.com custom webhook | Receive approved workflow intake | Test payload received successfully |
| Relevance AI | Invoke the Sensemaking Agent | Agent ID and authentication confirmed |
| Slack | Send notifications and receive authorised actions | Workspace and destination confirmed |
| Make.com Data Store | Maintain workflow state | Create, read and update confirmed |

Do not record credentials, secrets, webhook URLs or connection identifiers in this repository.

## Data Store

### Data store name

`strategic_os_beta_workflows`

### Primary key

`workflow_id`

### Required fields

| Field | Type | Example |
|---|---|---|
| `workflow_id` | Text | `sos-beta-20260731-130501-a7f2` |
| `workflow_name` | Text | `Bitbucket knowledge pilot` |
| `decision_question` | Text | `Should the proposal move into stakeholder socialisation?` |
| `opportunity_summary` | Long text | Safe summary of the opportunity |
| `known_evidence` | Long text | Safe evidence summary |
| `known_assumptions` | Long text | Visible assumptions |
| `constraints` | Long text | Known constraints and exclusions |
| `requested_output` | Text | Required agent output |
| `current_state` | Text | `sensemaking-review` |
| `previous_state` | Text | `sensemaking-running` |
| `active_agent` | Text | `human-review` |
| `decision_status` | Text | `pending` |
| `human_action_required` | Boolean | `true` |
| `available_actions` | Text | `approve,correct,rework,pause,stop` |
| `retry_count` | Number | `0` |
| `rework_count` | Number | `0` |
| `input_reference` | Text | Safe intake reference |
| `output_reference` | Text | Safe review reference |
| `output_version` | Number | `1` |
| `original_output` | Long text | First validated agent output |
| `latest_output` | Long text | Latest reviewable output |
| `human_correction` | Long text | Approved human correction |
| `last_error_summary` | Text | Safe operational error summary |
| `privacy_status` | Text | `confirmed` |
| `slack_destination` | Text | Approved channel or user identifier |
| `submitted_by` | Text | Approved initiator identifier |
| `created_at` | Date | Scenario timestamp |
| `updated_at` | Date | Scenario timestamp |
| `completed_at` | Date | Blank until a terminal state |

## Intake payload

The intake webhook should receive the following structure:

    {
      "workflow_name": "Bitbucket knowledge pilot",
      "decision_question": "Should the proposal move into stakeholder socialisation?",
      "opportunity_summary": "Create a governed and reusable approach to project and customer information using an existing enterprise Bitbucket capability.",
      "known_evidence": [
        "Bitbucket is already used by City of Melbourne developers.",
        "Project and customer information is distributed across multiple tools."
      ],
      "known_assumptions": [
        "A contained pilot can operate within existing governance."
      ],
      "constraints": [
        "Do not move all documentation into Git.",
        "Existing organisational platforms remain systems of record."
      ],
      "requested_output": "A structured decision framing suitable for stakeholder review.",
      "submitted_by": "jose-andrade",
      "slack_destination": "APPROVED_DESTINATION_ID",
      "privacy_confirmed": true
    }

Use synthetic or safe summary data during testing.

# Scenario 1 — Sensemaking Review

## Scenario name

`Strategic OS Beta — Sensemaking Review`

## Module A1 — Receive approved intake

Make.com module:

`Webhooks > Custom webhook`

Module name:

`Receive approved beta intake`

Expected fields:

- `workflow_name`
- `decision_question`
- `opportunity_summary`
- `known_evidence`
- `known_assumptions`
- `constraints`
- `requested_output`
- `submitted_by`
- `slack_destination`
- `privacy_confirmed`

## Module A2 — Set workflow variables

Make.com module:

`Tools > Set multiple variables`

Create:

| Variable | Value rule |
|---|---|
| `workflow_id` | `sos-beta-{timestamp}-{random suffix}` |
| `received_at` | Current scenario timestamp |
| `initial_state` | `intake-received` |
| `active_agent` | `sensemaking-agent` |
| `decision_status` | `pending` |
| `retry_count` | `0` |
| `rework_count` | `0` |
| `output_version` | `0` |

The workflow ID must remain unchanged throughout the workflow.

## Module A3 — Route intake validation

Make.com module:

`Flow control > Router`

Create two routes:

1. Valid intake
2. Invalid intake

## Valid-intake filter

All conditions must pass:

- `workflow_name` is present
- `decision_question` is present
- `opportunity_summary` is present
- `requested_output` is present
- `submitted_by` is present
- `slack_destination` is present
- `privacy_confirmed` equals `true`

Optional validation may also check:

- maximum field lengths
- unsupported attachments
- likely credential patterns
- likely customer-information patterns

Automated pattern checks should produce warnings unless they are reliable enough to avoid false positives.

Human privacy confirmation remains mandatory.

## Invalid-intake route

### Module A4-F1 — Create failed workflow record

Make.com module:

`Data Store > Add or replace a record`

Set:

| Field | Value |
|---|---|
| `workflow_id` | Generated workflow ID |
| `current_state` | `failed` |
| `previous_state` | `not-started` |
| `active_agent` | `intake-validation` |
| `decision_status` | `rejected` |
| `human_action_required` | `true` |
| `last_error_summary` | `Required intake validation failed` |
| `privacy_status` | `not-confirmed` or `validation-failed` |
| `created_at` | Current timestamp |
| `updated_at` | Current timestamp |
| `completed_at` | Current timestamp |

### Module A4-F2 — Send validation-failure notification

Make.com module:

`Slack > Create a message`

Suggested message:

> Workflow `{workflow_id}` did not start.
>
> Failed step: intake validation  
> State: `failed`
>
> One or more required fields are missing, or privacy confirmation was not provided.
>
> Correct the intake and submit a new request.
>
> No agent was invoked.

### Module A4-F3 — Stop route

Make.com module:

`Flow control > Break`

Do not continue to the Relevance AI call.

## Valid-intake route

### Module A4 — Create workflow record

Make.com module:

`Data Store > Add or replace a record`

Set:

| Field | Value |
|---|---|
| `workflow_id` | Generated workflow ID |
| `workflow_name` | Intake value |
| `decision_question` | Intake value |
| `opportunity_summary` | Intake value |
| `known_evidence` | Intake value |
| `known_assumptions` | Intake value |
| `constraints` | Intake value |
| `requested_output` | Intake value |
| `current_state` | `intake-received` |
| `previous_state` | `not-started` |
| `active_agent` | `sensemaking-agent` |
| `decision_status` | `pending` |
| `human_action_required` | `false` |
| `available_actions` | Blank |
| `retry_count` | `0` |
| `rework_count` | `0` |
| `output_version` | `0` |
| `privacy_status` | `confirmed` |
| `slack_destination` | Intake value |
| `submitted_by` | Intake value |
| `created_at` | Current timestamp |
| `updated_at` | Current timestamp |

## Module A5 — Send workflow-start notification

Make.com module:

`Slack > Create a message`

Suggested message:

> Workflow `{workflow_id}` has started.
>
> Decision: {decision_question}  
> State: `intake-received`
>
> The Sensemaking Agent will prepare a structured decision framing.
>
> Human review will be required before the workflow continues.

A failed start notification should be logged but should not stop agent execution.

## Module A6 — Update state to Sensemaking running

Make.com module:

`Data Store > Update a record`

Set:

| Field | Value |
|---|---|
| `previous_state` | `intake-received` |
| `current_state` | `sensemaking-running` |
| `active_agent` | `sensemaking-agent` |
| `updated_at` | Current timestamp |

## Module A7 — Compose agent request

Make.com module:

`Tools > Compose a string`

Use the following request:

    Workflow ID:
    {{workflow_id}}

    Decision to support:
    {{decision_question}}

    Opportunity summary:
    {{opportunity_summary}}

    Known evidence:
    {{known_evidence}}

    Known assumptions:
    {{known_assumptions}}

    Constraints:
    {{constraints}}

    Requested output:
    {{requested_output}}

    Instructions:
    - Distinguish evidence, assumptions, interpretation, recommendation and action.
    - Do not make the final decision.
    - Do not invent evidence.
    - Preserve uncertainty.
    - Identify material caveats.
    - Return all required sections.
    - Use the exact response structure below.

    Required response structure:

    Decision:
    Opportunity:
    Evidence:
    Assumptions:
    Interpretation:
    Options:
    Trade-offs:
    Preliminary recommendation:
    Unresolved questions:
    Stakeholder-analysis handoff:
    Confidence:
    Caveats:

Do not include:

- unrelated Slack history
- credentials
- customer information
- raw organisational extracts
- confidential attachments
- unnecessary prior conversation context

## Module A8 — Invoke Sensemaking Agent

Use the approved Relevance AI integration method.

Preferred order:

1. Native Make.com integration, where available and approved
2. Approved HTTP API call
3. Controlled manual invocation for connection testing only

Record:

- workflow ID
- agent identifier
- request timestamp
- response timestamp
- execution outcome
- safe error summary where applicable

Do not store credentials or unrestricted prompt data in logs.

## Module A9 — Route output validation

Make.com module:

`Flow control > Router`

Create three routes:

1. Valid agent output
2. Invalid agent output
3. Technical failure

## Valid-output filter

Confirm that the output:

- is not empty
- can be reliably linked to the workflow ID
- contains every required heading
- does not claim final decision authority
- includes visible caveats
- distinguishes evidence from assumptions

Required headings:

- `Decision:`
- `Opportunity:`
- `Evidence:`
- `Assumptions:`
- `Interpretation:`
- `Options:`
- `Trade-offs:`
- `Preliminary recommendation:`
- `Unresolved questions:`
- `Stakeholder-analysis handoff:`
- `Confidence:`
- `Caveats:`

## Invalid-output route

### Module A10-I1 — Increment retry count

Make.com module:

`Data Store > Update a record`

Set:

`retry_count = retry_count + 1`

### Module A10-I2 — Route retry decision

Make.com module:

`Flow control > Router`

Create two routes:

1. First invalid output
2. Second invalid output

### First invalid output

Filter:

`retry_count = 1`

Send one correction request to the Sensemaking Agent:

    The previous response for workflow {{workflow_id}} did not meet the required response contract.

    Missing or invalid elements:
    {{validation_summary}}

    Return a corrected response using every required heading.

    Do not add unsupported evidence.
    Do not remove visible caveats.
    Do not claim final decision authority.

Route the corrected response back through output validation.

### Second invalid output

Filter:

`retry_count >= 2`

Update the workflow record:

| Field | Value |
|---|---|
| `previous_state` | `sensemaking-running` |
| `current_state` | `failed` |
| `active_agent` | `sensemaking-agent` |
| `decision_status` | `failed` |
| `human_action_required` | `true` |
| `last_error_summary` | Safe validation-failure summary |
| `updated_at` | Current timestamp |

Send a Slack notification:

> Workflow `{workflow_id}` requires attention.
>
> Failed step: Sensemaking output validation  
> State: `failed`
>
> The agent did not return a valid response after one correction attempt.
>
> Review the failure, retry manually, revise the intake or stop the workflow.

Stop automatic execution.

## Technical-failure route

Attach a Make.com error handler to the Relevance AI module.

Retry only:

- temporary API timeout
- temporary service unavailability
- supported rate-limit response
- temporary network failure

Initial retry policy:

- maximum two retries
- increasing delay between retries
- no hidden retries after the limit

After the retry limit:

- set `current_state` to `failed`
- set `human_action_required` to `true`
- record a safe error summary
- notify José
- stop execution

## Valid-output route

### Module A10 — Store validated output

Make.com module:

`Data Store > Update a record`

Set:

| Field | Value |
|---|---|
| `original_output` | Validated agent output |
| `latest_output` | Validated agent output |
| `output_version` | `1` |
| `output_reference` | Safe stored-output reference |
| `previous_state` | `sensemaking-running` |
| `current_state` | `sensemaking-review` |
| `active_agent` | `human-review` |
| `decision_status` | `pending` |
| `human_action_required` | `true` |
| `available_actions` | `approve,correct,rework,pause,stop` |
| `updated_at` | Current timestamp |

## Module A11 — Send review notification

Make.com module:

`Slack > Create a message`

Suggested message:

> Sensemaking review required for workflow `{workflow_id}`.
>
> State: `sensemaking-review`  
> Decision: {decision_question}
>
> Review output: {output_reference}
>
> Available actions:
>
> - `approve {workflow_id}`
> - `correct {workflow_id}: [correction]`
> - `rework {workflow_id}: [instruction]`
> - `pause {workflow_id}: [reason]`
> - `stop {workflow_id}: [reason]`
>
> No further agent will run until an authorised response is received.

For the first implementation, structured text commands are acceptable.

Interactive Slack buttons should be added only after text-command routing is stable.

# Scenario 2 — Human Review Response

## Scenario name

`Strategic OS Beta — Human Review Response`

## Module B1 — Receive Slack action

Use an approved Slack trigger or custom webhook.

Required fields:

- `workflow_id`
- `selected_action`
- `response_text`
- `responder_id`
- `response_timestamp`

## Module B2 — Retrieve workflow record

Make.com module:

`Data Store > Get a record`

Primary key:

`workflow_id`

## Module B3 — Validate human response

All conditions must pass:

- the workflow exists
- the workflow is in `sensemaking-review` or `paused`
- the responder is authorised
- the action is supported
- correction text exists for `correct`
- rework instruction exists for `rework`
- the workflow has not already reached `stopped`

Invalid responses must be rejected and logged.

Suggested invalid-response notification:

> Action rejected for workflow `{workflow_id}`.
>
> The workflow state, responder or requested action was not valid.
>
> No workflow change was made.

## Module B4 — Route human action

Make.com module:

`Flow control > Router`

Create routes for:

1. Approve
2. Correct
3. Rework
4. Pause
5. Resume
6. Stop

## Approve route

Filter:

`selected_action = approve`

Update:

| Field | Value |
|---|---|
| `decision_status` | `approved` |
| `human_action_required` | `false` |
| `active_agent` | `none` |
| `available_actions` | Blank |
| `updated_at` | Current timestamp |

Suggested confirmation:

> Workflow `{workflow_id}` Sensemaking output approved.
>
> The workflow has completed its first review checkpoint.
>
> No further agent will run in this minimum scenario.

## Correct route

Filter:

`selected_action = correct`

Required behaviour:

- preserve `original_output`
- preserve output version 1
- record the human correction separately
- create output version 2
- identify the correction source
- mark version 2 as approved

Update:

| Field | Value |
|---|---|
| `human_correction` | Exact correction text |
| `latest_output` | Corrected approved output |
| `output_version` | `2` |
| `decision_status` | `approved-with-correction` |
| `human_action_required` | `false` |
| `active_agent` | `none` |
| `available_actions` | Blank |
| `updated_at` | Current timestamp |

Do not silently overwrite version 1.

Suggested confirmation:

> Workflow `{workflow_id}` approved with correction.
>
> Approved output version: 2
>
> The original agent output has been preserved for traceability.

## Rework route

Filter:

`selected_action = rework`

Allow one human-requested rework cycle in the minimum scenario.

Before execution, confirm:

`rework_count = 0`

Update:

| Field | Value |
|---|---|
| `previous_state` | `sensemaking-review` |
| `current_state` | `sensemaking-running` |
| `active_agent` | `sensemaking-agent` |
| `decision_status` | `rework` |
| `human_action_required` | `false` |
| `rework_count` | `1` |
| `updated_at` | Current timestamp |

Use the following rework request:

    Workflow ID:
    {{workflow_id}}

    Original approved intake:
    {{input context}}

    Previous unapproved output:
    {{latest_output}}

    Human rework instruction:
    {{response_text}}

    Return a revised response using the full required response contract.

    Preserve valid evidence and caveats.
    Do not treat the rework instruction as new evidence unless explicitly identified as evidence.
    Do not make the final decision.

Route the revised response through the same output-validation logic used in Scenario 1.

After validation:

- increment `output_version`
- set state to `sensemaking-review`
- set `human_action_required` to `true`
- send a new Slack review notification

If another rework is requested after `rework_count = 1`, pause and require manual intervention rather than creating an unlimited loop.

## Pause route

Filter:

`selected_action = pause`

Update:

| Field | Value |
|---|---|
| `previous_state` | `sensemaking-review` |
| `current_state` | `paused` |
| `active_agent` | `human-review` |
| `decision_status` | `paused` |
| `human_action_required` | `true` |
| `available_actions` | `resume,stop` |
| `updated_at` | Current timestamp |

Suggested confirmation:

> Workflow `{workflow_id}` is paused.
>
> No agent will run until an authorised resume or stop action is received.

## Resume route

Filter:

`selected_action = resume`

Required current state:

`paused`

Update:

| Field | Value |
|---|---|
| `previous_state` | `paused` |
| `current_state` | `sensemaking-review` |
| `active_agent` | `human-review` |
| `decision_status` | `pending` |
| `human_action_required` | `true` |
| `available_actions` | `approve,correct,rework,pause,stop` |
| `updated_at` | Current timestamp |

Do not rerun the Sensemaking Agent automatically.

Suggested confirmation:

> Workflow `{workflow_id}` has resumed.
>
> State: `sensemaking-review`
>
> The existing Sensemaking output is ready for review.

## Stop route

Filter:

`selected_action = stop`

Update:

| Field | Value |
|---|---|
| `previous_state` | Current state |
| `current_state` | `stopped` |
| `active_agent` | `none` |
| `decision_status` | `stopped` |
| `human_action_required` | `false` |
| `available_actions` | Blank |
| `updated_at` | Current timestamp |
| `completed_at` | Current timestamp |

Suggested confirmation:

> Workflow `{workflow_id}` has stopped.
>
> No further modules will run.
>
> Stop reason: {response_text}

# State-transition controls

Configure filters to enforce these transitions:

| Current state | Allowed next state |
|---|---|
| `not-started` | `intake-received` |
| `intake-received` | `sensemaking-running`, `failed`, `stopped` |
| `sensemaking-running` | `sensemaking-review`, `failed`, `stopped` |
| `sensemaking-review` | `sensemaking-running`, `paused`, `stopped` |
| `paused` | `sensemaking-review`, `stopped` |
| `failed` | `sensemaking-running`, `stopped` |
| `stopped` | None |

An unsupported transition must be:

- blocked
- logged
- surfaced to José when human action caused the attempted transition

# Logging requirements

Record:

- workflow ID
- scenario name
- module name
- previous state
- new state
- execution timestamp
- success or failure status
- retry count
- rework count
- safe error summary
- Slack notification status
- human action
- responder identifier
- output version
- final checkpoint outcome

Do not record:

- credentials
- access tokens
- webhook secrets
- customer information
- raw sensitive prompts
- unrestricted Slack content
- confidential attachments
- raw organisational extracts

# Minimum test cases

## Test 1 — Happy path

Input:

- valid intake
- valid Sensemaking output
- authorised approval

Expected result:

- workflow reaches `sensemaking-review`
- José receives a review request
- approval is recorded
- no further agent runs

## Test 2 — Missing intake field

Input:

- missing decision question

Expected result:

- agent is not invoked
- workflow state becomes `failed`
- validation reason is visible

## Test 3 — Privacy not confirmed

Input:

- `privacy_confirmed = false`

Expected result:

- agent is not invoked
- workflow stops safely
- Slack notification explains the failure

## Test 4 — First invalid agent output

Input:

- output omits assumptions or caveats

Expected result:

- one structured correction request is sent
- workflow remains `sensemaking-running`

## Test 5 — Second invalid agent output

Input:

- corrected output remains invalid

Expected result:

- workflow becomes `failed`
- automatic execution stops
- José receives a failure notification

## Test 6 — Human correction

Input:

- authorised `correct` action with exact correction text

Expected result:

- original output is preserved
- version 2 is created
- version 2 is marked approved

## Test 7 — Rework

Input:

- authorised `rework` action with a specific instruction

Expected result:

- workflow returns to `sensemaking-running`
- one rework cycle occurs
- revised output returns to review

## Test 8 — Pause and resume

Input:

- authorised pause
- later authorised resume

Expected result:

- no agent runs during pause
- resume returns to the same review output
- the agent is not rerun

## Test 9 — Stop

Input:

- authorised stop action

Expected result:

- workflow becomes `stopped`
- no further modules run
- stop reason is recorded

## Test 10 — Technical timeout

Input:

- temporary Relevance AI timeout

Expected result:

- configured retry occurs
- retry count is visible
- failure is surfaced after the retry limit

## Test 11 — Unauthorised response

Input:

- Slack action from an unauthorised responder

Expected result:

- action is rejected
- workflow state does not change
- rejection is logged

## Test 12 — Unsupported state transition

Input:

- approval action received after the workflow is stopped

Expected result:

- action is rejected
- no workflow data is overwritten
- attempted transition is logged

# Completion criteria

The scenario is ready to extend when:

- every minimum test case has been executed
- one complete approved workflow has succeeded
- human actions update the correct workflow
- invalid actions do not alter workflow state
- no silent failures occur
- retries are visible
- output versions remain distinguishable
- pause and stop controls work
- privacy checks prevent unsafe execution
- operational logs contain no credentials or sensitive source data

# Implementation order

Build in this order:

1. Create the Data Store
2. Create the intake webhook
3. Add intake validation
4. Create the initial workflow record
5. Add the Sensemaking Agent request
6. Add agent-output validation
7. Add the Slack review message
8. Create the human-response scenario
9. Add state-transition filters
10. Add correction, rework, pause, resume and stop routes
11. Add error handlers and retry limits
12. Run the minimum test cases

# Extension rule

Only after this implementation is stable should the workflow invoke the Stakeholder Journey Agent.

The next stage must reuse:

- the same workflow ID
- the approved Sensemaking output
- the same state store
- the same human-review pattern
- the same version controls
- the same privacy rules
- the same failure and retry logic

Do not create a parallel orchestration model.
