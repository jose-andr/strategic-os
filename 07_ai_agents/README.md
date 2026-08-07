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
↔ Obsidian

Slack is the preferred lightweight interface with agents where integration is available.

Obsidian is the primary workspace for navigating and developing Strategic OS knowledge.

GitHub remains the authoritative Strategic OS repository.

Agents may draft repository updates, but they must not silently turn conversations or temporary workspace content into durable knowledge.

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
- temporary chat notes
- Slack conversation history
- Obsidian scratch notes with no durable value
- next-step reminders that only make sense in one conversation

## Priority Agents

Strategic OS currently uses five general priority agents plus domain analytical agents.

| Agent | Folder | Primary role | Default autonomy |
|---|---|---|---|
| Sensemaking Agent | `sensemaking_agent/` | Turns ambiguity into decision-ready advice | Level 1 — Advisory |
| Stakeholder Journey Agent | `stakeholder_agent/` | Maps alignment, resistance and engagement sequencing | Level 1 — Advisory |
| Shipping Coach | `shipping_coach/` | Helps move useful work from thinking into visible progress | Level 2 — Coaching / Challenge |
| Career Architect | `career_architect/` | Converts work and feedback into career evidence and positioning | Level 1 — Advisory |
| Chief of Staff Agent | `chief_of_staff/` | Coordinates daily activity, priorities, follow-ups and decision-required items | Level 3 — Operational Coordination |
| Domain Analytical Agents | `11_analytics/[domain]/` | Support governed analytical interpretation | Level 4 — Domain Analytical Support |

## Shared Framework Files

| File | Purpose |
|---|---|
| `agent_operating_model.md` | Defines agent categories, autonomy levels, human review requirements and escalation rules |
| `agent_review_checklist.md` | Provides a shared checklist for reviewing agent outputs before use or storage |
| `agent_prompt_pattern.md` | Defines the standard prompt structure for running Strategic OS agents |
| `agent_output_map.md` | Maps agents to outputs, templates, storage locations and review points |
| `agent_file_naming.md` | Defines naming conventions for agent files and outputs |
| `agent_output_index_pattern.md` | Defines how agent outputs should be indexed where useful |

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

- Is the evidence strong enough?
- Are assumptions visible?
- Are interpretations separated from facts?
- Are risks and trade-offs clear?
- Is the recommendation proportionate?
- Is the next action realistic?
- Is the storage location appropriate?
- Is the content safe to retain?
- Does the output support the Strategic OS North Star?

## Conversation-To-Knowledge Rule

Agent conversations are temporary working context unless intentionally promoted.

When an interaction produces reusable value:

1. identify the reusable knowledge
2. remove conversation noise
3. remove or abstract sensitive source material
4. distinguish evidence, assumption, interpretation, recommendation and action
5. use the relevant Strategic OS template where helpful
6. review the proposed durable content
7. save it to the appropriate GitHub-backed Markdown file
8. use Obsidian to navigate and connect it

Do not store raw conversation history merely for completeness.

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

The Service Account analytics area remains the first mature pilot pattern:

`11_analytics/service-account/`

Service Account-specific rules should remain inside that domain folder.

## Output Storage Logic

Agent outputs should be stored according to purpose:

- Raw or unprocessed material goes in `00_inbox/`
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

Obsidian provides the working interface to that storage.

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

## Review Rhythm

Agent performance should be reviewed quarterly as part of the Strategic OS QA assessment.

Review questions:

- Which agents were used?
- Which outputs helped decisions?
- Which outputs were ignored or reworked?
- Where did agents overreach?
- Where was human review unclear?
- Which templates need improvement?
- Which agent specs need refinement?
- Did analytical agents document source rules and caveats?
- Is Slack improving the usability of agent interaction?
- Is Obsidian improving retrieval and reuse without creating unnecessary maintenance?
- Did agent outputs support the Strategic OS North Star?
