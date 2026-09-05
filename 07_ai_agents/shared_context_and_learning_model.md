# Shared Context and Agent Learning Model

## Purpose

Define how Strategic OS agents gain, use and improve shared context over time.

The goal is to make the five priority agents increasingly capable of operating within the Strategic OS environment without repeatedly asking José to restate context that the system should already know.

This model applies to:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

It does not create a new agent.

It defines the shared context and learning layer that supports the existing specialist team.

---

# North Star for agent learning

Strategic OS agents should become increasingly specialised in the context in which they operate.

The desired progression is:

> New agent → context-aware specialist → experienced Strategic OS specialist → coordinated agentic team member

At the beginning, context questions are expected.

Over time, repeated questions about established Strategic OS context should become an operational quality warning.

The long-term expectation is:

> Agents should know what environment they are working in, what Strategic OS is trying to achieve, what the current operating rules are, what recurring projects and patterns matter, and what has already been learned.

Agents should still ask questions when:

- the required information is genuinely new;
- evidence is missing;
- a consequential assumption needs confirmation;
- organisational source data cannot safely be inferred;
- project-specific context has not yet been captured;
- multiple plausible interpretations exist.

Agents should not repeatedly ask José to restate durable context that has already been reviewed and made available to them.

---

# Core principle

> Ask for missing evidence, not forgotten context.

A context question is useful when it reveals genuine uncertainty.

A context question is waste when the answer already exists in approved Strategic OS knowledge and the agent failed to retrieve or use it.

---

# Shared context architecture

Strategic OS agent context has three layers.

## Layer 1 — Shared Strategic OS context

Available to all five agents.

Contains durable, approved and reusable context such as:

- Strategic OS North Star;
- desired reputation;
- operating principles;
- human-in-the-loop rules;
- privacy boundaries;
- source-of-truth rules;
- agent roles and boundaries;
- interaction model;
- common decision-support conventions;
- current strategic priorities at a safe level;
- reusable frameworks;
- reusable lessons learned;
- stakeholder patterns;
- recurring terminology;
- recurring project summaries where safe;
- approved operating decisions;
- known runtime patterns;
- shared quality standards.

This layer should be mirrored into the Relevance AI runtime so all five agents can retrieve it.

GitHub remains authoritative.

Relevance AI is a runtime context mirror, not the source of truth.

## Layer 2 — Specialist context

Each agent retains its own:

- mission;
- primary question;
- reasoning framework;
- specialist prompts;
- output structure;
- autonomy level;
- failure modes;
- success criteria;
- domain-specific lessons.

This keeps each specialist differentiated while allowing all agents to work from the same Strategic OS foundation.

## Layer 3 — Run-specific context

Supplied for the current work item.

Examples:

- current decision;
- current opportunity;
- current evidence;
- current constraints;
- current stakeholders;
- current draft;
- current project state;
- current analytical result.

Run-specific context may come from Slack, Make, approved project summaries or other safe sources.

It should not be promoted automatically into permanent context.

---

# Runtime context rule

The intended reasoning pattern is:

`shared context + specialist context + current-run context → specialist reasoning`

José should not need to manually reconstruct all three layers.

During normal operation:

- Slack captures the current request;
- Make orchestrates the runtime;
- Relevance AI retrieves relevant shared and specialist context;
- the selected specialist reasons over the combined context;
- the result returns to Slack;
- José reviews consequential outputs.

---

# Context retrieval principle

Agents should retrieve only the context relevant to the current task.

Do not load the entire Strategic OS knowledge base into every run.

Prefer:

- relevant North Star and operating rules;
- relevant project summary;
- relevant prior decision;
- relevant framework;
- relevant lesson;
- relevant stakeholder pattern;
- relevant specialist guidance.

Avoid:

- indiscriminate context loading;
- raw Slack history;
- raw organisational documents;
- duplicated project material;
- stale context with no current relevance.

---

# Context maturity model

## Level 0 — Cold start

The agent knows only its basic contract.

Expected behaviour:

- asks basic contextual questions;
- requires explicit framing;
- has limited knowledge of Strategic OS conventions.

Acceptable during initial setup.

Not acceptable as a long-term operating state.

## Level 1 — Strategic OS aware

The agent knows:

- Strategic OS purpose;
- North Star;
- operating principles;
- human-review rules;
- privacy boundaries;
- its own specialist role;
- the five-agent team structure.

Basic questions such as:

> What is Strategic OS for?

or:

> Who makes the final decision?

should no longer occur.

## Level 2 — Practice aware

The agent can retrieve and use:

- reusable frameworks;
- decision patterns;
- stakeholder patterns;
- lessons learned;
- common terminology;
- recurring operating rules.

The agent should begin recognising familiar Strategic OS patterns without José re-explaining them.

## Level 3 — Project-context aware

The agent can retrieve safe, approved summaries of recurring active work.

Examples may include:

- Channel Strategy Y2;
- Customer Accounts and Information Services;
- Service Account / Portal CX;
- recurring career or stakeholder themes.

The agent understands prior decisions and current direction where they have been deliberately retained.

Repeated questions about already-approved project context become a warning signal.

## Level 4 — Experienced specialist

The agent uses accumulated approved learning to improve judgement.

Expected behaviour:

- recognises recurring patterns;
- references prior relevant decisions;
- avoids repeating previously resolved questions;
- distinguishes known context from new evidence;
- asks sharper clarification questions;
- detects contradictions with established Strategic OS logic;
- identifies when current work materially differs from precedent.

## Level 5 — Context-aware agentic team

Agents can coordinate using shared context and differentiated specialist knowledge.

Expected behaviour:

- understand the operating environment;
- know specialist boundaries;
- know what has already been learned;
- route or hand off work with minimal re-explanation;
- use the smallest useful combination of specialists;
- surface genuine uncertainty rather than basic context gaps.

This is a future capability state.

It does not justify premature orchestration.

---

# Context-question quality rule

Not all context questions are equal.

## Green — useful clarification

Ask when:

- information is genuinely absent;
- evidence is required for a consequential claim;
- two interpretations are plausible;
- a stakeholder position is unknown;
- current project state may have changed;
- organisational constraints need confirmation.

Example:

> Has the Class 6 proposal been tested against the formal classification criteria yet?

This is a useful question because the answer may materially affect the recommendation.

## Amber — possible context-retrieval failure

Investigate when:

- the agent asks for information that may already exist in Strategic OS;
- the answer exists but may not yet be available in the runtime context layer;
- the agent asks José to summarise a project that has an approved project summary.

Example:

> What is Channel Strategy Y2 trying to achieve?

If an approved project summary exists and is available to the agent, this should not normally be necessary.

## Red — repeated known-context failure

Treat as an operational quality issue when:

- the agent repeatedly asks for established Strategic OS context;
- the same context has already been supplied and retained;
- another agent has the context but the selected agent cannot access it;
- the agent contradicts an approved operating rule because it failed to retrieve context;
- José must repeatedly re-explain the same project or Strategic OS concept.

A repeated red signal means the problem is likely in:

- shared-context design;
- retrieval;
- indexing;
- synchronisation;
- context selection;
- stale knowledge;
- agent prompt design.

Do not solve repeated context failures by making José provide longer prompts.

---

# Learning loop

Agents should improve through reviewed use.

The learning loop is:

`real work`
→ `agent output`
→ `human review`
→ `identify reusable learning`
→ `abstract sensitive detail`
→ `store approved durable knowledge in GitHub`
→ `sync approved context to Relevance AI`
→ `future agents retrieve it`

Agents may propose learning.

Agents must not silently convert temporary interaction context into permanent knowledge.

Human review remains the promotion boundary.

---

# What may become shared context

Suitable examples:

- reusable decision logic;
- recurring service-design patterns;
- strategic principles;
- common stakeholder patterns;
- approved project summaries;
- validated terminology;
- reusable analytical caveats;
- operating decisions;
- lessons learned;
- approved career patterns;
- confirmed runtime behaviours.

---

# What must not become shared context

Do not persist:

- raw organisational source data;
- customer records;
- identifiable case material;
- credentials;
- tokens;
- confidential extracts;
- raw Slack history;
- sensitive stakeholder commentary;
- unreviewed assumptions;
- transient conversation noise;
- speculative interpretations presented as fact.

---

# Source-of-truth rule

GitHub remains authoritative for durable Strategic OS knowledge.

Relevance AI may hold a controlled runtime mirror for retrieval and reasoning.

The relationship is:

`GitHub approved knowledge → controlled sync → Relevance AI shared context`

Do not allow uncontrolled Relevance AI memory to become a competing source of truth.

If context conflicts:

> GitHub wins.

---

# Agent specialisation principle

Specialisation should emerge from repeated approved use, not uncontrolled memory accumulation.

A specialist becomes better by gaining access to:

- reviewed examples;
- recurring patterns;
- validated lessons;
- relevant frameworks;
- known failure modes;
- reusable decision logic.

The target is not an agent that remembers everything.

The target is:

> An agent that knows what matters, retrieves it when relevant, and recognises when genuinely new context is required.

---

# Quality measures

Monitor:

- number of repeated context questions;
- number of questions answered by already-existing Strategic OS knowledge;
- number of useful clarification questions;
- retrieval of relevant prior lessons;
- reuse of prior frameworks;
- contradiction with approved context;
- decision quality improvement;
- amount of context José has to manually restate;
- whether context retrieval reduces interaction friction.

A healthy system should show:

> decreasing repeated-context questions  
> increasing quality of clarification questions  
> increasing reuse of approved learning

---

# Current implementation priority

Start small.

Initial implementation should provide all five specialists with shared access to:

1. Strategic OS purpose and North Star;
2. operating principles;
3. source-of-truth and privacy rules;
4. five-agent role definitions;
5. communication / Slack control rules;
6. reusable lessons and frameworks;
7. approved high-level project context.

Do not attempt full autonomous memory.

Validate retrieval quality with one specialist first.

Then extend the same shared context layer to the remaining specialists.

---

# Definition of success

The shared-context layer is working when José can begin with a natural request such as:

> Sensemaking — is this role proposal strong enough?

and the agent already understands:

- what Strategic OS is;
- its role in the agent team;
- the relevant operating rules;
- known reusable context;
- relevant approved project background where available;

and asks only for information that is genuinely missing or needs confirmation.

The long-term standard is:

> Agents should become better colleagues through accumulated approved context, not require José to repeatedly onboard them.
