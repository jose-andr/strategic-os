# Strategic OS Make Runtime Backlog

## Purpose

Track runtime corrections, hardening opportunities and future adaptations identified while operating the validated Strategic OS specialist runtimes in Make, Relevance AI and Slack.

This backlog is not the active implementation sequence.

The active rule is:

> Operate the validated specialist runtimes through real work before expanding orchestration.

Do not pull items from this backlog merely because they are technically possible.

Prioritise an item only when:

- it blocks a validated specialist runtime;
- repeated use exposes a genuine problem;
- it materially improves privacy, reliability or decision quality;
- the operating boundary expands;
- governance or security requires it; or
- the active implementation phase explicitly requires it.

---

# Current runtime

Five priority specialist runtimes are validated end to end:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

Each specialist uses the same proven runtime pattern:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener → approved state`

The specialist scenarios remain independent.

There is currently no automatic multi-agent routing or sequencing.

---

# Current phase

**Specialist behavioural validation:** Complete

**Specialist runtime implementation:** Complete

**Current phase:** Operational use, observation and evidence

Current priority:

> Use the validated specialists on real work and let repeated evidence determine whether runtime hardening or orchestration expansion is justified.

Do not continue adding runtime capability merely because the technical foundation now works.

---

# Validated shared runtime

The common specialist runtime supports:

- specialist-specific webhook intake;
- common intake structure;
- `privacy_confirmed = true` privacy gate;
- shared `strategic_os_beta_workflows` Data Store;
- specialist execution in Relevance AI;
- Make used for orchestration only;
- specialist output stored in `latest_output`;
- transition from `processing` to `human-review-required`;
- Slack human review;
- strict `P <workflow_id>` approval parsing;
- workflow lookup;
- approved-state persistence;
- Slack approval confirmation.

---

# Validated state path

The minimum validated state sequence is:

    intake
      ↓
    privacy gate
      ↓
    processing
      ↓
    human-review-required
      ↓
    approved

Expected approved state:

    previous_state = human-review-required
    current_state = approved
    decision_status = approved
    human_action_required = false
    completed_at = now
    updated_at = now
    privacy_status = confirmed

No downstream specialist is automatically invoked after approval.

---

# Approval command

The supported human approval command is:

`P <workflow_id>`

Strict parser:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

The human-facing Slack instruction must match this executable contract exactly.

Reusable runtime lesson:

> Human-facing command instructions must exactly match the parser contract.

Do not append explanatory text inside the command itself.

---

# Shared Data Store

Use:

`strategic_os_beta_workflows`

Do not create specialist-specific Data Stores.

Primary lookup key:

`workflow_id`

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

The existence of a field does not mean every possible related behaviour has been implemented.

For example:

- `rework_count` does not mean a rework command exists;
- `retry_count` does not mean automatic retry behaviour exists.

---

# Validated specialist runtimes

## Sensemaking Agent

Status:

> Validated end to end.

Runtime values:

    workflow_name = sensemaking
    active_agent = sensemaking-agent

The Sensemaking runtime established the original specialist implementation pattern.

Validated behaviour includes:

- safe webhook intake;
- privacy gating;
- specialist reasoning;
- output persistence;
- Slack human review;
- strict approval parsing;
- approved-state persistence.

Reusable runtime learning:

> Human-facing approval instructions must exactly match the executable parser format.

---

## Stakeholder Journey Agent

Status:

> Validated end to end.

Runtime values:

    workflow_name = stakeholder-journey
    active_agent = stakeholder-journey-agent

Key implementation learning:

> Selecting the correct Relevance AI agent is not sufficient when cloning a specialist runtime.

Always check:

- selected Relevance AI agent;
- inherited specialist wrapper;
- `workflow_name`;
- `active_agent`;
- Data Store mappings;
- Slack specialist labels;
- live Make mapping tokens.

---

## Career Architect

Status:

> Validated end to end.

Scenario:

`Strategic OS Beta — Career Architect Review`

Webhook:

`Strategic OS Beta — Career Architect Intake`

Runtime values:

    workflow_name = career-architect
    active_agent = career-architect-agent

Validated Relevance AI Agent ID:

`24e39803-109a-423b-a7d9-02c22acdc5f8`

Behavioural validation confirmed:

- strategic value separated from career value;
- potential, emerging and achieved evidence separated;
- uncertainty preserved;
- sponsorship and impact not invented;
- stakeholder validation preferred before unnecessary artefact creation;
- one bounded next action;
- human review preserved.

Reusable learning:

> When an opportunity is sufficiently framed, test mandate, adoption or impact before creating more documentation.

---

## Shipping Coach

Status:

> Validated end to end.

Scenario:

`Strategic OS Beta — Shipping Coach Review`

Webhook:

`Strategic OS Beta — Shipping Coach Intake`

Runtime values:

    workflow_name = shipping-coach
    active_agent = shipping-coach-agent

Validated Relevance AI Agent ID:

`f34c1e33-ce57-4d8b-bc2b-a4fe24f5ed24`

Behavioural validation confirmed:

- blockers distinguished from optional refinement;
- risk of moving compared with risk of waiting;
- Ship / Socialise / Refine / Stop logic applied;
- refinement bounded;
- smallest useful action identified;
- clear done condition;
- overbuilding resisted;
- human review preserved.

Approval through the shared `P <workflow_id>` path passed.

---

## Chief of Staff Agent

Status:

> Validated end to end.

Scenario:

`Strategic OS Beta — Chief of Staff Review`

Webhook:

`Strategic OS Beta — Chief of Staff Intake`

Runtime values:

    workflow_name = chief-of-staff
    active_agent = chief-of-staff-agent

Validated Relevance AI Agent ID:

`cea451dc-641c-4d3e-9e18-c1d0fb1dc57c`

Behavioural validation confirmed:

- useful operating view;
- selective prioritisation;
- decisions separated from tasks;
- dependencies surfaced;
- focus protection;
- cautious goal alignment;
- specialist routing used selectively;
- unnecessary multi-agent invocation avoided;
- human decision points explicit;
- one bounded next action;
- human review preserved.

Approval through the shared `P <workflow_id>` path passed.

---

# Current validated controls

| Runtime control | Status |
|---|---|
| Specialist-specific webhook intake | Validated |
| Common intake schema | Validated |
| `privacy_confirmed = true` gate | Validated |
| Shared Data Store | Validated |
| Specialist selection by scenario | Validated |
| Relevance AI specialist execution | Validated |
| `latest_output` persistence | Validated |
| `processing → human-review-required` | Validated |
| Slack human review | Validated |
| Strict `P <workflow_id>` parser | Validated |
| Workflow lookup | Validated |
| `human-review-required → approved` | Validated |
| Approved-state persistence | Validated |
| Slack approval confirmation | Validated |
| Invalid workflow ID containment | Previously validated |
| Duplicate approval prevention | Previously validated |

---

# Runtime corrections already resolved

## Slack approval instruction mismatch

Status:

> Resolved

### Problem

The original Sensemaking Slack review message displayed:

`P <workflow-id> - Approve`

The approval listener accepted only:

`P <workflow-id>`

using:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

The additional text prevented the command from matching.

### Resolution

The Slack instruction was changed so the displayed command exactly matches:

`P <workflow_id>`

### Reusable lesson

> Interface instructions and executable command contracts must remain identical.

---

## Specialist wrapper inheritance

Status:

> Resolved and incorporated into cloning practice

### Problem

A cloned specialist scenario can point to the correct Relevance AI agent while still containing wrapper text inherited from another specialist.

### Resolution

When cloning a specialist scenario, inspect both:

1. the selected Relevance AI agent; and
2. the specialist wrapper text.

Also check:

- workflow values;
- Data Store labels;
- Slack labels;
- live Make tokens.

### Reusable lesson

> Specialist identity exists across configuration, prompt wrapper and runtime labels—not only agent selection.

---

# Backlog categories

Backlog items are grouped as:

1. runtime hardening;
2. human-review controls;
3. privacy and access controls;
4. reliability and failure handling;
5. orchestration expansion;
6. integration expansion;
7. runtime hygiene.

They are not prioritised simply by category order.

---

# 1. Runtime hardening

## H1 — Specialist output validation

Status:

> Not implemented

Potential problem:

A specialist may technically execute but return an incomplete or structurally poor response.

Possible future control:

- lightweight output validation before Slack review;
- verify only critical required structure;
- fail safely rather than invent missing content.

Do not implement until repeated output failures justify it.

---

## H2 — Sensitive-content safeguards

Status:

> Not implemented beyond the current privacy gate

Current control:

`privacy_confirmed = true`

Potential future need:

Additional inspection before external specialist execution if the information risk or user population expands.

Trigger:

- broader user access;
- more sensitive work;
- privacy incident or near miss;
- governance requirement.

---

## H3 — Workflow ID cleanup

Status:

> Not implemented

Potential issue:

The current workflow ID implementation may contain unnecessary technical debt or complexity.

Current decision:

> Do not redesign working ID generation without evidence of an operational problem.

---

# 2. Human-review controls

## R1 — Rework command

Candidate command:

`L <workflow_id>`

Status:

> Not implemented

Potential purpose:

Return a workflow for another specialist iteration.

Do not implement unless repeated real use shows that external/manual rework creates meaningful friction.

---

## R2 — Stop command

Candidate command:

`M <workflow_id>`

Status:

> Not implemented

Potential purpose:

Explicitly stop a workflow through Slack.

Do not implement merely for command symmetry with approval.

---

## R3 — Approve with correction

Status:

> Not implemented

Potential purpose:

Allow a human to accept the direction while preserving a small correction.

Risk:

Could create unnecessary parsing and state complexity.

Prefer simple human editing outside the runtime unless repeated need justifies a structured mechanism.

---

## R4 — Pause and resume

Status:

> Not implemented

Potential purpose:

Support workflows waiting on external evidence or stakeholder input.

Do not implement until long-running runtime-managed workflows become a real use case.

---

# 3. Privacy and access controls

## P1 — Privacy rejection feedback

Status:

> Not implemented

Current behaviour:

The privacy gate prevents normal specialist execution when confirmation is absent or false.

Potential future improvement:

Return a clear, safe message explaining why the workflow did not proceed.

Trigger:

Repeated user confusion or broader beta access.

---

## P2 — Authorised responder validation

Status:

> Not implemented

Potential purpose:

Ensure only approved Slack users can approve a workflow.

Current operating context:

Contained specialist use with explicit human control.

Trigger:

- wider Slack access;
- multiple reviewers;
- organisational deployment;
- increased consequence of unauthorised approval.

This is likely to become more important if the operating boundary expands.

---

# 4. Reliability and failure handling

## F1 — Relevance AI failure handling

Status:

> Not implemented as a complete automated recovery pattern

Potential need:

Handle:

- timeout;
- unavailable agent;
- malformed response;
- API failure.

Current rule:

> Observe real failures before designing a broad retry architecture.

---

## F2 — Slack notification failure handling

Status:

> Not implemented

Potential risk:

A workflow reaches `human-review-required` but the reviewer does not receive the Slack message.

Trigger:

A real delivery failure or wider operational use.

Potential future control:

- detect notification failure;
- preserve review-required state;
- expose a safe recovery path.

---

## F3 — Automated retries

Status:

> Not implemented

Potential future need:

Retry transient failures.

Risk:

Unbounded retries can create cost, duplication and unclear state.

Any retry design should define:

- eligible failure types;
- retry limit;
- state behaviour;
- human visibility;
- duplicate-prevention logic.

---

## F4 — Explicit invalid workflow feedback

Status:

> Not implemented

Existing containment:

An invalid workflow ID does not approve an unrelated record and does not generate successful approval confirmation.

Potential improvement:

Provide explicit human feedback when a workflow ID cannot be found.

Trigger:

Repeated approval mistakes or broader access.

---

# 5. Orchestration expansion

## O1 — Multi-agent router

Status:

> Paused / not implemented

Concept:

Automatically select a specialist from the intake.

Current decision:

> Do not build.

Evidence required before reconsideration:

- repeated difficulty selecting the correct specialist;
- meaningful manual routing overhead;
- stable and predictable routing rules;
- low ambiguity;
- preserved human control.

---

## O2 — Automatic specialist sequencing

Status:

> Paused / not implemented

Concept:

Automatically invoke another specialist after one specialist completes.

Current decision:

> Do not build.

Evidence required:

- real work repeatedly needs the same specialist sequence;
- sequencing order is stable;
- manual context handoff creates material friction;
- context transfer can remain privacy-safe;
- human review points remain explicit.

---

## O3 — Agent-to-agent handoff contract

Status:

> Not implemented

Potential need:

A reusable structured context format if multi-specialist work becomes frequent.

Current approach:

Human deliberately starts the next specialist with only the safe context required.

Do not formalise an automated handoff contract before repeated evidence exists.

---

# 6. Integration expansion

## I1 — Automatic GitHub writes

Status:

> Paused / not implemented

Current decision:

> Do not automate Strategic OS repository writes.

Reasons:

- human review remains valuable;
- repository content should remain curated;
- automatic persistence could preserve low-value or unsafe content;
- Git history should reflect deliberate knowledge changes.

Reconsider only if repeated safe repository maintenance becomes a meaningful operating bottleneck.

---

## I2 — Jira automation

Status:

> Not implemented

Potential use:

Create or update delivery work from an approved specialist recommendation.

Current decision:

Keep organisational systems of record separate from the specialist runtime.

Any future Jira action requires:

- explicit system-of-record rules;
- bounded write authority;
- human approval;
- duplicate prevention;
- clear ownership.

---

## I3 — Confluence automation

Status:

> Not implemented

Potential use:

Publish approved organisational documentation.

Current decision:

Not part of the specialist beta runtime.

Strategic OS should not automatically publish into organisational systems without a separate controlled workflow.

---

# 7. Runtime hygiene

## G1 — Scenario naming consistency

Status:

> Monitor

Ensure specialist scenarios use stable naming patterns.

Current examples:

- `Strategic OS Beta — Sensemaking Review`
- `Strategic OS Beta — Stakeholder Journey Review`
- `Strategic OS Beta — Career Architect Review`
- `Strategic OS Beta — Shipping Coach Review`
- `Strategic OS Beta — Chief of Staff Review`

Avoid renaming working scenarios without a functional reason.

---

## G2 — Specialist label inheritance

Status:

> Control established

When cloning:

- check scenario name;
- webhook;
- `workflow_name`;
- `active_agent`;
- Relevance AI agent;
- wrapper;
- Data Store values;
- Slack labels.

This should remain part of the specialist cloning checklist.

---

## G3 — Mapping-token integrity

Status:

> Control established

Use live Make mapping tokens.

Do not rely on copied black/plain-text placeholders.

Retest mapping only when scenarios are cloned or changed.

---

# Prioritisation framework

Use this order when deciding whether to activate a backlog item.

## Priority 1 — Blocking defect

A validated specialist cannot complete its normal path.

Action:

> Fix immediately with the smallest contained change.

## Priority 2 — Privacy or governance risk

A demonstrated or newly applicable privacy, access or governance issue exists.

Action:

> Add the minimum adequate safeguard.

## Priority 3 — Repeated operational friction

The same problem materially affects multiple real runs.

Action:

> Define one contained improvement and validate it.

## Priority 4 — Expansion opportunity

Additional automation might improve convenience.

Action:

> Keep paused until the evidence threshold is met.

Technical possibility alone is not sufficient.

---

# Evidence threshold for backlog activation

Before activating a non-blocking backlog item, record:

**Problem:**  
What is happening?

**Evidence:**  
How many times has it occurred?

**Impact:**  
What does it reduce or risk?

**Current workaround:**  
Can the existing runtime handle it adequately?

**Smallest useful change:**  
What is the minimum intervention?

**Human-control impact:**  
Does the change alter decision authority?

**Privacy impact:**  
Does it increase context movement or persistence?

**Validation method:**  
How will the change be proven?

If these questions cannot be answered clearly:

> Leave the item in the backlog.

---

# Runtime observation log

Do not create a detailed log for every use.

Capture an observation only when it may affect runtime design.

Use:

## Runtime observation

**Date:**  
[Add date]

**Specialist:**  
[Add specialist]

**Observed behaviour:**  
[Safe summary]

**Frequency:**  
[First occurrence / Repeated]

**Impact:**  
[Low / Medium / High]

**Existing workaround:**  
[Add workaround]

**Backlog item affected:**  
[Add item or `None`]

**Change justified:**  
[Yes / No]

**Next action:**  
[One bounded action]

---

# Current backlog

| ID | Item | Status | Trigger |
|---|---|---|---|
| H1 | Specialist output validation | Paused | Repeated malformed or incomplete output |
| H2 | Additional sensitive-content safeguards | Paused | Higher-risk use or governance requirement |
| H3 | Workflow ID cleanup | Paused | Demonstrated runtime defect |
| R1 | `L` rework command | Paused | Repeated rework friction |
| R2 | `M` stop command | Paused | Repeated need for runtime stop control |
| R3 | Approve with correction | Paused | Repeated minor-correction friction |
| R4 | Pause / resume | Paused | Real long-running workflow need |
| P1 | Privacy rejection feedback | Paused | Repeated user confusion |
| P2 | Authorised responder validation | Paused | Broader reviewer access |
| F1 | Relevance AI failure handling | Paused | Observed failure pattern |
| F2 | Slack failure handling | Paused | Observed delivery failure |
| F3 | Automated retries | Paused | Repeated transient failure |
| F4 | Invalid workflow feedback | Paused | Repeated approval errors |
| O1 | Multi-agent router | Paused | Repeated routing friction |
| O2 | Automatic specialist sequencing | Paused | Stable repeated specialist sequence |
| O3 | Agent handoff contract | Paused | Repeated multi-specialist context transfer |
| I1 | Automatic GitHub writes | Paused | Demonstrated repository-maintenance bottleneck |
| I2 | Jira automation | Paused | Explicit bounded organisational use case |
| I3 | Confluence automation | Paused | Explicit bounded organisational use case |

---

# Completed runtime work

The following no longer belong in the active backlog:

- [x] Sensemaking specialist runtime implemented
- [x] Sensemaking approval path validated
- [x] Stakeholder Journey specialist runtime implemented
- [x] Stakeholder Journey approval path validated
- [x] Career Architect specialist runtime implemented
- [x] Career Architect approval path validated
- [x] Shipping Coach specialist runtime implemented
- [x] Shipping Coach approval path validated
- [x] Chief of Staff specialist runtime implemented
- [x] Chief of Staff approval path validated
- [x] shared Data Store pattern established
- [x] common intake schema established
- [x] `privacy_confirmed = true` gate established
- [x] strict `P <workflow_id>` approval parser established
- [x] Slack approval instruction mismatch corrected
- [x] specialist wrapper inheritance issue identified and controlled
- [x] approved-state persistence validated

Do not keep completed implementation work as if it were still an active backlog item.

---

# Current implementation rule

> Do not add runtime capability simply because all five specialists now work.

The next evidence threshold is not another Make scenario.

It is repeated real-world use.

Use the current runtime to learn:

- whether specialist selection remains easy;
- whether the common intake remains sufficient;
- whether Slack review remains proportionate;
- whether state persistence remains reliable;
- whether output quality is consistently useful;
- whether manual specialist handoff becomes burdensome;
- whether a specific failure pattern recurs.

Only then activate the smallest relevant backlog item.

---

# Current decision

Specialist runtime implementation is complete.

Runtime expansion is paused.

Current priority:

> Use, observation and evidence.

The backlog exists to prevent known possibilities from being mistaken for current requirements.

A working runtime does not need to become a more complex runtime unless real use proves why.
