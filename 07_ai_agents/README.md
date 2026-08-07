# AI Agents

## Purpose

This folder contains the Strategic OS agent framework.

Strategic OS agents are structured support roles that help turn complexity, evidence, stakeholder context, operational signals and personal knowledge into clearer strategic outputs.

Agents support the Strategic OS North Star:

> Increase strategic opportunities by helping leaders make better strategic decisions.

Agents do not replace human judgement, stakeholder engagement, governance or final decision-making.

## Interaction Model

The preferred operating pattern is:

José
→ Slack or another approved interaction surface
→ Strategic OS agent
→ relevant reasoning and source tools
→ decision-ready response
→ human review
→ approved durable knowledge
→ GitHub-backed Markdown
→ optional Obsidian desktop / mobile navigation and visual thinking

Slack is the primary conversational interface with Strategic OS agents where integration is available.

GitHub web is the primary cloud-accessible Strategic OS workspace.

GitHub remains the authoritative Strategic OS repository.

Obsidian desktop and mobile are optional enhanced workspaces for navigation, linking, reflection and visual thinking when available. Strategic OS must remain fully usable without them.

Microsoft 365 Copilot is a separate enterprise AI layer where organisationally enabled and approved. It may support authorised organisational knowledge retrieval, Teams meeting synthesis and approved administrative automation without becoming the Strategic OS source of truth.

PLAUD may be evaluated as a portable capture capability, but is not a confirmed Strategic OS component and must not be used for organisational content without appropriate organisational approval and governance.

Agents may draft repository updates, but they must not silently turn conversations, meeting transcripts, Copilot outputs, capture-tool outputs or temporary workspace content into durable knowledge.

## What Belongs Here

This folder contains:

- general agent operating rules
- agent specifications
- prompt patterns
- review checklists
- output maps
- file naming guidance
- reusable agent patterns
- shared guidance for future agent development

Agent-specific folders should contain the operating material for each priority agent.

## What Does Not Belong Here

Do not store:

- raw organisational source data
- customer-level records
- sensitive stakeholder commentary
- confidential extracts from systems of record
- project-specific artefacts that belong in `08_projects/`
- analytics domain rules that belong in `11_analytics/`
- temporary interaction or workspace notes with no durable value
- raw Slack conversation history
- raw Microsoft 365 Copilot conversations or organisational source content
- raw meeting recordings or transcripts
- raw PLAUD or other external capture-tool output
- Obsidian scratch notes with no durable value
- next-step reminders that only make sense in one conversation

## Priority Agents

Strategic OS currently prioritises:

### Sensemaking Agent

Turns ambiguity, evidence and complexity into decision-ready advice.

### Stakeholder Journey Agent

Supports alignment, influence, stakeholder sequencing and communication.

### Shipping Coach

Challenges unnecessary refinement and helps move useful work forward.

### Career Architect

Supports strategic opportunity creation, career evidence and promotion readiness.

### Chief of Staff Agent

Coordinates daily operating rhythm, priorities, follow-ups and decision attention.

### Domain Analytical Agents

Support governed analytical interpretation using source-aware definitions, caveats and human review.

## Agent Folder Pattern

Each priority agent should have its own folder.

Recommended structure:

- `agent_spec.md`
- supporting rules where required
- examples where useful
- local prompt patterns where useful

The standard agent specification structure is:

- `# [Agent Name] Specification`
- `## Mission`
- `## Primary Question`
- `## Inputs`
- `## Outputs`
- `## Reasoning Framework`
- `## Operating Autonomy`
- `## Human In The Loop`
- `## Success Metrics`
- `## Failure Modes`

## Autonomy Model

| Level | Name | Meaning |
|---|---|---|
| Level 1 | Advisory | Provides synthesis, options and recommendations only |
| Level 2 | Coaching / Challenge | Recommends action, challenges delay and identifies smallest useful next steps |
| Level 3 | Operational Coordination | Organises and prioritises low-risk day-to-day work within approved rules |
| Level 4 | Domain Analytical Support | Supports governed analytical work with documented source rules and caveats |
| Level 5 | Human Approval Required | Applies whenever sensitive, formal, reputational, financial, governance or career consequences are present |

Level 5 is a control point, not a standing agent mode.

## Human Review

Human review is required before an agent output is:

- shared with stakeholders
- used to support a formal decision
- treated as approved advice
- used in governance or reporting
- stored as durable evidence
- used for career positioning
- used to make a commitment
- used where sensitive information is involved
- committed as durable Strategic OS knowledge

Human review should check:

- evidence
- assumptions
- caveats
- privacy
- source alignment
- recommendation quality
- decision relevance
- stakeholder sensitivity
- whether the output should be retained at all

## Interaction-To-Knowledge Rule

Agent conversations, Copilot interactions, meeting summaries, capture-tool outputs and workspace notes are temporary working context unless intentionally promoted.

When an interaction produces reusable value:

1. identify the reusable knowledge
2. remove interaction noise
3. remove or abstract sensitive source material
4. distinguish evidence, assumption, interpretation, recommendation and action
5. use the relevant Strategic OS template where helpful
6. review the proposed durable content
7. save it to the appropriate GitHub-backed Markdown file
8. optionally use Obsidian desktop or mobile to navigate and connect it when available

Do not store raw interaction history merely for completeness.

## Domain Analytical Agents

General personal and operating agents live under `07_ai_agents/`.

Domain-specific analytical agents may live under:

- `11_analytics/[domain]/`
- `08_projects/[project-name]/` when project-specific

Databricks / Genie agents require local source rules, caveats and review prompts.

Relevant local files may include:

- `agent_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `genie_context.md`
- `metric_caveats.md`
- `source_rules.md`

Domain Analytical Agents should distinguish:

- business question
- metric definition
- numerator
- denominator
- source
- grain
- filters
- period
- result
- caveat
- interpretation
- recommendation
- slide-safe wording

They must state plainly when a technically calculated result is unsafe for decision-making or presentation.

## Enterprise AI Boundary

Microsoft 365 Copilot is not a Strategic OS agent.

Where organisationally approved, it may support:

- Teams meeting recap
- organisational knowledge retrieval
- document drafting
- email and calendar support
- approved admin automation
- enterprise-context synthesis

Its outputs remain subject to organisational source-of-truth and governance rules.

Strategic OS agents may reason from reviewed, safe abstractions of those outputs where useful.

Do not treat access to enterprise AI as permission to transfer raw organisational content into Strategic OS.

## Capture Tool Boundary

PLAUD is not a Strategic OS agent.

It may be evaluated as a capture surface for approved in-person conversations or personal reflection.

Do not use it for organisational content until organisational approval, consent, privacy, security and records obligations are understood.

Raw recordings and transcripts do not belong in Strategic OS.

## Output Storage Logic

Agent outputs should be stored according to purpose:

- Raw or unprocessed safe material goes in `00_inbox/`
- Career evidence goes in `01_career/`
- Strategic opportunities go in `02_strategic_opportunities/`
- Decision briefs go in `03_decision_briefs/`
- Reusable frameworks go in `04_frameworks/`
- Lessons learned go in `05_lessons_learned/`
- Stakeholder patterns go in `06_stakeholder_patterns/`
- Agent specifications and operating rules go in `07_ai_agents/`
- Project-specific artefacts go in `08_projects/`
- Thought leadership drafts go in `09_thought_leadership/`
- Reusable templates go in `10_templates/`
- Analytics guidance and governed analytical patterns go in `11_analytics/`

GitHub owns durable storage.

GitHub web provides the primary cloud-accessible workspace.

Obsidian provides an optional enhanced interface to that storage when available.

## Agent Architecture Management Principle

Agent architecture should minimise recurring human administration.

Prefer:

- stable routing rules
- reusable prompts
- automated low-risk coordination
- controlled handoffs
- clear source ownership
- human review at meaningful decision points

Avoid architectures that require constant manual synchronisation, duplicate filing, repeated tagging or routine reconciliation between tools.

Complex initial configuration is acceptable when it creates a simpler and more reliable operating model afterwards.

## Quality Bar

A good agent output should:

- make the situation clearer
- reduce decision friction
- identify the real issue or opportunity
- separate evidence from interpretation
- make assumptions visible
- make trade-offs visible
- recommend a practical next step
- identify human review requirements
- avoid overclaiming
- respect privacy and governance boundaries
- create reusable knowledge where appropriate
- remain understandable outside any single interface or tool
- avoid creating unnecessary recurring management overhead

## Maintenance

Do not add a new agent merely because a new tool or use case appears.

Prefer extending an existing agent when the mission and reasoning pattern already fit.

Create a new agent only when repeated use exposes a distinct, durable role that improves decision clarity, stakeholder alignment, evidence use or strategic capability.

Review agents periodically for:

- actual use
- overlap
- output quality
- privacy
- maintenance burden
- decision impact
- whether an agent can be simplified or retired
