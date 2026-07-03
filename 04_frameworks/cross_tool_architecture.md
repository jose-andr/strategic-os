# Cross-Tool Architecture

## Purpose

This framework defines how Strategic OS connects across tools.

Strategic OS is not intended to make GitHub do everything.

Each tool has a role.

The purpose of this framework is to clarify:

- what each tool is for
- what each tool should not be used for
- where information should live
- how agents should interact with tools
- how privacy, governance and source-of-truth boundaries are maintained
- how Chief of Staff and analytics workflows can operate safely

## Core Principle

Use each tool for its strongest role.

Do not duplicate source systems.

Strategic OS should connect tools through clear boundaries, not blur them.

GitHub stores reusable knowledge.

Official organisational systems store official organisational records.

Governed data tools remain the source of truth for governed metrics and analysis.

## Tool Role Summary

| Tool | Primary Role | Boundary |
| --- | --- | --- |
| GitHub | Strategic OS knowledge repository | Stores reusable knowledge, not raw organisational records |
| Relevance AI | Agent memory and reasoning layer | Supports reasoning, but does not become the source of truth |
| Make.com | Workflow orchestration | Moves signals and triggers, but does not own decisions |
| Slack | User interface and lightweight interaction | Supports interaction, not permanent recordkeeping |
| Databricks Genie | Governed data interrogation | Answers governed data questions with caveats |
| Power BI | Reporting source of truth | Holds approved dashboards and reporting views |
| SharePoint / OneDrive | Organisational document storage | Stores official documents and governed files |
| Teams / Email / Calendar | Operational coordination | Supports communication, scheduling and follow-up |
| Miro | Visual collaboration and system mapping | Supports visual thinking and collaboration |
| Jira | Delivery tracking | Tracks delivery work, not strategic knowledge architecture |

## GitHub

## Role

GitHub is the Strategic OS knowledge repository.

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

## GitHub Should Not Store

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

## GitHub Source-Of-Truth Role

GitHub is the source of truth for:

- Strategic OS structure
- Strategic OS frameworks
- agent specifications
- reusable templates
- operating cadence
- privacy and governance rules
- knowledge architecture
- safe patterns and lessons

GitHub is not the source of truth for:

- organisational records
- customer records
- governed dashboards
- legal or HR documents
- operational delivery records
- formal approval records

## Relevance AI

## Role

Relevance AI may act as an agent memory and reasoning layer.

It may support:

- agent orchestration
- prompt execution
- memory retrieval
- reasoning workflows
- task-specific agent support
- structured outputs
- Chief of Staff routines
- sensemaking workflows
- career evidence support
- stakeholder pattern support

## Boundary

Relevance AI should not become an uncontrolled store of sensitive organisational material.

It should follow the same privacy and governance principles as Strategic OS.

It may use context to reason, but durable knowledge should be stored only when it is safe, useful and intentionally retained.

## Appropriate Use

Use Relevance AI for:

- running Strategic OS agents
- generating structured drafts
- synthesising safe summaries
- creating daily briefings
- helping triage inputs
- supporting decision-framing workflows
- routing tasks to the right agent

## Avoid

Avoid using Relevance AI to store:

- raw customer records
- confidential organisational source material
- private stakeholder commentary
- governed data extracts
- sensitive operational records
- material that should remain in official systems

## Make.com

## Role

Make.com may act as the workflow orchestration layer.

It can help connect tools and automate low-risk workflows.

It may support:

- scheduled triggers
- task routing
- notification flows
- capturing user-approved inputs
- moving safe summaries between tools
- prompting agent workflows
- creating reminders
- coordinating Chief of Staff routines

## Boundary

Make.com can move signals.

It should not make strategic decisions.

It should not create commitments.

It should not move sensitive material into GitHub or other tools without explicit approval and privacy checks.

## Appropriate Use

Use Make.com for:

- triggering a daily briefing workflow
- reminding the user to review the inbox
- sending a prompt to an agent
- creating a lightweight follow-up reminder
- routing a safe summary to the right place
- notifying the user that review is required

## Avoid

Avoid using Make.com to:

- automatically send stakeholder communications
- commit changes without review
- copy confidential content between systems
- make prioritisation decisions
- escalate issues without approval
- bypass governance workflows

## Slack

## Role

Slack may act as a lightweight user interface for Strategic OS interactions.

It can support:

- quick prompts
- daily briefing delivery
- agent interaction
- reminders
- follow-up nudges
- review prompts
- quick capture of safe notes

## Boundary

Slack should not be treated as the permanent knowledge repository.

Useful material should be reviewed and, if appropriate, converted into a safe Strategic OS file.

## Appropriate Use

Use Slack for:

- receiving a daily briefing
- asking an agent for a summary
- capturing a quick thought
- receiving reminders
- confirming next actions
- lightweight triage

## Avoid

Avoid using Slack to store:

- long-term decision history
- sensitive stakeholder commentary
- confidential project context
- raw organisational material
- governed data outputs

## Databricks Genie

## Role

Databricks Genie may act as a governed data interrogation layer.

It can help answer analytical questions from approved data sources.

It may support:

- metric exploration
- governed data interrogation
- analytical interpretation
- domain-specific data agents
- source-aware responses
- caveated metric review
- data quality questions

## Boundary

Databricks Genie is for governed data interrogation.

GitHub may store source rules, caveats and interpretation guidance.

GitHub should not store raw query outputs, governed datasets or customer-level data.

## Appropriate Use

Use Databricks Genie for:

- asking metric questions
- exploring source-defined datasets
- reviewing trends
- checking data caveats
- identifying analytical limitations
- supporting governed domain-agent workflows

## Avoid

Avoid copying into GitHub:

- raw Genie outputs
- customer-level tables
- restricted data
- query result exports
- screenshots of restricted analytics
- sensitive metric breakdowns

## Domain Analytics Pattern

Domain-specific analytics agents may live under:

`11_analytics/`

Example:

`11_analytics/service-account/`

A mature analytics domain may include:

- `agent_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `genie_context.md`
- `metric_caveats.md`
- `source_rules.md`

## Power BI

## Role

Power BI is the reporting source of truth for approved dashboards and reporting views.

It may support:

- performance reporting
- executive dashboards
- operational dashboards
- approved metric views
- trend monitoring
- scorecards
- visual reporting

## Boundary

Power BI should remain the source of truth for dashboard views.

Strategic OS may document how to interpret metrics, but should not duplicate dashboard data.

## Appropriate Use

Use Power BI for:

- approved reporting
- metric review
- dashboard interpretation
- performance monitoring
- visual trends
- decision support

## Strategic OS May Store

Strategic OS may store:

- metric definitions
- dashboard interpretation notes
- caveats
- review questions
- decision-support framing
- links or references to official dashboards, where safe

## Avoid

Avoid storing:

- dashboard screenshots
- raw exported data
- copied sensitive tables
- governed metrics without caveats
- restricted report extracts

## SharePoint And OneDrive

## Role

SharePoint and OneDrive are organisational document stores.

They may hold:

- official project documents
- organisational records
- governed files
- working documents
- approved artefacts
- collaboration files
- formal records

## Boundary

Official documents should remain in official organisational storage.

Strategic OS may store a privacy-safe summary, lesson or decision logic derived from the work, but should not duplicate confidential documents.

## Appropriate Use

Use SharePoint and OneDrive for:

- official project files
- working documents
- formal artefacts
- stakeholder-approved materials
- governed collaboration
- records requiring organisational retention

## Strategic OS May Store

Strategic OS may store:

- safe summaries
- lessons learned
- framework implications
- decision logic
- reusable patterns
- links or references to official locations, where appropriate and safe

## Avoid

Avoid copying into GitHub:

- confidential documents
- draft organisational papers
- sensitive project files
- official records
- private stakeholder comments
- internal-only content that should remain governed

## Teams, Email And Calendar

## Role

Teams, email and calendar are operational coordination tools.

They support:

- meetings
- scheduling
- communication
- follow-ups
- operational decisions
- stakeholder coordination
- day-to-day commitments

## Boundary

These tools contain communication records and operational context.

Strategic OS should not copy private threads or raw communications into GitHub.

## Appropriate Use

Use these tools for:

- stakeholder communication
- meeting coordination
- calendar planning
- follow-up tracking
- operational commitments
- real-time collaboration

## Strategic OS May Store

Strategic OS may store:

- action summaries
- meeting preparation notes
- decision points
- follow-up patterns
- abstracted stakeholder patterns
- lessons learned
- safe daily briefing notes

## Avoid

Avoid storing:

- raw email threads
- private chat messages
- confidential meeting transcripts
- sensitive stakeholder commentary
- identifiable private comments
- calendar details that expose sensitive context

## Miro

## Role

Miro is a visual collaboration and system mapping workspace.

It may support:

- journey mapping
- service blueprinting
- ecosystem mapping
- workshop collaboration
- system diagrams
- stakeholder mapping
- opportunity mapping
- visual sensemaking

## Boundary

Miro may contain collaborative working material.

Strategic OS should store only safe summaries, exported public-safe artefacts or reusable patterns.

## Appropriate Use

Use Miro for:

- collaborative mapping
- visual facilitation
- system exploration
- workshop artefacts
- service design artefacts
- co-design activities
- visual thinking

## Strategic OS May Store

Strategic OS may store:

- safe map summaries
- reusable mapping patterns
- facilitation lessons
- design principles
- decision implications
- links to official boards, where appropriate and safe

## Avoid

Avoid storing:

- screenshots with sensitive information
- identifiable customer comments
- private stakeholder notes
- raw workshop data
- confidential board exports

## Jira

## Role

Jira is the delivery tracking system.

It may support:

- backlog management
- delivery tasks
- sprint planning
- issue tracking
- delivery status
- technical dependencies
- implementation progress

## Boundary

Jira tracks delivery.

Strategic OS captures strategic learning, decision logic and reusable patterns.

Do not duplicate Jira tickets into GitHub.

## Appropriate Use

Use Jira for:

- delivery tracking
- task ownership
- ticket status
- sprint planning
- blockers
- implementation dependencies

## Strategic OS May Store

Strategic OS may store:

- delivery lessons
- decision summaries
- project patterns
- risks and caveats
- shipping recommendations
- reusable delivery heuristics

## Avoid

Avoid storing:

- full ticket copies
- sensitive operational details
- private implementation notes
- delivery records that belong in Jira
- confidential attachments

## Chief Of Staff Tool Boundaries

The Chief of Staff Agent may interact conceptually with multiple tools, but must respect boundaries.

## May Support

The Chief of Staff Agent may help:

- prepare daily briefings
- summarise user-provided context
- identify follow-ups
- identify decisions required
- suggest calendar preparation
- surface risks or blockers
- recommend what should be reviewed
- suggest where safe notes should be stored

## Must Not Do Without Approval

The Chief of Staff Agent must not independently:

- send messages
- escalate issues
- change calendar commitments
- create stakeholder obligations
- copy sensitive material between tools
- store confidential source data
- commit repository changes
- make formal decisions

## Analytics Agent Tool Boundaries

Analytics and Databricks / Genie agents require stricter source rules.

They should:

- identify source hierarchy
- label caveats
- distinguish governed metrics from contextual signals
- avoid copying raw data into GitHub
- use domain-specific rules where available
- recommend human review where confidence is uncertain

They must not:

- treat contextual signals as governed truth
- export sensitive data into Strategic OS
- hide metric caveats
- make operational decisions without human review
- answer beyond their source scope

## Cross-Tool Flow Patterns

## Daily Briefing Flow

Possible flow:

1. Calendar, task and user-provided context are reviewed.
2. Chief of Staff Agent prepares a daily briefing.
3. User reviews the briefing.
4. Safe reusable notes may be stored in Strategic OS.
5. Sensitive operational detail remains in source tools.

Output may use:

`10_templates/daily_briefing.md`

## Analytics Question Flow

Possible flow:

1. User asks a metric or analytics question.
2. Databricks Genie or relevant domain agent checks governed sources.
3. Output includes source, caveat and confidence.
4. Strategic OS stores only safe interpretation guidance or lessons.
5. Raw data remains in governed tools.

Output may relate to:

`11_analytics/`

## Project Learning Flow

Possible flow:

1. Project work happens in official tools.
2. Strategic OS captures safe summaries, decisions and lessons.
3. Project folder stores reusable knowledge.
4. Official records remain in SharePoint, Jira, Power BI or other systems.
5. Career evidence is abstracted and stored safely where useful.

Output may relate to:

`08_projects/`

or:

`01_career/`

## Opportunity Capture Flow

Possible flow:

1. Signal emerges from meeting, data, stakeholder conversation or project work.
2. Signal is captured safely in `00_inbox/`.
3. Opportunity is assessed using the strategic opportunity pipeline.
4. Mature opportunity is converted into project, decision brief, career evidence or thought leadership.
5. Sensitive source detail remains outside Strategic OS.

Output may relate to:

`02_strategic_opportunities/`

## Source Of Truth Rules

Use these source-of-truth rules.

| Information Type | Source Of Truth |
| --- | --- |
| Strategic OS frameworks | GitHub |
| Agent specifications | GitHub |
| Reusable templates | GitHub |
| Official organisational documents | SharePoint / OneDrive or approved organisational storage |
| Operational communication | Teams / Email / Calendar |
| Approved reporting | Power BI |
| Governed data interrogation | Databricks Genie or governed data platform |
| Delivery tracking | Jira |
| Visual collaboration boards | Miro |
| Strategic OS interaction layer | Slack or selected interface |
| Workflow automation | Make.com |
| Agent reasoning layer | Relevance AI |

## Review Before Moving Information Between Tools

Before moving information from one tool to another, ask:

- What is the source of truth?
- Is this information safe to move?
- Is this raw material or reusable knowledge?
- Does this include customer-level information?
- Does this include confidential organisational content?
- Does this include sensitive stakeholder commentary?
- Does the destination tool have the right governance level?
- Should this be summarised instead of copied?
- Is human review required before transfer?

## Privacy And Governance Rules

Follow:

`04_frameworks/privacy_governance_retention.md`

Core rules:

- keep raw organisational source material in official systems
- keep governed data in governed tools
- store reusable knowledge in Strategic OS
- abstract sensitive stakeholder patterns
- mark assumptions clearly
- separate evidence from interpretation
- do not copy operational data into GitHub
- review sensitive files before committing

## Success Measures

The cross-tool architecture is working when:

- each tool has a clear role
- source-of-truth boundaries are respected
- Strategic OS does not duplicate official systems
- agents know what they can and cannot access or store
- Chief of Staff workflows reduce operational drag safely
- analytics agents preserve source caveats
- useful learning moves into Strategic OS without sensitive detail
- official records remain in official systems
- cross-tool automation supports judgement without replacing it

## Failure Modes

The architecture is failing if:

- GitHub becomes a shadow record system
- raw organisational data is copied into Strategic OS
- agents move sensitive material without review
- Slack becomes the knowledge repository
- Power BI screenshots replace governed reporting
- Databricks outputs are copied without caveats
- SharePoint documents are duplicated unnecessarily
- Jira tasks are copied into project folders
- tool boundaries become unclear
- automation creates commitments without human approval

## Review Rhythm

Review this framework during quarterly Strategic OS QA assessment.

Update it when:

- a new tool is added
- an agent gains access to another system
- a workflow becomes automated
- governance expectations change
- a new analytics domain is added
- tool boundaries become unclear

## Minimal Use Rule

Move the learning, not the record.

Move the pattern, not the private detail.

Move the decision logic, not the confidential source.

Use tools together, but keep their boundaries clear.
