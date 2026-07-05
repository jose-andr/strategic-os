# Domain Analytical Agent Genie Context

## Purpose

This pattern defines how to prepare safe, consistent context for Databricks Genie or similar natural-language analytics tools.

It helps Domain Analytical Agents use Genie outputs carefully by making domain purpose, source hierarchy, metric definitions, caveats and review requirements explicit.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Genie context supports the North Star by making analytical questions easier to ask and analytical answers safer to interpret.

## Core Principle

Genie can help retrieve or explain data.

Genie is not the source of truth by itself.

A Genie response should be interpreted through:

- source rules
- metric definitions
- metric caveats
- data quality notes
- human review
- decision relevance

## When To Use

Use this pattern when an analytics domain uses Databricks Genie or a similar natural-language analytics interface.

Use it when:

- users repeatedly ask similar analytical questions
- metric language needs standardising
- source hierarchy matters
- Genie answers need consistent caveats
- outputs may support decision briefs
- data quality issues affect interpretation
- non-technical users need safer analytical interaction

Do not create Genie context for domains that do not use natural-language analytics tools.

## Recommended Location

General pattern:

`11_analytics/domain_agent_genie_context.md`

Domain-specific context:

`11_analytics/[domain]/genie_context.md`

Examples:

- `11_analytics/service-account/genie_context.md`
- `11_analytics/channel-strategy/genie_context.md`
- `11_analytics/customer-demand/genie_context.md`
- `11_analytics/support-csat/genie_context.md`
- `11_analytics/executive-metrics/genie_context.md`
- `11_analytics/data-quality/genie_context.md`

## What Genie Context Should Include

A domain Genie context file should include:

- domain purpose
- approved terminology
- source hierarchy
- approved metrics
- metric definitions
- known caveats
- data quality notes
- common questions
- safe interpretation rules
- prohibited interpretations
- human review triggers
- storage rules

## What Genie Context Should Not Include

Do not include:

- raw datasets
- customer-level rows
- restricted query outputs
- copied dashboard extracts
- sensitive screenshots
- confidential source exports
- private stakeholder commentary
- passwords, keys or credentials
- unrestricted table access instructions
- instructions to bypass governance

## Standard Genie Context Structure

Use this structure for domain-specific `genie_context.md` files.

# Genie Context

## Purpose

This file gives Genie or a similar natural-language analytics tool safe context for this analytics domain.

## Domain

[Domain name]

## Intended Use

[Describe what questions this context supports.]

## Source Hierarchy

[State source hierarchy or link to `source_rules.md`.]

## Approved Terms

| Term | Use This Meaning | Avoid Confusing With |
| --- | --- | --- |
|  |  |  |

## Approved Metrics

| Metric | Definition | Source | Caveat |
| --- | --- | --- | --- |
|  |  |  |  |

## Common Questions

| Question | Preferred Interpretation |
| --- | --- |
|  |  |

## Known Caveats

[List caveats or link to `metric_caveats.md`.]

## Data Quality Notes

[List known data quality issues or link to `data_quality_notes.md`.]

## Safe Response Pattern

[State how Genie-style answers should be interpreted.]

## Prohibited Interpretations

[List claims or interpretations not allowed without review.]

## Human Review Triggers

[List when human review is required.]

## Storage Rules

[State what may or may not be stored in Strategic OS.]

## Approved Terminology

Use consistent terminology so questions and answers remain stable.

Document terms such as:

- customer
- account
- contact
- interaction
- case
- request
- channel
- service
- resolution
- completion
- escalation
- demand
- failure demand
- repeat contact
- satisfaction
- sentiment
- containment
- digital uptake
- assisted support

For each term, clarify:

- what it means in the domain
- what it does not mean
- which source uses it
- which metric it relates to
- what caveat applies

## Common Question Pattern

Document repeatable questions.

| Question Type | Example | Required Context |
| --- | --- | --- |
| Definition | What does this metric mean? | Metric definition and source |
| Trend | Is this increasing or decreasing? | Timeframe, source, caveat |
| Comparison | How does this compare across segments? | Grain, filter, caveat |
| Anomaly | What changed unexpectedly? | Baseline, timeframe, source |
| Source conflict | Why do two views differ? | Source hierarchy |
| Decision support | What decision could this inform? | Caveats and confidence |
| Data quality | Can we trust this metric? | Data quality note |

## Safe Prompting Pattern

Use prompts that ask for caveated analytical interpretation.

Example structure:

Question:

[Ask the analytical question.]

Context to apply:

- use approved source hierarchy
- define the metric before interpreting it
- state timeframe and grain
- include known caveats
- separate observation from interpretation
- state confidence
- identify human review required
- avoid official reporting claims unless source and review support them

## Safe Response Pattern

A safe Genie-supported response should include:

### Question

[Question answered]

### Source

[Source used]

### Metric Definition

[Metric meaning]

### Observation

[What the data appears to show]

### Caveats

[Known limits]

### Confidence

[High / Medium / Low]

### Interpretation

[What it may mean]

### Decision Relevance

[What decision it may support]

### Human Review

[Review required before use]

## Prohibited Interpretations

Genie-supported outputs must not:

- treat Genie as the source of truth
- use unknown tables as authoritative
- ignore metric definitions
- omit caveats
- present exploratory outputs as official reporting
- infer cause without evidence
- compare teams or individuals without review
- make public-facing claims without review
- store raw query outputs in Strategic OS
- bypass governed dashboards where required
- imply that a decision has been made
- overstate confidence

## Source Conflict Handling

If Genie output conflicts with another source, the Domain Analytical Agent should:

1. name the conflicting sources
2. check `source_rules.md`
3. state the source hierarchy
4. avoid blending incompatible figures
5. lower confidence
6. recommend human review
7. use the governed source for formal claims where required

## Caveat Handling

If a metric has known caveats, the Genie-supported output should include them.

If caveats are unknown, the output should say:

Caveats are not yet confirmed. This output should not be used for decision support until source rules and metric caveats are reviewed.

## Data Quality Handling

If data quality issues are known, include:

- affected source
- affected metric
- severity
- interpretation impact
- safe use
- human review trigger

If data quality is unknown, lower confidence.

## Human Review Required

Human review is required before Genie-supported outputs are:

- used in decision briefs
- used in executive-facing material
- used in governance
- used for performance claims
- used in stakeholder-sensitive communication
- used to compare teams or individuals
- used in public-facing claims
- used where source, metric or caveat is unclear
- stored as reusable analytical evidence

## Storage Rules

Store reusable Genie context in:

`11_analytics/[domain]/genie_context.md`

Store reviewed analytical summaries in:

`11_analytics/[domain]/`

Do not store:

- raw Genie transcripts
- raw query results
- customer-level rows
- copied governed outputs
- restricted table details
- sensitive screenshots
- exploratory outputs with no reuse value

## Relationship To Domain Files

Genie context should align with:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`

If one changes, check whether the Genie context needs updating.

## Review Checklist

Before using or storing Genie context, check:

- Is the domain purpose clear?
- Is source hierarchy clear?
- Are approved terms defined?
- Are approved metrics listed?
- Are caveats visible?
- Are data quality issues included?
- Are prohibited interpretations listed?
- Are human review triggers clear?
- Are storage rules safe?
- Does the context avoid raw or sensitive data?
- Does it improve decision-support quality?

## Success Measures

Genie context is working when:

- users ask clearer analytical questions
- Genie-supported outputs use consistent terms
- metric definitions are stable
- caveats are included
- data quality issues are visible
- source hierarchy is respected
- confidence is proportionate
- human review happens before formal use
- Strategic OS avoids storing raw Genie outputs
- analytical evidence becomes more useful for decisions

## Failure Modes

Genie context is failing if:

- Genie answers are treated as source of truth
- caveats disappear
- metric definitions drift
- outputs use inconsistent terminology
- raw query outputs are stored in Strategic OS
- source conflicts are hidden
- confidence is too high
- human review is skipped
- non-technical users gain false certainty
- context becomes too broad to govern

## Minimal Use Rule

Create Genie context only where natural-language analytics is actually being used.

Keep the context narrow, domain-specific and caveated.

Use Genie to support interpretation, not to replace governed reporting or human judgement.
