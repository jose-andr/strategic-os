# AI Agents

This folder contains Strategic OS agent specifications and shared agent operating guidance.

Agents are structured support roles that help turn ambiguity, evidence, stakeholder context, daily operating activity and personal knowledge into clearer strategic outputs.

Agents do not replace human judgement, stakeholder engagement, governance or final decision-making.

## Purpose

The agents framework supports the Strategic OS North Star:

> Increase strategic opportunities by helping leaders make better strategic decisions.

Agents help with:

- sensemaking
- stakeholder alignment
- shipping discipline
- career development
- day-to-day operating coordination
- evidence-aware analysis
- reusable knowledge creation
- decision support

## Current priority agents

| Agent | Location | Mission | Primary output |
|---|---|---|---|
| Sensemaking Agent | `07_ai_agents/sensemaking_agent/agent_spec.md` | Turn ambiguity into decision-ready advice | Decision Brief |
| Stakeholder Journey Agent | `07_ai_agents/stakeholder_agent/agent_spec.md` | Bring people along the journey | Stakeholder Alignment Assessment |
| Shipping Coach | `07_ai_agents/shipping_coach/agent_spec.md` | Challenge unnecessary refinement and encourage timely delivery | Shipping Recommendation |
| Career Architect | `07_ai_agents/career_architect/agent_spec.md` | Create more strategic opportunities and support long-term career development | Opportunity Review / Career Guidance / Promotion Readiness Assessment |

## Planned priority agent

| Agent | Planned location | Mission | Primary output |
|---|---|---|---|
| Chief of Staff Agent | `07_ai_agents/chief_of_staff/agent_spec.md` | Keep the lights on, coordinate day-to-day activity and connect daily delivery to the Strategic OS North Star | Daily Briefing |

## Shared agent pattern

Each agent specification should generally include:

- Mission
- Primary Question
- Inputs
- Outputs
- Reasoning Framework
- Operating Autonomy
- Human In The Loop
- Success Metrics
- Failure Modes

## Agent development rules

When adding or changing agents:

1. Do not change the root `README.md` unless the Strategic OS foundation itself needs to change.
2. Keep each general-purpose agent in its own folder under `07_ai_agents/`.
3. Use markdown-first documentation.
4. Define the agent’s mission, inputs, outputs, reasoning model, autonomy level, human-in-the-loop points, success metrics and failure modes.
5. Keep agents practical and decision-oriented.
6. Avoid storing organisational source data in this repository.
7. Separate evidence, assumptions, interpretation, recommendation and action.
8. Make autonomy and escalation rules explicit where an agent may support operational coordination.
9. Keep project-specific or domain-specific analytical rules inside the relevant project or analytics folder.

## Shared framework files

The agents framework may include shared files such as:

| File | Purpose |
|---|---|
| `agent_operating_model.md` | Defines how Strategic OS agents operate |
| `agent_review_checklist.md` | Provides checks before using, saving or sharing agent outputs |
| `agent_prompt_pattern.md` | Provides reusable prompt structures for running agents |
| `agent_output_map.md` | Maps agents to outputs, templates and storage locations |
| `agent_file_naming.md` | Defines naming conventions for saved agent outputs |
| `agent_output_index_pattern.md` | Defines lightweight index patterns for saved outputs |

## Domain-specific analytical agents

General-purpose personal agents live in `07_ai_agents/`.

Domain-specific analytical agents may live inside relevant analytics or project folders where they require their own source rules, metric caveats, Genie prompts, consistency checks or review prompts.

Example pattern:

    analytics/
    └── service-account/
        ├── genie-context.md
        ├── agent-review-prompt.md
        ├── agent-consistency-check.md
        └── metric-caveats.md

The Service Account analytics work is the first mature pilot pattern for this approach.

Future Databricks / Genie agents should be able to exist across multiple domains rather than being forced into one generic analytics agent.

## Human judgement

Agents can recommend, structure, challenge, synthesise and coordinate.

Humans remain responsible for:

- strategic intent
- prioritisation
- stakeholder engagement
- formal decisions
- sensitive interpretation
- publication
- career decisions
- governance
- organisational action

## Privacy and portability

Strategic OS should retain portable knowledge, reusable patterns, prompts, templates, reflections and personal frameworks.

Do not store:

- raw organisational source data
- customer-level records
- confidential extracts
- sensitive stakeholder commentary
- governed datasets
- private organisational records

Use summaries, caveats, patterns and reusable learning instead.
