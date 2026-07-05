# MCP Server Architecture

## Purpose

This framework defines how Strategic OS can use Model Context Protocol servers to connect AI agents with tools, files, data sources and workflows.

The goal is to make future tool access safer, clearer and more governed.

MCP servers should help Strategic OS agents retrieve, inspect or act on approved context without blurring source-of-truth boundaries, privacy rules or human approval requirements.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

MCP server architecture supports the North Star by making agent access to tools more structured, auditable and bounded.

## Core Principle

Connect agents to tools through explicit boundaries.

Do not give agents broad access just because access is technically possible.

Every MCP connection should define:

- purpose
- source system
- allowed actions
- prohibited actions
- data sensitivity
- human review points
- logging or traceability needs
- storage rules
- escalation triggers

## What MCP Servers Are For

MCP servers may allow Strategic OS agents to interact with external tools or sources in a structured way.

They may support:

- file retrieval
- repository inspection
- document search
- governed analytics access
- workflow triggers
- task lookup
- calendar context
- project context
- knowledge retrieval
- safe summaries
- source-aware decision support

They should not be treated as permission to automate decisions, communications or commitments.

## Strategic OS MCP Use Cases

Potential MCP use cases include:

- reading Strategic OS repo files
- checking whether a file exists
- retrieving template content
- retrieving agent specifications
- searching project folders
- reading approved analytics context
- retrieving source rules or metric caveats
- preparing daily or weekly operating views
- checking task or follow-up context
- supporting repository hygiene reviews
- supporting quarterly Strategic OS assessments

## MCP Server Categories

| Category | Purpose | Example Use |
| --- | --- | --- |
| Repository MCP | Access Strategic OS files | Read templates, frameworks and agent specs |
| File Search MCP | Search approved documents | Retrieve safe project or reference context |
| Analytics MCP | Query governed analytical sources | Support metric interpretation with caveats |
| Workflow MCP | Trigger approved workflows | Start review prompts or low-risk reminders |
| Calendar MCP | Retrieve planning context | Prepare daily briefing inputs |
| Task MCP | Retrieve delivery context | Check open tasks or blockers |
| Communication MCP | Draft or review messages | Prepare text for human review only |

## Source-Of-Truth Rules

MCP servers must respect existing source-of-truth boundaries.

| Information Type | Source Of Truth |
| --- | --- |
| Strategic OS structure | GitHub |
| Agent specifications | GitHub |
| Reusable templates | GitHub |
| Reusable frameworks | GitHub |
| Official organisational documents | Official document system |
| Customer records | Official customer system |
| Delivery tasks | Jira or official delivery system |
| Communication records | Teams, email or calendar |
| Approved reporting | Power BI or governed reporting platform |
| Governed data interrogation | Databricks, Genie or approved data platform |

MCP access should not turn Strategic OS into a shadow copy of any source system.

## Access Rules

Before enabling or using an MCP server, define:

### Purpose

What is this server for?

### Data Scope

What sources can it access?

### Action Scope

What actions can it perform?

### Read Boundary

What can it read?

### Write Boundary

What can it write or change?

### Human Review Boundary

What requires explicit approval?

### Storage Boundary

What can be stored in Strategic OS?

### Sensitivity Level

What sensitivity level applies?

Use these levels:

- public
- personal
- internal-safe
- sensitive
- restricted

## Allowed Actions

MCP-connected agents may be allowed to:

- read approved files
- search approved sources
- retrieve relevant context
- summarise safe material
- compare files
- check for missing files
- inspect file structure
- prepare draft outputs
- identify caveats
- identify human-review needs
- recommend storage locations
- trigger low-risk reminders where approved

Allowed actions should be documented per server.

## Prohibited Actions

MCP-connected agents must not:

- access sources without permission
- copy raw confidential material into Strategic OS
- store customer-level records
- store governed datasets
- send messages without approval
- change calendar events without approval
- make commitments
- approve decisions
- write to source systems without explicit workflow controls
- bypass official governance
- hide uncertainty or caveats
- treat retrieved context as automatically safe to store
- use access to infer private stakeholder motives

## Human Approval Required

Human approval is required before an MCP-connected agent:

- sends communication
- changes a calendar event
- creates or changes a commitment
- escalates an issue
- stores sensitive information
- writes to an external system
- uses governed data in a recommendation
- shares executive-facing material
- acts on stakeholder-sensitive context
- treats an output as approved
- uses confidential organisational content outside its original context

## Repository MCP Rules

A repository MCP may support Strategic OS repo work.

It may:

- read files when asked
- check file existence
- compare current content with proposed content
- identify missing checklist files
- inspect folder structure
- support repository hygiene review
- support end-of-day completion passes

It must not:

- check the repository repeatedly without need during an active working sequence
- update README files unless explicitly requested
- create duplicate files
- commit changes without human approval
- treat stale local assumptions as verified repo state
- expand structure beyond the checklist without a genuine gap

During repeated `3` prompts, repository access should follow the working-session rule:

- check at the start of the session or when explicitly asked
- continue from established repo state
- re-check only when needed to avoid a duplicate, contradiction or incorrect file operation

## Analytics MCP Rules

An analytics MCP may support governed data interpretation.

It may:

- retrieve approved metric definitions
- retrieve source rules
- retrieve metric caveats
- support analytical summaries
- identify data quality concerns
- distinguish governed metrics from contextual signals
- prepare decision-support evidence for review

It must not:

- copy raw datasets into Strategic OS
- store customer-level rows
- treat exploratory outputs as official reporting
- omit caveats
- bypass human review
- present contextual signals as governed truth
- generate performance claims without source and caveat review

Store analytics MCP guidance in:

`11_analytics/[domain]/`

## Workflow MCP Rules

A workflow MCP may support low-risk orchestration.

It may:

- trigger review prompts
- create reminders
- route safe summaries
- start an approved agent workflow
- notify the user that review is needed
- support daily or weekly cadence prompts

It must not:

- send stakeholder communication without approval
- create commitments
- escalate issues externally
- copy sensitive material between systems
- automatically store raw tool outputs
- make prioritisation decisions
- bypass human review points

## Calendar MCP Rules

A calendar MCP may support operating awareness.

It may:

- read approved calendar context
- identify meeting preparation needs
- identify capacity risks
- support daily briefings
- suggest focus-protection actions
- identify follow-up timing

It must not:

- accept meetings
- decline meetings
- move meetings
- cancel meetings
- contact attendees
- commit the user to availability
- infer sensitive context from calendar titles without confirmation

## Communication MCP Rules

A communication MCP may support drafting and review.

It may:

- draft messages for review
- summarise a communication need
- identify tone risks
- identify stakeholder sensitivity
- prepare follow-up options
- recommend human review

It must not:

- send messages
- imply that a message has been sent
- make commitments
- apologise or accept responsibility on behalf of the user
- state final positions without approval
- store private threads in Strategic OS
- copy sensitive communications into repo files

## Task Or Delivery MCP Rules

A task or delivery MCP may support visibility of work.

It may:

- read approved task summaries
- identify blockers
- support follow-up tracking
- identify delivery dependencies
- prepare project status summaries
- support weekly operating reviews

It must not:

- duplicate full delivery records
- change task ownership
- change deadlines
- close tasks
- assign work to others
- store full issue records in Strategic OS
- copy sensitive comments from delivery tools

## MCP Server Design Template

Use this structure when defining a new MCP server.

### Server Name

[Name]

### Purpose

[What the server supports]

### Connected Tool Or Source

[Tool or system]

### Allowed Inputs

[What the agent may read]

### Allowed Outputs

[What the agent may produce]

### Allowed Actions

[What the agent may do]

### Prohibited Actions

[What the agent must not do]

### Sensitivity Level

[Public / Personal / Internal-safe / Sensitive / Restricted]

### Human Review Triggers

[What requires approval]

### Storage Rules

[What may be stored in Strategic OS]

### Logging Or Traceability

[What should be traceable]

### Related Agents

[Relevant Strategic OS agents]

### Related Templates

[Relevant Strategic OS templates]

### Failure Modes

[What could go wrong]

## Agent Routing

| Need | Agent |
| --- | --- |
| Interpret retrieved context | Sensemaking Agent |
| Assess stakeholder implications | Stakeholder Journey Agent |
| Decide whether to ship or stop output | Shipping Coach |
| Convert work into career evidence | Career Architect |
| Coordinate daily or weekly operating use | Chief of Staff Agent |
| Interpret governed data | Domain Analytical Agent |

## Review Checklist

Before enabling or using an MCP server, check:

- Is the purpose clear?
- Is the source of truth clear?
- Is the data scope limited?
- Are allowed actions documented?
- Are prohibited actions documented?
- Are human review triggers clear?
- Are privacy and retention rules followed?
- Are governed data boundaries protected?
- Is sensitive information excluded or abstracted?
- Is the server useful enough to maintain?
- Does the workflow support the Strategic OS North Star?

## Success Measures

MCP server architecture is working when:

- agents access only approved sources
- source-of-truth boundaries remain clear
- human approval points are respected
- sensitive material is not copied into Strategic OS
- analytics outputs include caveats
- repository work is faster without becoming unsafe
- workflow automation reduces drag without creating commitments
- agents remain within their autonomy levels
- users can understand what each server can and cannot do

## Failure Modes

MCP server architecture is failing if:

- agents gain broad access without clear purpose
- sensitive information is copied into GitHub
- automation sends or escalates communication without approval
- governed data is treated as final without review
- source systems are duplicated
- repository checks happen unnecessarily during repeated work
- agents make commitments through connected tools
- tool access creates false authority
- users cannot tell what an agent has accessed or changed
- the architecture creates more risk than leverage

## Minimal Use Rule

Use the fewest MCP servers needed.

Give each server the narrowest useful access.

Prefer read-only access unless a write action is clearly necessary, approved and governed.

Connect tools to improve judgement, not to bypass it.
