# Agent Knowledge Management and Governance

## Purpose

Define how knowledge used by Strategic OS agents is:

- created;
- reviewed;
- approved;
- stored;
- synchronised;
- retrieved;
- updated;
- corrected;
- retired;
- governed.

This applies to the five priority Strategic OS specialists:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

The goal is to help agents become increasingly specialised in the Strategic OS environment while preserving human control, privacy and a clear source of truth.

---

# Core rule

> GitHub owns durable knowledge. Relevance AI provides runtime access to approved knowledge.

Relevance AI must not become an uncontrolled parallel source of truth.

The intended relationship is:

`real work`
→ `candidate learning`
→ `human review`
→ `approved reusable knowledge in GitHub`
→ `controlled runtime mirror in Relevance AI`
→ `agent retrieval during future work`

---

# Why this matters

Strategic OS agents should improve through repeated use.

At first, agents may need to ask basic context questions.

As approved context accumulates, repeated questions about established Strategic OS knowledge should become a quality warning.

The target is:

> Ask for missing evidence, not forgotten context.

Agents should increasingly know:

- what Strategic OS is for;
- the North Star;
- operating principles;
- privacy and source-of-truth rules;
- how José interacts with the system;
- specialist roles and boundaries;
- reusable decision patterns;
- recurring terminology;
- approved project context;
- lessons learned from prior reviewed work.

Agents should still ask questions when information is genuinely new, uncertain, consequential or not available in approved knowledge.

---

# Knowledge architecture

Strategic OS uses three context layers.

## Layer 1 — Shared agent knowledge

Available to all five agents.

Examples:

- Strategic OS North Star;
- operating principles;
- privacy rules;
- source-of-truth rules;
- Slack control-surface model;
- agent-team roles;
- decision-support standards;
- reusable frameworks;
- approved cross-agent lessons;
- approved project summaries.

Runtime location:

`strategic_os_shared_context`

in Relevance AI.

Authoritative location:

GitHub Strategic OS repository.

## Layer 2 — Specialist knowledge

Specific to an individual agent.

Examples:

- agent mission;
- specialist frameworks;
- specialist prompts;
- output expectations;
- failure modes;
- domain-specific lessons;
- validated specialist examples.

Authoritative location:

The relevant agent folder under:

`07_ai_agents/`

Runtime location:

The relevant Relevance AI specialist configuration or associated approved knowledge source.

## Layer 3 — Current-run context

Temporary context required for the current piece of work.

Examples:

- current decision;
- opportunity;
- draft;
- evidence;
- assumptions;
- constraints;
- stakeholder situation;
- current project state.

Current-run context may come through Slack and Make.

It is not automatically durable knowledge.

---

# Shared Relevance AI knowledge table

Current shared runtime table:

`strategic_os_shared_context`

Current schema:

| Field | Purpose |
|---|---|
| `context_id` | Stable identifier for the knowledge record |
| `category` | Context taxonomy |
| `title` | Human-readable name |
| `summary` | Safe, reusable context supplied to agents |
| `source_path` | Authoritative GitHub source |
| `status` | Governance state |
| `last_reviewed` | Date of latest meaningful human review |

Initial categories:

- `north_star`
- `operating_principles`
- `source_and_privacy`
- `agent_roles`
- `communication_and_slack`
- `reusable_frameworks`
- `approved_project_context`

Do not add categories merely because a new topic appears once.

Extend the taxonomy only when repeated use demonstrates a reusable context type that does not fit the existing categories.

---

# Knowledge lifecycle

## 1. Knowledge is encountered

Potential reusable learning may emerge from:

- real agent runs;
- project work;
- strategic decisions;
- stakeholder interactions;
- analytics interpretation;
- service-design work;
- operating-system changes;
- runtime validation;
- repeated clarification questions;
- repeated mistakes.

At this point the information is only a candidate.

Do not automatically treat it as permanent knowledge.

## 2. Candidate learning is assessed

Ask:

- Is this likely to improve a future decision?
- Is it reusable beyond one conversation?
- Is it safe to retain?
- Is it sufficiently validated?
- Does it duplicate existing knowledge?
- Is there a clear authoritative source?
- Will retaining it reduce future context burden?

If not, leave it in the current work only.

## 3. Sensitive detail is abstracted

Before durable storage, remove:

- customer personal information;
- raw organisational data;
- identifiable case details;
- credentials;
- tokens;
- confidential extracts;
- unnecessary stakeholder commentary;
- transient Slack conversation;
- unsupported speculation.

Preserve only the reusable strategic meaning.

## 4. Human approval occurs

José remains the promotion boundary for durable agent knowledge.

Agents may:

- identify a reusable lesson;
- recommend that it be retained;
- propose wording;
- identify contradictions.

Agents must not silently promote temporary context into permanent knowledge.

## 5. GitHub is updated

Approved knowledge is stored in the smallest appropriate Strategic OS file.

Prefer:

- updating an existing authoritative file;
- a concise project summary;
- a reusable framework;
- an agent-specific lesson;
- a shared operating rule.

Avoid creating duplicate knowledge files.

The GitHub path becomes the authoritative `source_path`.

## 6. Runtime knowledge is synchronised

Approved shared knowledge is added or updated in:

`strategic_os_shared_context`

The Relevance AI record should contain only enough information for reliable retrieval.

Do not copy entire repository files into the table when a concise approved summary is sufficient.

## 7. Agents retrieve context during work

Agents should retrieve relevant knowledge rather than load all available knowledge into every run.

Expected reasoning model:

`relevant shared knowledge`
+
`relevant specialist knowledge`
+
`current-run context`
→
`specialist reasoning`

Retrieval should favour relevance over volume.

## 8. Knowledge is reviewed through use

Real work is the primary quality test.

Monitor whether knowledge:

- prevents repeated context questions;
- improves recommendations;
- helps identify relevant precedent;
- causes stale assumptions;
- creates contradictions;
- is too broad to be useful;
- is missing important context.

## 9. Knowledge is corrected or retired

When durable knowledge changes:

1. update GitHub first;
2. update the corresponding Relevance AI record;
3. update `last_reviewed`;
4. supersede or remove stale runtime knowledge where appropriate.

Do not leave contradictory versions active in the shared context layer.

---

# Status model

Use these governance states where useful:

## `approved`

Reviewed and safe for agent use.

## `in_review`

Candidate context not yet approved for routine retrieval.

## `superseded`

Previously valid but replaced by newer approved knowledge.

## `retired`

No longer appropriate for agent use.

The normal runtime retrieval layer should primarily expose:

`approved`

knowledge.

---

# Source-of-truth rule

Every durable shared-context record should have a traceable GitHub `source_path`.

If a Relevance AI record conflicts with GitHub:

> GitHub wins.

Correct the runtime mirror rather than changing the authoritative knowledge to match the runtime.

Do not treat:

- Slack messages;
- Make Data Stores;
- agent conversation history;
- Relevance AI memory;

as authoritative durable Strategic OS knowledge unless the learning has passed the approval process and been recorded in GitHub.

---

# Update triggers

Shared knowledge should be reviewed or updated when:

- an operating rule changes;
- an agent contract changes;
- a recurring project reaches a materially new state;
- prior context causes a wrong recommendation;
- José repeatedly has to correct the same misunderstanding;
- an agent repeatedly asks for context already available;
- a reusable lesson is validated through real work;
- a contradiction is discovered;
- a context record becomes stale;
- a new reusable framework is adopted.

Do not schedule frequent updates merely to keep activity high.

Update because the knowledge has materially changed.

---

# Context-question monitoring

Repeated context questions are an agent-quality signal.

## Green — genuine clarification

Examples:

- new evidence is required;
- a project state may have changed;
- a consequential assumption needs confirmation;
- two interpretations remain plausible.

These are healthy questions.

## Amber — retrieval issue

The answer probably exists in Strategic OS, but the agent did not retrieve it.

Investigate:

- indexing;
- table content;
- search terms;
- retrieval instructions;
- context selection.

## Red — established-context failure

The agent repeatedly asks for information already retained and available.

Examples:

- asking what Strategic OS is for;
- asking who the final decision-maker is;
- repeatedly asking for an approved project summary;
- contradicting a known operating rule;
- requiring José to repeatedly explain the same environment.

A red signal is a system-quality issue.

Do not solve it by asking José to write longer prompts.

Investigate the knowledge layer.

---

# Knowledge-quality criteria

A shared-context record should be:

## Decision relevant

It should improve future reasoning or reduce avoidable clarification.

## Reusable

It should be useful beyond one isolated interaction.

## Safe

It must respect privacy, organisational and Strategic OS boundaries.

## Traceable

It should point to an authoritative GitHub source.

## Concise

It should provide useful context without loading unnecessary detail.

## Current

It should reflect the latest approved state.

## Distinguishable from evidence

Agents must not mistake persistent contextual guidance for evidence about the current decision.

---

# Project-context rule

Project knowledge should normally be stored as approved high-level summaries.

A project-context record may include:

- purpose;
- current phase;
- confirmed strategic direction;
- important definitions;
- approved operating decisions;
- key constraints;
- known caveats.

It should not contain:

- raw project data;
- full meeting notes;
- raw stakeholder commentary;
- unreviewed working assumptions;
- confidential extracts.

Project summaries should help agents understand:

> Where am I working, what has already been decided, and what context should I not ask José to repeat?

They should not attempt to replace the project system of record.

---

# Agent learning rule

Agents become more specialised through approved knowledge, not unrestricted memory accumulation.

A specialist should improve through access to:

- reviewed examples;
- validated patterns;
- reusable lessons;
- approved project context;
- recurring decision logic;
- known failure modes.

The target is not:

> Remember everything.

The target is:

> Know what matters, retrieve it when relevant, and recognise what is genuinely missing.

---

# Write-back governance

Initial operating rule:

> Agents may read approved shared knowledge but may not autonomously write durable knowledge.

An agent may recommend:

`Candidate reusable learning`

for human review.

Only approved learning should be promoted into GitHub and then synchronised to Relevance AI.

Automatic write-back may be considered later only if real use demonstrates:

- reliable classification of reusable learning;
- acceptable privacy controls;
- reliable deduplication;
- safe review and rollback;
- clear human approval boundaries.

Do not enable uncontrolled agent self-editing of the shared knowledge base.

---

# Synchronisation rule

Current operating process:

`GitHub approved update`
→ `human updates Relevance AI runtime mirror`

This manual process is acceptable during operational validation.

Future automation may synchronise approved GitHub knowledge to Relevance AI.

If introduced, automation must preserve:

- GitHub authority;
- human approval;
- source-path traceability;
- status;
- review date;
- rollback;
- privacy boundaries.

Do not automate synchronisation until manual use proves the schema and governance model are stable.

---

# Review rhythm

Do not create a heavy governance ceremony.

Review shared context when:

- a red context-quality signal occurs;
- project context materially changes;
- a reusable lesson is approved;
- a source file changes materially;
- an agent produces inconsistent behaviour.

A lightweight periodic review may be introduced later if accumulated context becomes large enough to justify it.

---

# Ownership

José owns approval of durable Strategic OS knowledge.

The Design Systems Architect supports:

- identifying reusable knowledge;
- checking duplication;
- recommending the correct GitHub location;
- drafting safe summaries;
- identifying stale or contradictory context;
- improving the shared-context model.

Specialist agents may propose lessons but do not own final knowledge promotion.

---

# Current implementation state

Current shared runtime table:

`strategic_os_shared_context`

Initial seed:

- North Star;
- operating principles;
- source and privacy rules;
- five-agent context;
- Slack control-surface rule;
- decision-support standard;
- operationalisation context.

Current implementation priority:

1. populate the initial shared table;
2. connect it to Sensemaking;
3. test whether retrieval improves a real Sensemaking run;
4. refine only where evidence shows a gap;
5. extend the same shared context to the remaining four specialists;
6. begin adding approved project summaries where repeated context needs justify them.

Do not attempt autonomous memory or automatic knowledge creation yet.

---

# Definition of success

Agent knowledge management is working when:

- agents understand the Strategic OS environment;
- José does not need to repeatedly provide established context;
- clarification questions become more specific and useful;
- agents reuse relevant prior knowledge;
- stale or incorrect context can be traced and corrected;
- durable knowledge remains governed in GitHub;
- runtime knowledge remains safe and maintainable;
- agent specialisation improves through real use.

The long-term standard is:

> Strategic OS agents should become better colleagues through governed learning, while José retains control over what the system permanently knows.
# Actionable automation opportunity — GitHub to Relevance AI knowledge deployment

## Opportunity

Automate deployment of approved Strategic OS knowledge from GitHub into the Relevance AI shared context layer.

Current manual pattern:

`GitHub approved update → human updates Relevance AI runtime mirror`

Future automated pattern:

`GitHub approved update`
→ `automation detects eligible knowledge change`
→ `validates schema and status`
→ `updates matching Relevance AI knowledge record`
→ `records sync result`
→ `agents retrieve current approved context`

## Intended outcome

Reduce manual maintenance while preserving:

- GitHub as the authoritative source;
- human approval before durable knowledge becomes active;
- source-path traceability;
- privacy boundaries;
- review status;
- rollback;
- controlled knowledge taxonomy.

## Automation boundary

Automation may synchronise only knowledge that is already:

- approved in GitHub;
- safe for agent use;
- mapped to the shared-context schema;
- associated with a stable `context_id`;
- traceable to an authoritative `source_path`.

Automation must not:

- decide autonomously what should become durable knowledge;
- promote unreviewed Slack or agent outputs;
- copy raw organisational source material;
- overwrite GitHub from Relevance AI;
- create uncontrolled categories;
- silently resolve conflicting knowledge.

## Candidate implementation

Preferred direction:

`GitHub → Make → Relevance AI`

Possible trigger:

- approved context file or manifest changes in GitHub.

Possible automation actions:

1. detect changed approved knowledge;
2. parse eligible context records;
3. validate required fields;
4. compare `context_id` with the Relevance AI runtime mirror;
5. create or update the matching knowledge row;
6. retire or supersede records only when explicitly declared in GitHub;
7. log success or failure;
8. notify Slack when synchronisation requires attention.

## Minimum schema

Each deployable knowledge record should preserve:

- `context_id`
- `category`
- `title`
- `summary`
- `source_path`
- `status`
- `last_reviewed`

GitHub remains authoritative for every field.

## Activation criteria

Do not automate this immediately.

Activate when:

- the shared-context schema has been proven through real use;
- more than one agent is actively using the shared knowledge layer;
- manual synchronisation becomes repeated maintenance work;
- retrieval quality is stable enough that automated updates will not amplify poor context;
- the Relevance AI update mechanism is sufficiently reliable;
- rollback can be performed safely.

## Definition of done

> An approved Strategic OS knowledge change can be committed in GitHub and reliably reflected in the Relevance AI shared context without José manually re-entering the same information.

## Backlog status

`Actionable future automation`

Priority:

`After shared-context retrieval is validated with Sensemaking and extended successfully to the five specialist agents.`

Do not allow this automation to block current operationalisation work.
# Actionable improvement — optimise knowledge ingestion

## Problem

The current shared-context ingestion process is functional but manual and error-prone.

Today, José must:

1. identify the correct GitHub source;
2. manually create a concise context summary;
3. manually choose the category;
4. manually enter the `source_path`;
5. manually add or import the record into Relevance AI;
6. manually confirm that the runtime mirror matches the approved GitHub source.

This creates avoidable friction and increases the risk of:

- inconsistent summaries;
- incorrect source paths;
- duplicated records;
- stale context;
- taxonomy drift;
- manual re-entry;
- uncertainty about which GitHub file is authoritative.

## Desired improvement

Move toward a guided ingestion pattern:

`approved GitHub knowledge`
→ `structured context record`
→ `validation`
→ `Relevance AI import / sync`

The ingestion experience should make it easy to answer:

- What is the authoritative source?
- Is this knowledge approved?
- Which category does it belong to?
- Does a matching `context_id` already exist?
- Is the summary concise and safe?
- Is this an update, new record, supersession or retirement?

## Near-term optimisation

Before full automation, create a simple ingestion artefact or process that can generate upload-ready records from approved GitHub sources.

Minimum outputs:

- `context_id`
- `category`
- `title`
- `summary`
- `source_path`
- `status`
- `last_reviewed`

Preferred interaction:

> José identifies an approved GitHub source or project area, and Strategic OS prepares the Relevance-ready context record automatically for review.

José should not need to manually type each field.

## Future automation

This improvement should converge with the GitHub-to-Relevance deployment opportunity.

Target future flow:

`GitHub approved change`
→ `eligible context detected`
→ `record generated`
→ `human review where required`
→ `Relevance AI updated`
→ `sync result visible in Slack`

## Quality rule

> Context ingestion should be more reliable than manual copy-paste.

If the ingestion process routinely requires José to reconstruct paths, categories or summaries by hand, treat that as operational friction worth reducing.

## Backlog status

`Actionable near-term improvement`

Priority:

`After shared-context retrieval quality is proven with Sensemaking, before scaling manual ingestion across many project records.`
