# Cross-Tool Architecture

## Purpose

This framework defines how Strategic OS connects across tools.

Strategic OS is not intended to make one tool do everything.

Each tool has a distinct role.

The purpose of this framework is to clarify:

- what each tool is for
- what each tool should not be used for
- where information should live
- how agents should interact with tools
- how GitHub web and optional Obsidian workspaces fit together
- how enterprise AI and capture tools fit without becoming new sources of truth
- how privacy, governance and source-of-truth boundaries are maintained
- how Chief of Staff and analytics workflows can operate safely
- how architecture can minimise recurring human administration

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Cross-tool architecture supports the North Star by making sure information, decisions, data, artefacts and actions live in the right place.

## Core Principle

Use each tool for its strongest role.

Do not duplicate source systems.

Do not move sensitive information between tools without a clear reason, explicit review and safe abstraction.

Strategic OS should connect tools through clear boundaries, not blur them.

The operating distinction is:

> Slack is where the user primarily interacts with Strategic OS agents.  
> GitHub web is the primary cloud-accessible Strategic OS workspace.  
> GitHub is where Strategic OS knowledge is governed and version controlled.  
> Obsidian desktop and mobile are optional enhanced workspaces over Strategic OS Markdown.  
> Microsoft 365 Copilot operates inside the approved enterprise information environment where enabled.  
> Organisational systems remain authoritative for organisational records and governed data.

Strategic OS must remain fully usable without Obsidian.

PLAUD is an evaluation candidate rather than an assumed architectural component.

## Low-Management Architecture Principle

Prefer architecture that is complex once and simple to run.

Initial installation, configuration or integration may require significant thinking when it creates a stable operating model afterwards.

Prefer systems that minimise:

- manual synchronisation
- duplicate filing
- repeated tagging
- conflict resolution
- manual information transfer
- recurring configuration
- brittle handoffs
- routine administration required only to keep the architecture functioning

Do not add a tool unless its recurring value exceeds its ongoing management burden.

## Tool Role Summary

| Tool | Primary Role | Boundary |
|---|---|---|
| Slack | Primary Strategic OS agent interaction interface | Supports prompts, briefings, approvals and lightweight capture; not permanent knowledge storage |
| GitHub / GitHub web | Authoritative Strategic OS repository and primary cloud workspace | Stores reusable Strategic OS knowledge, not raw organisational records |
| Obsidian desktop / mobile | Optional enhanced Markdown workspace | Improves navigation, linking and visual thinking without becoming a second source of truth |
| Relevance AI | Agent memory and reasoning layer | Supports reasoning but does not become the source of truth |
| Make.com | Workflow orchestration | Moves approved signals and triggers but does not own decisions |
| Microsoft 365 Copilot | Enterprise AI layer | Works with authorised organisational knowledge and approved workflows; organisational systems retain authority |
| PLAUD | Optional conversation-capture capability to evaluate | Must not be used for organisational content without appropriate approval, consent and governance |
| Databricks Genie | Governed data interrogation | Answers governed data questions with caveats |
| Power BI | Reporting source of truth | Holds approved dashboards and reporting views |
| SharePoint / OneDrive | Organisational document storage | Stores official documents and governed files |
| Teams / Email / Calendar | Operational coordination | Supports communication, scheduling and follow-up |
| Miro | Visual collaboration and system mapping | Supports collaborative visual thinking |
| Jira | Delivery tracking | Tracks delivery work, not strategic knowledge architecture |

## Core Strategic OS Flow

José
→ Slack or another approved interaction surface
→ Strategic OS agent
→ approved reasoning, orchestration and source tools
→ decision-ready response
→ human review
→ safe reusable knowledge
→ GitHub-backed Markdown
→ optional Obsidian navigation and visual thinking
→ reuse

The system should optimise for fast interaction while keeping durable knowledge controlled.

## Slack

### Role

Slack is the preferred lightweight conversational interface for Strategic OS agents where the integration is available.

It may support:

- quick prompts
- agent interaction
- daily briefing delivery
- reminders
- follow-up nudges
- review prompts
- lightweight approvals
- quick capture of safe notes

### Boundary

Slack is not the permanent Strategic OS knowledge repository.

A useful Slack exchange becomes durable knowledge only when it has been reviewed, abstracted where necessary and intentionally stored in the GitHub-backed Markdown repository.

### Appropriate Use

Use Slack for:

- asking an agent to analyse or synthesise an issue
- receiving a decision-ready summary
- confirming or rejecting a proposed next action
- receiving a daily briefing
- capturing a safe strategic signal
- asking for a repository-ready draft
- triggering a low-risk workflow

### Avoid

Avoid using Slack to store:

- long-term decision history
- sensitive stakeholder commentary
- confidential project context
- raw organisational material
- governed data outputs
- customer records
- credentials
- formal approvals that belong in official systems

## GitHub

### Role

GitHub is the authoritative Strategic OS knowledge repository.

GitHub web is the primary cloud-accessible workspace for accessing, reviewing and maintaining Strategic OS when local applications are unavailable.

It stores:

- frameworks
- templates
- agent specifications
- decision logic
- lessons learned
- privacy-safe summaries
- reusable patterns
- career-safe evidence
- opportunity indexes
- project folder structures
- analytics interpretation guidance
- system architecture documentation

### GitHub Should Not Store

GitHub should not store:

- customer-level records
- raw organisational documents
- confidential extracts
- governed datasets
- raw operational data
- private employee information
- sensitive stakeholder commentary
- access credentials
- system exports
- screenshots of restricted systems
- raw Databricks or Genie outputs
- copied Power BI data
- raw email, Teams or Slack threads
- raw meeting recordings or transcripts
- full Jira issue records

### GitHub Source-Of-Truth Role

GitHub is the source of truth for:

- Strategic OS structure
- Strategic OS frameworks
- agent specifications
- reusable templates
- operating cadence
- privacy and governance rules
- knowledge architecture
- safe patterns and lessons

GitHub is not the source of truth for organisational records, customer records, governed dashboards, legal or HR documents, operational delivery records, formal approval records, or financial, procurement and compliance records.

## Obsidian

### Role

Obsidian desktop and mobile are optional enhanced workspaces over Strategic OS Markdown.

They may support:

- navigation
- backlinks
- linked-note exploration
- authoring
- search
- strategic synthesis
- service and systems thinking
- visual canvases
- reusable templates
- reflection
- discovery of relationships across decisions, evidence, stakeholders, patterns and lessons

### Source-Of-Truth Boundary

Obsidian is a workspace, not a separate source of truth.

GitHub remains authoritative for Strategic OS structure and durable knowledge.

Preferred pattern:

- open the GitHub-backed repository directly as an Obsidian vault where a supported local device is available; or
- use a controlled synchronisation method that preserves the GitHub repository as authoritative.

Do not maintain a second divergent copy of Strategic OS in a separate Obsidian-only vault.

Strategic OS must remain fully usable without Obsidian.

### Markdown Portability Rule

Strategic OS content must remain usable without Obsidian.

Obsidian-specific capabilities may enhance the workspace, but essential knowledge must remain readable as plain Markdown.

Use Obsidian features carefully:

- standard Markdown links are preferred where practical
- wiki links may be used when they do not create portability problems
- properties may support navigation and filtering
- Canvas or Excalidraw may support visual thinking
- plugin-dependent dashboards should supplement, not replace, durable Markdown content

### Appropriate Use

Use Obsidian for:

- navigating Strategic OS
- linking related decisions and frameworks
- developing reusable knowledge
- reviewing the inbox
- tracing relationships
- finding previous patterns
- preparing strategic thinking before agent interaction
- reviewing proposed agent outputs before repository retention
- visualising systems, services or stakeholder relationships
- mobile reading, capture and reflection when useful

### Avoid

Avoid using Obsidian to:

- create an uncontrolled shadow repository
- store raw organisational data
- store confidential documents
- retain customer-level information
- replace Jira for task management
- replace SharePoint or OneDrive for organisational records
- replace Databricks or Power BI as governed data sources
- rely on plugins that make essential knowledge inaccessible outside Obsidian
- introduce recurring manual reconciliation with GitHub

## Relevance AI

### Role

Relevance AI may act as an agent memory and reasoning layer.

It may support:

- agent orchestration
- prompt execution
- memory retrieval
- reasoning workflows
- structured outputs
- Chief of Staff routines
- sensemaking workflows
- career evidence support
- stakeholder pattern support

### Boundary

Relevance AI should not become an uncontrolled store of sensitive organisational material.

It may use context to reason, but durable Strategic OS knowledge should be retained only when safe, useful, reviewed and intentionally stored.

## Make.com

### Role

Make.com may act as the workflow orchestration layer.

It can support:

- scheduled triggers
- task routing
- notification flows
- capturing user-approved inputs
- moving safe summaries between tools
- prompting agent workflows
- creating reminders
- coordinating Chief of Staff routines

### Boundary

Make.com can move signals.

It should not make strategic decisions, create commitments, bypass governance or commit durable Strategic OS changes without appropriate review.

## Microsoft 365 Copilot

### Role

Microsoft 365 Copilot may act as the enterprise AI layer for authorised organisational work where the organisation has enabled and approved the relevant capabilities.

Potential uses include:

- summarising Teams meetings
- extracting actions, decisions and unresolved questions
- querying authorised organisational knowledge
- preparing meeting and stakeholder briefings
- supporting email, calendar and document administration
- supporting approved workflow automation
- reducing repetitive administrative work

### Boundary

Microsoft 365 Copilot operates inside the organisational information environment.

It does not change source-of-truth ownership.

Organisational records, documents, communications and governed data remain in their approved systems.

Strategic OS should receive only reviewed, privacy-safe abstraction where reusable strategic value exists.

Do not copy raw meeting transcripts, private communications or sensitive organisational content into Strategic OS.

### Evaluation Status

Treat specific Copilot capabilities and automations as discovery items until licensing, tenant configuration, permissions and organisational governance are confirmed.

## PLAUD

### Role

PLAUD may be evaluated as a portable conversation-capture layer for situations where approved enterprise meeting capture is unavailable or impractical.

Potential value may include:

- in-person stakeholder conversations
- workshops
- interviews
- site or frontline conversations
- personal verbal reflection
- structured extraction of actions, decisions and themes

### Boundary

PLAUD is not a confirmed Strategic OS component.

Do not use it for organisational conversations unless organisational approval, participant consent, privacy, information-security and records requirements are satisfied.

Raw recordings and transcripts should not be stored in Strategic OS.

Where approved capture produces reusable value, retain only the reviewed, privacy-safe abstraction appropriate for Strategic OS.

## Databricks Genie

### Role

Databricks Genie may act as a governed data interrogation layer.

It can support:

- metric exploration
- governed data interrogation
- analytical interpretation
- domain-specific data agents
- source-aware responses
- caveated metric review
- data quality questions

### Boundary

Databricks Genie is for governed data interrogation.

Strategic OS may store source rules, caveats, definitions and interpretation guidance.

Do not copy raw governed datasets, customer-level information or unsafe query outputs into Strategic OS.

## Power BI

Power BI is the reporting source of truth for approved dashboards and reporting views.

Strategic OS may store:

- metric definitions
- dashboard interpretation notes
- caveats
- review questions
- decision-support framing
- safe references to official dashboards

Strategic OS should not duplicate dashboard data or present exploratory interpretation as governed reporting.

## SharePoint And OneDrive

SharePoint and OneDrive are organisational document stores.

Official documents should remain there.

Strategic OS may retain only safe summaries, reusable patterns, decision logic and references where appropriate.

## Teams, Email And Calendar

These tools support operational communication, scheduling, follow-up and day-to-day commitments.

Strategic OS should not copy private threads or raw communications into the repository.

Agents may prepare messages or planning notes but must not make commitments or send communications without the appropriate human approval and organisational controls.

Microsoft 365 Copilot may support these environments where organisationally enabled, but source ownership remains unchanged.

## Miro

Miro supports visual collaboration, workshops, journey mapping, system mapping and shared exploration.

Strategic OS may retain reusable abstractions or patterns from Miro work, but official or sensitive workshop content should remain in the approved organisational environment.

## Jira

Jira is the delivery tracking system where organisationally used.

Use Jira for:

- delivery work
- tasks
- owners
- status
- dependencies
- sprint activity
- blockers

Strategic OS should not duplicate Jira as a task system.

Retain only durable decision context, reusable lessons or strategic patterns where useful.

## Cross-Tool Knowledge Rule

Temporary interaction does not equal durable knowledge.

Slack messages, Copilot outputs, PLAUD transcripts, Obsidian scratch notes, agent memory and workflow payloads are temporary working context unless intentionally promoted.

Humans decide whether they become durable knowledge.

## Chief Of Staff Workflows

The Chief of Staff Agent may use approved cross-tool signals to support coordination.

Safe inputs may include:

- calendar context
- user-provided meeting notes
- user-approved follow-up summaries
- safe task summaries
- project context
- reviewed inbox items
- non-sensitive operating signals
- approved Copilot-derived summaries where appropriate

Outputs may include:

- daily briefing
- weekly operating review
- admin task list
- follow-up tracker
- meeting preparation note
- decision-required list
- focus protection recommendation

The Chief of Staff Agent must not send messages, change calendar events, accept meetings, contact stakeholders, make commitments, escalate issues externally, store sensitive raw source material or treat temporary operating notes as durable knowledge without the required approval.

## Analytics Workflows

Domain Analytical Agents may use governed analytical tools to support decision-making.

Inputs may include:

- business question
- governed metric
- source rule
- grain
- filters
- numerator
- denominator
- caveat
- period
- safe contextual evidence

Outputs may include:

- caveated interpretation
- decision-support summary
- metric risk
- data quality note
- analytical question
- slide-safe wording

Raw governed data remains in the official analytical system.

## Tool And Architecture Evaluation Criteria

Evaluate new systems, applications and integrations against:

- strategic decision value
- stakeholder-alignment value
- evidence and source-of-truth clarity
- privacy, security and governance fit
- organisational approval
- device and browser accessibility
- interoperability
- portability
- automation potential
- duplication risk
- vendor dependency
- human-review requirements
- ongoing human management burden

### Management-Overhead Decision Rule

> Prefer complex-once, simple-to-run architecture over simple-to-start architecture that requires permanent manual maintenance.

A tool should not be added merely because it is capable or interesting.

Prefer the smallest architecture that delivers the required strategic value with the least recurring human administration.

## Architecture Review Questions

Review the architecture periodically and ask:

- Is each tool still doing a distinct job?
- Is GitHub still authoritative?
- Is Strategic OS fully usable without optional local applications?
- Are organisational systems still treated as systems of record?
- Are AI and capture tools operating inside appropriate governance boundaries?
- Are raw organisational records staying out of Strategic OS?
- Are agents supporting rather than replacing human judgement?
- Are workflows creating useful leverage?
- Is recurring management overhead proportionate to value?
- Can a tool, sync layer or workflow be removed without reducing strategic value?

Do not expand the architecture unless repeated real use exposes a genuine gap.
