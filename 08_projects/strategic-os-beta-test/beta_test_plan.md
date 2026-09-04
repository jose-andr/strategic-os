# Strategic OS Beta Test Plan

## Status

**Specialist runtime implementation:** Complete

**Current phase:** Operational validation through real use

## Purpose

Evaluate whether the validated Strategic OS specialist runtimes improve real strategic work reliably enough to justify continued use and any future runtime expansion.

The beta is no longer testing whether the specialist runtime can technically execute.

That has been proven across:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

The next evidence threshold is:

> Use, observation and evidence.

The beta should now test whether the specialist runtimes:

- improve decision clarity;
- support appropriate stakeholder action;
- reduce unnecessary refinement;
- improve prioritisation;
- surface useful strategic or career opportunities;
- preserve evidence and uncertainty;
- maintain clear human control;
- remain privacy-safe;
- create reusable learning;
- operate with low management overhead.

Do not expand orchestration merely because the specialist paths now work.

---

# Primary beta question

> Do the validated Strategic OS specialist runtimes materially improve real strategic decisions and actions while remaining lightweight, human-governed and privacy-safe?

## Secondary beta questions

> Is manual specialist selection sufficient for current use?

> Does the common intake structure provide enough context without creating unnecessary preparation overhead?

> Does Slack human review remain proportionate to the value created?

> Does repeated real work expose a genuine need for runtime hardening or orchestration expansion?

---

# Current operating principle

> Operate the validated specialist runtimes through real work before expanding orchestration.

The beta should not attempt to prove that more automation is required.

No change is a valid beta result.

---

# Beta boundary

The beta should use real strategic work where appropriate.

It should not:

- create multi-agent routing;
- automatically sequence specialists;
- automatically invoke a second specialist;
- build workflow complexity merely for testing;
- automate GitHub writes;
- replace organisational systems of record;
- retain raw organisational data;
- retain customer records;
- retain credentials or tokens;
- retain identifiable case material;
- treat stakeholder endorsement as the sole measure of success;
- treat repository activity as the primary evidence of value.

Strategic OS should retain only safe, reusable interpretation and design logic.

---

# Validated technical baseline

Each specialist has already passed the common end-to-end runtime:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener → approved state`

Validated common controls include:

- specialist-specific webhook intake;
- common intake structure;
- `privacy_confirmed = true` gate;
- shared `strategic_os_beta_workflows` Data Store;
- specialist reasoning in Relevance AI;
- Make used for orchestration only;
- output persistence to `latest_output`;
- transition from `processing` to `human-review-required`;
- Slack review;
- strict `P <workflow_id>` parsing;
- workflow lookup;
- approved-state persistence;
- Slack approval confirmation.

The beta should not repeatedly retest this full technical baseline unless:

- a runtime component changes;
- a regression is suspected;
- operational use exposes a failure.

---

# Agents in scope

All five priority specialists are operational.

They should be selected according to the real decision-support need.

## Sensemaking Agent

Use when the primary need is to:

- clarify an ambiguous decision;
- separate evidence from assumptions;
- identify the underlying strategic question;
- frame options and trade-offs;
- surface caveats;
- produce a recommendation or decision frame.

## Stakeholder Journey Agent

Use when the primary need is to:

- identify relevant stakeholders;
- assess influence, interest and impact;
- clarify decision rights cautiously;
- preserve unknown stakeholder positions;
- sequence engagement;
- identify the next stakeholder action.

## Career Architect

Use when the primary need is to:

- assess strategic value;
- assess career value;
- distinguish potential, emerging and achieved evidence;
- test whether impact or sponsorship is real;
- identify the next useful validation action.

Reusable operating principle:

> When an opportunity is sufficiently framed, test mandate, adoption or impact before creating more documentation.

## Shipping Coach

Use when the primary need is to:

- distinguish blockers from optional refinement;
- assess the risk of moving versus waiting;
- decide Ship / Socialise / Refine / Stop;
- bound remaining refinement;
- identify the smallest useful action;
- define a clear done condition.

## Chief of Staff Agent

Use when the primary need is to:

- create an operating view;
- prioritise selectively;
- separate decisions from tasks;
- surface dependencies;
- protect focus;
- identify one bounded next action;
- determine whether specialist support may be useful.

The Chief of Staff Agent may recommend another specialist.

The runtime does not automatically invoke that specialist.

---

# Specialist selection model

Specialist selection remains human-led.

| Need | Specialist |
|---|---|
| Clarify an ambiguous strategic decision | Sensemaking Agent |
| Improve stakeholder sequencing or alignment | Stakeholder Journey Agent |
| Assess strategic and career opportunity value | Career Architect |
| Determine whether work should move or refine | Shipping Coach |
| Establish priorities and next actions | Chief of Staff Agent |

This is guidance.

It is not an automated routing specification.

---

# Real-work test model

The beta should use a series of contained real-work tests rather than one orchestrated multi-agent workflow.

Each test should:

1. identify a real decision-support need;
2. select the most appropriate specialist;
3. prepare a privacy-safe intake;
4. run the specialist through the validated runtime;
5. complete human review;
6. assess the usefulness of the result;
7. capture only durable learning;
8. decide whether any change is justified.

A second specialist may be used only when the real work independently requires it.

Do not invoke another specialist merely to test handoffs.

---

# Test subject selection

Choose work that is:

- real;
- strategically relevant;
- bounded;
- safe to summarise;
- capable of producing an observable decision or action;
- sufficiently different from previous tests to expose new learning.

Good test subjects may include:

- a strategic proposition;
- a service-design decision;
- stakeholder alignment;
- an analytics-supported decision;
- an active work item at risk of over-refinement;
- a strategic or career opportunity;
- weekly operating prioritisation.

Avoid:

- artificial tasks created only to exercise the agents;
- work requiring unsafe source data;
- problems with no meaningful decision or action;
- large programmes that make attribution impossible.

---

# Human-in-the-loop boundary

José retains final decision authority.

Human review is required before:

- specialist output is treated as accepted;
- stakeholder-facing content is used;
- strategic recommendations become commitments;
- organisational action is taken;
- durable reusable knowledge is stored;
- another specialist is deliberately invoked where consequential;
- runtime changes are adopted.

The current supported runtime approval command is:

`P <workflow_id>`

Strict parser:

    ^P\s+(?<workflow_id>[a-fA-F0-9]{32})$

The beta does not currently depend on:

- `L` rework;
- `M` stop;
- pause;
- resume;
- automatic correction;
- automatic specialist sequencing.

---

# Evaluation dimensions

## 1. Decision contribution

Evaluate whether the specialist:

- clarified the real decision;
- separated evidence from interpretation;
- surfaced assumptions;
- preserved important uncertainty;
- clarified options or trade-offs;
- improved the recommendation;
- identified a useful next action.

Primary question:

> Did the specialist materially improve the quality or clarity of the decision?

---

## 2. Specialist fit

Evaluate whether:

- the correct specialist was selected;
- the specialist stayed within role;
- the output matched the need;
- another specialist would have been materially better;
- role boundaries remained understandable.

Primary question:

> Was specialist selection simple and reliable enough without an automated router?

---

## 3. Context sufficiency

Evaluate whether the common intake provided enough information.

Check:

- `decision_question`;
- `opportunity_summary`;
- `evidence`;
- `known_assumptions`;
- `constraints`;
- `requested_output`;
- `requested_outcome`.

Primary question:

> Could the specialist produce useful work without excessive context preparation or follow-up reconstruction?

---

## 4. Human control

Evaluate whether José could:

- understand what the specialist produced;
- distinguish recommendation from decision;
- review evidence and assumptions;
- approve deliberately;
- reject or disregard the output outside the runtime where appropriate;
- retain final authority.

Primary question:

> Did the runtime support judgement without obscuring who decides?

---

## 5. Slack review

Evaluate whether the Slack review:

- arrived when meaningful action was required;
- identified the specialist;
- displayed the workflow ID;
- presented the specialist output clearly;
- made the approval action obvious;
- avoided unnecessary notification volume.

Primary question:

> Did Slack make human review easier rather than adding coordination overhead?

---

## 6. Runtime reliability

During real use, observe:

- webhook reliability;
- privacy gate behaviour;
- correct specialist selection within the intended scenario;
- Data Store persistence;
- output persistence;
- Slack delivery;
- approval parsing;
- approved-state persistence.

Do not rerun deep technical testing unless a problem appears.

Primary question:

> Did the already validated runtime remain reliable under normal use?

---

## 7. Output quality

Evaluate whether the output was:

- decision-relevant;
- evidence-aware;
- caveated;
- proportionate;
- structurally clear;
- stakeholder-appropriate where relevant;
- reusable where appropriate;
- privacy-safe;
- usable with little manual reconstruction.

Primary question:

> Was the output useful enough to affect real work?

---

## 8. Shipping behaviour

Where relevant, assess whether Strategic OS:

- reduced unnecessary refinement;
- helped work move at the right time;
- identified real blockers;
- prevented premature shipping;
- produced a clear done condition.

Primary question:

> Did the system improve progress without lowering necessary quality?

---

## 9. Stakeholder contribution

Where relevant, assess whether Strategic OS:

- identified the right decision-makers;
- distinguished contributors from implementation participants;
- avoided inventing support or resistance;
- improved engagement order;
- identified the next useful conversation.

Primary question:

> Did the system improve stakeholder alignment or reduce unnecessary consultation?

---

## 10. Strategic opportunity contribution

Where relevant, assess whether Strategic OS:

- surfaced a strategic opportunity;
- clarified its value;
- identified evidence still required;
- connected the opportunity to the desired reputation;
- identified a useful next validation action.

Primary question:

> Did the system strengthen a real strategic opportunity?

---

## 11. Reuse

Evaluate whether the work created any durable reusable knowledge.

Examples:

- decision logic;
- stakeholder pattern;
- analytical caveat;
- service-design pattern;
- operating principle;
- validated prompt behaviour;
- runtime learning.

Primary question:

> Did anything useful survive beyond the immediate task?

Do not manufacture reusable artefacts where none are needed.

---

## 12. Management overhead

Observe:

- preparation effort;
- manual copying;
- context reconstruction;
- Slack overhead;
- specialist-selection effort;
- runtime monitoring effort;
- repository maintenance generated by the run.

Primary question:

> Does Strategic OS create more decision value than operating overhead?

---

# Evidence categories

Use the following evidence labels where useful:

- Observed
- Reported
- Validated
- Partially validated
- Assumption
- Future signal
- Rejected
- Out of scope

Do not promote a single observation into a framework requirement.

---

# Test result template

## Operational test

**Test ID:**  
[Add identifier]

**Date:**  
[Add date]

**Work item:**  
[Safe summary]

**Decision-support need:**  
[Add need]

**Selected specialist:**  
[Add specialist]

**Why this specialist:**  
[Short rationale]

**Decision question:**  
[Add question]

**Expected contribution:**  
[What should improve]

**Runtime result:**  
[Pass / Partial / Fail]

**Human review:**  
[Completed / Not completed]

**Decision contribution:**  
[High / Medium / Low]

**Output quality:**  
[Accepted / Minor revision / Major revision / Rejected]

**Specialist fit:**  
[Strong / Adequate / Weak]

**Context sufficiency:**  
[Strong / Adequate / Weak]

**Slack usefulness:**  
[Useful / Neutral / Friction]

**Management overhead:**  
[Low / Moderate / High]

**Reusable learning:**  
[Safe durable learning or `None`]

**Strategic opportunity signal:**  
[Add signal or `None`]

**Career evidence signal:**  
[Add signal or `None`]

**Observed friction:**  
[Safe summary or `None`]

**Change justified:**  
[Yes / No]

**Next action:**  
[One bounded action]

---

# Test portfolio

Do not require every specialist to be used an equal number of times.

Use specialists according to real work.

Aim for sufficient variety to judge sustained usefulness.

## Sensemaking Agent

- [ ] Additional real-work run completed
- [ ] Second additional real-work run completed
- [ ] Decision contribution assessed
- [ ] Repeated behavioural friction assessed

## Stakeholder Journey Agent

- [ ] Additional real stakeholder run completed
- [ ] Second additional real stakeholder run completed
- [ ] Engagement sequencing contribution assessed
- [ ] Repeated behavioural friction assessed

## Career Architect

- [ ] Real strategic / career opportunity run completed
- [ ] Second materially different run completed
- [ ] Evidence maturity handling assessed
- [ ] Sponsor / impact discipline assessed

## Shipping Coach

- [ ] Real active-work run completed
- [ ] Second materially different run completed
- [ ] Shipping decision contribution assessed
- [ ] Refinement behaviour assessed

## Chief of Staff Agent

- [ ] Real operating-priority run completed
- [ ] Second materially different run completed
- [ ] Focus protection assessed
- [ ] Specialist-routing recommendations assessed

---

# Cross-specialist observation

The beta should observe cross-specialist behaviour without automating it.

Where one real work item genuinely requires more than one specialist, assess:

- whether the second specialist was actually necessary;
- whether the human could transfer enough safe context;
- whether definitions remained consistent;
- whether important context was lost;
- whether outputs contradicted each other;
- whether manual sequencing was burdensome;
- whether an automated handoff would materially improve the result.

Do not create an automated handoff because one case used two specialists.

A future orchestration requirement should be based on repeated evidence.

---

# Runtime hardening observation

Known but not implemented controls include:

- `L` rework command;
- `M` stop command;
- privacy rejection feedback;
- authorised responder validation;
- Relevance AI failure handling;
- Slack notification failure handling;
- sensitive-content safeguards beyond the current privacy gate;
- automated output validation;
- workflow ID cleanup;
- multi-agent routing;
- automatic specialist sequencing;
- automatic GitHub writes.

During real work, note when the absence of one of these controls causes material friction or risk.

Do not treat its absence alone as evidence that it must be implemented.

---

# Hardening trigger

A runtime-hardening item should become active only when:

- a failure recurs;
- the operating environment broadens;
- more users gain access;
- information sensitivity increases;
- the consequence of failure increases;
- governance or privacy requires stronger control;
- an existing control proves inadequate.

When triggered:

1. define the demonstrated problem;
2. identify the smallest additional control;
3. preserve human authority;
4. validate the affected path;
5. update Strategic OS after the control is proven.

---

# Orchestration expansion test

Multi-agent orchestration remains paused.

Before reconsidering automatic routing or sequencing, require evidence that:

- real work repeatedly needs multiple specialists;
- manual specialist selection creates material friction;
- safe context handoff is repetitive and predictable;
- specialist order is sufficiently stable to automate;
- automatic sequencing would improve decision quality or reduce meaningful overhead;
- human review points can remain explicit;
- failure behaviour can remain bounded.

If these conditions are not demonstrated:

> Keep specialists independent.

---

# Success criteria

The operational beta is successful when evidence shows that Strategic OS:

- improves real decision clarity;
- preserves evidence and uncertainty;
- maintains clear specialist roles;
- retains human decision authority;
- operates reliably through the validated runtime;
- uses Slack proportionately;
- does not breach privacy boundaries;
- creates some reusable strategic knowledge;
- improves stakeholder action where relevant;
- improves shipping behaviour where relevant;
- surfaces or strengthens strategic opportunities where relevant;
- does not create disproportionate management overhead.

Success does not require new automation.

---

# Failure indicators

The beta should be considered weak where repeated evidence shows that:

- specialists add little decision value;
- choosing the correct specialist is consistently difficult;
- outputs require substantial reconstruction;
- important context is repeatedly lost;
- outputs overstate weak evidence;
- specialist roles overlap materially;
- Slack adds more friction than value;
- workflow state becomes unreliable;
- privacy boundaries are difficult to maintain;
- manual operation creates disproportionate overhead;
- repository maintenance becomes the dominant activity;
- Strategic OS produces documentation without improving decisions.

One isolated weak run does not automatically require redesign.

Look for recurrence.

---

# Measures

| Dimension | Measure |
|---|---|
| Decision contribution | Decisions materially clarified or strengthened |
| Specialist fit | Correct specialist selected without unnecessary routing complexity |
| Output quality | Accepted with no, minor or major revision |
| Context sufficiency | Manual reconstruction required |
| Human control | Explicit review and clear decision authority |
| Slack | Useful versus unnecessary review notifications |
| Runtime reliability | Successful execution and approval persistence |
| Stakeholder value | Engagement sequencing or alignment improved |
| Shipping value | Delay or unnecessary refinement reduced |
| Opportunity value | Strategic opportunities clarified or progressed |
| Reuse | Durable knowledge reused later |
| Efficiency | Decision value compared with operating effort |
| Privacy | Boundary incidents or near misses |
| Overhead | Preparation and maintenance burden |

---

# Beta evidence log

Use a lightweight evidence log only when the run produces useful learning.

| Field | Record |
|---|---|
| Date | |
| Work item | |
| Specialist | |
| Decision question | |
| Expected contribution | |
| Runtime result | |
| Human review completed | |
| Output quality | |
| Decision contribution | |
| Specialist fit | |
| Slack usefulness | |
| Management overhead | |
| Reusable learning | |
| Observed friction | |
| Change justified | |
| Next action | |

Do not create detailed logs where there is no learning worth retaining.

---

# Beta result categories

## Continue unchanged

Use when:

- the specialist adds value;
- the runtime works reliably;
- no material repeated friction is present.

This is a successful result.

## Continue with contained improvement

Use when:

- value is clear;
- one repeated issue has been identified;
- the issue can be solved through a small targeted change.

## Harden one runtime control

Use when:

- a repeated reliability, privacy or governance issue exists;
- the current boundary needs a specific additional safeguard.

## Revisit specialist contract

Use when:

- repeated real use shows a specialist consistently behaves outside its intended role;
- the issue is reasoning behaviour rather than orchestration.

## Reconsider orchestration

Use only when repeated evidence demonstrates that independent specialists create material coordination friction.

## Pause

Use when:

- the system creates insufficient value;
- overhead is disproportionate;
- a material unresolved risk exists.

---

# Operational acceptance relationship

This beta contributes evidence toward:

`12_quality/strategic_os_operationalisation_checklist.md`

The beta does not independently declare Strategic OS operational.

Operational acceptance also requires evidence of:

- repeated real decisions supported;
- sustained working cadence;
- reusable knowledge;
- strategic opportunity contribution;
- safe analytics use where relevant;
- low operating overhead;
- North Star impact.

---

# Current completed evidence

The following phases are complete:

- [x] priority agent architecture established;
- [x] behavioural validation of all five specialists;
- [x] specialist runtime implementation;
- [x] end-to-end runtime validation of all five specialists;
- [x] shared privacy gate validated;
- [x] shared Data Store pattern validated;
- [x] Slack human-review pattern validated;
- [x] strict `P <workflow_id>` approval validated;
- [x] approved-state persistence validated.

The following evidence remains active:

- [ ] repeated real-world specialist use;
- [ ] sustained operating value;
- [ ] specialist selection sufficiency;
- [ ] management-overhead assessment;
- [ ] reusable knowledge reuse;
- [ ] strategic opportunity contribution;
- [ ] evidence for or against runtime hardening;
- [ ] evidence for or against orchestration expansion.

---

# Current decision

The original beta concept tested whether an agentic team could coordinate sequentially across a contained strategic workstream.

Operationalisation produced a simpler validated architecture:

> independent specialist runtimes + shared workflow state + explicit human review.

Therefore the beta now tests the value of that architecture in real use.

It does not test a hypothetical multi-agent team.

---

# Immediate next action

Use the validated specialist runtimes on real work.

For each meaningful run:

1. select the specialist deliberately;
2. use the validated common intake;
3. complete human review;
4. assess decision contribution;
5. capture material friction only;
6. retain reusable learning only;
7. make no architecture change unless evidence justifies it.

Current priority:

> Use, observation and evidence.

The next architecture decision should come from real work, not from the availability of additional automation.
