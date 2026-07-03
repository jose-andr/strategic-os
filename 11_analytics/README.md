# Analytics

## Purpose

This folder contains Strategic OS analytics documentation, domain-specific data interpretation patterns, governed metric caveats, Genie context, review prompts and non-sensitive analytical guidance.

Use this folder for analytics domains that need clearer source rules, metric definitions, interpretation guidance or Databricks / Genie agent support.

Analytics folders should help connect evidence to better strategic decisions without storing raw organisational source data.

## What belongs here

- Analytics domain documentation
- Metric definitions
- Source rules
- Caveats
- Genie context
- Agent review prompts
- Agent consistency checks
- SQL templates
- Data interpretation notes
- Non-sensitive analytical synthesis
- Evidence boundaries
- Data quality guidance
- Links or references to governed systems of record

## What does not belong here

- Raw organisational datasets
- Customer-level records
- Governed source extracts
- Confidential business data
- Sensitive operational records
- Personally identifiable information
- Unapproved reporting outputs
- Data copied from systems of record

Use summaries, caveats, reusable prompts, interpretation rules and links to governed systems instead.

## Current analytics domains

| Domain | Folder | Purpose |
|---|---|---|
| Service Account | `11_analytics/service-account/` | First mature analytics pilot pattern for Strategic OS, including metric definitions, Genie context, review prompts, caveats and EOFY documentation support |

## Future analytics domains

Strategic OS should be able to support multiple Databricks / Genie analytical agents across different domains.

Potential future domains:

- `11_analytics/channel-strategy/`
- `11_analytics/customer-demand/`
- `11_analytics/support-csat/`
- `11_analytics/executive-metrics/`
- `11_analytics/data-quality/`

Create these only when there is a real analytical domain that needs its own source rules, caveats, prompts or review checks.

## Recommended domain structure

Use this pattern for future analytics domains:

    11_analytics/
    └── domain-name/
        ├── README.md
        ├── source_rules.md
        ├── metric_definitions.md
        ├── metric_caveats.md
        ├── genie_context.md
        ├── agent_review_prompt.md
        ├── agent_consistency_check.md
        ├── sql/
        └── archive/

## File purposes

### `README.md`

Domain overview, purpose, scope, source systems and key caveats.

### `source_rules.md`

Rules for which systems, tables, exports or governed tools can be used.

### `metric_definitions.md`

Definitions for metrics used in the domain.

### `metric_caveats.md`

Known limitations, exclusions, interpretation risks and reporting boundaries.

### `genie_context.md`

Context and prompt guidance for Databricks Genie or related analytical agents.

### `agent_review_prompt.md`

Review prompt for checking analytical outputs before use.

### `agent_consistency_check.md`

Checklist for identifying metric drift, unsupported claims or inconsistent interpretation.

### `sql/`

Reusable SQL templates or safe query patterns where appropriate.

### `archive/`

Superseded analytical guidance that is safe to retain.

## Relationship to `07_ai_agents/`

General-purpose personal agents live in:

`07_ai_agents/`

Domain-specific analytical agents and rules may live inside:

`11_analytics/[domain]/`

This keeps general agent principles separate from domain-specific data rules.

## Databricks / Genie agent principles

Future Databricks / Genie agents should:

- use governed data sources only
- follow documented source rules
- apply metric definitions consistently
- include caveats where needed
- distinguish governed headline metrics from contextual evidence
- avoid unsupported claims
- flag data quality issues
- remain inside their domain scope
- require human review before strategic or executive use

## Related agents

| Agent | Use |
|---|---|
| Sensemaking Agent | Turn analytical evidence into decision-ready advice |
| Stakeholder Journey Agent | Translate analytical findings for stakeholder alignment |
| Shipping Coach | Check whether an analytical output is ready to socialise |
| Chief of Staff Agent | Surface analytical follow-ups, reporting deadlines and review needs |
| Future Databricks / Genie agents | Interrogate governed data within domain-specific rules and caveats |

## Related templates

| Template | Use |
|---|---|
| `10_templates/decision_brief.md` | Convert evidence into a decision recommendation |
| `10_templates/lesson_learned.md` | Capture analytical learning or interpretation patterns |
| `10_templates/quarterly_strategic_os_assessment.md` | Review analytical reliability and usefulness over time |

## Suggested naming

Use clear lowercase filenames with underscores.

Examples:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`

## Review rhythm

Review analytics domains monthly or before major reporting cycles.

Use the review to ask:

- Are metric definitions still accurate?
- Are source rules clear?
- Are caveats visible?
- Are analytical agents staying within scope?
- Are contextual signals clearly labelled?
- Are governed metrics protected?
- Are outdated assumptions archived or updated?

## Review checklist

Before saving analytics material, check:

- [ ] Is this non-sensitive and safe to retain?
- [ ] Is raw organisational data excluded?
- [ ] Are source systems referenced but not copied?
- [ ] Are metric definitions clear?
- [ ] Are caveats documented?
- [ ] Is the difference between governed metrics and contextual evidence clear?
- [ ] Is human review required before use?
