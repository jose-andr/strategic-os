# AI Agents

This folder contains agent specifications for Strategic OS.

Agents are structured support roles that help turn ambiguity, evidence, stakeholder context and personal knowledge into clearer strategic outputs.

Agents do not replace human judgement, stakeholder engagement, governance or final decision-making.

## Current agents

Strategic OS currently has four priority agents:

    07_ai_agents/
    ├── career_architect/
    │   └── agent_spec.md
    ├── sensemaking_agent/
    │   └── agent_spec.md
    ├── shipping_coach/
    │   └── agent_spec.md
    └── stakeholder_agent/
        └── agent_spec.md

## Agent summary

### Sensemaking Agent

Location:

`07_ai_agents/sensemaking_agent/agent_spec.md`

Mission:

> Turn ambiguity into decision-ready advice.

Primary outputs:

- Weekly synthesis
- Decision brief

### Stakeholder Journey Agent

Location:

`07_ai_agents/stakeholder_agent/agent_spec.md`

Mission:

> Bring people along the journey.

Primary output:

- Stakeholder Alignment Assessment

### Shipping Coach

Location:

`07_ai_agents/shipping_coach/agent_spec.md`

Mission:

> Challenge unnecessary refinement and encourage timely delivery.

Primary output:

- Ship / Socialise / Refine / Stop recommendation

### Career Architect

Location:

`07_ai_agents/career_architect/agent_spec.md`

Mission:

> Create more strategic opportunities and support long-term career development.

Primary outputs:

- Opportunity Review
- Career Guidance
- Promotion Readiness Assessment

## Agent development rules

When adding or changing agents:

1. Do not change the root `README.md` unless the Strategic OS foundation itself needs to change.
2. Keep each agent in its own folder.
3. Use markdown-first documentation.
4. Define the agent’s mission, inputs, outputs, reasoning model, human-in-the-loop points, success metrics and failure modes.
5. Keep agents practical and decision-oriented.
6. Avoid storing organisational source data in this repository.
7. Separate evidence, interpretation, recommendation and action.

## Shared agent pattern

Each agent should generally include:

- Mission
- Primary Question
- Inputs
- Outputs
- Reasoning Framework
- Human In The Loop
- Success Metrics
- Failure Modes

## Next build step

The four priority agent specifications now exist.

The next agents-framework update should create reusable templates that support agent outputs, starting with:

`10_templates/stakeholder_alignment_assessment.md`

Purpose:

Create a reusable template for the Stakeholder Journey Agent’s primary output.
