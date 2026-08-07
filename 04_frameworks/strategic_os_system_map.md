# Strategic OS System Map

## Purpose

This file maps how Strategic OS works as a whole system.

It shows how inputs move through interaction, capture, sensemaking, agent support, human review, storage, navigation and reuse.

The purpose is to make Strategic OS understandable without needing chat history.

Strategic OS exists to support the North Star:

> Increase strategic opportunities by helping leaders make better strategic decisions.

## Core System Logic

Strategic OS turns raw signals into reusable strategic knowledge.

The core flow is:

Inputs
→ interaction or capture
→ `00_inbox/` when unstructured
→ triage
→ agent support
→ template or structured output
→ human review
→ durable Markdown
→ GitHub
↔ Obsidian
→ reuse
→ better decisions, stronger alignment and more strategic opportunities

## Interaction Layer

Slack is the preferred lightweight interface for interacting with Strategic OS agents where integration is available.

It may be used to:

- ask questions
- request synthesis
- receive briefings
- approve or reject proposed actions
- capture safe signals
- request repository-ready drafts

Slack does not own durable Strategic OS knowledge.

## Workspace Layer

Obsidian is the primary workspace for navigating and developing Strategic OS knowledge.

It supports:

- authoring
- search
- backlinks
- related-note discovery
- graph navigation
- templates
- Canvas and visual thinking
- review of decisions, evidence, assumptions, stakeholders, patterns and lessons

Obsidian works over the Strategic OS Markdown repository.

It must not become a separate divergent source of truth.

## Repository Layer

GitHub is the authoritative source of truth for Strategic OS structure and durable knowledge.

Approved durable knowledge is stored as Markdown in the relevant repository folder.

GitHub provides:

- version history
- controlled change
- portability
- auditability
- repository structure
- a common source for human and agent use

## Whole-System Map

Organisational systems and personal inputs
→ Slack / approved interaction surface
→ Strategic OS agents
→ `00_inbox/` when capture is needed
→ triage and synthesis
→ appropriate template or output
→ human review
→ GitHub-backed Markdown
↔ Obsidian workspace
→ indexing and linking
→ reuse in future decisions

External governed sources remain outside Strategic OS.

Strategic OS stores safe interpretation and reusable logic rather than copied source records.

## Input Types

Inputs may include:

- meeting notes
- stakeholder signals
- project observations
- decision questions
- risks
- opportunities
- customer themes
- service-design observations
- analytical questions
- metric caveats
- career evidence
- lessons
- external research
- thought-leadership ideas

Inputs must be handled according to privacy and source-of-truth rules.

## Capture Layer

Use `00_inbox/` when an input is useful but not yet classified.

Not every Slack message or Obsidian scratch note belongs in the inbox.

Capture only material with plausible decision, learning, opportunity, project, stakeholder, career or reusable knowledge value.

## Triage Layer

Triage asks:

- What is this?
- Why does it matter?
- Is a decision required?
- Is an agent useful?
- Is there a relevant template?
- Is the material safe to retain?
- Where should the durable output live?
- Can the original input be discarded after abstraction?

Typical pathways include:

- decision support
- strategic opportunity
- lesson learned
- stakeholder pattern
- project artefact
- career evidence
- thought leadership
- analytics interpretation
- reusable framework
- reusable template

## Agent Layer

Strategic OS agents structure, challenge, synthesise and coordinate work.

| Agent | Primary Role | Main Output |
|---|---|---|
| Sensemaking Agent | Turns ambiguity into decision-ready advice | Decision Brief |
| Stakeholder Journey Agent | Supports stakeholder alignment and influence | Stakeholder Alignment Assessment |
| Shipping Coach | Helps move work from refinement to delivery | Shipping Recommendation |
| Career Architect | Turns work into career evidence and opportunity positioning | Career Guidance |
| Chief of Staff Agent | Coordinates daily priorities, follow-ups and operating rhythm | Daily Briefing |
| Domain Analytical Agents | Support source-aware analytical interpretation | Caveated analytical outputs |

### Agent Boundaries

Agents may:

- structure thinking
- synthesise evidence
- identify patterns
- recommend next steps
- challenge weak framing
- surface risks
- prepare drafts
- suggest storage locations
- support review cadence

Agents must not:

- make formal decisions
- create stakeholder commitments
- send messages without approval
- store sensitive material without review
- replace governance
- treat assumptions as facts
- copy raw organisational source data into Strategic OS
- silently convert Slack or Obsidian content into durable repository knowledge

## Human Review Layer

Human review is the gate between useful agent output and durable Strategic OS knowledge.

Review should confirm:

- decision relevance
- evidence quality
- assumptions
- caveats
- privacy
- source alignment
- appropriate storage location
- whether the material is reusable
- whether it should be retained at all

## Template Layer

Templates convert agent-supported thinking into consistent outputs.

Key templates include:

| Template | Purpose |
|---|---|
| `10_templates/decision_brief.md` | Supports decision-making |
| `10_templates/lesson_learned.md` | Captures reusable lessons |
| `10_templates/stakeholder_alignment_assessment.md` | Reviews stakeholder alignment |
| `10_templates/shipping_recommendation.md` | Helps move work forward |
| `10_templates/opportunity_review.md` | Assesses strategic opportunities |
| `10_templates/career_guidance.md` | Supports career positioning |
| `10_templates/promotion_readiness_assessment.md` | Reviews promotion evidence |
| `10_templates/daily_briefing.md` | Supports daily operating rhythm |
| `10_templates/quarterly_strategic_os_assessment.md` | Supports quarterly QA review |

## Storage Layer

Durable outputs are stored by purpose.

| Output | Location |
|---|---|
| Unsorted capture | `00_inbox/` |
| Career evidence | `01_career/` |
| Strategic opportunity | `02_strategic_opportunities/` |
| Decision brief | `03_decision_briefs/` |
| Reusable framework | `04_frameworks/` |
| Lesson learned | `05_lessons_learned/` |
| Stakeholder pattern | `06_stakeholder_patterns/` |
| Agent specification | `07_ai_agents/` |
| Project artefact | `08_projects/` |
| Thought leadership | `09_thought_leadership/` |
| Reusable template | `10_templates/` |
| Analytics interpretation pattern | `11_analytics/` |
| QA material | `12_quality/` |

## Knowledge Navigation Layer

Obsidian provides the primary navigation experience over durable Markdown.

Useful relationships may include:

- decision ↔ evidence
- decision ↔ stakeholder
- decision ↔ project
- framework ↔ use case
- lesson ↔ project
- metric ↔ definition
- metric ↔ source rule
- opportunity ↔ career evidence
- stakeholder pattern ↔ decision
- prompt ↔ agent

Links should improve retrieval and reasoning without creating unnecessary metadata overhead.

## Tool Layer

| Tool | Role |
|---|---|
| Slack | Agent interaction and lightweight capture |
| Obsidian | Strategic workspace, linking and navigation |
| GitHub | Authoritative Strategic OS knowledge repository |
| Relevance AI | Agent memory and reasoning layer |
| Make.com | Workflow orchestration |
| Databricks Genie | Governed data interrogation |
| Power BI | Reporting source of truth |
| SharePoint / OneDrive | Organisational document storage |
| Teams / Email / Calendar | Operational coordination |
| Miro | Visual collaboration and system mapping |
| Jira | Delivery tracking |

Tool boundaries are governed by:

`04_frameworks/cross_tool_architecture.md`

## Source-Of-Truth Layer

Strategic OS does not replace official systems.

Official sources remain authoritative for:

- governed data
- formal documents
- customer records
- reporting
- delivery records
- approvals
- organisational communications

Strategic OS retains safe reusable interpretation, patterns, decision logic, definitions, caveats and lessons.

## Core Flows

### Flow 1: Input To Decision

Input
→ Slack or `00_inbox/`
→ Sensemaking Agent
→ `10_templates/decision_brief.md`
→ human review
→ `03_decision_briefs/`
→ GitHub
↔ Obsidian
→ future decision support

### Flow 2: Input To Strategic Opportunity

Input
→ capture
→ Career Architect or Sensemaking Agent
→ opportunity review
→ human review
→ `02_strategic_opportunities/`
→ GitHub
↔ Obsidian
→ revisit when trigger occurs

### Flow 3: Work To Lesson

Experience
→ reflection
→ Sensemaking Agent or Shipping Coach
→ lesson learned
→ human review
→ `05_lessons_learned/`
→ linked to relevant framework or project
→ reuse

### Flow 4: Stakeholder Signal To Pattern

Signal
→ safe abstraction
→ Stakeholder Journey Agent
→ stakeholder alignment assessment
→ human review
→ `06_stakeholder_patterns/`
→ reuse without retaining unnecessary identifiable detail

### Flow 5: Governed Analytics To Decision Support

Business question
→ Databricks Genie / approved data source
→ metric definition and source check
→ caveated interpretation
→ Domain Analytical Agent
→ human review
→ safe analytical summary
→ decision support

Raw data remains in the governed source.

### Flow 6: Agent Conversation To Durable Knowledge

Slack conversation
→ agent recommendation
→ identify reusable value
→ remove sensitive or temporary context
→ human review
→ repository-ready Markdown
→ GitHub
↔ Obsidian

The raw conversation is not the durable knowledge object.

## Review Rhythm

### Daily

Focus on:

- priorities
- meetings
- decisions required
- stakeholder preparation
- follow-ups
- risks and blockers

Primary support:

- Chief of Staff Agent
- Slack
- Obsidian workspace as needed

### Weekly

Focus on:

- inbox triage
- sensemaking
- shipping review
- stakeholder alignment
- open decisions
- project movement

### Monthly

Focus on:

- strategic opportunities
- lessons learned
- career evidence
- frameworks and templates
- active project patterns
- knowledge links that are genuinely useful

### Quarterly

Focus on:

- Strategic OS QA
- agent performance
- template usefulness
- repository hygiene
- privacy and governance compliance
- North Star alignment
- tool architecture effectiveness
- whether Obsidian is improving retrieval and decision quality rather than creating maintenance overhead

## System Health Questions

Ask:

- Is Strategic OS helping make better strategic decisions?
- Is Slack making agent interaction easier?
- Is Obsidian making relevant knowledge easier to find and connect?
- Is GitHub still clearly authoritative?
- Are agents supporting rather than replacing judgement?
- Is reusable knowledge being captured without raw organisational data?
- Are official systems still treated as systems of record?
- Is the system becoming simpler through use rather than more complex through configuration?

## Final Rule

Strategic OS should behave as one connected operating system:

**Interact through agents. Navigate and think in Obsidian. Govern durable knowledge in GitHub. Keep organisational truth in organisational systems.**
