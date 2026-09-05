# Communication Protocol

## Purpose

Define the working protocol between José Andrade, Strategic OS agents and the Design Systems Architect.

This document is the canonical source for:

- human interaction with Strategic OS;
- agent control-surface rules;
- communication and continuity conventions;
- repository-output conventions.

GitHub is authoritative.

The same file may be uploaded to the GPT Knowledge area as a convenience mirror.

---

# Strategic OS human interface

## Single control surface

Slack is the primary human-facing control surface for Strategic OS agents.

During normal operation, José should be able to:

1. initiate a specialist-agent run;
2. provide the initial idea, question or context;
3. select the specialist intentionally;
4. receive the specialist output;
5. review the output;
6. approve, reject or continue the work where required;

without opening Make or Relevance AI.

The intended operating relationship is:

`José → Slack → Make → Relevance AI specialist → Make → Slack → José`

In plain language:

> Slack is where José operates Strategic OS.  
> Make orchestrates.  
> Relevance AI reasons.  
> GitHub preserves reusable Strategic OS knowledge.  
> José remains the decision-maker.

## Normal-operation boundary

Make and Relevance AI are implementation platforms, not normal user interfaces.

José should not need to:

- open a Make scenario to start routine agent work;
- manually trigger a Make webhook;
- construct JSON payloads for routine use;
- paste prompts directly into Relevance AI;
- retrieve agent responses manually from Relevance AI;
- understand scenario plumbing to use a specialist;
- manually transfer an agent response from one platform to another.

Direct interaction with Make or Relevance AI is appropriate only for:

- configuration;
- debugging;
- validation;
- maintenance;
- deliberate runtime changes.

If routine Strategic OS use requires José to operate either platform directly, treat this as an operational usability gap.

## Slack-first agent initiation

Slack must support intentional initiation of each validated specialist runtime.

Current specialists:

1. Sensemaking Agent
2. Stakeholder Journey Agent
3. Career Architect
4. Shipping Coach
5. Chief of Staff Agent

José selects the specialist.

Do not introduce automatic specialist selection merely to simplify the interface.

The preferred interaction should be simple enough to begin with an incomplete thought.

Example:

`Sensemaking`

`I think this role should become a Class 6 lead role, but I am not sure whether the case is strong enough.`

The Slack intake layer may structure this input for the runtime.

José should not be required to know the specialist webhook schema.

## Agent routing principle

Human specialist selection remains intentional.

Therefore:

`Slack command or selection → selected specialist runtime`

is preferred over:

`Slack message → AI master router decides which specialists to run`

Do not add:

- automatic multi-agent routing;
- automatic specialist sequencing;
- hidden agent chains;

unless repeated real use demonstrates a genuine need.

A simple deterministic control surface is preferable to unnecessary orchestration.

## Human-in-the-loop boundary

Agents support:

- synthesis;
- challenge;
- interpretation;
- recommendations;
- coordination;
- decision support.

Humans decide.

Where an action requires explicit human approval, Slack should provide the approval surface.

The runtime must not interpret the existence of an agent output as approval to act.

---

# Platform responsibilities

## Slack

Primary conversational and control interface.

Used for:

- specialist selection;
- intake;
- clarification where required;
- agent output;
- human review;
- approval;
- operational confirmation.

## Make

Workflow orchestration and runtime state.

Used for:

- receiving Slack events;
- deterministic routing;
- privacy gates;
- workflow IDs;
- state management;
- Relevance AI invocation;
- output validation;
- approval handling;
- returning results to Slack.

Make is not the normal human interaction surface.

## Relevance AI

Specialist reasoning runtime.

Used for:

- specialist prompts;
- reasoning;
- synthesis;
- agent-specific decision support.

Relevance AI is not the normal human interaction surface.

## GitHub

Authoritative Strategic OS source of truth.

Used for:

- agent contracts;
- frameworks;
- reusable operating patterns;
- decision logic;
- templates;
- safe durable knowledge;
- runtime documentation;
- communication rules.

GitHub does not replace organisational systems of record.

---

# Core interaction pattern

## Confirm understanding

Begin each task with a brief confirmation of what José is asking for.

Keep the confirmation practical.

Do not restate the full workstream context unless clarification is genuinely required.

## Work one task at a time

Provide one contained task or update at a time unless José explicitly asks for combined work.

A contained task may be:

- one new file;
- one full-file replacement;
- one complete section replacement;
- one append-only update;
- one configuration change;
- one validation action;
- one design decision;
- one clearly scoped analysis.

Do not bundle unrelated changes.

---

# Command protocol

## Command `3`

When José types:

`3`

Continue with the next single contained task.

Do not:

- repeat long context;
- restate the previous rationale;
- restart the workstream;
- combine multiple updates;
- recheck external sources unless uncertainty requires it;
- introduce new scope.

Provide either:

- one clear next action; or
- one complete copy-paste-ready repository update.

## Command `6`

When José types:

`6`

Create an optimised continuity prompt for a new chat.

The continuity prompt must include:

- workstream name;
- repository name where relevant;
- active source of truth;
- project purpose;
- current working principles;
- current phase;
- completed work;
- recently changed files;
- confirmed decisions;
- paused items;
- unresolved questions;
- next logical task;
- active communication rules;
- a suggested continuity-chat title.

---

# Context-length management

Monitor the cumulative size and complexity of the conversation.

Before earlier context is likely to become unreliable or difficult to retain, say:

> Context-length alert: type 6 for an optimised continuity summary.

Give the alert before important context is likely to be lost.

---

# Continuity-chat titles

Use this title pattern:

`[Workstream] Continuity [index] DDMMMYY`

Example:

`Strategic OS Continuity 02 17JUL26`

Rules:

- increase the index for each new continuity chat;
- use a two-digit day;
- use an uppercase three-letter month;
- use a two-digit year;
- place the date at the end;
- remind José that the assistant cannot directly rename the chat.

---

# Repository output format

For repository updates, use:

**Target file:**  
`path/to/file.md`

**Change type:**  
New file / Replace full file / Replace section / Append

**Purpose:**  
One sentence describing the problem solved.

**Repo-ready content:**  
Provide complete copy-paste-ready content in a fenced code block.

---

# Replacement rules

When replacing a section in a larger document:

- provide the entire replacement section;
- begin with the section heading;
- include all content belonging to that section;
- do not provide only changed lines;
- make the replacement boundary clear.

When replacing a full file:

- provide the complete file;
- preserve relevant source references;
- preserve validation or status information;
- do not omit unchanged sections.

---

# Markdown rules

For repository-ready Markdown:

- avoid nested fenced code blocks;
- use plain-text diagrams where practical;
- keep headings clear and stable;
- keep tables readable;
- preserve exact file names and paths;
- label assumptions and validation status;
- label future ideas as signals rather than confirmed requirements;
- avoid unnecessary explanation;
- keep content simple enough to maintain.

---

# Source-of-truth discipline

Follow the source-of-truth rule established for the active workstream.

For Strategic OS:

- the public GitHub repository is the active source of truth;
- GPT Knowledge attachments are convenience mirrors;
- organisational platforms remain systems of record for original source material;
- Strategic OS stores reusable interpretation and design logic rather than raw source-system content.

Do not assume Strategic OS source-of-truth rules apply to unrelated organisational repositories.

---

# Current-state documentation rules

For current-state service-design or SOP work:

- map actual practice, not aspirational role scope;
- preserve uncertainty;
- distinguish reported practice from validated practice;
- separate function-specific discovery before cross-function comparison;
- record exceptions and workarounds;
- avoid turning proposed improvements into confirmed requirements;
- use safe, de-identified evidence only;
- do not introduce unvalidated governance, privacy or system rules.

Recommended status labels:

- Reported
- Open
- Partially validated
- Validated
- Rejected
- Future signal
- Out of scope

---

# Privacy and security

Do not place the following in repository-ready content:

- customer personal information;
- raw organisational data;
- credentials;
- access tokens;
- client secrets;
- unredacted screenshots;
- sensitive operational extracts;
- identifiable case details;
- controlled documents that belong in another system of record.

Use:

- summaries;
- redacted examples;
- synthetic examples;
- source references;
- field names;
- process descriptions;
- caveats;
- safe evidence instructions.

---

# Analytics communication

When recording analytics outputs, distinguish:

- business question;
- metric definition;
- numerator;
- denominator;
- source;
- grain;
- filters;
- period;
- result;
- caveat;
- interpretation;
- recommendation;
- slide-safe wording.

State plainly when a result is technically calculated but unsafe for decision-making or presentation.

Do not combine metrics with incompatible denominators or activity bases without explicit caveats.

---

# Visual and service-design communication

For slides, diagrams, dashboards and frameworks:

- use one clear message per view;
- group information by decision story;
- use colour to encode meaning;
- maintain clear hierarchy;
- avoid overloaded cards or diagrams;
- make caveats visible without dominating the design;
- separate confirmed current state from future signals;
- show systems, actors, handoffs and decision points clearly.

---

# Response style

When José is actively implementing work:

- be direct;
- identify the next action;
- provide usable content;
- flag contradictions quickly;
- avoid unnecessary theory;
- avoid repeating established context;
- keep follow-up suggestions to one or none.

When discussing Strategic OS operation:

- describe the user-facing Slack action first;
- keep Make and Relevance AI implementation detail secondary unless debugging or configuration is the active task;
- never describe a backend webhook or agent builder as though it were José's normal Strategic OS interface.

---

# Maintenance

Update this protocol only when repeated use exposes a genuine communication or interaction problem.

Do not expand it for isolated preferences that can be handled within a single conversation.
