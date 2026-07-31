# Strategic OS Beta — Automation and Slack Workflow

## Status

Draft for beta implementation

## Purpose

Define the minimum automation and Slack communication workflow required to evaluate:

- agent coordination;
- workflow sequencing;
- context handoffs;
- human approval;
- notification quality;
- failure recovery; and
- beta evidence capture.

This workflow supports the Bitbucket documentation opportunity as the beta test subject.

The business outcome of that opportunity does not determine beta success.

## Operating principle

Automation coordinates the work.

Agents analyse and produce outputs.

Slack keeps José informed and provides clear human-control points.

José retains final decision authority.

## Workflow objective

Test whether the Strategic OS agentic team can move a real strategic opportunity through:

1. intake;
2. sensemaking;
3. human review;
4. stakeholder analysis;
5. artefact preparation;
6. shipping assessment;
7. final human decision; and
8. beta evaluation.

## In-scope agents

### Orchestrator

Responsible for:

- receiving the workflow trigger;
- creating the workflow record;
- selecting the next agent;
- passing approved context;
- maintaining workflow state;
- sending Slack notifications;
- pausing for approval;
- detecting failures;
- recording retries and interventions; and
- closing the workflow.

### Sensemaking Agent

Responsible for:

- clarifying the opportunity;
- identifying the decision required;
- separating evidence, assumptions and interpretation;
- identifying options, risks and caveats; and
- producing the first structured handoff.

### Stakeholder Journey Agent

Responsible for:

- identifying stakeholder interests;
- anticipating concerns and resistance;
- defining desired stakeholder movement;
- tailoring engagement approaches; and
- preparing stakeholder communication inputs.

### Shipping Coach

Responsible for:

- assessing readiness;
- identifying minimum remaining work;
- recommending Ship, Socialise, Refine or Stop;
- identifying unresolved risks; and
- defining the next action.

## Workflow state model

Use the following workflow states:

- `not-started`
- `intake-received`
- `sensemaking-running`
- `sensemaking-review`
- `stakeholder-analysis-running`
- `stakeholder-review`
- `artefact-preparation`
- `shipping-review`
- `human-decision-required`
- `paused`
- `failed`
- `completed`
- `stopped`

Each workflow event should record:

- workflow ID;
- current state;
- previous state;
- timestamp;
- responsible agent or automation;
- input reference;
- output reference;
- human action required;
- Slack notification status;
- error status; and
- next expected step.

## Minimum workflow

    Beta trigger received
            |
            v
    Workflow record created
            |
            v
    Sensemaking Agent runs
            |
            v
    Slack review request sent to José
            |
            v
    José approves, redirects or stops
            |
            v
    Stakeholder Journey Agent runs
            |
            v
    Slack review request sent to José
            |
            v
    José approves, redirects or stops
            |
            v
    Decision and engagement artefacts prepared
            |
            v
    Shipping Coach assesses readiness
            |
            v
    Slack decision request sent to José
            |
            v
    José selects Ship, Socialise, Refine or Stop
            |
            v
    Outcome and beta evidence recorded
            |
            v
    Completion notification sent

## Workflow trigger

The beta workflow should start only when José explicitly initiates it.

Recommended trigger:

`Start Strategic OS beta`

The trigger may be submitted through:

- Slack command;
- Slack message in a nominated channel;
- manual workflow action; or
- approved automation interface.

The trigger should not start from passive mentions, document changes or inferred intent during the beta.

## Required trigger inputs

The workflow should require:

| Field | Description |
|---|---|
| Test subject | The opportunity or problem being assessed |
| Decision required | The decision the work should support |
| Intended stakeholders | The people or roles affected |
| Source references | Links or safe summaries of relevant material |
| Information sensitivity | Public, internal or restricted |
| Desired output | Brief, assessment, meeting plan or other artefact |
| Target date | When the output is needed |
| Human owner | José unless explicitly reassigned |

If required information is missing, the workflow should pause and ask José for clarification.

It should not invent material business context.

## Step 1 — Intake and workflow creation

### Automation action

The Orchestrator should:

1. assign a unique workflow ID;
2. create the beta evidence record;
3. validate required inputs;
4. check information-sensitivity boundaries;
5. set the state to `intake-received`;
6. select the Sensemaking Agent; and
7. send a workflow-started notification.

### Slack notification

**Type:** Information

**Required content:**

- workflow ID;
- test subject;
- decision required;
- agent about to run;
- expected output;
- known missing information;
- expected next review point; and
- link to the workflow record.

### Example

> **Strategic OS beta started**
>
> Workflow: `BETA-001`  
> Subject: Reusable documentation and customer-knowledge capability  
> Decision: Whether to propose a contained Bitbucket pilot  
> Current step: Sensemaking Agent  
> Next review: Sensemaking output approval  
> Action required now: None

## Step 2 — Sensemaking

### Agent input

The Sensemaking Agent should receive:

- original test subject;
- decision required;
- stakeholder list;
- approved source summaries;
- source references;
- information-sensitivity classification;
- intended output; and
- relevant prior decisions.

### Required output

The Sensemaking Agent should produce:

- clarified opportunity;
- decision statement;
- evidence;
- assumptions;
- interpretation;
- options;
- trade-offs;
- risks;
- caveats;
- recommendation;
- unresolved questions; and
- recommended next agent.

### Automation checks

Before the output is sent to José, the Orchestrator should confirm:

- required sections are present;
- evidence and assumptions are separated;
- no restricted content is included;
- the recommendation is not presented as a final decision;
- unresolved questions are visible; and
- the next action is clear.

### State change

`sensemaking-running` → `sensemaking-review`

### Slack notification

**Type:** Review required

**Required content:**

- producing agent;
- output summary;
- recommendation;
- key assumptions;
- material caveats;
- unresolved questions;
- link to the full output;
- available actions; and
- consequence of no response.

### Available actions

- `Approve`
- `Approve with correction`
- `Request rework`
- `Pause`
- `Stop`

### Example

> **Sensemaking output ready — review required**
>
> Workflow: `BETA-001`  
> Recommendation: Test a contained Bitbucket pilot focused on reusable source assets and governance workflows.  
> Key caveat: Non-technical contributor usability has not yet been validated.  
> Next step if approved: Stakeholder Journey Agent  
>
> Choose: Approve / Correct / Rework / Pause / Stop

## Step 3 — Human review of sensemaking

### Approve

The Orchestrator should:

- record approval;
- preserve the approved output;
- set the state to `stakeholder-analysis-running`;
- pass only approved context to the next agent; and
- notify José that the workflow has resumed.

### Approve with correction

The Orchestrator should:

- record José's correction;
- update the approved context;
- preserve the original output and correction;
- pass the corrected version to the next agent; and
- record that human intervention occurred.

### Request rework

The Orchestrator should:

- record the reason;
- return the work to the Sensemaking Agent;
- increment the attempt count;
- prevent the next agent from starting;
- set a retry limit; and
- notify José when the revised output is ready.

### Pause

The Orchestrator should:

- set the state to `paused`;
- preserve all current context;
- cancel pending agent actions; and
- send confirmation.

### Stop

The Orchestrator should:

- set the state to `stopped`;
- record the reason;
- prevent further actions;
- preserve the beta evidence; and
- send a closure notification.

## Step 4 — Stakeholder analysis

### Agent input

The Stakeholder Journey Agent should receive:

- approved sensemaking output;
- decision required;
- stakeholder list;
- known stakeholder context;
- relevant caveats;
- intended engagement outcome; and
- constraints confirmed by José.

### Required output

The agent should produce:

- stakeholder overview;
- likely position;
- interests;
- concerns;
- resistance signals;
- value proposition;
- tailored engagement approach;
- evidence needed;
- desired stakeholder movement;
- recommended engagement sequence; and
- unresolved stakeholder assumptions.

### Automation checks

Confirm that:

- stakeholders are treated individually;
- assumptions are labelled;
- no stakeholder position is presented as fact without evidence;
- communication is suitable for the intended audience;
- the recommendation remains advisory; and
- a review action is clear.

### State change

`stakeholder-analysis-running` → `stakeholder-review`

### Slack notification

**Type:** Review required

**Required content:**

- producing agent;
- stakeholders assessed;
- recommended engagement sequence;
- main resistance risks;
- unresolved assumptions;
- link to the output; and
- available actions.

## Step 5 — Human review of stakeholder analysis

Use the same actions:

- `Approve`
- `Approve with correction`
- `Request rework`
- `Pause`
- `Stop`

Approved stakeholder analysis becomes the input for artefact preparation.

## Step 6 — Artefact preparation

### Automation action

The Orchestrator should prepare or trigger preparation of the agreed artefacts.

Expected beta artefacts may include:

- stakeholder alignment assessment;
- decision brief;
- working-session plan;
- manager pitch;
- pilot scope;
- governance workflow; and
- pilot evaluation notes.

### Required controls

Each artefact should identify:

- purpose;
- intended audience;
- source inputs;
- status;
- owner;
- assumptions;
- caveats;
- decision or action required; and
- producing agent or workflow step.

### State change

`stakeholder-review` → `artefact-preparation`

When the required artefacts are complete:

`artefact-preparation` → `shipping-review`

## Step 7 — Shipping assessment

### Shipping Coach input

The Shipping Coach should receive:

- approved sensemaking output;
- approved stakeholder assessment;
- completed artefacts;
- target audience;
- deadline;
- unresolved caveats;
- known risks; and
- revision history.

### Required output

Use:

**Recommendation:**  
Ship / Socialise / Refine / Stop

**Rationale:**  
Why this is the appropriate action.

**Minimum remaining work:**  
Only the changes required before the recommended action.

**Risks:**  
What could go wrong if used now.

**Cost of further refinement:**  
What may be lost through unnecessary delay.

**Next action:**  
One clear action and owner.

### Automation checks

Confirm that:

- the recommendation is explicit;
- remaining work is contained;
- unresolved risks are visible;
- the output does not imply human approval; and
- the next decision belongs to José.

### State change

`shipping-review` → `human-decision-required`

### Slack notification

**Type:** Decision required

**Required content:**

- Shipping Coach recommendation;
- readiness rationale;
- minimum remaining work;
- material risks;
- available decisions;
- link to the artefacts; and
- explicit statement that the workflow will wait.

### Available decisions

- `Ship`
- `Socialise`
- `Refine`
- `Stop`
- `Pause`

## Step 8 — Final human decision

### Ship

Use when the output is ready for its intended stakeholder or operational use.

The Orchestrator should:

- record José's approval;
- mark the artefact as approved for use;
- record the intended recipient or channel;
- require confirmation before any automated external publication; and
- proceed to completion logging.

### Socialise

Use when the output is ready for informal testing or discussion but not formal approval.

The Orchestrator should:

- record the limited-use boundary;
- identify the audience;
- mark the artefact as draft or in review;
- capture feedback requirements; and
- proceed to completion logging.

### Refine

Use when contained changes are required.

The Orchestrator should:

- record the required changes;
- route the work to the appropriate agent;
- preserve prior versions;
- increment the revision count; and
- return to the relevant review state.

### Stop

Use when the work should not continue.

The Orchestrator should:

- record the reason;
- mark outputs as stopped or rejected;
- prevent publication;
- preserve reusable lessons; and
- proceed to completion logging.

### Pause

Use when a dependency or decision prevents progress.

The Orchestrator should:

- record the dependency;
- assign an owner where possible;
- preserve state;
- define the resume condition; and
- send confirmation.

## Step 9 — Completion and evaluation

### Automation action

At workflow completion, the Orchestrator should:

- set the final state;
- record the final human decision;
- link all approved outputs;
- record agent attempts and revisions;
- record automation failures;
- record Slack notification results;
- calculate available beta measures;
- request José's evaluation; and
- store reusable lessons.

### Slack notification

**Type:** Completion and evaluation request

**Required content:**

- final status;
- final decision;
- artefacts produced;
- agents used;
- human interventions;
- automation failures or retries;
- open actions;
- beta feedback questions; and
- link to the evidence log.

### Evaluation questions

Ask José:

1. Was the final output useful?
2. Was the workflow state clear?
3. Were the Slack notifications timely?
4. Were any notifications unnecessary?
5. Did you know when action was required?
6. Did the agents preserve context?
7. Did any agent duplicate or contradict another?
8. How much manual reconstruction was required?
9. Did the workflow improve the work?
10. Should this workflow continue, change or stop?

## Slack notification standards

Every notification should include:

- workflow ID;
- notification type;
- current state;
- responsible agent or automation;
- concise summary;
- action required;
- available choices;
- response deadline where relevant;
- consequence of no response; and
- link to the relevant output or record.

## Notification types

Use only:

- `Information`
- `Review required`
- `Decision required`
- `Warning`
- `Failure`
- `Completed`

Do not use different labels for the same notification purpose.

## Action language

Use explicit language.

Prefer:

> Review the Sensemaking Agent output and choose Approve, Correct, Rework, Pause or Stop.

Avoid:

> Have a look when you get a chance.

Prefer:

> The workflow is paused until you approve or redirect this output.

Avoid:

> The next step may require your input.

## Notification volume rules

Send a Slack notification when:

- a workflow starts;
- a meaningful output is ready;
- human review is required;
- a decision is required;
- a material warning occurs;
- a step fails;
- a retry fails;
- the workflow is paused;
- the workflow resumes; or
- the workflow completes.

Do not notify José for:

- every internal agent action;
- routine status checks;
- successful metadata updates;
- intermediate drafts not requiring review;
- repeated unchanged reminders; or
- low-value technical logs.

## Reminder rules

For review or decision requests:

- send one initial notification;
- send one reminder after the agreed response period;
- do not send repeated reminders without new information;
- escalate only where a real deadline or dependency exists; and
- allow José to snooze or pause the workflow.

## Failure handling

## Failure categories

Use:

- `input-failure`
- `agent-failure`
- `handoff-failure`
- `automation-failure`
- `slack-failure`
- `approval-timeout`
- `privacy-risk`
- `unknown-failure`

## Failure response

When a failure occurs, the Orchestrator should:

1. stop dependent actions;
2. record the failed step;
3. preserve available context;
4. classify the failure;
5. assess whether an automatic retry is safe;
6. retry no more than the configured limit;
7. notify José when the failure is material;
8. make the required human action clear; and
9. record the recovery result.

## Automatic retry rules

An automatic retry may occur when:

- the failure is technical and transient;
- no duplicate external action could occur;
- the retry does not change approved content;
- the attempt count is visible; and
- the retry limit has not been reached.

Do not automatically retry when:

- the input is ambiguous;
- an agent produced unsafe or materially weak content;
- human approval is missing;
- sensitive information may be involved;
- an external publication may be duplicated; or
- the failure cause is unknown.

## Failure notification example

> **Strategic OS beta failure — action required**
>
> Workflow: `BETA-001`  
> Failed step: Stakeholder Journey Agent handoff  
> Failure type: `handoff-failure`  
> Impact: Stakeholder analysis did not receive the approved caveats.  
> Automatic retry: Not attempted  
> Required action: Approve reconstructed context or stop the workflow.

## Privacy and source boundaries

Automation must not pass or store:

- customer personal information;
- credentials;
- secrets;
- raw organisational data;
- raw research transcripts;
- sensitive operational extracts;
- controlled documents;
- confidential attachments; or
- content that belongs exclusively in another system of record.

The workflow may pass:

- safe summaries;
- approved definitions;
- source references;
- assumptions;
- caveats;
- stakeholder patterns;
- decision logic;
- reusable prompts; and
- de-identified examples.

If the sensitivity classification is uncertain, pause and ask José.

## Workflow evidence log

Record:

| Field | Description |
|---|---|
| Workflow ID | Unique beta workflow identifier |
| Event ID | Unique event identifier |
| Timestamp | Date and time |
| Previous state | State before the event |
| Current state | State after the event |
| Actor | Agent, automation or human |
| Trigger | What caused the event |
| Input reference | Input used |
| Output reference | Output created |
| Slack notification | Sent, failed or not required |
| Human action | Action requested or completed |
| Attempt number | Agent or automation attempt |
| Failure category | Where applicable |
| Recovery action | Where applicable |
| Duration | Time taken |
| Notes | Caveat or relevant observation |

## Beta measures produced by the workflow

The workflow should support calculation of:

- total workflow duration;
- time waiting for human action;
- agent processing time;
- number of agent attempts;
- number of rework requests;
- number of human corrections;
- number of automation failures;
- number of retries;
- number of Slack notifications;
- useful notification rate;
- missed notification count;
- duplicate notification count;
- outputs accepted without revision;
- outputs requiring minor revision;
- outputs requiring major revision;
- privacy incidents or near misses; and
- final beta result.

## Minimum technical configuration

Before launch, confirm:

- [ ] Slack destination is defined.
- [ ] José's Slack identity is confirmed.
- [ ] Workflow trigger is configured.
- [ ] Workflow ID generation works.
- [ ] Agent sequence is configured.
- [ ] Approved context can pass between agents.
- [ ] Workflow states are stored.
- [ ] Human approval pauses the workflow.
- [ ] Slack action responses can be recorded.
- [ ] Failure notifications work.
- [ ] Retry limits are configured.
- [ ] Evidence logging works.
- [ ] Sensitive inputs can be blocked or paused.
- [ ] Final completion notification works.
- [ ] José can stop or pause the workflow.
- [ ] A test workflow can run without contacting real stakeholders.

## Pre-launch simulation

Before the real beta, simulate:

1. a successful workflow;
2. a human correction;
3. an agent rework request;
4. a paused workflow;
5. an automation failure;
6. a Slack delivery failure;
7. a privacy-risk pause; and
8. a final Stop decision.

The simulation should use synthetic or non-sensitive content.

## Launch gate

The beta may start when:

- the workflow trigger works;
- the agent sequence is configured;
- Slack notifications reach José;
- approval actions pause and resume the workflow;
- failure states are visible;
- evidence is recorded;
- José can stop the workflow;
- sensitive inputs are excluded; and
- the pre-launch simulation has been completed.

## Immediate next action

Map this workflow to the actual automation components available in Strategic OS and identify:

- the workflow engine;
- agent execution method;
- state-storage location;
- Slack integration method;
- approval mechanism;
- logging mechanism;
- retry configuration; and
- unresolved technical dependencies.
