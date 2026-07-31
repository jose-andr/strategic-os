# Minimum Make.com Scenario

## Purpose

Define the minimum executable Make.com scenario for the first Strategic OS beta workflow.

This scenario tests:

- intake validation;
- workflow-state creation;
- Sensemaking Agent execution;
- structured output validation;
- Slack notification;
- human review;
- pause and resume behaviour;
- failure visibility; and
- safe context handling.

The scenario ends when José approves, corrects, requests rework, pauses or stops the Sensemaking Agent output.

It does not yet invoke the Stakeholder Journey Agent or Shipping Coach.

## Scope

### Included

- manual or Slack-triggered intake;
- workflow ID creation;
- minimum intake validation;
- workflow-state storage;
- Relevance AI Sensemaking Agent call;
- output-format validation;
- Slack review notification;
- human response capture;
- approved state transitions;
- retry handling for transient technical failures;
- safe operational logging.

### Excluded

- stakeholder analysis;
- artefact preparation;
- Shipping Coach review;
- stakeholder-facing publication;
- automated GitHub commits;
- multi-workflow prioritisation;
- advanced reporting;
- broad exception automation.

## Scenario outcome

The scenario is successful when:

1. an approved intake starts the workflow;
2. Make.com creates a valid workflow record;
3. the Sensemaking Agent returns a usable structured output;
4. José receives a clear Slack review request;
5. José can approve, correct, request rework, pause or stop;
6. the workflow state changes correctly; and
7. failures are visible rather than silent.

## Required components

| Component | Role |
|---|---|
| Make.com | Orchestration, routing, state management and retries |
| Relevance AI | Sensemaking Agent execution |
| Slack | Review notification and human response |
| Approved state store | Temporary workflow-state storage |
| GitHub | Durable storage for approved reusable outputs, initially manual if required |

## Scenario trigger

Use one of the following trigger methods.

### Preferred first implementation

Manual Make.com webhook triggered from an approved intake form or controlled request.

This reduces integration complexity while testing the orchestration logic.

### Optional later implementation

Slack shortcut, command or structured message that sends the approved intake to Make.com.

Do not begin with free-text monitoring of a Slack channel.

## Minimum intake schema

The trigger payload must include:

| Field | Required | Purpose |
|---|---|---|
| `workflow_name` | Yes | Human-readable name for the beta run |
| `decision_question` | Yes | Decision the workflow is supporting |
| `opportunity_summary` | Yes | Safe summary of the opportunity |
| `known_evidence` | No | Evidence already available |
| `known_assumptions` | No | Assumptions already identified |
| `constraints` | No | Known limits, dependencies or exclusions |
| `requested_output` | Yes | Expected Sensemaking Agent output |
| `submitted_by` | Yes | Approved human initiator |
| `slack_destination` | Yes | Approved channel or direct-message destination |
| `privacy_confirmed` | Yes | Confirmation that the payload is safe to process |

The trigger must reject the request when:

- `decision_question` is missing;
- `opportunity_summary` is missing;
- `requested_output` is missing;
- `slack_destination` is missing;
- `privacy_confirmed` is not `true`; or
- credentials, customer information or sensitive raw data are detected.

## Minimum workflow states

This scenario uses:

- `not-started`
- `intake-received`
- `sensemaking-running`
- `sensemaking-review`
- `paused`
- `failed`
- `stopped`

The broader beta workflow states remain defined in:

`automation_and_slack_workflow.md`

## Scenario sequence

### Module 1 — Receive intake

Component:

Make.com webhook or approved manual trigger.

Actions:

- receive the structured intake;
- record the received timestamp;
- preserve only the approved fields;
- reject unsupported attachments or raw source data.

Output:

Validated raw trigger payload.

### Module 2 — Validate intake

Component:

Make.com filters and validation logic.

Checks:

- required fields are present;
- `privacy_confirmed` equals `true`;
- the decision question is understandable;
- the requested output is defined;
- the Slack destination is approved;
- no blocked information type is present.

On success:

Continue to workflow creation.

On failure:

- do not invoke the agent;
- send a concise Slack error message;
- record the validation reason;
- stop the scenario.

### Module 3 — Create workflow record

Component:

Approved Make.com-compatible state store.

Create:

- `workflow_id`;
- `workflow_name`;
- `current_state`;
- `previous_state`;
- `active_agent`;
- `decision_status`;
- `retry_count`;
- timestamps;
- safe intake reference;
- Slack destination;
- privacy status.

Initial values:

| Field | Value |
|---|---|
| `current_state` | `intake-received` |
| `previous_state` | `not-started` |
| `active_agent` | `sensemaking-agent` |
| `decision_status` | `pending` |
| `retry_count` | `0` |
| `human_action_required` | `false` |

### Module 4 — Notify workflow start

Component:

Slack.

Message must include:

- workflow ID;
- workflow name;
- decision question;
- current state;
- next automated action;
- notice that human review will be required after Sensemaking Agent completion.

Suggested message:

> Workflow `{workflow_id}` has started.
>
> Decision: {decision_question}
>
> State: `intake-received`
>
> The Sensemaking Agent will now prepare a structured decision framing. You will be notified when review is required.

If Slack delivery fails:

- retry according to the transient-failure rule;
- do not stop agent execution solely because the start notification failed;
- record the notification failure.

### Module 5 — Update state to Sensemaking running

Component:

State store.

Update:

| Field | Value |
|---|---|
| `previous_state` | `intake-received` |
| `current_state` | `sensemaking-running` |
| `active_agent` | `sensemaking-agent` |
| `updated_at` | Current timestamp |

### Module 6 — Prepare agent handoff

Component:

Make.com transformation module.

Pass only:

- workflow ID;
- decision question;
- opportunity summary;
- known evidence;
- known assumptions;
- constraints;
- requested output;
- privacy-safe source references;
- explicit instruction to distinguish evidence, assumptions, interpretation, recommendation and action.

Do not pass:

- full Slack history;
- unrelated project context;
- credentials;
- raw organisational extracts;
- customer information;
- hidden workflow metadata;
- previous failed outputs unless clearly labelled for rework.

## Sensemaking Agent request contract

The agent request should ask for:

1. decision to be supported;
2. opportunity framing;
3. known evidence;
4. assumptions;
5. interpretation;
6. options;
7. trade-offs;
8. preliminary recommendation;
9. unresolved questions;
10. stakeholder-analysis handoff.

The agent must not make the final decision.

## Sensemaking Agent response contract

The response should use this structure:

```text
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
