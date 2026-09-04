# Minimum Make.com Scenario

## Purpose

Define the minimum validated Make runtime for a Strategic OS specialist agent.

This file describes the smallest executable orchestration pattern proven across the five priority specialist runtimes:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

The minimum runtime is:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener → approved state`

This is the current baseline for specialist operation.

It is not a multi-agent orchestration design.

Current operating rule:

> Operate the validated specialist runtimes through real work before expanding orchestration.

---

## Status

**Minimum runtime:** Validated

**Validated specialist set:** Five priority specialists

**Current phase:** Use, observation and evidence

The minimum scenario should remain stable unless repeated real use exposes a genuine operational problem.

---

# Scope

## Included

The validated minimum runtime includes:

- specialist-specific webhook intake;
- common intake structure;
- `privacy_confirmed = true` gate;
- shared workflow-state storage;
- specialist execution in Relevance AI;
- specialist output persistence;
- Slack human-review notification;
- strict approval parsing;
- workflow lookup;
- approved-state persistence;
- Slack approval confirmation;
- safe runtime context handling.

## Excluded

The minimum runtime does not currently include:

- multi-agent routing;
- automatic specialist sequencing;
- automatic downstream-agent invocation;
- `L` rework command;
- `M` stop command;
- pause and resume;
- approve-with-correction;
- automated output validation;
- automated correction retries;
- advanced technical retry handling;
- privacy-rejection feedback;
- authorised-responder validation;
- automatic GitHub writes;
- automatic publication;
- broad exception automation.

These exclusions are deliberate.

Do not add them merely because they are technically possible.

---

# Scenario outcome

A specialist scenario is successful when:

1. a privacy-safe intake reaches the intended specialist webhook;
2. the privacy gate passes;
3. a workflow record is persisted in the shared Data Store;
4. the correct Relevance AI specialist is invoked;
5. the specialist output is stored in `latest_output`;
6. the workflow enters `human-review-required`;
7. Slack presents the output for human review;
8. the reviewer sends `P <workflow_id>`;
9. the correct workflow record is retrieved;
10. the approved state is persisted; and
11. Slack confirms successful approval.

No specialist output becomes an approved decision without human action.

---

# Required components

| Component | Role |
|---|---|
| Make | Orchestration, state management and system handoffs |
| Relevance AI | Specialist reasoning |
| Slack | Human-review surface |
| `strategic_os_beta_workflows` | Shared workflow-state Data Store |
| Strategic OS repository | Agent contracts, workflow definitions, reusable operating logic and validation records |

Make should remain orchestration-only.

Relevance AI should remain responsible for specialist reasoning.

Strategic OS does not become the system of record for organisational source data.

---

# Scenario model

Use one independent Make scenario per specialist.

Each scenario reuses the same common runtime pattern but defines its own:

- webhook;
- `workflow_name`;
- `active_agent`;
- selected Relevance AI agent;
- specialist wrapper;
- Slack specialist label.

Do not create separate Data Stores for each specialist.

Do not introduce a router between specialists until repeated real work demonstrates a genuine need.

---

# Specialist scenarios

## Sensemaking Agent

Scenario:

`Strategic OS Beta — Sensemaking Review`

Runtime values:

    workflow_name = sensemaking
    active_agent = sensemaking-agent

Status:

> Validated end to end.

---

## Stakeholder Journey Agent

Scenario:

`Strategic OS Beta — Stakeholder Journey Review`

Runtime values:

    workflow_name = stakeholder-journey
    active_agent = stakeholder-journey-agent

Status:

> Validated end to end.

---

## Career Architect

Scenario:

`Strategic OS Beta — Career Architect Review`

Webhook:

`Strategic OS Beta — Career Architect Intake`

Runtime values:

    workflow_name = career-architect
    active_agent = career-architect-agent

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

Status:

> Validated end to end.

---

# Common intake contract

Each specialist webhook uses the same intake structure:

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

`name` remains in the schema because it is part of the webhook structure currently detected by Make.

Do not rename `evidence` to `known_evidence`.

Do not redesign the common intake structure unless repeated operational use identifies a material limitation.

---

# Safe example intake

Use synthetic or safely summarised information during technical testing.

Example:

    {
      "name": "Synthetic specialist runtime test",
      "workflow_name": "sensemaking",
      "decision_question": "What is the most useful next strategic decision?",
      "opportunity_summary": "Synthetic context for runtime validation.",
      "evidence": "Safe synthetic evidence.",
      "known_assumptions": "Known assumptions that remain unvalidated.",
      "constraints": "Use safe information only. Human review is required.",
      "requested_output": "A structured specialist recommendation.",
      "requested_outcome": "Identify the most useful next action.",
      "submitted_by": "approved-initiator",
      "slack_destination": "approved-destination",
      "privacy_confirmed": true
    }

Do not use:

- customer information;
- raw organisational extracts;
- credentials;
- tokens;
- secrets;
- sensitive operational data;
- identifiable case material.

---

# Minimum workflow states

The validated minimum specialist path is:

    intake
      ↓
    privacy gate
      ↓
    processing
      ↓
    human-review-required
      ↓
    approved

Operational state values used by the common path are:

- `processing`
- `human-review-required`
- `approved`

Do not use specialist-specific workflow states such as:

- `sensemaking-running`;
- `sensemaking-review`.

Do not document `paused`, `stopped`, `rework` or similar states as implemented runtime behaviour until they are built and validated.

---

# Shared Data Store

Use:

`strategic_os_beta_workflows`

Primary lookup key:

`workflow_id`

The workflow ID remains unchanged through the scenario.

Do not redesign workflow ID generation unless operational evidence demonstrates a problem.

---

# Shared Data Store field order

Maintain the common fields in this logical order:

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

Some fields support future or diagnostic use but do not imply that every possible behaviour has been implemented.

For example, the presence of `rework_count` does not mean a rework command is currently operational.

---

# Scenario sequence

## Module 1 — Receive specialist intake

Component:

Make custom webhook.

Use a specialist-specific webhook.

Actions:

- receive the common intake;
- preserve the intended safe fields;
- expose them as live Make mapping values;
- continue to the privacy gate.

Do not rely on copied text representations of Make mapping tokens.

---

## Module 2 — Apply privacy gate

Component:

Make filter.

Required condition:

`privacy_confirmed = true`

If true:

> Continue.

If false:

> Do not invoke the specialist.

Detailed privacy-rejection feedback is not part of the current validated minimum runtime.

Do not document it as implemented.

---

## Module 3 — Create or initialise workflow record

Component:

`strategic_os_beta_workflows`

Persist the safe workflow context, including:

- workflow ID;
- workflow name;
- active agent;
- decision question;
- opportunity summary;
- evidence;
- known assumptions;
- constraints;
- requested output;
- requested outcome;
- submitted by;
- Slack destination;
- privacy values;
- workflow-state values;
- timestamps.

The selected specialist scenario supplies the correct:

- `workflow_name`;
- `active_agent`.

---

## Module 4 — Set processing state

Before or as specialist execution begins, persist:

    current_state = processing

Ensure:

- the workflow ID remains unchanged;
- the correct specialist remains mapped;
- the safe intake remains available for the specialist call.

---

## Module 5 — Invoke Relevance AI specialist

Component:

Relevance AI.

Send the safe intake to the selected Strategic OS specialist.

The common wrapper pattern is:

    Use the following Strategic OS intake.

    Work / decision:
    {{decision_question}}

    Context:
    {{opportunity_summary}}

    Evidence:
    {{evidence}}

    Known assumptions:
    {{known_assumptions}}

    Constraints:
    {{constraints}}

    Requested output:
    {{requested_output}}

    Requested outcome:
    {{requested_outcome}}

    Apply the selected Strategic OS agent contract.
    Human review is required.

The specialist contract remains authoritative for reasoning behaviour.

Do not reproduce that reasoning as Make transformation or router logic.

---

# Specialist cloning control

Selecting the correct Relevance AI agent is necessary but not sufficient.

When cloning a scenario, check:

1. scenario name;
2. specialist webhook;
3. `workflow_name`;
4. `active_agent`;
5. selected Relevance AI agent;
6. specialist wrapper text;
7. Data Store specialist mappings;
8. Slack specialist label;
9. live Make tokens.

A validated implementation issue showed that a correctly selected agent can still receive inherited wrapper text from another specialist.

Always inspect both.

---

## Module 6 — Persist specialist output

After successful specialist execution, write:

    latest_output = <Relevance AI answer>
    previous_state = processing
    current_state = human-review-required
    human_action_required = true
    updated_at = now

The specialist output is not an approved decision at this point.

It is awaiting human review.

---

## Module 7 — Send Slack review

Component:

Slack.

Use this pattern:

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

The message should make the human-review boundary obvious.

Do not advertise commands that are not implemented.

---

# Approval listener

Use the existing shared approval listener.

Supported command:

`P <workflow_id>`

Strict parser:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

The parser extracts the workflow ID only when the supported approval format is used.

Do not revert to:

`APPROVE <workflow_id>`

Do not expose additional commands until they have been deliberately implemented and tested.

---

## Approval sequence

The listener:

1. receives the Slack response;
2. applies the strict approval regex;
3. extracts `workflow_id`;
4. retrieves the matching `strategic_os_beta_workflows` record;
5. confirms the workflow is awaiting human review;
6. persists the approved state;
7. sends Slack confirmation.

---

# Expected approved state

After a successful approval:

    previous_state = human-review-required
    current_state = approved
    decision_status = approved
    human_action_required = false
    completed_at = now
    updated_at = now
    privacy_status = confirmed

The Data Store record is the authoritative runtime-state record.

Slack is the human-facing confirmation surface.

---

# Human-review principle

The specialist may:

- analyse;
- synthesise;
- structure;
- prioritise;
- recommend;
- surface uncertainty;
- identify next actions.

The specialist does not make the final human decision.

The approved state means:

> A human explicitly accepted the specialist output through the validated review path.

It does not mean the specialist has authority to execute downstream organisational actions.

---

# Minimum validation checks

A specialist runtime is operational only when all of the following pass:

- [ ] correct specialist webhook receives the intake;
- [ ] common intake fields map correctly;
- [ ] `privacy_confirmed = true` is enforced;
- [ ] correct `workflow_name` is persisted;
- [ ] correct `active_agent` is persisted;
- [ ] correct Relevance AI specialist is selected;
- [ ] inherited wrapper text has been removed;
- [ ] specialist output is returned;
- [ ] specialist output is stored in `latest_output`;
- [ ] state becomes `human-review-required`;
- [ ] Slack presents the correct specialist output;
- [ ] `P <workflow_id>` is parsed correctly;
- [ ] correct workflow record is retrieved;
- [ ] approved state is persisted;
- [ ] Slack approval confirmation is delivered;
- [ ] no additional specialist is triggered automatically.

All five priority specialist runtimes have passed this minimum path.

---

# Defensive behaviour

The existing runtime has also demonstrated useful containment around approval handling.

## Invalid workflow ID

An invalid workflow ID should not result in an unrelated Data Store update or successful approval confirmation.

Do not redesign this path unless the listener changes or operational evidence identifies a weakness.

## Duplicate approval

An already approved workflow should not be treated as a new pending approval.

The approval listener should preserve the completed workflow state rather than silently rewriting it.

Retest this control if the approval-state filter changes.

---

# Runtime evidence

For technical validation, use the following evidence hierarchy:

1. final Data Store record;
2. Make execution history;
3. Slack review or confirmation;
4. safe manual observation.

Do not place secrets, webhook URLs or raw sensitive execution data in Strategic OS.

Record only:

- safe workflow references;
- field names;
- expected state;
- observed state;
- pass / fail result;
- safe implementation learning.

---

# Current implementation decisions

The following decisions are confirmed:

- reuse the proven specialist runtime;
- use one specialist scenario at a time;
- use one shared Data Store;
- keep Make thin;
- keep Relevance AI responsible for reasoning;
- keep Slack as the human-review surface;
- reuse the strict `P` approval listener;
- do not redesign workflow ID generation;
- do not build multi-agent routing yet;
- do not introduce automatic specialist sequencing yet;
- do not introduce automatic GitHub writes;
- expand only when repeated real use exposes a genuine need.

---

# Known but not implemented

The following items are not part of the minimum validated scenario:

- `L` rework command;
- `M` stop command;
- correction workflow;
- pause / resume;
- privacy rejection feedback;
- authorised responder validation;
- Relevance AI failure recovery;
- Slack notification failure recovery;
- automated output validation;
- automated correction retries;
- sensitive-content safeguards beyond the current privacy gate;
- workflow ID cleanup;
- multi-agent router;
- automatic multi-agent sequencing;
- automatic GitHub writes.

Their absence does not invalidate the current specialist runtime.

They remain candidates for future hardening only when justified by evidence.

---

# Expansion rule

Do not increase runtime complexity simply because the current specialist pattern works.

Before expanding it:

1. observe repeated real use;
2. identify a recurring problem;
3. confirm that the current specialist path cannot handle it cleanly;
4. define the smallest useful change;
5. preserve the privacy boundary;
6. preserve human decision authority;
7. validate the change end to end;
8. update Strategic OS after validation.

---

# Current release state

The minimum specialist runtime is validated across:

- Sensemaking Agent;
- Stakeholder Journey Agent;
- Career Architect;
- Shipping Coach;
- Chief of Staff Agent.

Specialist runtime implementation is complete.

The next phase is:

> Use, observation and evidence.

Technical capability should not drive the next architecture decision.

Real work should.
