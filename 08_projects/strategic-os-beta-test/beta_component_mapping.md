# Strategic OS Beta Component Mapping

## Purpose

Map the validated Strategic OS specialist runtime to the existing technology, agent and repository components.

This file is an implementation bridge.

It explains:

- which component owns each part of the runtime;
- where specialist reasoning occurs;
- where workflow state is persisted;
- where human review occurs;
- what Strategic OS stores;
- what remains deliberately outside the current runtime.

It does not introduce a new architecture or define future multi-agent orchestration.

Related implementation files:

- `beta_test_plan.md`
- `automation_and_slack_workflow.md`
- `minimum_make_scenario.md`
- `make_scenario_build_specification.md`
- `make_scenario_test_script.md`
- `make_runtime_backlog.md`
- agent specifications under `07_ai_agents/`

---

# Status

**Specialist runtime operationalisation:** Complete

**Validated specialists:**

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

**Current phase:**

> Use, observation and evidence.

**Operating principle:**

> Operate the validated specialist runtimes through real work before expanding orchestration.

---

# Implementation principle

Use the existing Strategic OS stack:

- Relevance AI executes specialist reasoning.
- Make coordinates runtime orchestration and state.
- Slack provides the human-review surface.
- the shared Make Data Store retains workflow state.
- GitHub stores approved reusable Strategic OS logic and safe learning.
- José retains final decision authority.

Do not create an additional orchestration platform or multi-agent coordination layer unless repeated real use demonstrates a genuine limitation in the current specialist pattern.

---

# Validated runtime

Each specialist uses the same common runtime:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener → approved state`

The five specialist scenarios are independent.

They are not currently connected through automatic routing or sequencing.

A completed specialist does not trigger another specialist.

---

# Component map

| Beta capability | Strategic OS component | Responsibility | Status |
|---|---|---|---|
| Specialist intake | Make custom webhook | Receive the common specialist intake | Validated |
| Privacy gate | Make filter | Require `privacy_confirmed = true` before specialist execution | Validated |
| Workflow orchestration | Make | Coordinate system handoffs and state transitions | Validated |
| Workflow state | `strategic_os_beta_workflows` | Persist safe runtime context, specialist output and approval state | Validated |
| Sensemaking | Relevance AI Sensemaking Agent | Clarify decisions, evidence, assumptions, options and recommendations | Validated |
| Stakeholder analysis | Relevance AI Stakeholder Journey Agent | Clarify stakeholder roles, influence, uncertainty and engagement sequence | Validated |
| Career assessment | Relevance AI Career Architect | Assess strategic value, career value, evidence maturity and next validation step | Validated |
| Shipping assessment | Relevance AI Shipping Coach | Distinguish blockers from refinement and recommend Ship / Socialise / Refine / Stop | Validated |
| Operating coordination | Relevance AI Chief of Staff Agent | Prioritise, separate decisions from tasks, surface dependencies and protect focus | Validated |
| Human review | Slack + José | Present output and require explicit human approval | Validated |
| Approval parsing | Make shared approval listener | Parse strict `P <workflow_id>` command | Validated |
| Approved-state persistence | Make + shared Data Store | Record explicit human approval | Validated |
| Approval confirmation | Slack | Confirm successful approved-state persistence | Validated |
| Durable Strategic OS knowledge | GitHub | Store reusable, privacy-safe interpretation, design logic and lessons | Established |
| Organisational source records | Organisational systems of record | Retain authoritative source data and operational records | External boundary |

---

# System responsibilities

## Strategic OS repository

Strategic OS is authoritative for:

- agent contracts;
- runtime definitions;
- workflow patterns;
- operating rules;
- quality criteria;
- reusable prompts;
- reusable decision logic;
- validation status;
- reusable operational learning.

Strategic OS should store only safe, durable knowledge.

It should not become an execution log or duplicate organisational systems of record.

---

## Make

Make is the runtime orchestration layer.

Make is responsible for:

- specialist-specific webhook intake;
- privacy gating;
- workflow ID handling;
- shared workflow-state persistence;
- specialist invocation;
- specialist output persistence;
- Slack review delivery;
- strict approval parsing;
- workflow lookup;
- approved-state persistence;
- approval confirmation.

Make should remain thin.

Make should not:

- reproduce specialist reasoning;
- make consequential strategic decisions;
- automatically choose another specialist;
- automatically sequence specialists;
- infer approval from silence;
- infer approval from unrelated Slack messages;
- publish externally without a separate approved process;
- write automatically to GitHub;
- become a second repository of organisational source data.

---

## Relevance AI

Relevance AI is the specialist reasoning layer.

It is responsible for:

- applying the selected Strategic OS agent contract;
- analysing the supplied safe context;
- producing the specialist output;
- preserving uncertainty and evidence discipline defined by the contract;
- returning a reviewable answer to Make.

Relevance AI does not own workflow state.

It does not determine human approval.

---

## Slack

Slack is the current human-review surface.

Slack is responsible for:

- presenting specialist output;
- making the workflow ID visible;
- identifying the specialist;
- making the human-review requirement explicit;
- receiving the supported approval command;
- confirming successful approval.

Slack is not the durable source of truth for:

- Strategic OS agent contracts;
- reusable decision logic;
- workflow definitions;
- final workflow state;
- organisational source records.

---

## Shared Make Data Store

Use:

`strategic_os_beta_workflows`

The shared Data Store is responsible for persisted runtime state.

Do not create separate Data Stores for individual specialists.

Primary lookup key:

`workflow_id`

The workflow ID remains stable through the specialist runtime.

---

## GitHub

GitHub is the durable Strategic OS knowledge layer.

GitHub may store:

- agent specifications;
- safe workflow definitions;
- runtime design patterns;
- test scripts;
- operationalisation status;
- reusable prompts;
- metric definitions;
- caveats;
- de-identified lessons;
- reusable decision logic;
- safe strategic artefacts where appropriate.

GitHub must not store:

- credentials;
- tokens;
- webhook URLs;
- raw Slack exports;
- raw organisational datasets;
- customer information;
- sensitive stakeholder commentary;
- confidential attachments;
- raw agent logs containing sensitive inputs;
- unredacted sensitive screenshots;
- uncontrolled source-system extracts.

---

# Organisational systems of record

Strategic OS does not replace organisational systems.

Depending on the work, authoritative records may remain in:

- Databricks;
- Power BI;
- SharePoint;
- OneDrive;
- Teams;
- email;
- calendar;
- Jira;
- Confluence;
- Miro;
- CRM platforms;
- approved operational repositories.

Strategic OS should store:

- summaries;
- caveats;
- source rules;
- interpretation;
- decision logic;
- reusable patterns;
- lessons learned.

Prefer source references over duplicated source material.

---

# Common intake mapping

The validated common specialist webhook contract is:

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

`name` remains part of the current schema because it is present in the webhook structure detected by Make.

Do not replace `evidence` with the earlier `known_evidence` field.

Do not redesign the common intake contract unless repeated operational use exposes a genuine need.

---

# Intake responsibility map

| Intake field | Purpose |
|---|---|
| `name` | Human-readable intake identifier |
| `workflow_name` | Specialist workflow identifier |
| `decision_question` | Decision or problem the specialist should support |
| `opportunity_summary` | Safe contextual summary |
| `evidence` | Relevant safe evidence |
| `known_assumptions` | Assumptions that remain unvalidated |
| `constraints` | Material limitations or boundaries |
| `requested_output` | Type of specialist response required |
| `requested_outcome` | Intended decision-support outcome |
| `submitted_by` | Safe initiator reference |
| `slack_destination` | Approved review destination |
| `privacy_confirmed` | Mandatory privacy confirmation |

---

# Privacy mapping

The runtime requires:

`privacy_confirmed = true`

before invoking Relevance AI.

The current privacy control is a gate.

Detailed privacy-rejection feedback is not yet implemented.

The runtime should not intentionally process or retain:

- raw customer information;
- raw organisational extracts;
- credentials;
- access tokens;
- secrets;
- identifiable case material;
- sensitive operational material.

Use safe summaries and de-identified evidence.

---

# Shared workflow data model

Maintain the common Data Store fields in this logical order:

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

The presence of a field does not prove that every associated behaviour is implemented.

Examples:

- `retry_count` does not mean automated retry handling is operational;
- `rework_count` does not mean a rework command is operational.

---

# Validated workflow-state mapping

The minimum common path is:

    intake
      ↓
    privacy gate
      ↓
    processing
      ↓
    human-review-required
      ↓
    approved

| State | Primary component | Meaning |
|---|---|---|
| `processing` | Make + Relevance AI | Selected specialist is being executed |
| `human-review-required` | Make + Slack + human | Specialist output is persisted and awaiting explicit review |
| `approved` | Make + shared Data Store | Human approval has been successfully persisted |

Do not document the earlier specialist-specific states as current runtime behaviour.

Examples no longer used as the common state model include:

- `sensemaking-running`
- `sensemaking-review`
- `stakeholder-analysis-running`
- `stakeholder-review`
- `shipping-review`
- `artefact-preparation`

Do not describe `paused`, `rework`, `stopped` or similar states as implemented until they are deliberately built and validated.

---

# Specialist mapping

## Sensemaking Agent

Repository source:

`07_ai_agents/sensemaking_agent/`

Runtime values:

    workflow_name = sensemaking
    active_agent = sensemaking-agent

Role:

- clarify the decision or strategic question;
- distinguish evidence from assumptions and interpretation;
- frame options and trade-offs;
- identify caveats;
- produce a recommendation where appropriate;
- identify the useful next action.

Runtime status:

> Validated end to end.

---

## Stakeholder Journey Agent

Runtime values:

    workflow_name = stakeholder-journey
    active_agent = stakeholder-journey-agent

Role:

- assess stakeholder influence, interest and impact;
- treat decision rights carefully;
- preserve unknown stakeholder positions;
- avoid inventing motives;
- sequence engagement;
- identify the next stakeholder action.

Runtime status:

> Validated end to end.

Implementation learning:

> Selecting the correct Relevance AI agent is not sufficient. Inherited specialist wrapper text, Data Store mappings and Slack labels must also be checked when cloning scenarios.

---

## Career Architect

Runtime values:

    workflow_name = career-architect
    active_agent = career-architect-agent

Validated Relevance AI Agent ID:

`24e39803-109a-423b-a7d9-02c22acdc5f8`

Role:

- separate strategic value from career value;
- assess evidence maturity;
- distinguish potential, emerging and achieved evidence;
- preserve uncertainty;
- avoid inventing sponsorship or impact;
- identify the most useful validation action.

Runtime status:

> Validated end to end.

Reusable learning:

> When an opportunity is sufficiently framed, test mandate, adoption or impact before creating more documentation.

---

## Shipping Coach

Runtime values:

    workflow_name = shipping-coach
    active_agent = shipping-coach-agent

Validated Relevance AI Agent ID:

`f34c1e33-ce57-4d8b-bc2b-a4fe24f5ed24`

Role:

- distinguish genuine blockers from optional refinement;
- compare the risk of moving with the risk of waiting;
- use Ship / Socialise / Refine / Stop;
- bound refinement;
- identify the smallest useful action;
- define a clear done condition.

Runtime status:

> Validated end to end.

---

## Chief of Staff Agent

Runtime values:

    workflow_name = chief-of-staff
    active_agent = chief-of-staff-agent

Validated Relevance AI Agent ID:

`cea451dc-641c-4d3e-9e18-c1d0fb1dc57c`

Role:

- create a useful operating view;
- prioritise selectively;
- separate decisions from tasks;
- surface dependencies;
- protect focus;
- handle goal alignment cautiously;
- recommend specialist use selectively;
- identify one bounded next action.

Runtime status:

> Validated end to end.

The Chief of Staff Agent may recommend another specialist.

It does not automatically invoke that specialist.

---

# Specialist selection

Specialist selection remains human-led.

| Decision-support need | Specialist |
|---|---|
| Clarify an ambiguous strategic problem | Sensemaking Agent |
| Clarify stakeholder alignment and engagement sequencing | Stakeholder Journey Agent |
| Assess strategic and career opportunity value | Career Architect |
| Determine whether work should move, refine or stop | Shipping Coach |
| Establish operating priorities and next actions | Chief of Staff Agent |

This table is decision guidance.

It is not an automated routing specification.

---

# Relevance AI invocation mapping

Each scenario passes the common safe intake to the selected specialist.

A thin wrapper may use:

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

Specialist-specific wording may be used where needed.

Make must use live mapping tokens.

When cloning a runtime:

1. select the correct Relevance AI specialist;
2. replace inherited wrapper text;
3. check `workflow_name`;
4. check `active_agent`;
5. check Data Store mappings;
6. check Slack labels.

---

# Post-agent mapping

After successful specialist execution:

    latest_output = <Relevance AI answer>
    previous_state = processing
    current_state = human-review-required
    human_action_required = true
    updated_at = now

The specialist output remains advisory.

No downstream organisational action occurs automatically.

---

# Slack review mapping

The validated review message pattern is:

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

Slack should make the human action obvious.

The current minimum runtime does not require:

- workflow-start notifications;
- agent-handoff notifications;
- rework controls;
- pause controls;
- stop controls;
- automatic reminder sequences;
- retry notifications;
- final multi-agent summaries.

Add additional notifications only when repeated use demonstrates value.

---

# Approval mapping

Supported command:

`P <workflow_id>`

Strict regex:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

Approval sequence:

1. receive Slack response;
2. match strict approval command;
3. extract workflow ID;
4. retrieve matching Data Store record;
5. confirm workflow is awaiting human review;
6. persist approved state;
7. send Slack confirmation.

Do not use the obsolete:

`APPROVE <workflow_id>`

format.

Do not expose unimplemented commands.

---

# Approved-state mapping

Expected approved state:

    previous_state = human-review-required
    current_state = approved
    decision_status = approved
    human_action_required = false
    completed_at = now
    updated_at = now
    privacy_status = confirmed

No specialist runs automatically after this transition.

---

# Human-control mapping

José retains final decision authority.

The specialist may:

- analyse;
- synthesise;
- interpret;
- structure;
- prioritise;
- recommend;
- identify uncertainty;
- recommend another specialist.

The specialist may not autonomously:

- approve its own work;
- contact stakeholders;
- alter organisational systems;
- create external commitments;
- publish artefacts;
- invoke another specialist through the current runtime;
- write to GitHub.

The current validated human-control event is explicit approval through:

`P <workflow_id>`

---

# Defensive controls

## Invalid workflow ID

Previously validated behaviour:

- invalid workflow ID does not update an unrelated record;
- no successful approval occurs;
- no approval confirmation is sent.

Explicit invalid-ID feedback remains a future hardening item.

## Duplicate approval

Previously validated behaviour:

- approved records are not approved again;
- `completed_at` is not rewritten;
- duplicate approval confirmation is not generated.

Retest these controls if approval handling changes.

---

# Agent handoff position

The current runtime does not implement automatic agent-to-agent handoffs.

If one specialist indicates another specialist would be useful:

1. the human reviews the recommendation;
2. the human decides whether another specialist is needed;
3. a separate specialist runtime is started deliberately;
4. only the minimum safe context needed for that specialist should be supplied.

This manual boundary is intentional.

It preserves:

- decision authority;
- context control;
- privacy;
- specialist-role clarity;
- observability.

Do not create a formal automatic handoff contract until repeated use demonstrates a need.

---

# Failure and retry position

Advanced automated recovery is not part of the validated minimum runtime.

Known future hardening areas include:

- Relevance AI failure handling;
- Slack delivery failure handling;
- retry rules;
- retry limits;
- output validation;
- sensitive-content safeguards;
- explicit privacy-rejection feedback;
- authorised-responder validation.

These are not currently described as implemented capabilities.

When a runtime problem occurs:

> Correct the smallest relevant failure and retest the affected path.

Do not automatically expand the entire orchestration model.

---

# Runtime evidence

Use the following evidence hierarchy when validating operation:

1. final Data Store record;
2. Make execution history;
3. Slack review or confirmation;
4. safe manual observation.

Repository evidence should contain only safe summaries and references.

Do not copy raw logs or sensitive execution payloads into Strategic OS.

---

# Current validation status

| Component | Status | Current evidence threshold |
|---|---|---|
| Sensemaking Agent | Validated | Repeated real use |
| Stakeholder Journey Agent | Validated | Repeated real use |
| Career Architect | Validated | Repeated real use |
| Shipping Coach | Validated | Repeated real use |
| Chief of Staff Agent | Validated | Repeated real use |
| Common webhook structure | Validated | Monitor sufficiency |
| Privacy gate | Validated | Monitor boundary |
| Shared Data Store | Validated | Monitor reliability |
| Specialist output persistence | Validated | Monitor reliability |
| Slack review | Validated | Monitor usefulness and overhead |
| Strict P approval parsing | Validated | Monitor reliability |
| Approved-state persistence | Validated | Monitor reliability |
| Automatic multi-agent routing | Not implemented | Evidence required before build |
| Automatic specialist sequencing | Not implemented | Evidence required before build |
| Automatic GitHub writes | Not implemented | Evidence required before build |
| Advanced failure recovery | Not implemented | Harden when justified |

---

# Known but not implemented

The following remain outside the validated runtime:

- `L` rework command;
- `M` stop command;
- approve with correction;
- pause and resume;
- automated output correction;
- automatic specialist handoffs;
- multi-agent router;
- automatic specialist sequencing;
- privacy rejection feedback;
- authorised-responder validation;
- advanced Relevance AI error recovery;
- Slack notification failure recovery;
- automatic retry handling;
- retry-limit handling;
- sensitive-content safeguards beyond the current privacy gate;
- workflow ID cleanup;
- automatic Jira actions;
- automatic Confluence actions;
- automatic GitHub writes;
- automatic external publication.

These should not be implemented merely to complete a conceptual architecture.

---

# Expansion rule

Before adding a new runtime capability:

1. identify a repeated operational problem;
2. confirm that the current specialist runtime cannot handle it cleanly;
3. define the smallest useful additional behaviour;
4. preserve human decision authority;
5. preserve privacy boundaries;
6. validate the change end to end;
7. record only the reusable implementation learning.

No change is a valid outcome when the current runtime remains sufficient.

---

# Current implementation decision

The original proposed beta architecture assumed coordinated sequencing between multiple specialist agents.

Operational validation produced a simpler and more useful pattern:

> independent specialist runtimes + shared workflow state + explicit human review.

Therefore:

- keep the five specialist runtimes independent;
- keep Make thin;
- keep Relevance AI responsible for reasoning;
- keep Slack focused on meaningful human review;
- reuse the shared Data Store;
- retain explicit `P <workflow_id>` approval;
- observe real use before adding orchestration.

---

# Next evidence threshold

The specialist-runtime architecture is no longer the main uncertainty.

The next questions are:

- Do specialists improve real decisions consistently?
- Is specialist selection straightforward?
- Does the common intake contract remain sufficient?
- Does Slack review remain lightweight?
- Does workflow-state persistence remain reliable?
- Does manual specialist selection create material friction?
- Do repeated failures expose a specific hardening need?
- Is any new orchestration genuinely necessary?

Current priority:

> Use, observation and evidence.

Real work should determine the next architecture change.
