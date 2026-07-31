# Strategic OS Beta Test Plan

## Status

Draft for beta launch

## Purpose

Evaluate whether the Strategic OS agentic team can reliably support a real strategic workstream from initial ambiguity through sensemaking, stakeholder preparation, artefact production, review and next-action coordination.

The beta is primarily testing:

- agent role clarity;
- coordination between agents;
- quality of agent handoffs;
- workflow automation;
- Slack communication and notifications;
- human oversight and intervention;
- output quality;
- recovery from errors or incomplete information; and
- creation of reusable strategic knowledge.

The selected Bitbucket documentation opportunity is the strategic test subject.

Its strategic relevance makes the test realistic, but approval or adoption of the proposal does not determine whether the beta succeeds.

## Primary beta question

> Can the Strategic OS agentic team reliably coordinate analysis, artefact creation, automation and Slack communication while supporting a real strategic decision?

## Secondary beta question

> Does the agentic workflow improve the clarity, quality and efficiency of the work compared with completing the same activity manually?

## Test subject

The beta will use the following opportunity:

> Explore whether City of Melbourne's established Bitbucket capability could support reusable, governed and machine-readable sources for internal project artefacts and customer-facing knowledge across multiple teams and channels.

The subject may involve:

- project and design documentation;
- customer information architecture;
- customer-friendly service semantics;
- customer segmentation profiles;
- Channel Strategy patterns;
- multi-channel publishing;
- cross-team governance workflows;
- reusable design elements; and
- trusted source material for emerging agents.

These are test inputs and outputs.

They are not the primary beta success criteria.

## Beta boundary

The beta will test the agentic workflow using one contained strategic workstream.

It will not:

- test every Strategic OS agent;
- automate every possible workflow;
- establish a production operating model;
- replace organisational systems of record;
- migrate existing documentation libraries;
- store raw customer or organisational data;
- assess Bitbucket as an enterprise platform implementation; or
- treat stakeholder approval as the sole indicator of success.

## Agents in scope

The initial beta should use only the agents required for the test subject.

Expected roles include:

### Sensemaking Agent

Responsible for:

- clarifying the opportunity;
- separating evidence from assumptions;
- identifying the decision required;
- framing options and trade-offs; and
- preparing structured inputs for later agents.

### Stakeholder Journey Agent

Responsible for:

- identifying stakeholder interests and concerns;
- tailoring engagement approaches;
- anticipating resistance;
- defining desired stakeholder movement; and
- preparing stakeholder-ready communication.

### Shipping Coach

Responsible for:

- assessing whether outputs are ready to use;
- identifying minimum remaining work;
- preventing unnecessary refinement;
- recommending whether to ship, socialise, refine or stop; and
- preparing the next action.

### Orchestration layer

Responsible for:

- selecting the appropriate agent;
- passing relevant context;
- maintaining workflow state;
- triggering automation;
- notifying José through Slack;
- requesting approval at defined points; and
- recording outcomes and failures.

## Workflow under test

The initial workflow is:

    Strategic opportunity captured
                |
                v
    Sensemaking Agent analyses the opportunity
                |
                v
    José receives Slack summary and review request
                |
                v
    Stakeholder Journey Agent prepares alignment approach
                |
                v
    José receives Slack action notification
                |
                v
    Decision brief and working-session artefacts are prepared
                |
                v
    Shipping Coach evaluates readiness
                |
                v
    José approves, redirects, pauses or rejects
                |
                v
    Final status, decisions and lessons are recorded

## Human-in-the-loop gates

José retains final decision authority.

Human review is required before:

- stakeholder-facing content is used;
- recommendations are treated as agreed;
- significant workflow changes are made;
- sensitive or organisational material is retained;
- the system proceeds after an error;
- a final artefact is marked ready; or
- the beta result is determined.

The system should make each intervention point clear through Slack.

## Evaluation dimensions

## 1. Agent performance

Evaluate whether each agent:

- understood its assigned role;
- stayed within scope;
- used relevant prior outputs;
- avoided unnecessary duplication;
- identified uncertainty;
- preserved important caveats;
- produced a useful handoff;
- requested human input only when necessary; and
- improved decision clarity.

## 2. Agent coordination

Evaluate whether agents:

- used consistent definitions;
- avoided contradictory recommendations;
- preserved decisions and context;
- built on previous outputs;
- avoided repeating completed work;
- handed off in a usable format; and
- maintained a clear current state.

## 3. Orchestration

Evaluate whether the orchestration layer:

- selected the right agent;
- triggered work at the right time;
- passed sufficient context;
- prevented duplicate actions;
- maintained workflow status;
- detected failures;
- supported retries or redirection; and
- kept José informed.

## 4. Automation

Evaluate:

- trigger reliability;
- sequence accuracy;
- data passed between steps;
- missed actions;
- duplicate actions;
- error handling;
- retry behaviour;
- manual interventions;
- status accuracy; and
- auditability.

Automation should reduce coordination effort without hiding uncertainty or failure.

## 5. Slack communication

Evaluate whether Slack notifications:

- reached José;
- arrived at the appropriate time;
- explained what occurred;
- identified the responsible agent;
- made the required action clear;
- distinguished information from approval requests;
- included enough context;
- avoided unnecessary detail;
- avoided duplication;
- reported errors visibly; and
- confirmed completed decisions or actions.

## 6. Human control

Evaluate whether José could:

- understand the current workflow state;
- identify which agent produced each output;
- review assumptions and evidence;
- approve or reject recommendations;
- pause the workflow;
- redirect an agent;
- request rework;
- recover from errors; and
- retain final decision authority.

## 7. Output quality

Evaluate whether outputs were:

- decision-relevant;
- evidence-aware;
- caveated;
- internally consistent;
- stakeholder-appropriate;
- reusable;
- maintainable;
- privacy-safe;
- structurally clear; and
- usable with limited manual correction.

## 8. Strategic contribution

Evaluate whether the agentic team helped:

- clarify the opportunity;
- distinguish the capability from the technology;
- identify stakeholder-specific concerns;
- define realistic options;
- surface risks and dependencies;
- improve the quality of the decision process; and
- produce useful strategic artefacts.

Stakeholder endorsement of the Bitbucket proposal is not required for success.

## Outcome independence

The following outcomes do not independently determine beta success:

- approval by the manager;
- stakeholder enthusiasm for Git or Bitbucket;
- adoption of the documentation model;
- implementation of the pilot;
- agreement on the preferred platform;
- confirmation that the initial strategic hypothesis was correct; or
- immediate organisational value.

The beta may still succeed if the proposal is rejected, narrowed or redirected, provided the system supported a clear, evidence-aware and well-communicated decision.

The beta may fail even if stakeholders approve the proposal, if the agentic workflow was unreliable, opaque or required excessive manual reconstruction.

## Success criteria

The beta is successful when the evidence shows that the system can:

- complete an end-to-end workflow;
- maintain understandable agent roles;
- coordinate work without material contradictions;
- produce useful strategic outputs;
- notify José through Slack at meaningful points;
- make required actions and decisions clear;
- retain human review before consequential use;
- detect and communicate errors;
- recover from failed or weak steps;
- preserve evidence, assumptions and caveats;
- avoid storing sensitive source material;
- create reusable learning; and
- deliver enough value to justify another controlled test.

## Failure indicators

The beta should be considered weak or unsuccessful if:

- agents repeatedly duplicate work;
- agents contradict each other without surfacing the conflict;
- important context is lost;
- automation silently fails;
- triggers occur in the wrong order;
- Slack notifications are unclear, missing or excessive;
- José cannot understand the workflow state;
- outputs require substantial reconstruction;
- recommendations overstate weak evidence;
- errors are hidden;
- privacy boundaries are breached;
- the workflow creates documentation without improving decisions; or
- manual intervention is disproportionate to the value created.

## Measures

| Dimension | Measure |
|---|---|
| Agent performance | Outputs accepted with no, minor or major revision |
| Role clarity | Out-of-scope or duplicated agent actions |
| Handoffs | Handoffs requiring manual context reconstruction |
| Coordination | Contradictions, repeated work or lost decisions |
| Automation | Successful triggers, failures, retries and interventions |
| Slack | Useful, missed, duplicated and unnecessary notifications |
| Human control | Successful approvals, pauses, redirects and rework requests |
| Output quality | Clarity, usability, evidence quality and readiness |
| Efficiency | Approximate effort compared with an unassisted workflow |
| Recovery | Time and actions required to correct failed steps |
| Reuse | Outputs and lessons suitable for future work |
| Privacy | Information-boundary incidents or near misses |
| Strategic contribution | Improvement in framing, options and stakeholder preparation |

## Slack notification checkpoints

The beta should test notifications at these minimum points:

### Workflow started

Notify José that:

- the test has started;
- the subject has been recorded;
- the current agent is identified; and
- the next expected action is visible.

### Agent output ready

Notify José that:

- an output is ready;
- the producing agent is identified;
- the output purpose is clear;
- unresolved caveats are summarised; and
- a review action is requested.

### Approval required

Notify José that:

- a decision is required;
- the available choices are explicit;
- the consequences are summarised; and
- the workflow will not proceed without human approval.

### Workflow failure

Notify José that:

- a failure occurred;
- the failed step is identified;
- the impact is explained;
- any retry is visible; and
- the required human action is clear.

### Workflow completed

Notify José that:

- the workflow is complete;
- the final output or status is identified;
- important decisions are summarised;
- outstanding actions are visible; and
- evaluation feedback is requested.

## Beta evidence log

Record each test event using:

| Field | Record |
|---|---|
| Date and time | |
| Workflow stage | |
| Agent or automation | |
| Trigger | |
| Expected result | |
| Actual result | |
| Slack notification sent | Yes / No |
| Notification useful | Yes / Partly / No |
| Human action required | |
| Human intervention | |
| Output quality | Accepted / Minor revision / Major revision / Rejected |
| Error or friction | |
| Recovery action | |
| Time or effort | |
| Lesson | |
| Follow-up change | |

## Beta result categories

### Continue

The agentic team, automation and Slack workflow performed reliably enough for another controlled test.

### Continue with contained improvements

The system created clear value, but specific agents, handoffs, automations or notifications require correction.

### Redesign a workflow component

A material component was unreliable, although the wider agentic approach remains promising.

### Pause

The system created insufficient value or required disproportionate manual intervention.

### Stop

The test exposed fundamental problems that make continued use inappropriate without a substantially different approach.

## Exit criteria

The beta may be closed when:

- one complete strategic workflow has run;
- all planned agent handoffs have been tested;
- Slack checkpoints have been exercised;
- at least one human approval or redirect has occurred;
- at least one failure or exception path has been tested or simulated;
- outputs have been evaluated;
- privacy boundaries have been reviewed;
- lessons have been recorded;
- the overall result category has been assigned; and
- the next recommendation has been agreed.

## Immediate next action

Confirm the automation and Slack workflow to be tested, including:

- triggers;
- agent sequence;
- Slack checkpoints;
- approval actions;
- failure notifications;
- workflow-state storage; and
- beta logging.
