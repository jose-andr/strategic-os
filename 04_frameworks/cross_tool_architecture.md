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
- how Obsidian and GitHub work together
- how privacy, governance and source-of-truth boundaries are maintained
- how Chief of Staff and analytics workflows can operate safely

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Cross-tool architecture supports the North Star by making sure information, decisions, data, artefacts and actions live in the right place.

## Core Principle

Use each tool for its strongest role.

Do not duplicate source systems.

Do not move sensitive information between tools without a clear reason, explicit review and safe abstraction.

Strategic OS should connect tools through clear boundaries, not blur them.

The operating distinction is:

> Slack is where the user interacts with agents.  
> Obsidian is where the user navigates and develops Strategic OS knowledge.  
> GitHub is where Strategic OS knowledge is governed and version controlled.

Official organisational systems remain authoritative for organisational records and governed data.

## Tool Role Summary

| Tool | Primary Role | Boundary |
|---|---|---|
| Slack | Agent interaction interface | Supports prompts, briefings, approvals and lightweight capture; not permanent knowledge storage |
| Obsidian | Strategic workspace and knowledge interface | Supports authoring, linking, navigation and visual thinking; does not replace GitHub authority |
| GitHub | Authoritative Strategic OS repository | Stores reusable Strategic OS knowledge, not raw organisational records |
| Relevance AI | Agent memory and reasoning layer | Supports reasoning but does not become the source of truth |
| Make.com | Workflow orchestration | Moves approved signals and triggers but does not own decisions |
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
→ GitHub
↔ Obsidian

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

## Obsidian

### Role

Obsidian is the primary human workspace for Strategic OS knowledge.

It sits over the Markdown repository and supports:

- navigation
- backlinks
- linked-note exploration
- authoring
- search
- strategic synthesis
- service and systems thinking
- visual canvases
- reusable templates
- discovery of relationships across decisions, evidence, stakeholders, patterns and lessons

### Source-Of-Truth Boundary

Obsidian is a workspace, not a separate source of truth.

GitHub remains authoritative for Strategic OS structure and durable knowledge.

Preferred pattern:

- open the GitHub-backed repository directly as an Obsidian vault; or
- use a controlled sync method that preserves the GitHub repository as authoritative.

Do not maintain a second divergent copy of Strategic OS in a separate Obsidian-only vault.

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

## GitHub

### Role

GitHub is the authoritative Strategic OS knowledge repository.

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

## Miro

Miro supports collaborative visual work such as:

- journey mapping
- service blueprinting
- ecosystem mapping
- workshops
- system diagrams
- stakeholder mapping

Strategic OS may retain simplified, privacy-safe reusable patterns or summaries, not uncontrolled board exports.

## Jira

Jira tracks delivery activity.

Strategic OS stores strategic knowledge, decision logic and reusable learning.

Use links and summaries rather than duplicating issue records.

## Human-In-The-Loop Writeback Rule

No conversation, agent memory, Obsidian note or automated workflow becomes durable Strategic OS knowledge solely because it exists.

Before durable writeback:

1. identify the reusable value
2. remove or abstract sensitive source material
3. distinguish evidence, assumption and interpretation
4. identify the correct repository location
5. review the proposed content
6. commit or approve the GitHub-backed Markdown change

Agents may draft changes.

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

Outputs may include:

- daily briefing
- weekly operating review
- admin task list
- follow-up tracker
- meeting preparation note
- decision-required list
- focus protection recommendation

The Chief of Staff Agent must not send messages, change calendar events, accept meetings, contact stakeholders, make commitments, escalate issues externally, store sensitive raw source material or treat temporary operating notes as durable knowledge.

## Analytics Workflows

Domain Analytical Agents may use governed analytical tools to support decision-making.

Inputs may include:

- governed metric definitions
- approved dashboard views
- source rules
- metric caveats
- data quality notes
- user-approved analytical questions
- safe summaries of analytical findings

Outputs may include:

- analytical summary
- metric caveat note
- source rules
- Genie context
- agent review prompt
- agent consistency check
- data quality note
- decision-support evidence summary

Analytical agents must not treat exploratory output as official reporting, copy raw datasets into GitHub or Obsidian, store customer-level data, omit caveats or bypass human review.

## Information Movement Rules

Before moving information between tools:

1. **Identify the source** — Where did the information come from?
2. **Identify the destination** — Where is it going?
3. **Identify the purpose** — Why does it need to move?
4. **Identify sensitivity** — Is it public, personal, internal-safe, sensitive or restricted?
5. **Convert if needed** — Can it be abstracted, summarised or generalised?
6. **Review before durable storage** — Does a human need to approve it?
7. **Store or discard** — Should it be retained, kept temporarily or discarded?

## Cross-Tool Storage Rules

| Source | May Become Durable Strategic OS Knowledge | Do Not Retain |
|---|---|---|
| Slack | Reviewed safe summaries, approved decisions, reusable prompts | Raw threads, sensitive conversation history |
| Obsidian | Reviewed Markdown intended for repository retention | Uncontrolled local-only sensitive material or divergent copies |
| Relevance AI | Reviewed safe summaries, prompts and agent rules | Unreviewed memory or sensitive source material |
| Make.com | Approved workflow rules and safe metadata patterns | Sensitive payloads or uncontrolled execution history |
| Databricks / Genie | Definitions, caveats, source rules, interpretation | Raw data, customer records, sensitive query results |
| Power BI | Metric interpretation, caveats, safe references | Copied dashboards, raw exports |
| SharePoint / OneDrive | Safe summaries, patterns, references | Confidential or official documents |
| Teams / Email / Calendar | Abstracted actions, decision context, reusable patterns | Raw private communications |
| Miro | Simplified reusable patterns and diagrams | Sensitive board exports |
| Jira | Delivery lessons and decision implications | Full backlog or issue records |

## Final Rule

The Strategic OS architecture should remain simple:

**Interact in Slack. Think and navigate in Obsidian. Govern durable knowledge in GitHub. Keep official records in official systems. Keep humans accountable for decisions and writeback.**
