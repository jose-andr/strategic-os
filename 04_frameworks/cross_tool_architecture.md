# Cross-Tool Architecture

## Purpose

This framework defines how Strategic OS connects across tools.

Strategic OS is not intended to make GitHub do everything.

Each tool has a role.

The purpose of this framework is to clarify:

* what each tool is for
* what each tool should not be used for
* where information should live
* how agents should interact with tools
* how privacy, governance and source-of-truth boundaries are maintained
* how Chief of Staff and analytics workflows can operate safely

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Cross-tool architecture supports the North Star by making sure information, decisions, data, artefacts and actions live in the right place.

## Core Principle

Use each tool for its strongest role.

Do not duplicate source systems.

Do not move sensitive information between tools without a clear reason, explicit review and safe abstraction.

Strategic OS should connect tools through clear boundaries, not blur them.

GitHub stores reusable Strategic OS knowledge.

Official organisational systems store official organisational records.

Governed data tools remain the source of truth for governed metrics and analysis.

## Tool Role Summary

| Tool                     | Primary Role                            | Boundary                                                    |
| ------------------------ | --------------------------------------- | ----------------------------------------------------------- |
| GitHub                   | Strategic OS knowledge repository       | Stores reusable knowledge, not raw organisational records   |
| Relevance AI             | Agent memory and reasoning layer        | Supports reasoning, but does not become the source of truth |
| Make.com                 | Workflow orchestration                  | Moves signals and triggers, but does not own decisions      |
| Slack                    | Lightweight user interface              | Supports interaction, not permanent recordkeeping           |
| Databricks Genie         | Governed data interrogation             | Answers governed data questions with caveats                |
| Power BI                 | Reporting source of truth               | Holds approved dashboards and reporting views               |
| SharePoint / OneDrive    | Organisational document storage         | Stores official documents and governed files                |
| Teams / Email / Calendar | Operational coordination                | Supports communication, scheduling and follow-up            |
| Miro                     | Visual collaboration and system mapping | Supports visual thinking and collaboration                  |
| Jira                     | Delivery tracking                       | Tracks delivery work, not strategic knowledge architecture  |

## GitHub

### Role

GitHub is the Strategic OS knowledge repository.

It stores:

* frameworks
* templates
* agent specifications
* decision logic
* lessons learned
* privacy-safe summaries
* reusable patterns
* career-safe evidence
* opportunity indexes
* project folder structures
* analytics interpretation guidance
* system architecture documentation

### GitHub Should Not Store

GitHub should not store:

* customer-level records
* raw organisational documents
* confidential extracts
* governed datasets
* raw operational data
* private employee information
* sensitive stakeholder commentary
* access credentials
* system exports
* screenshots of restricted systems
* raw Databricks or Genie outputs
* copied Power BI data
* raw email or Teams threads
* full Jira issue records

### GitHub Source-Of-Truth Role

GitHub is the source of truth for:

* Strategic OS structure
* Strategic OS frameworks
* agent specifications
* reusable templates
* operating cadence
* privacy and governance rules
* knowledge architecture
* safe patterns and lessons

GitHub is not the source of truth for:

* organisational records
* customer records
* governed dashboards
* legal or HR documents
* operational delivery records
* formal approval records
* financial, procurement or compliance records

## Relevance AI

### Role

Relevance AI may act as an agent memory and reasoning layer.

It may support:

* agent orchestration
* prompt execution
* memory retrieval
* reasoning workflows
* task-specific agent support
* structured outputs
* Chief of Staff routines
* sensemaking workflows
* career evidence support
* stakeholder pattern support

### Boundary

Relevance AI should not become an uncontrolled store of sensitive organisational material.

It should follow the same privacy and governance principles as Strategic OS.

It may use context to reason, but durable knowledge should be stored only when it is safe, useful and intentionally retained.

### Appropriate Use

Use Relevance AI for:

* running Strategic OS agents
* generating structured drafts
* synthesising safe summaries
* creating daily briefings
* helping triage inputs
* supporting decision-framing workflows
* routing tasks to the right agent
* preparing outputs for human review

### Avoid

Avoid using Relevance AI to store:

* raw customer records
* confidential organisational source material
* private stakeholder commentary
* governed data extracts
* sensitive operational records
* material that should remain in official systems
* unreviewed long-term memory about people

## Make.com

### Role

Make.com may act as the workflow orchestration layer.

It can help connect tools and automate low-risk workflows.

It may support:

* scheduled triggers
* task routing
* notification flows
* capturing user-approved inputs
* moving safe summaries between tools
* prompting agent workflows
* creating reminders
* coordinating Chief of Staff routines

### Boundary

Make.com can move signals.

It should not make strategic decisions.

It should not create commitments.

It should not move sensitive material into GitHub or other tools without explicit approval and privacy checks.

### Appropriate Use

Use Make.com for:

* triggering a daily briefing workflow
* reminding the user to review the inbox
* sending a prompt to an agent
* creating a lightweight follow-up reminder
* routing a safe summary to the right place
* notifying the user that review is required
* triggering quarterly review prompts

### Avoid

Avoid using Make.com to:

* automatically send stakeholder communications
* commit changes without review
* copy confidential content between systems
* make prioritisation decisions
* escalate issues without approval
* bypass governance workflows
* automatically store raw tool outputs in GitHub

## Slack

### Role

Slack may act as a lightweight user interface for Strategic OS interactions.

It can support:

* quick prompts
* daily briefing delivery
* agent interaction
* reminders
* follow-up nudges
* review prompts
* quick capture of safe notes

### Boundary

Slack should not be treated as the permanent knowledge repository.

Useful material should be reviewed and, if appropriate, converted into a safe Strategic OS file.

### Appropriate Use

Use Slack for:

* receiving a daily briefing
* asking an agent for a summary
* capturing a quick thought
* receiving reminders
* confirming next actions
* lightweight triage

### Avoid

Avoid using Slack to store:

* long-term decision history
* sensitive stakeholder commentary
* confidential project context
* raw organisational material
* governed data outputs
* sensitive approvals or commitments without official records

## Databricks Genie

### Role

Databricks Genie may act as a governed data interrogation layer.

It can help answer analytical questions from approved data sources.

It may support:

* metric exploration
* governed data interrogation
* analytical interpretation
* domain-specific data agents
* source-aware responses
* caveated metric review
* data quality questions

### Boundary

Databricks Genie is for governed data interrogation.

GitHub may store source rules, caveats and interpretation guidance.

GitHub should not store raw query outputs, governed datasets or customer-level data.

### Appropriate Use

Use Databricks Genie for:

* asking metric questions
* exploring source-defined datasets
* reviewing trends
* checking data caveats
* identifying analytical limitations
* supporting governed domain-agent workflows

### Avoid

Avoid copying into GitHub:

* raw Genie outputs
* customer-level tables
* restricted data
* query result exports
* screenshots of restricted analytics
* sensitive metric breakdowns
* outputs that could be treated as official reporting without review

## Domain Analytics Pattern

Domain-specific analytics agents may live under:

`11_analytics/`

Example:

`11_analytics/service-account/`

A mature analytics domain may include:

* `agent_context.md`
* `agent_review_prompt.md`
* `agent_consistency_check.md`
* `genie_context.md`
* `metric_caveats.md`
* `source_rules.md`
* `metric_definitions.md`
* `data_quality_notes.md`

Future domains may include:

* `11_analytics/channel-strategy/`
* `11_analytics/customer-demand/`
* `11_analytics/support-csat/`
* `11_analytics/executive-metrics/`
* `11_analytics/data-quality/`

Create domain folders only when there is a real analytical domain with source rules, caveats, review prompts or decision-support value.

## Power BI

### Role

Power BI is the reporting source of truth for approved dashboards and reporting views.

It may support:

* performance reporting
* executive dashboards
* operational dashboards
* approved metric views
* trend monitoring
* scorecards
* visual reporting

### Boundary

Power BI should remain the source of truth for dashboard views.

Strategic OS may document how to interpret metrics, but should not duplicate dashboard data.

### Appropriate Use

Use Power BI for:

* approved reporting
* metric review
* dashboard interpretation
* performance monitoring
* visual trends
* decision support

### Strategic OS May Store

Strategic OS may store:

* metric definitions
* dashboard interpretation notes
* caveats
* review questions
* decision-support framing
* links or references to official dashboards, where safe

### Avoid

Avoid storing:

* dashboard screenshots
* raw exported data
* copied sensitive tables
* governed metrics without caveats
* restricted report extracts
* performance claims without review

## SharePoint And OneDrive

### Role

SharePoint and OneDrive are organisational document stores.

They may hold:

* official project documents
* organisational records
* governed files
* working documents
* approved artefacts
* collaboration files
* formal records

### Boundary

Official documents should remain in official organisational storage.

Strategic OS may store a privacy-safe summary, lesson or decision logic derived from the work, but should not duplicate confidential documents.

### Appropriate Use

Use SharePoint and OneDrive for:

* official project files
* working documents
* formal artefacts
* stakeholder-approved materials
* governed collaboration
* records requiring organisational retention

### Strategic OS May Store

Strategic OS may store:

* safe summaries
* lessons learned
* framework implications
* decision logic
* reusable patterns
* links or references to official locations, where appropriate and safe

### Avoid

Avoid copying into GitHub:

* confidential documents
* draft organisational papers
* sensitive project files
* official records
* private stakeholder comments
* internal-only content that should remain governed

## Teams, Email And Calendar

### Role

Teams, email and calendar are operational coordination tools.

They support:

* meetings
* scheduling
* communication
* follow-ups
* operational decisions
* stakeholder coordination
* day-to-day commitments

### Boundary

These tools contain communication records and operational context.

Strategic OS should not copy private threads or raw communications into GitHub.

The Chief of Staff Agent may prepare planning notes, but must not send messages, change calendar events, make commitments or imply approval.

### Appropriate Use

Use these tools for:

* stakeholder communication
* meeting coordination
* calendar planning
* follow-up tracking
* operational commitments
* real-time collaboration

### Strategic OS May Store

Strategic OS may store:

* action summaries
* meeting preparation notes
* decision points
* follow-up patterns
* abstracted stakeholder patterns
* lessons learned
* safe daily briefing notes
* privacy-safe weekly operating review signals

### Avoid

Avoid storing:

* raw email threads
* private chat messages
* confidential meeting transcripts
* sensitive stakeholder commentary
* identifiable private comments
* calendar details that expose sensitive context

## Miro

### Role

Miro is a visual collaboration and system mapping workspace.

It may support:

* journey mapping
* service blueprinting
* ecosystem mapping
* workshop collaboration
* system diagrams
* stakeholder mapping
* opportunity mapping
* visual sensemaking

### Boundary

Miro may contain collaborative and sensitive working material.

Strategic OS should not automatically store exported boards or screenshots unless they are safe, reviewed and reusable.

### Appropriate Use

Use Miro for:

* visual thinking
* workshop collaboration
* system architecture sketches
* journey and service blueprinting
* mapping stakeholders or dependencies
* co-design or sensemaking activities

### Strategic OS May Store

Strategic OS may store:

* simplified diagrams
* safe summaries
* reusable mapping patterns
* workshop lessons
* framework implications
* privacy-safe artefact descriptions

### Avoid

Avoid storing:

* full exported boards with sensitive content
* screenshots showing private comments
* customer-level records
* confidential organisational notes
* raw workshop material that should remain in the collaboration space

## Jira

### Role

Jira is a delivery tracking tool.

It may support:

* backlog tracking
* delivery tasks
* implementation issues
* progress visibility
* sprint or project delivery
* dependency tracking

### Boundary

Jira tracks delivery work.

Strategic OS stores strategic knowledge, decision logic and reusable lessons.

Strategic OS should not duplicate Jira issue records.

### Appropriate Use

Use Jira for:

* delivery tracking
* assigning implementation work
* tracking issue status
* managing dependencies
* recording delivery progress

### Strategic OS May Store

Strategic OS may store:

* delivery lessons
* decision implications
* project-level patterns
* blocker summaries
* shipping recommendations
* privacy-safe delivery reflections

### Avoid

Avoid storing:

* full Jira issue records
* operational backlog dumps
* sensitive delivery comments
* customer-level linked issues
* private team discussion
* data that should remain in Jira

## Chief Of Staff Workflows

The Chief of Staff Agent may use cross-tool signals to support coordination.

### Appropriate Cross-Tool Signals

Safe inputs may include:

* calendar context
* user-provided meeting notes
* user-approved follow-up summaries
* safe task summaries
* project context
* reviewed inbox items
* non-sensitive operating signals

### Outputs

Chief of Staff outputs may include:

* daily briefing
* weekly operating review
* admin task list
* follow-up tracker
* meeting preparation note
* decision-required list
* focus protection recommendation

### Tool Boundaries

The Chief of Staff Agent must not:

* send messages
* change calendar events
* accept or decline meetings
* contact stakeholders
* make commitments
* escalate issues externally
* store sensitive raw source material
* treat temporary operating notes as durable Strategic OS knowledge

## Analytics Workflows

Domain Analytical Agents may use governed analytical tools to support decision-making.

### Appropriate Analytical Inputs

Inputs may include:

* governed metric definitions
* approved dashboard views
* source rules
* metric caveats
* data quality notes
* user-approved analytical questions
* safe summaries of analytical findings

### Outputs

Analytical outputs may include:

* analytical summary
* metric caveat note
* source rules
* Genie context
* agent review prompt
* agent consistency check
* data quality note
* decision-support evidence summary

### Tool Boundaries

Analytical agents must not:

* treat exploratory output as official reporting
* copy raw datasets into GitHub
* store customer-level data
* omit metric caveats
* ignore source hierarchy
* present contextual signals as governed truth
* bypass human review for governance or executive use

## Information Movement Rules

Use this rule before moving information between tools.

### 1. Identify The Source

Where did the information come from?

### 2. Identify The Destination

Where is it going?

### 3. Identify The Purpose

Why does it need to move?

### 4. Identify Sensitivity

Is it public, personal, internal-safe, sensitive or restricted?

### 5. Convert If Needed

Can it be abstracted, summarised or generalised?

### 6. Review Before Storage

Does a human need to approve it?

### 7. Store Or Discard

Should it be stored, kept temporarily or discarded?

## Cross-Tool Storage Rules

| Source Tool              | May Move To GitHub                                      | Do Not Move To GitHub                        |
| ------------------------ | ------------------------------------------------------- | -------------------------------------------- |
| Relevance AI             | Reviewed safe summaries, prompts, agent rules           | Unreviewed memory, sensitive source material |
| Make.com                 | Workflow patterns, automation rules, safe trigger notes | Raw tool payloads, sensitive automations     |
| Slack                    | Safe notes, reminders, reviewed actions                 | Private threads, sensitive comments          |
| Databricks Genie         | Caveats, source rules, reviewed interpretations         | Raw outputs, restricted datasets             |
| Power BI                 | Metric definitions, caveats, interpretation notes       | Screenshots, exports, copied dashboard data  |
| SharePoint / OneDrive    | Safe summaries, lessons, decision logic                 | Official documents, confidential files       |
| Teams / Email / Calendar | Action summaries, preparation notes                     | Raw communications, private threads          |
| Miro                     | Safe diagrams, mapping patterns                         | Full sensitive boards, private comments      |
| Jira                     | Delivery lessons, blocker patterns                      | Full issue records, backlog dumps            |

## Human Review Triggers

Human review is required before moving, storing or acting on material involving:

* customer-level information
* confidential organisational content
* sensitive stakeholder commentary
* governed data
* executive-facing advice
* formal decisions
* stakeholder commitments
* legal, HR, financial or procurement implications
* reputational risk
* public-facing content
* automation that sends or escalates communication
* calendar or priority changes that affect others

## Source-Of-Truth Map

| Information Type                  | Source Of Truth                                   |
| --------------------------------- | ------------------------------------------------- |
| Strategic OS structure            | GitHub                                            |
| Agent specifications              | GitHub                                            |
| Reusable templates                | GitHub                                            |
| Reusable frameworks               | GitHub                                            |
| Official organisational documents | SharePoint / OneDrive or official document system |
| Customer records                  | Official customer system                          |
| Operational delivery tasks        | Jira or official delivery system                  |
| Communication record              | Teams / Email / Calendar                          |
| Approved reporting                | Power BI or governed reporting platform           |
| Governed analytical interrogation | Databricks Genie / Databricks                     |
| Quick user interaction            | Slack or chosen interaction layer                 |
| Workflow triggers                 | Make.com or chosen orchestration layer            |

## Review Checklist

Before adding or changing a cross-tool workflow, check:

* Does each tool have a clear role?
* Is the source of truth clear?
* Is sensitive material protected?
* Is raw organisational material kept out of GitHub?
* Are governed metrics kept in governed tools?
* Are analytical caveats preserved?
* Is human review required before action?
* Does automation avoid making commitments?
* Does the Chief of Staff Agent stay within Level 3 coordination?
* Do Domain Analytical Agents stay within Level 4 analytical support?
* Is the workflow useful enough to maintain?
* Does the workflow support the Strategic OS North Star?

## Success Measures

The cross-tool architecture is working when:

* each tool is used for its strongest role
* GitHub remains a safe knowledge repository
* official systems remain sources of truth
* Databricks and Power BI retain governed data authority
* agents can support work without overstepping
* Chief of Staff workflows reduce drag without creating commitments
* analytics workflows preserve caveats and source rules
* safe summaries move between tools intentionally
* sensitive material is not copied unnecessarily
* cross-tool workflows create clarity rather than complexity

## Failure Modes

The cross-tool architecture is failing if:

* GitHub becomes a shadow records system
* raw organisational material is duplicated
* governed data is copied into Strategic OS
* agents act across tools without review
* automation creates commitments
* calendar or stakeholder actions happen without approval
* source-of-truth boundaries are unclear
* Power BI screenshots or exports replace governed reporting
* Databricks or Genie outputs are treated as final without review
* Slack, Teams or email become unmanaged long-term memory
* the tool architecture creates more maintenance burden than value

## Minimal Use Rule

Use the fewest tools needed.

Move the least information needed.

Store the safest abstraction needed.

Keep official records in official systems.

Keep reusable Strategic OS knowledge in GitHub.
