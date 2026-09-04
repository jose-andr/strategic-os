# Strategic OS Beta — Automation and Slack Workflow

## Status

**Specialist runtime operationalisation:** Complete

**Validated specialist runtimes:** Five

**Current phase:** Use, observation and evidence

## Purpose

Define the validated automation and Slack workflow used to operate Strategic OS specialist agents through Make and Relevance AI.

This file records what is currently proven.

It does not define a future multi-agent orchestration model.

The operating principle is:

> Operate the validated specialist runtimes through real work before expanding orchestration.

---

# 1. Current operating model

Strategic OS currently uses five independent specialist runtimes:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

Each specialist uses the same proven runtime pattern:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener → approved state`

The specialists are not automatically sequenced.

A completed specialist does not trigger another specialist.

Human judgement determines what happens next.

---

# 2. System responsibilities

## Strategic OS

Strategic OS is authoritative for:

- agent contracts;
- workflow definitions;
- reusable operating rules;
- runtime design patterns;
- quality criteria;
- operationalisation status;
- reusable lessons.

Strategic OS does not store raw organisational systems-of-record content.

## Make

Make is responsible for:

- specialist webhook intake;
- privacy gating;
- workflow-state persistence;
- Relevance AI invocation;
- specialist output persistence;
- Slack notification;
- approval parsing;
- workflow lookup;
- approved-state persistence;
- Slack approval confirmation.

Make is an orchestration layer.

Do not reproduce specialist reasoning inside Make.

## Relevance AI

Relevance AI is responsible for:

- specialist reasoning;
- applying the selected Strategic OS agent contract;
- generating the reviewable specialist output.

## Slack

Slack is the human-review surface.

Slack is used to:

- present the specialist output;
- identify the workflow;
- require explicit human review;
- capture the supported approval command;
- confirm successful approval.

## Shared Data Store

The Make Data Store:

`strategic_os_beta_workflows`

is the persisted runtime-state record.

Slack messages do not replace persisted workflow state.

---

# 3. Human-control principle

José retains final decision authority.

The runtime may:

- receive context;
- invoke specialist reasoning;
- store the resulting output;
- request review;
- record explicit approval.

The runtime does not currently:

- choose another specialist automatically;
- sequence agents automatically;
- execute a specialist recommendation automatically;
- publish externally;
- write automatically to GitHub;
- infer approval from silence;
- infer approval from unrelated Slack messages.

Human review is a required boundary.

---

# 4. Privacy boundary

Every specialist path requires:

`privacy_confirmed = true`

before specialist execution.

Do not pass or persist:

- customer personal information;
- raw organisational data;
- credentials;
- tokens;
- secrets;
- sensitive operational extracts;
- identifiable case material;
- confidential attachments;
- unrestricted source-system records.

Use:

- safe summaries;
- de-identified evidence;
- assumptions;
- constraints;
- reusable interpretation;
- decision logic;
- source references where appropriate.

Organisational systems remain their respective systems of record.

---

# 5. Common specialist intake

The validated common webhook schema is:

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

Do not redesign this schema unless repeated operational use exposes a genuine limitation.

---

# 6. Specialist-specific configuration

Each specialist has its own scenario and webhook where applicable.

Each scenario defines:

- `workflow_name`;
- `active_agent`;
- selected Relevance AI specialist;
- specialist wrapper;
- Slack specialist label.

All other runtime mechanics should reuse the common pattern.

---

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

Key implementation learning:

- selecting the correct Relevance AI agent is not sufficient;
- inherited specialist wrapper text must also be replaced;
- Data Store labels must be checked;
- Slack labels must be checked;
- live Make mapping tokens must be used.

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

# 7. Shared Data Store

Use:

`strategic_os_beta_workflows`

Do not create agent-specific Data Stores.

Primary lookup key:

`workflow_id`

The workflow ID remains stable throughout the specialist runtime.

Do not redesign workflow ID generation unless operational evidence identifies a material issue.

---

# 8. Shared Data Store field order

Maintain the shared fields in the following logical order:

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

The existence of a field does not mean every possible related runtime behaviour has been implemented.

For example:

- `retry_count` does not mean automated retry handling is operational;
- `rework_count` does not mean a rework command is operational.

---

# 9. Validated state model

The common specialist state path is:

    intake
      ↓
    privacy gate
      ↓
    processing
      ↓
    human-review-required
      ↓
    approved

Validated runtime states:

- `processing`
- `human-review-required`
- `approved`

Do not use specialist-specific runtime states such as:

- `sensemaking-running`;
- `sensemaking-review`;
- `stakeholder-analysis-running`;
- `stakeholder-review`;
- `shipping-review`.

Do not document:

- `paused`;
- `stopped`;
- `rework`;
- `failed`;

as implemented workflow behaviour unless those controls are deliberately built and validated.

---

# 10. Runtime sequence

## Step 1 — Receive specialist intake

A specialist-specific Make webhook receives the common intake.

Confirm:

- expected fields are present;
- mappings use live Make tokens;
- specialist identity is correct;
- no sensitive content is intentionally included.

The specialist is selected by the scenario José invokes.

Make does not choose a specialist automatically.

---

## Step 2 — Apply privacy gate

Required condition:

`privacy_confirmed = true`

If the condition is satisfied:

> Continue.

If it is not satisfied:

> Do not invoke the Relevance AI specialist.

Detailed privacy-rejection feedback is not currently implemented.

Do not describe it as an operational capability.

---

## Step 3 — Create or update workflow record

Persist the safe workflow context in:

`strategic_os_beta_workflows`

The record should identify:

- workflow ID;
- workflow name;
- active specialist;
- safe decision context;
- requested output;
- requested outcome;
- privacy confirmation;
- workflow state;
- timestamps.

---

## Step 4 — Set processing state

Before or during specialist execution:

    current_state = processing

Preserve:

- workflow ID;
- active specialist;
- safe intake context.

---

## Step 5 — Invoke Relevance AI

Pass the safe intake to the selected specialist.

Use a thin wrapper such as:

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

The Strategic OS specialist contract controls the reasoning.

Make should not recreate that reasoning.

---

# 11. Specialist cloning control

When cloning a specialist scenario, update all specialist-specific elements.

Check:

1. scenario name;
2. webhook;
3. `workflow_name`;
4. `active_agent`;
5. Relevance AI agent;
6. specialist wrapper;
7. Data Store mappings;
8. Slack specialist label;
9. live Make mapping tokens.

A known implementation failure occurred when the correct Relevance AI specialist was selected but inherited wrapper text from another specialist remained.

Always inspect both the agent selection and wrapper.

---

# 12. Persist specialist output

After specialist execution:

    latest_output = <Relevance AI answer>
    previous_state = processing
    current_state = human-review-required
    human_action_required = true
    updated_at = now

The output remains advisory.

It is not yet approved.

---

# 13. Slack review workflow

Slack is used only when meaningful human action is required.

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

The message should make four things immediately clear:

1. which workflow is being reviewed;
2. which specialist produced the output;
3. what the output says;
4. what explicit human action is supported.

---

# 14. Slack communication principles

## Be explicit

Prefer:

> Human review required. Approve with `P <workflow_id>`.

Avoid vague requests such as:

> Have a look when you get a chance.

## Minimise notification volume

Send Slack messages when:

- specialist output is ready for human review;
- approval has been successfully persisted.

Additional notifications should only be introduced when repeated use demonstrates a need.

Do not automatically add:

- workflow-start notifications;
- internal processing notifications;
- routine Data Store updates;
- reminder sequences;
- retry notifications;
- pause/resume messages;
- specialist-handoff notifications.

The current runtime does not need notification volume to prove activity.

It needs clear human-control points.

---

# 15. Approval listener

The validated human action is:

`P <workflow_id>`

Strict approval regex:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

The strict parser ensures unrelated Slack messages are not treated as approvals.

Do not use obsolete approval formats such as:

`APPROVE <workflow_id>`

Do not expose additional commands until they are implemented and validated.

---

# 16. Approval sequence

The shared listener:

1. receives the Slack message;
2. applies the strict approval regex;
3. extracts `workflow_id`;
4. retrieves the matching record from `strategic_os_beta_workflows`;
5. confirms the workflow is awaiting human review;
6. persists the approved state;
7. sends Slack approval confirmation.

No new specialist runs automatically after approval.

---

# 17. Approved state

Expected successful state:

    previous_state = human-review-required
    current_state = approved
    decision_status = approved
    human_action_required = false
    completed_at = now
    updated_at = now
    privacy_status = confirmed

The Data Store record is authoritative for runtime state.

Slack confirmation is the human-facing acknowledgement.

---

# 18. Defensive approval controls

## Invalid workflow ID

The validated original runtime demonstrated that an invalid workflow ID:

- does not update an unrelated Data Store record;
- does not result in successful approval;
- does not send an approval confirmation.

Explicit invalid-ID feedback remains a future hardening item.

## Duplicate approval

The validated runtime demonstrated that an already approved workflow should not:

- be approved again;
- overwrite `completed_at`;
- generate a second successful approval confirmation.

Retest these controls if the approval listener is materially changed.

---

# 19. Specialist outputs remain advisory

Approval means:

> The human reviewer accepted the specialist output through the current runtime.

Approval does not mean Make is authorised to:

- contact stakeholders;
- publish artefacts;
- modify organisational systems;
- create Jira work;
- update Confluence;
- write to Strategic OS automatically;
- invoke another agent.

Those actions remain separate human decisions or future bounded automations.

---

# 20. Current specialist roles

The five specialist runtimes are differentiated by their Strategic OS contracts.

## Sensemaking Agent

Used to improve decision framing by clarifying:

- the underlying question;
- evidence;
- assumptions;
- interpretation;
- options;
- trade-offs;
- recommendation;
- next action.

## Stakeholder Journey Agent

Used to improve stakeholder decision support by clarifying:

- influence;
- interest;
- impact;
- decision rights;
- uncertainty;
- engagement sequence;
- next stakeholder action.

## Career Architect

Used to assess:

- strategic value;
- career value;
- evidence maturity;
- sponsorship;
- impact;
- next validation step.

Reusable learning:

> When an opportunity is sufficiently framed, test mandate, adoption or impact before creating more documentation.

## Shipping Coach

Used to distinguish:

- real blockers;
- optional refinement;
- risk of moving;
- risk of waiting;
- Ship / Socialise / Refine / Stop recommendation;
- minimum next action;
- done condition.

## Chief of Staff Agent

Used to support:

- operating view;
- selective prioritisation;
- decision/task separation;
- dependency visibility;
- focus protection;
- cautious goal alignment;
- selective specialist routing;
- one bounded next action.

The Chief of Staff Agent may recommend another specialist.

It does not automatically invoke that specialist.

---

# 21. Selection remains human-led

Current specialist selection is deliberately simple.

José chooses the specialist that best matches the work.

Indicative routing logic:

| Need | Specialist |
|---|---|
| Clarify an ambiguous strategic question | Sensemaking Agent |
| Determine stakeholder sequencing or alignment | Stakeholder Journey Agent |
| Assess strategic and career opportunity value | Career Architect |
| Decide whether work is ready to move | Shipping Coach |
| Prioritise work or establish the next operating action | Chief of Staff Agent |

This is decision guidance.

It is not an automated router.

---

# 22. Evidence hierarchy

When validating runtime behaviour, use:

1. final Data Store record;
2. Make execution history;
3. Slack review or confirmation;
4. safe manual observation.

Record only privacy-safe evidence.

Do not place in Strategic OS:

- webhook URLs;
- access tokens;
- credentials;
- raw execution payloads containing sensitive information;
- unrestricted screenshots;
- private Slack history.

---

# 23. Current validation result

All five priority specialist runtimes have passed the common end-to-end path.

| Specialist | Execution | Slack review | P approval | Approved state | Status |
|---|---|---|---|---|---|
| Sensemaking Agent | Passed | Passed | Passed | Passed | Validated |
| Stakeholder Journey Agent | Passed | Passed | Passed | Passed | Validated |
| Career Architect | Passed | Passed | Passed | Passed | Validated |
| Shipping Coach | Passed | Passed | Passed | Passed | Validated |
| Chief of Staff Agent | Passed | Passed | Passed | Passed | Validated |

Behavioural validation:

> Complete

Specialist runtime implementation:

> Complete

---

# 24. Known but not implemented

The following capabilities are deliberately outside the validated runtime:

- `L` rework command;
- `M` stop command;
- approve with correction;
- pause and resume;
- automated specialist sequencing;
- multi-agent routing;
- automatic specialist handoffs;
- authorised-responder validation;
- privacy rejection feedback;
- explicit invalid-workflow feedback;
- advanced output validation;
- automated correction retries;
- Relevance AI failure handling;
- Slack notification failure handling;
- retry-limit handling;
- sensitive-content safeguards beyond the current privacy gate;
- workflow ID cleanup;
- automatic Jira actions;
- automatic Confluence actions;
- automatic GitHub writes;
- external publication.

Do not describe these as operational capabilities.

---

# 25. Runtime hardening rule

Known gaps do not automatically become build priorities.

Implement additional controls when:

- repeated real use exposes a failure;
- more users gain runtime access;
- information sensitivity increases;
- the workflow moves into a broader organisational environment;
- the consequence of failure materially increases;
- privacy or governance requires stronger control;
- a current safeguard proves unreliable.

Use the smallest control that solves the demonstrated problem.

---

# 26. Orchestration expansion rule

Do not build multi-agent orchestration because several specialist agents are now available.

Before introducing automatic routing or sequencing, establish:

1. a repeated real-work problem;
2. evidence that manual specialist selection creates material friction;
3. a clear benefit from automatic coordination;
4. safe context-handoff rules;
5. explicit human decision boundaries;
6. privacy-safe persistence;
7. bounded failure behaviour;
8. an end-to-end validation method.

Until those conditions exist:

> Keep specialists independent.

---

# 27. Real-work observation

Technical validation is no longer the primary evidence threshold.

Observe the runtime through real work.

Capture only useful evidence about:

- whether the right specialist was easy to choose;
- whether the common intake was sufficient;
- whether specialist output improved decision clarity;
- whether Slack review was proportionate;
- whether approval was reliable;
- whether context had to be reconstructed manually;
- whether another specialist genuinely became necessary;
- whether any failure pattern repeated;
- whether the runtime added or reduced management overhead.

Do not create new repository architecture for isolated inconveniences.

---

# 28. Runtime evaluation questions

After meaningful real-world use, ask:

1. Did the specialist improve the decision or next action?
2. Was the selected specialist appropriate?
3. Was sufficient context available?
4. Were evidence and assumptions handled safely?
5. Was the Slack review easy to understand?
6. Was the approval boundary clear?
7. Did the workflow require unnecessary manual reconstruction?
8. Did another specialist become genuinely necessary?
9. Was any automation missing that materially affected the work?
10. Should the runtime remain unchanged?

The final question matters.

No change is a valid result.

---

# 29. Current operating decision

The five priority specialist runtimes are operational.

The original concept of an automatically sequenced beta agent team is not the current runtime architecture.

The current architecture is:

> independent specialist runtimes + shared state pattern + explicit human review.

The next priority is:

> Use, observation and evidence.

Do not proceed automatically to:

- routing;
- chaining;
- expanded Slack controls;
- autonomous sequencing;
- automatic actions.

Real work should determine whether any of those capabilities are necessary.

---

# 30. Success condition

The automation and Slack workflow succeeds when it:

- gets the right safe context to the intended specialist;
- keeps Make thin;
- preserves the specialist contract;
- stores a reviewable output;
- makes human review explicit;
- records approval reliably;
- avoids accidental downstream action;
- adds little management overhead;
- improves real strategic decision support.

> Automation is useful when it removes coordination friction without removing human judgement.
