# Strategic OS Operationalisation Checklist

## Purpose

This checklist tracks the work required to make Strategic OS operational in real use.

Strategic OS v1 is already structurally complete enough to move from framework-building into active use.

This checklist therefore does not define new framework architecture.

Its purpose is to verify that Strategic OS can repeatedly:

1. receive real work;
2. identify what requires strategic attention;
3. use the appropriate agent, workflow or analytical pattern;
4. produce useful decision support;
5. support stakeholder alignment and action;
6. retain reusable knowledge safely;
7. surface strategic and career opportunities; and
8. improve future decisions through accumulated learning.

The goal is not repository completeness.

The goal is:

> Strategic OS reliably helps create more strategic opportunities by helping leaders make better strategic decisions.

---

## Relationship to the finalisation plan

`strategic_os_framework_finalisation_plan.md` remains the record of the framework build and finalisation process.

This checklist begins where that work ends.

Use:

- `strategic_os_framework_finalisation_plan.md` to understand what was built;
- this checklist to track whether the system is becoming operational;
- `04_frameworks/strategic_os_qa_model.md` to assess ongoing system quality;
- the relevant agent, template and domain files for execution.

Do not reopen completed framework work unless active use exposes a genuine defect or repeated gap.

---

# Operational status

Overall status:

- [x] Framework structurally complete
- [x] Core repository architecture established
- [x] Priority agent architecture established
- [x] Templates established
- [x] Analytics architecture established
- [x] Privacy and source-of-truth rules established
- [x] Five priority specialist runtimes validated end to end
- [ ] Core workflows validated through repeated real use
- [ ] Operating cadence established as a working habit
- [ ] Agent roles proven through repeated live work
- [ ] Reusable knowledge demonstrably reused
- [ ] Strategic opportunities actively tracked
- [ ] Chief of Staff operating model tested through sustained practice
- [ ] Strategic OS operational acceptance criteria met

Current phase:

> **Specialist runtime operationalisation complete; operational validation through real use in progress.**

Operating rule:

> Operate the validated specialist runtimes through real work before expanding orchestration.

Do not build multi-agent routing, automatic specialist sequencing or additional runtime complexity merely because the specialist paths now work.

---

# 1. Validate the core intake-to-output loop

Goal:

Prove that real work can move through Strategic OS from input to useful, reusable output.

## First live run

- [ ] Select one real active work item
- [ ] Capture or summarise the input safely
- [ ] Determine whether `00_inbox/` capture is useful
- [ ] Triage the item
- [ ] Identify the decision, opportunity or strategic question
- [ ] Select the relevant agent
- [ ] Select the relevant template
- [ ] Produce the first decision-support output
- [ ] Complete human review
- [ ] Store the durable output in the correct folder
- [ ] Update the relevant index where useful
- [ ] Identify reusable learning
- [ ] Identify stakeholder implications
- [ ] Identify strategic-opportunity implications
- [ ] Identify career-evidence implications where relevant
- [ ] Record any friction encountered

## Repeatability

Complete at least three materially different end-to-end real-work runs.

- [ ] Operational validation run 1 completed
- [ ] Operational validation run 2 completed
- [ ] Operational validation run 3 completed

Suggested validation contexts:

- strategic / service-design decision
- stakeholder or organisational opportunity
- analytics-supported decision

Definition of done:

- [ ] Strategic OS has supported at least three real decisions or strategic work items
- [ ] The intake-to-output workflow works without inventing a new process each time
- [ ] Outputs are easier to locate and reuse after completion
- [ ] Any framework change is based on repeated evidence rather than speculation

---

# 2. Validate Decision First behaviour

Goal:

Ensure Strategic OS consistently improves decisions rather than simply producing documentation.

For live work, check:

- [ ] The decision or strategic question is explicit
- [ ] Evidence is separated from interpretation
- [ ] Assumptions are visible
- [ ] Material caveats are visible
- [ ] Options or trade-offs are clear where relevant
- [ ] A recommendation is provided where appropriate
- [ ] The stakeholder or organisational implication is clear
- [ ] The next action or decision is clear
- [ ] Outputs avoid unnecessary documentation volume

Definition of done:

- [ ] At least three outputs have directly supported a real decision
- [ ] At least one decision became materially clearer through Strategic OS
- [ ] Strategic OS can show evidence of decision support rather than artefact production alone

---

# 3. Validate priority agents through live work

Goal:

Prove that each priority agent has a useful and differentiated role in the operating system.

## Runtime validation baseline

All five priority specialists have now passed end-to-end runtime validation using the common Make pattern:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener → approved state`

Validated specialists:

- [x] Sensemaking Agent
- [x] Stakeholder Journey Agent
- [x] Career Architect
- [x] Shipping Coach
- [x] Chief of Staff Agent

This establishes that each specialist can be invoked, reviewed and approved through the operational runtime.

It does not by itself establish that every specialist has been proven through repeated real-world use.

## Sensemaking Agent

Behavioural and runtime validation:

- [x] Used on real complex or ambiguous problems
- [x] Helped frame the underlying problem
- [x] Separated evidence, assumptions and interpretation
- [x] Produced useful recommendations or decision frames
- [x] Output reviewed for usefulness
- [x] Human approval path validated

Status:

> **Validated**

Monitoring note:

Continue to observe whether the agent occasionally defaults to producing another artefact when stakeholder or project action would be more useful.

Do not change the contract unless this behaviour recurs.

## Stakeholder Journey Agent

Behavioural and runtime validation:

- [x] Used on real stakeholder challenges
- [x] Distinguished decision-makers, contributors and implementation participants
- [x] Preserved unknown stakeholder positions as unknown
- [x] Avoided inventing motives or support
- [x] Improved engagement sequencing
- [x] Surfaced useful stakeholder actions
- [x] Output reviewed for usefulness
- [x] Human approval path validated

Status:

> **Validated**

Monitoring note:

Continue to observe whether the agent:

- includes organisational context as if it were a stakeholder;
- assigns decision rights without evidence;
- overstates likely support or resistance;
- recommends broad consultation where targeted engagement would be sufficient.

Do not change the agent specification unless one of these behaviours recurs.

## Career Architect

Behavioural and runtime validation:

- [x] Strategic value separated from career value
- [x] Potential, emerging and achieved evidence separated
- [x] Uncertainty preserved
- [x] Sponsorship or impact not invented
- [x] Real stakeholder validation preferred before unnecessary artefact creation
- [x] One clear next action produced
- [x] Human review required and completed
- [x] Approval path validated

Status:

> **Validated**

Reusable operational learning:

> When an opportunity is sufficiently framed, test mandate, adoption or impact before creating more documentation.

Repeated real-world use remains the next evidence threshold.

## Shipping Coach

Behavioural and runtime validation:

- [x] Blockers distinguished from optional refinement
- [x] Risk of moving compared with risk of waiting
- [x] Ship / Socialise / Refine / Stop logic applied
- [x] Refinement kept bounded
- [x] Smallest useful action identified
- [x] Clear done condition defined
- [x] Overbuilding resisted
- [x] Human review required and completed
- [x] Approval path validated

Status:

> **Validated**

Repeated real-world use remains the next evidence threshold.

## Chief of Staff Agent

Behavioural and runtime validation:

- [x] Operating view produced
- [x] Selective prioritisation applied
- [x] Decisions separated from tasks
- [x] Dependencies surfaced
- [x] Focus protection supported
- [x] Goal alignment handled cautiously
- [x] Specialist routing used selectively
- [x] Unnecessary multi-agent invocation avoided
- [x] Human decision points explicit
- [x] One bounded next action produced
- [x] Human review required and completed
- [x] Approval path validated

Status:

> **Validated**

The runtime is validated.

Sustained Chief of Staff operating practices such as daily briefing, follow-up tracking and cadence support remain to be tested through repeated use before the operating model is considered proven.

## Priority-agent validation result

Behavioural validation phase:

> **Complete**

Specialist runtime implementation phase:

> **Complete**

Next evidence threshold:

> **Repeated use in real work.**

Definition of done for full operational proof:

- [ ] Each priority agent has been used sufficiently in real work to judge sustained usefulness
- [x] Each agent has a clearly differentiated role
- [x] No agent is retained solely because it exists in the architecture
- [ ] Repeated overlap or confusion has been assessed through ongoing use
- [ ] Any changes are based on observed recurring friction rather than hypothetical needs

---

# 4. Establish the operating cadence

Goal:

Make Strategic OS part of normal work rather than an occasional repository exercise.

## Daily

Test only where useful:

- [ ] Priority check
- [ ] Decision-required check
- [ ] Follow-up check
- [ ] Focus-protection check
- [ ] Daily briefing where it adds value

## Weekly

- [ ] Inbox reviewed
- [ ] Active strategic work reviewed
- [ ] Shipping risks reviewed
- [ ] Stakeholder alignment reviewed
- [ ] Decisions requiring attention surfaced
- [ ] Useful outputs stored or indexed

## Monthly

- [ ] Strategic opportunities reviewed
- [ ] Career evidence reviewed
- [ ] Lessons learned reviewed
- [ ] Analytics domains reviewed where active
- [ ] Reusable patterns identified
- [ ] Unused or low-value operating practices challenged

## Quarterly

- [ ] Strategic OS QA assessment completed
- [ ] Agent usefulness reviewed
- [ ] Repository hygiene reviewed
- [ ] North Star alignment reviewed
- [ ] Operational friction reviewed
- [ ] Unnecessary complexity removed

Definition of done:

- [ ] A lightweight cadence operates without creating significant management overhead
- [ ] Reviews lead to decisions or action rather than maintenance for its own sake
- [ ] Cadence can be sustained during normal workload

---

# 5. Validate analytics-to-decision support

Goal:

Prove that analytical work can move safely from governed sources to strategic interpretation.

## Service Account pilot

- [ ] Business question clearly stated
- [ ] Metric definition confirmed
- [ ] Numerator confirmed
- [ ] Denominator confirmed
- [ ] Source confirmed
- [ ] Grain confirmed
- [ ] Filters confirmed
- [ ] Period confirmed
- [ ] Caveats recorded
- [ ] Result interpreted
- [ ] Decision implication identified
- [ ] Slide-safe wording produced where required
- [ ] Human review completed

## Analytical safety

- [ ] Governed metrics remain distinct from exploratory diagnostics
- [ ] Incompatible denominators are not combined without caveat
- [ ] Source conflicts are recorded
- [ ] Unsafe metrics are explicitly labelled unsafe
- [ ] Raw organisational data is not stored in Strategic OS
- [ ] Raw Genie transcripts are not retained
- [ ] Reusable metric definitions and interpretation rules are retained where useful

## Repeatability

- [ ] One Service Account analytics-to-decision run completed
- [ ] Second analytics-to-decision run completed
- [ ] Analytics pattern works without relying on chat memory

Definition of done:

- [ ] Analytics evidence can reliably support a decision without compromising source governance
- [ ] At least one misleading or unsafe analytical interpretation has been prevented or corrected
- [ ] Reusable analytical knowledge survives beyond the immediate analysis

---

# 6. Activate the strategic opportunity pipeline

Goal:

Ensure Strategic OS actively helps create strategic opportunities.

- [ ] Capture first live strategic opportunity
- [ ] Assess alignment with North Star
- [ ] Assess organisational value
- [ ] Assess stakeholder relevance
- [ ] Assess evidence and confidence
- [ ] Assess career / reputation value
- [ ] Decide pursue / monitor / pause / reject
- [ ] Record next action
- [ ] Update opportunity index
- [ ] Review opportunity at the appropriate cadence

Repeat:

- [ ] Second opportunity assessed
- [ ] Third opportunity assessed

Definition of done:

- [ ] Strategic opportunities are actively identified rather than only retrospectively recognised
- [ ] Opportunity decisions are explicit
- [ ] At least one opportunity progresses because Strategic OS surfaced or strengthened it

---

# 7. Activate career evidence capture

Goal:

Make useful strategic work accumulate into portable career capability and evidence.

- [ ] Capture first achievement
- [ ] Capture useful stakeholder or leadership feedback
- [ ] Capture evidence of decision influence
- [ ] Capture evidence of strategic capability
- [ ] Capture evidence of service / systems thinking
- [ ] Capture evidence of analytics interpretation where relevant
- [ ] Connect evidence to desired reputation
- [ ] Review promotion / role-readiness implications where useful

Definition of done:

- [ ] Career evidence accumulates naturally from real work
- [ ] Evidence is reusable outside the immediate project
- [ ] Strategic OS can help explain how current work is strengthening future opportunity

---

# 8. Validate reusable knowledge creation

Goal:

Prove that Strategic OS prevents useful learning from disappearing after individual projects.

For completed work:

- [ ] Identify reusable lesson
- [ ] Identify reusable framework or design pattern
- [ ] Identify reusable stakeholder pattern
- [ ] Identify reusable decision logic
- [ ] Identify reusable analytics rule or caveat
- [ ] Store only the durable reusable knowledge
- [ ] Avoid copying raw organisational source material
- [ ] Index where retrieval value justifies it

## Reuse test

- [ ] Retrieve an earlier lesson during new work
- [ ] Reuse an earlier framework or pattern
- [ ] Reuse an earlier stakeholder insight
- [ ] Reuse an earlier metric definition or caveat
- [ ] Demonstrate that reuse improved speed, quality or clarity

Definition of done:

- [ ] At least one Strategic OS knowledge item has been reused in later work
- [ ] Reuse reduces repeated sensemaking or prevents repeated mistakes
- [ ] Repository knowledge is becoming more valuable through use

---

# 9. Validate cross-tool boundaries

Goal:

Ensure Strategic OS supports organisational work without becoming another system of record.

Check real workflows against these rules:

- [ ] Organisational source data remains in organisational systems
- [ ] Jira remains a delivery-tracking system
- [ ] Confluence / SharePoint / OneDrive remain organisational documentation systems where applicable
- [ ] Databricks / Genie remain governed analytical sources
- [ ] Power BI remains a reporting source where applicable
- [ ] Email / Teams / calendar remain operational communication systems
- [ ] Miro remains a visual collaboration environment where applicable
- [ ] Make remains an orchestration environment
- [ ] Relevance AI remains the specialist reasoning runtime
- [ ] Slack remains a human-review surface where used
- [ ] Strategic OS stores reusable interpretation, decision logic and lessons
- [ ] Links or source references are preferred to duplicated source material
- [ ] Sensitive operational material is not copied into Strategic OS

Definition of done:

- [ ] No recurring confusion exists about which system owns which information
- [ ] Strategic OS adds strategic value without duplicating organisational systems of record

---

# 10. Validate Chief of Staff operational support

Goal:

Determine the minimum useful level of day-to-day coordination.

The Chief of Staff specialist runtime is validated.

This section tests whether its operating model becomes useful as a sustained working practice.

## Manual / assisted operation

- [ ] Daily briefing format proven useful through repeated use
- [ ] Weekly operating review format proven useful
- [ ] Decision-required items surfaced reliably
- [ ] Follow-ups surfaced reliably
- [ ] Strategic priorities connected to current work
- [ ] Operational noise distinguished from strategic attention
- [ ] Human approval boundaries remain clear

## Integration assessment

Do not automate additional coordination merely because the Chief of Staff runtime now works.

Assess only after repeated use:

- [ ] Identify recurring manual friction
- [ ] Identify potential automation candidate
- [ ] Confirm privacy and governance constraints
- [ ] Confirm source-of-truth ownership
- [ ] Confirm human approval boundary
- [ ] Determine whether automation materially reduces operating overhead
- [ ] Reject automation where the value does not justify complexity

Definition of done:

- [ ] Chief of Staff support works usefully through sustained real use
- [ ] Any additional automation is driven by demonstrated recurring need
- [ ] Operational coordination remains human-governed

---

# 11. Track operational friction

Goal:

Use real friction to improve Strategic OS without returning to speculative framework building.

For each repeated issue, record:

- problem;
- where it occurred;
- impact;
- frequency;
- workaround;
- whether an existing rule already solves it;
- whether a repository change is justified.

Operational improvement rule:

> Do not create a new framework file for a one-off inconvenience.

Create or change architecture only when:

- [ ] the problem has occurred repeatedly;
- [ ] the problem affects decision quality, reuse, safety or operating efficiency;
- [ ] an existing file cannot reasonably absorb the solution; and
- [ ] the smallest maintainable change has been identified.

Definition of done:

- [ ] Strategic OS improves through evidence from use
- [ ] Framework growth remains controlled

---

# 12. Measure whether Strategic OS is creating value

Goal:

Assess outcomes rather than repository activity.

Look for evidence that Strategic OS has:

- [ ] made a decision clearer
- [ ] improved a recommendation
- [ ] identified a missing caveat
- [ ] prevented a misleading analytical conclusion
- [ ] improved stakeholder alignment
- [ ] surfaced an important stakeholder earlier
- [ ] helped work ship sooner
- [ ] reduced unnecessary refinement
- [ ] surfaced a strategic opportunity
- [ ] strengthened career evidence
- [ ] preserved a reusable lesson
- [ ] reused earlier knowledge
- [ ] reduced repeated sensemaking
- [ ] connected customer and organisational outcomes more clearly
- [ ] helped a leader make a better strategic decision

Primary evidence of success:

> Strategic OS changes the quality, clarity or effectiveness of decisions and strategic action.

Not:

> Strategic OS contains more files.

---

# Operational acceptance criteria

Strategic OS can be considered operational when all of the following are true.

Validated specialist runtimes are an enabling milestone, not operational acceptance on their own.

## Core operation

- [ ] At least three real work items have completed the intake-to-output loop
- [ ] At least three real decisions have been supported
- [ ] Priority agents have been tested sufficiently through real work
- [ ] The operating cadence has been used for a sustained period
- [ ] Durable outputs are stored consistently

## Evidence and knowledge

- [ ] At least one lesson or pattern has been reused
- [ ] At least one strategic opportunity has progressed
- [ ] Career evidence is accumulating from real work
- [ ] Analytics-to-decision support has been tested safely
- [ ] Source and caveat discipline is working

## Operating quality

- [ ] Strategic OS does not duplicate organisational systems of record
- [ ] Privacy rules hold under real use
- [ ] The system does not require excessive manual maintenance
- [ ] Agent boundaries remain understandable
- [ ] The system can be resumed without relying on extensive chat context
- [ ] Repeated friction is captured and addressed through small improvements

## North Star proof

- [ ] There is concrete evidence that Strategic OS has helped improve strategic decision-making
- [ ] There is concrete evidence that Strategic OS has increased or strengthened a strategic opportunity

Operational status:

- [ ] Operational acceptance criteria met

---

# Specialist validation runs

Use this section as a lightweight record of completed specialist validation.

These runs establish behavioural and runtime readiness.

They do not substitute for repeated operational use.

| Run | Work item / validation focus | Primary capability tested | Status | Key learning |
|---|---|---|---|---|
| 01 | Customer Accounts and Information Services Lead proposal + Channel Strategy Y2 prioritisation | Sensemaking Agent | Validated | Agent consistently improves decision clarity; monitor artefact-first next actions but no prompt change is justified |
| 02 | Customer Accounts and Information Services Lead stakeholder alignment + Channel Strategy Y2 stakeholder sequencing | Stakeholder Journey Agent | Validated | Agent differentiates decision-makers, co-designers, consultees and implementation participants and improves engagement sequencing |
| 03 | Strategic / career opportunity assessment | Career Architect | Validated | Test mandate, adoption or impact before creating more documentation when an opportunity is already sufficiently framed |
| 04 | Active-work shipping and refinement decision | Shipping Coach | Validated | Bound refinement, distinguish blockers from optional work and identify the smallest useful action |
| 05 | Operating-view and prioritisation test | Chief of Staff Agent | Validated | Protect focus, separate decisions from tasks and route selectively rather than invoking specialists unnecessarily |

Allowed status values:

- Not started
- Prepared for testing
- In progress
- Validated
- Needs adjustment
- Paused

---

## Run 01 — Sensemaking Agent validation

### Validation question

Can Strategic OS use the live Sensemaking Agent on real strategic work to produce clearer decision support than the original source material alone?

### Test 01 — Customer Accounts and Information Services Lead

Result:

> Pass with observation

Key evidence:

- [x] Real decision clarified
- [x] Capability decision separated from role mechanism
- [x] Evidence separated from interpretation
- [x] Assumptions surfaced
- [x] Uncertainty preserved
- [x] Options and trade-offs identified
- [x] Recommendation proportionate
- [x] Human review completed
- [x] Output approved through live workflow

Observation:

The agent recommended creating another decision brief when a stakeholder conversation was the more useful next action.

### Test 02 — Channel Strategy Y2 prioritisation

Result:

> Clean pass

Key evidence:

- [x] Real prioritisation decision clarified
- [x] Four discovery streams synthesised into a common strategic pattern
- [x] Evidence and assumptions separated
- [x] Unsupported scope expansion resisted
- [x] Meaningful options and trade-offs identified
- [x] Focused MVP path recommended
- [x] Real project action identified as the next step
- [x] Human review completed
- [x] Output approved through live workflow

### Sensemaking Agent result

Status:

> **Validated**

Rationale:

> Across two materially different real strategic problems, the live Sensemaking Agent consistently improved decision clarity, preserved evidence and uncertainty discipline, and produced useful strategic recommendations.

Monitoring note:

> Continue to observe whether the agent occasionally defaults to producing an artefact when stakeholder or project action would be more useful.

Do not change the prompt unless this behaviour recurs.

---

## Run 02 — Stakeholder Journey Agent validation

### Validation question

Can the Stakeholder Journey Agent improve stakeholder decision clarity and engagement sequencing on real strategic work without inventing stakeholder positions, inferring motives or defaulting to broad consultation?

### Test 01 — Customer Accounts and Information Services Lead

Work item:

> Stakeholder alignment required before formalising an emerging CX capability and proposed role mechanism.

Result:

> Pass with observation

The agent correctly:

- [x] separated influence, interest, impact and decision rights;
- [x] distinguished evidence from assumptions;
- [x] preserved unknown stakeholder positions as unknown;
- [x] treated possible resistance as a signal to test rather than a motive;
- [x] identified sponsor, advisory, affected and implementation stakeholder groups;
- [x] sequenced sponsor alignment before broader engagement;
- [x] recommended a specific first conversation;
- [x] preserved the human-review boundary.

Key engagement sequence:

1. Customer Focus and Strategy leadership;
2. CX branch leadership;
3. workforce / classification advisers;
4. adjacent capability owners;
5. service owners and implementation stakeholders;
6. return to decision-makers with a tested recommendation.

Observation:

The output listed the existing Project Officer role context as a stakeholder.

That is better treated as organisational context or evidence rather than a stakeholder.

This did not materially reduce the usefulness of the assessment.

### Test 02 — Channel Strategy Y2

Work item:

> Align four discovery streams into a minimum viable Connected Interactions Framework without creating four disconnected outputs or over-consulting the organisation.

Result:

> Clean pass

The agent correctly:

- [x] differentiated decision-makers from contributors;
- [x] differentiated co-design from targeted consultation;
- [x] identified later implementation participants separately;
- [x] separated formal decision rights from implementation influence;
- [x] resisted broad early consultation;
- [x] identified convergence across the four discovery streams as the key stakeholder challenge;
- [x] differentiated common-framework shaping from component-specific shaping;
- [x] sequenced sponsor alignment before synthesis work;
- [x] recommended targeted assurance consultation rather than full-programme consultation;
- [x] introduced priority journey validation at the appropriate point;
- [x] ended with a specific sponsor alignment conversation.

Key participation model:

> Sponsors → core co-design group → targeted assurance partners → priority journey validators → broader implementation participants

### Comparative assessment

| Criterion | Test 01 | Test 02 | Overall |
|---|---|---|---|
| Real engagement need clarified | Pass | Pass | Pass |
| Influence separated from interest and impact | Pass | Pass | Pass |
| Decision rights treated carefully | Pass | Pass | Pass |
| Evidence separated from assumptions | Pass | Pass | Pass |
| Unknown positions preserved | Pass | Pass | Pass |
| Motives not inferred | Pass | Pass | Pass |
| Resistance treated as information | Pass | Pass | Pass |
| Stakeholders differentiated by role | Pass | Pass | Pass |
| Broad consultation resisted | Pass | Pass | Pass |
| Engagement sequence realistic | Pass | Pass | Pass |
| Specific next conversation identified | Pass | Pass | Pass |
| Human review preserved | Pass | Pass | Pass |
| Stakeholder list limited to actual actors/groups | Needs observation | Pass | Pass with monitoring |

### Stakeholder Journey Agent result

Status:

> **Validated**

Rationale:

> Across two materially different stakeholder problems, the agent consistently improved engagement sequencing, differentiated participation levels, preserved uncertainty and avoided unsupported assumptions about stakeholder positions or motives.

### Reusable operational learning

> Validate strategic intent with sponsors first, use a small group to shape core logic, then involve targeted consultees and implementation stakeholders according to what they genuinely need to influence.

A second reusable principle emerged:

> Converge core logic with a small design group before broad organisational consultation.

### Monitoring note

Continue to observe whether the agent:

- includes organisational context or roles as if they were stakeholders;
- assigns decision rights without evidence;
- overstates likely support or resistance;
- recommends broad consultation where targeted engagement would be sufficient.

Do not change the agent specification unless one of these behaviours recurs.

### Run 02 completion condition

- [x] Stakeholder Journey Agent implemented in Relevance AI
- [x] Real stakeholder problem used
- [x] Two materially different tests completed
- [x] Outputs human-reviewed
- [x] Influence, interest, impact and decision rights assessed
- [x] Unknown stakeholder positions preserved
- [x] Engagement sequencing assessed
- [x] Agent usefulness judged
- [x] Operational learning captured
- [x] Final result recorded

### Current status

Status:

> **Validated**

---

## Run 03 — Career Architect validation

### Validation focus

Test whether the Career Architect can assess a strategic or career opportunity without overstating evidence, inventing sponsorship or encouraging unnecessary artefact production.

Result:

> **Validated**

Behaviour confirmed:

- [x] strategic value separated from career value;
- [x] potential, emerging and achieved evidence separated;
- [x] uncertainty preserved;
- [x] sponsorship and impact not invented;
- [x] real stakeholder validation preferred where appropriate;
- [x] one clear next action produced;
- [x] human review preserved;
- [x] approved-state persistence validated.

Reusable operational learning:

> When an opportunity is sufficiently framed, test mandate, adoption or impact before creating more documentation.

Next evidence threshold:

> Observe the specialist through repeated real career and strategic-opportunity work rather than adding more runtime capability.

---

## Run 04 — Shipping Coach validation

### Validation focus

Test whether the Shipping Coach can distinguish genuine blockers from optional refinement and help active work progress without lowering necessary quality.

Result:

> **Validated**

Behaviour confirmed:

- [x] blockers distinguished from optional refinement;
- [x] risk of moving compared with risk of waiting;
- [x] Ship / Socialise / Refine / Stop logic used;
- [x] refinement bounded;
- [x] smallest useful action identified;
- [x] clear done condition defined;
- [x] overbuilding resisted;
- [x] human review preserved;
- [x] approved-state persistence validated.

Next evidence threshold:

> Use the specialist on real work at risk of delay or over-refinement and observe whether the guidance improves actual shipping behaviour.

---

## Run 05 — Chief of Staff Agent validation

### Validation focus

Test whether the Chief of Staff Agent can create a useful operating view, protect focus and identify bounded next actions without turning coordination into unnecessary multi-agent orchestration.

Result:

> **Validated**

Behaviour confirmed:

- [x] operating view produced;
- [x] selective prioritisation applied;
- [x] decisions separated from tasks;
- [x] dependencies surfaced;
- [x] focus protected;
- [x] goal alignment handled cautiously;
- [x] specialist routing used selectively;
- [x] unnecessary multi-agent invocation avoided;
- [x] human decision points explicit;
- [x] one bounded next action produced;
- [x] human review preserved;
- [x] approved-state persistence validated.

Next evidence threshold:

> Test the operating model through sustained real use before automating additional briefing, follow-up or coordination behaviour.

---

## Current agent validation status

| Agent | Behavioural validation | Runtime validation | Repeated real-use proof |
|---|---|---|---|
| Sensemaking Agent | Validated | Validated | In progress |
| Stakeholder Journey Agent | Validated | Validated | In progress |
| Career Architect | Validated | Validated | In progress |
| Shipping Coach | Validated | Validated | In progress |
| Chief of Staff Agent | Validated | Validated | In progress |

Behavioural validation phase:

> **Complete**

Specialist runtime implementation phase:

> **Complete**

Current operating priority:

> **Use, observation and evidence.**

Do not expand Strategic OS because another orchestration capability might be useful.

Use the validated specialists on real work, observe what helps, record what fails, and make the smallest useful improvement.

Do not build multi-agent routing or automatic specialist sequencing without repeated evidence of a genuine need.

> Operational Strategic OS = useful decisions + stakeholder alignment + reusable knowledge + strategic opportunity, with low management overhead.
# Future capability roadmap — Slack-first agentic team

## Purpose

Define the intended evolution of Strategic OS from manually selected specialist workflows toward a coordinated agentic team that can increasingly interpret natural-language intent and determine the appropriate support path.

This is a future capability roadmap.

It does not override the current operating rule:

> Operate validated specialist runtimes through real work before expanding orchestration.

Do not implement later-stage capabilities merely because they are technically possible.

Progress only when repeated real use shows that the next stage will reduce friction or improve decision quality.

## Bluesky outcome

The long-term interaction should be simple:

> José posts a natural-language thought, problem, opportunity or request in Slack, and the Strategic OS agentic team is sufficiently context-aware to determine what needs to happen next.

The intended experience is:

`José → Slack → Strategic OS agentic team → appropriate reasoning / coordination → Slack → José`

José should not need to:

- know which agent owns the problem;
- understand Make scenarios;
- open Relevance AI;
- construct structured payloads;
- manually coordinate several specialists;
- understand agent sequencing;
- move outputs between specialist tools.

The system should progressively handle that complexity while keeping important human decisions explicit.

## Capability evolution

### Stage 1 — Single Slack control surface

Status:

`Next implementation priority`

Goal:

Allow José to initiate any validated specialist runtime from Slack without opening Make or Relevance AI.

Operating pattern:

`José → Slack → explicit specialist selection → Make → selected Relevance AI specialist → Slack → José`

Capabilities:

- [ ] one accessible Slack control surface;
- [ ] intentional selection of Sensemaking Agent;
- [ ] intentional selection of Stakeholder Journey Agent;
- [ ] intentional selection of Career Architect;
- [ ] intentional selection of Shipping Coach;
- [ ] intentional selection of Chief of Staff Agent;
- [ ] natural-language context accepted from Slack;
- [ ] backend webhook schemas hidden from José;
- [ ] specialist output returned to Slack;
- [ ] human review remains in Slack.

Constraint:

Do not introduce automatic specialist selection to complete this stage.

Definition of done:

> José can operate all five validated specialists from Slack without touching Make or Relevance AI during normal use.

---

### Stage 2 — Assisted specialist routing

Status:

`Future — activate only after Stage 1 real-use evidence`

Goal:

Reduce the need for José to know which specialist is appropriate while preserving human control.

Operating pattern:

`José → Slack → Strategic OS suggests specialist → José confirms → specialist runtime`

Example:

José posts:

> I think this role should become a Class 6 lead role, but I am not sure whether the case is strong enough.

Strategic OS responds:

> Recommended specialist: Sensemaking Agent  
> Reason: this is primarily an ambiguous strategic decision requiring evidence, assumptions and decision framing.

José confirms or selects another specialist.

Capabilities:

- [ ] infer likely specialist from natural-language intent;
- [ ] explain the routing recommendation briefly;
- [ ] allow José to confirm or override;
- [ ] preserve explicit human specialist choice;
- [ ] record routing errors or recurring ambiguity;
- [ ] use observed routing mistakes to improve the routing model.

Evidence threshold before activation:

- repeated manual specialist selection creates noticeable friction;
- specialist roles are sufficiently differentiated through real use;
- routing recommendations can be evaluated safely;
- incorrect routing can be corrected without material consequence.

Definition of done:

> Strategic OS can usually recommend the right specialist, while José retains the routing decision.

---

### Stage 3 — Automatic specialist routing

Status:

`Future — evidence gated`

Goal:

Allow well-understood, low-risk requests to route directly to the appropriate specialist.

Operating pattern:

`José → Slack → intent classification → specialist runtime → Slack`

Human confirmation remains available where confidence is low or the request is consequential.

Capabilities:

- [ ] confidence-aware specialist selection;
- [ ] automatic routing for clear specialist matches;
- [ ] ask for clarification when intent is ambiguous;
- [ ] human override;
- [ ] routing trace visible when useful;
- [ ] low-confidence requests do not silently route;
- [ ] privacy and state rules preserved.

Activation criteria:

- assisted routing has demonstrated high practical accuracy;
- manual confirmation is becoming repetitive rather than valuable;
- failure modes are understood;
- human override is reliable;
- automation reduces management overhead without reducing decision quality.

Definition of done:

> Routine requests can reach the right specialist without requiring José to select the agent manually.

---

### Stage 4 — Controlled multi-agent coordination

Status:

`Future — evidence gated`

Goal:

Allow Strategic OS to use more than one specialist when a real work item genuinely requires different forms of reasoning.

Example:

A strategic proposal may require:

`Sensemaking → Stakeholder Journey → Shipping Coach`

but only when each contribution materially improves the outcome.

Capabilities:

- [ ] determine whether one specialist is sufficient;
- [ ] invoke additional specialists only when necessary;
- [ ] define sequencing rules;
- [ ] prevent duplicated analysis;
- [ ] preserve shared workflow context;
- [ ] define stop conditions;
- [ ] reconcile specialist outputs;
- [ ] expose consequential disagreements;
- [ ] preserve human checkpoints;
- [ ] avoid orchestration for its own sake.

Operating rule:

> Prefer one capable specialist over an unnecessary agent chain.

Activation criteria:

- repeated real work shows that José is manually passing the same item between specialists;
- handoffs create recurring friction;
- multi-specialist value is observable;
- agent responsibilities remain differentiated;
- sequencing can be defined without excessive complexity.

Definition of done:

> Strategic OS can coordinate a small number of specialists when doing so materially improves the decision or action.

---

### Stage 5 — Agentic team coordination

Status:

`Bluesky`

Goal:

Strategic OS interprets a natural-language post, determines the required work, coordinates the appropriate specialists and returns a coherent decision-support outcome.

Operating pattern:

`José posts intent`
`→ Strategic OS interprets need`
`→ determines whether action, clarification or specialist reasoning is required`
`→ invokes the minimum useful specialist set`
`→ coordinates outputs`
`→ presents one coherent response`
`→ José decides`

The agentic team should be capable of deciding:

- whether the request requires strategic attention at all;
- whether one specialist is sufficient;
- which specialist or specialists are relevant;
- whether clarification is required;
- whether evidence is missing;
- whether stakeholder thinking is needed;
- whether work is ready to ship;
- whether an opportunity should be surfaced;
- whether durable reusable learning should be retained.

The team should not:

- create work merely because an agent is available;
- invoke every specialist by default;
- hide material uncertainty;
- make consequential human decisions automatically;
- persist sensitive organisational material;
- become a parallel organisational system of record.

Definition of done:

> José can post a natural-language thought into Slack and Strategic OS reliably determines the smallest useful combination of reasoning, coordination and human decision support needed to move it forward.

---

## Human-control principle across all stages

Increasing autonomy must not remove meaningful human control.

As capability matures:

- low-value mechanical choices may become automated;
- ambiguous interpretation should remain visible;
- consequential actions should retain appropriate human checkpoints;
- agent disagreement should be surfaced rather than silently resolved;
- confidence should determine whether the system acts, recommends or asks.

The target is not maximum automation.

The target is:

> Minimum management overhead with better strategic decisions.

---

## Evidence rule

Do not progress between stages because the next stage is attractive.

Progress when repeated use demonstrates:

1. a recurring human-friction problem;
2. a clear capability that would reduce that friction;
3. acceptable failure modes;
4. preserved human control;
5. measurable improvement in decision clarity, speed, alignment or reuse.

Treat future orchestration as an earned capability, not a default architecture requirement.
