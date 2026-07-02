# AI Agents

This folder contains agent specifications for Strategic OS.

Agents are structured support roles that help turn ambiguity, evidence, stakeholder context and personal knowledge into clearer strategic outputs.

Agents do not replace human judgement, stakeholder engagement, governance or final decision-making.

## Current agents

### Sensemaking Agent

Location:

`07_ai_agents/sensemaking_agent/agent_spec.md`

Mission:

> Turn ambiguity into decision-ready advice.

Primary outputs:

- Weekly synthesis
- Decision brief

The Sensemaking Agent is the first agent pattern in Strategic OS and should be used as the reference structure for future agent specifications.

## Agent development rules

When adding or changing agents:

1. Do not change the root `README.md` unless the Strategic OS foundation itself needs to change.
2. Keep each agent in its own folder.
3. Use markdown-first documentation.
4. Define the agent’s mission, inputs, outputs, reasoning model, human-in-the-loop points, success metrics and failure modes.
5. Keep agents practical and decision-oriented.
6. Avoid storing organisational source data in this repository.
7. Separate evidence, interpretation, recommendation and action.

## Suggested future agent folders

The root Strategic OS README names four priority agents:

    07_ai_agents/
    ├── sensemaking_agent/
    ├── stakeholder_agent/
    ├── shipping_coach/
    └── career_architect/

Only create new folders when there is enough clarity to define the agent’s actual role, not just its name.

## Next build step

The next agent-framework update should extend from the existing Sensemaking Agent pattern.

Recommended next update:

`07_ai_agents/stakeholder_agent/agent_spec.md`

Purpose:

Define the Stakeholder Journey Agent as the agent that helps bring people along the journey by assessing alignment, likely resistance, influence pathways and communication sequencing.
