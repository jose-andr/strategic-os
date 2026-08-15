# Enterprise AI Agent Capability Assessment

## Purpose

Assess which organisation-approved enterprise AI agents can reduce recurring administrative work, retrieve authoritative organisational policy and guidance, and support Strategic OS work by playing to the native strengths of each platform.

This assessment replaces the earlier Microsoft 365 Copilot-only capability test.

## Decision question

Which enterprise AI agents should be used for which recurring work because they:
- remove repetitive administration;
- retrieve authoritative organisational information from their native systems;
- prepare useful outputs for human review;
- work within restrictive organisational permissions and governance;
- avoid duplicating another platform's stronger capability; and
- require low ongoing human management once configured?

## Operating assumption

Assume a conservative, risk-averse organisational environment.

Agents may be able to retrieve, summarise, classify, prepare, draft and recommend a next administrative action.

Do not assume they can autonomously decide, publish, alter authoritative records, execute cross-system workflows, use unrestricted connectors, or retain sensitive organisational knowledge outside approved systems.

Preferred pattern:

> Retrieve → summarise → prepare → human review → action in the system of record.

## Platforms in scope

- **Microsoft 365 Copilot / Agent Builder** — meetings, email, calendar, Microsoft 365 knowledge, policy retrieval and narrow repeatable admin support.
- **Atlassian Rovo** — Jira, Confluence, project governance, decision traceability and Atlassian-based policy/process retrieval.
- **Databricks Genie** — governed analytics, repeatable metric retrieval and diagnostic evidence.
- **Miro AI / Sidekick** — extraction and summarisation of existing board content.

Miro AI is not being assessed as a creativity or design substitute.

## Strategic OS boundary

Strategic OS remains the durable layer for interpretation, decision logic, reusable operating patterns, caveats and lessons.

Organisational systems remain the source of truth for policies, documents, meetings, email, Jira, Confluence, governed data, Miro boards and official records.

Do not copy raw organisational source material into this repository.

## Files

- `context.md`
- `decisions.md`
- `stakeholder-notes.md`
- `outputs/enterprise-ai-agent-capability-assessment.md`
- `lessons-learned.md`
- `archive/`

## Current status

**Phase:** Capability discovery

Current evidence confirms the presence of Microsoft 365 Copilot, Microsoft agent-building surfaces, organisation-deployed Copilot Studio agents, Atlassian Rovo, Databricks Genie and Miro AI / Sidekick.

Presence does not prove unrestricted permissions, full licensing, approved connectors or write capability.

## Test rule

Do not compare agents on generic creativity or writing quality.

Test each platform against the work it is structurally best positioned to support.

> What recurring work can this agent prepare correctly enough that the user mainly needs to review and act?
