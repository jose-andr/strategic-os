# Strategic OS Beta Component Mapping

## Purpose

Map the Strategic OS beta workflow to the existing Strategic OS technology, agent and repository components.

This file is an implementation bridge.

It does not introduce a new architecture or replace:

- `beta_test_plan.md`
- `automation_and_slack_workflow.md`
- agent specifications under `07_ai_agents/`
- reusable architecture rules under `04_frameworks/`

## Implementation principle

Use the existing Strategic OS stack:

- Relevance AI executes the specialist agents.
- Make.com coordinates workflow sequencing and integrations.
- Slack provides human interaction, review and operational notifications.
- GitHub stores approved, reusable and privacy-safe Strategic OS knowledge.
- José retains final decision authority.

Do not create an additional orchestration platform unless testing demonstrates a genuine limitation in this stack.

## Component map

| Beta capability | Strategic OS component | Responsibility |
|---|---|---|
| Workflow intake | Slack and Make.com | Receive the beta request, assign a workflow ID and start the workflow |
| Workflow orchestration | Make.com | Control sequencing, routing, state transitions, retries and notifications |
| Sensemaking | Relevance AI Sensemaking Agent | Clarify the opportunity, decision, evidence, assumptions, options and trade-offs |
| Stakeholder analysis | Relevance AI Stakeholder Journey Agent | Assess stakeholder interests, resistance, desired movement and engagement sequence |
| Shipping review | Relevance AI Shipping Coach | Recommend Ship, Socialise, Refine or Stop and identify the smallest useful next action |
| Human review | Slack and José | Approve, correct, request rework, pause, redirect, resume or stop |
| Workflow state | Make.com data store or approved equivalent | Maintain the current workflow state and required control metadata |
| Operational notification | Slack | Surface meaningful progress, review requirements, failures and decisions |
| Temporary agent handoff | Make.com scenario data | Pass only the minimum approved context required by the next agent |
| Durable output | GitHub | Store approved, reusable and privacy-safe project outputs |
| Delivery evidence | Beta project files | Record safe summaries of test results, caveats, failures and lessons |
| Quality assessment | Strategic OS QA model and beta measures | Assess coordination, reliability, output usability, effort and human control |

## Agent mapping

### Sensemaking Agent

Repository source:

`07_ai_agents/sensemaking_agent/`

Beta role:

- interpret the intake;
- identify the decision to be supported;
- distinguish evidence, assumptions and interpretation;
- frame options and trade-offs;
- produce a structured handoff for human review.

Expected beta output:

- decision framing;
- evidence and assumption summary;
- options;
- preliminary recommendation;
- unresolved questions;
- stakeholder-analysis handoff.

Human control:

José reviews the output before it is passed to the Stakeholder Journey Agent.

### Stakeholder Journey Agent

Repository source:

`07_ai_agents/stakeholder_agent/`

Beta role:

- identify stakeholder interests and concerns;
- anticipate resistance or misunderstanding;
- define the desired stakeholder movement;
- recommend engagement sequence and messaging;
- identify stakeholder risks that affect the decision.

Expected beta output:

- stakeholder map;
- alignment assessment;
- engagement sequence;
- message implications;
- unresolved stakeholder risks;
- shipping-review handoff.

Human control:

José reviews the output before artefact preparation or shipping assessment.

### Shipping Coach

Repository source:

`07_ai_agents/shipping_coach/`

Beta role:

- assess whether the work is useful enough to progress;
- identify remaining gaps that materially affect the decision;
- challenge unnecessary refinement;
- recommend Ship, Socialise, Refine or Stop;
- define the next action.

Expected beta output:

- readiness assessment;
- material gaps;
- recommendation;
- minimum next action;
- required human decision.

Human control:

José makes the final Ship, Socialise, Refine or Stop decision.

## Orchestrator mapping

### Make.com

Make.com is the beta orchestrator.

It should:

- receive the approved intake;
- generate or accept a workflow ID;
- create the initial workflow record;
- invoke agents in the approved sequence;
- pass structured handoff data;
- update workflow state;
- send Slack notifications;
- pause at human review points;
- process approved human responses;
- retry eligible technical failures;
- surface unsuccessful retries;
- stop the workflow when directed; and
- record the final operational outcome.

Make.com should not:

- make consequential strategic decisions;
- publish stakeholder-facing material without approval;
- store sensitive organisational source material;
- silently continue after a failed human-control checkpoint;
- infer approval from inactivity; or
- overwrite an approved artefact without a visible revision event.

## Slack mapping

Slack is the human-control and operational-visibility layer.

Slack should support:

- workflow-start confirmation;
- agent-output-ready notifications;
- concise output summaries;
- links to reviewable outputs;
- approval and correction instructions;
- rework requests;
- pause and stop controls;
- warnings and failure alerts;
- retry outcomes;
- final completion summaries.

Each actionable notification should include:

- workflow ID;
- current state;
- responsible component or agent;
- what occurred;
- what José needs to decide or do;
- available actions;
- consequence of no response;
- link to the relevant output where available.

Slack is not the durable source of truth for:

- final strategic artefacts;
- important decision rationale;
- reusable lessons;
- agent specifications; or
- approved operating rules.

## GitHub mapping

GitHub is the durable Strategic OS knowledge layer.

For this beta, GitHub may store:

- approved decision briefs;
- approved stakeholder assessments;
- approved workshop or engagement artefacts;
- safe workflow definitions;
- test plans;
- synthetic test records;
- de-identified failure summaries;
- metric definitions;
- caveats;
- decision logic;
- reusable lessons.

GitHub must not store:

- credentials or webhook URLs;
- raw Slack exports;
- raw organisational records;
- customer information;
- sensitive stakeholder commentary;
- confidential attachments;
- raw agent execution logs containing sensitive inputs;
- unredacted screenshots;
- uncontrolled source-system extracts.

## Minimum workflow data model

The orchestrator should maintain the following minimum fields:

| Field | Purpose |
|---|---|
| `workflow_id` | Unique identifier for the beta run |
| `workflow_name` | Human-readable workflow name |
| `current_state` | Current approved workflow state |
| `previous_state` | Previous workflow state |
| `active_agent` | Agent or component currently responsible |
| `input_reference` | Safe reference to the approved intake |
| `output_reference` | Reference to the latest reviewable output |
| `human_action_required` | Whether José must act |
| `available_actions` | Valid actions at the current checkpoint |
| `decision_status` | Pending, approved, corrected, rework, paused, stopped or completed |
| `retry_count` | Number of retries for the current failed step |
| `last_error_summary` | Safe operational description of the latest failure |
| `created_at` | Workflow start timestamp |
| `updated_at` | Latest meaningful update timestamp |
| `completed_at` | Workflow completion timestamp |
| `privacy_status` | Confirmation that stored context is safe for the intended component |

Do not store raw sensitive input in the workflow record.

## State-to-component mapping

| Workflow state | Primary component | Required action |
|---|---|---|
| `not-started` | Human / Slack | Prepare and approve intake |
| `intake-received` | Make.com | Validate required fields and initialise workflow |
| `sensemaking-running` | Relevance AI | Execute Sensemaking Agent |
| `sensemaking-review` | Slack / Human | Review, approve, correct or request rework |
| `stakeholder-analysis-running` | Relevance AI | Execute Stakeholder Journey Agent |
| `stakeholder-review` | Slack / Human | Review, approve, correct or request rework |
| `artefact-preparation` | Make.com and approved agent | Assemble approved material into the required artefact |
| `shipping-review` | Relevance AI | Execute Shipping Coach |
| `human-decision-required` | Slack / Human | Select Ship, Socialise, Refine or Stop |
| `paused` | Make.com | Preserve state and await explicit resume or stop action |
| `failed` | Make.com / Slack | Record failure, apply retry rule and alert José |
| `completed` | Make.com / GitHub / Slack | Record outcome, store approved output and notify José |
| `stopped` | Make.com / Slack | Preserve the stop reason and end further execution |

## Handoff contract

Each agent handoff should contain only:

- workflow ID;
- decision or task being supported;
- approved context summary;
- relevant evidence summary;
- visible assumptions;
- current caveats;
- unresolved questions;
- required output;
- human-review status;
- safe references to prior outputs.

The handoff should not contain:

- unnecessary conversation history;
- raw organisational datasets;
- customer-level information;
- credentials;
- private Slack content unrelated to the decision;
- hidden instructions from earlier agents;
- unreviewed claims presented as facts.

## Failure and retry allocation

### Retry automatically

Make.com may automatically retry:

- temporary API timeouts;
- rate-limit responses where retry is permitted;
- temporary network failures;
- recoverable integration errors;
- transient Slack delivery failures.

### Require human review

Pause and notify José when:

- an agent output is empty or structurally invalid;
- two agents materially contradict each other;
- required context is missing;
- an output appears to overstate evidence;
- sensitive information may have entered the workflow;
- the workflow reaches its retry limit;
- a state transition cannot be confirmed;
- an approval response is ambiguous;
- an artefact may be used externally;
- the correct next step requires judgement.

### Do not retry automatically

Do not automatically retry:

- explicit human rejection;
- stop commands;
- privacy or security violations;
- unauthorised publication attempts;
- strategically consequential decisions;
- failures caused by an invalid or unsafe request.

## Minimum beta implementation

The first executable beta does not need every proposed feature.

The minimum implementation is:

1. Slack intake or manually approved intake trigger.
2. Make.com workflow record with a unique workflow ID.
3. Sensemaking Agent execution.
4. Slack review checkpoint.
5. Stakeholder Journey Agent execution.
6. Slack review checkpoint.
7. Shipping Coach execution.
8. Slack decision checkpoint.
9. Final outcome notification.
10. Safe recording of the approved artefact and beta result.

The first version may use manual links or manual GitHub storage where full automation would add more risk than learning value.

## Current validation status

| Component | Status | Validation needed |
|---|---|---|
| Relevance AI agent execution | Confirmed Strategic OS component | Confirm each beta agent is deployed and callable |
| Make.com orchestration | Confirmed Strategic OS component | Confirm scenario access, trigger method and state-storage option |
| Slack interaction | Confirmed Strategic OS component | Confirm approved workspace, destination and integration method |
| GitHub durable storage | Confirmed Strategic OS component | Confirm whether the first beta uses manual or automated commits |
| Sensemaking Agent | Repository-defined | Confirm deployed agent matches the current specification |
| Stakeholder Journey Agent | Repository-defined | Confirm deployed agent matches the current specification |
| Shipping Coach | Repository-defined | Confirm deployed agent matches the current specification |
| Human approval controls | Required | Confirm how Slack actions or replies are interpreted |
| Failure logging | Required | Confirm where operational execution logs will be retained |
| Retry behaviour | Defined conceptually | Configure and test in Make.com |
| Workflow state storage | Required | Select and validate the approved Make.com-compatible store |

## Implementation decision

Proceed with the current Strategic OS stack.

Do not create more conceptual architecture before testing:

- one synthetic workflow;
- one failure-and-retry path;
- one pause-and-resume path;
- one human correction path; and
- one complete end-to-end beta run.

The next implementation task is to define the minimum executable Make.com scenario from intake trigger through the first Sensemaking Agent review checkpoint.
