# Analytical Metric Caveat Note

## Purpose

This template captures a specific caveat that affects how a metric should be interpreted.

It helps Strategic OS prevent metric misuse, overclaiming and unsupported decision-making.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Metric caveat notes support better decisions by making the limits of analytical evidence visible and reusable.

## When To Use

Use this template when a caveat affects:

- metric interpretation
- trend interpretation
- anomaly interpretation
- decision-support evidence
- stakeholder communication
- executive-facing material
- governance or reporting interpretation
- confidence in an analytical output

Do not use this template for caveats that are obvious, temporary or unlikely to affect future interpretation.

## Caveat Details

### Title

[Short descriptive title]

### Date

[Date]

### Domain

[Analytics domain]

Example:

`service-account`

### Prepared By

[Person or agent]

### Status

Choose one:

- draft
- reviewed
- active
- superseded
- archived

## Metric

[Name the metric affected by this caveat.]

## Source

### Source Name

[Name the source, dashboard, reporting layer, query or tool.]

### Source Type

Choose one:

- governed source
- approved reporting source
- approved analytical source
- contextual signal
- exploratory analysis
- user-provided context
- external benchmark
- unknown source

## Metric Definition

[Define the metric before describing the caveat.]

## Caveat Type

Choose one or more:

- definition caveat
- source caveat
- lag caveat
- completeness caveat
- duplication caveat
- filter caveat
- channel caveat
- volume caveat
- sample caveat
- attribution caveat
- context caveat
- transition caveat
- governance caveat
- sensitivity caveat
- data quality caveat
- other

## Caveat

[Describe the caveat clearly.]

## Why It Matters

[Explain how this caveat could change interpretation.]

## Severity

Choose one:

- low
- medium
- high
- blocking

### Severity Rationale

[Explain why this severity level is appropriate.]

## Confidence

Choose one:

- high confidence
- medium confidence
- low confidence
- unknown

### Confidence Rationale

[Explain how certain this caveat is.]

## Safe Interpretation

[State how the metric can still be used safely.]

## Unsafe Interpretation

[State what should not be claimed from this metric.]

## Example Safe Language

[Provide wording that can be reused in analytical summaries or decision briefs.]

Example:

This metric should be interpreted as directional because [caveat]. It may support [safe use], but it should not be used to claim [unsupported claim] without review.

## Human Review

### Human Review Required

Choose one:

- yes
- no

### Reason

[Explain why.]

Human review is required when the caveated metric is used for:

- decision briefs
- executive-facing advice
- governance
- formal reporting interpretation
- performance claims
- customer experience claims
- stakeholder-sensitive communication
- public-facing claims
- funding or resourcing decisions
- comparison between teams, individuals or services

## Related Files To Update

| File | Update Needed |
| --- | --- |
| `source_rules.md` |  |
| `metric_definitions.md` |  |
| `metric_caveats.md` |  |
| `data_quality_notes.md` |  |
| `genie_context.md` |  |
| `agent_output_index.md` |  |

## Storage

### Store This Caveat?

Choose one:

- yes
- no
- only after review

### Recommended Location

[File path]

Example:

`11_analytics/service-account/`

### Suggested File Name

Use:

`YYYY-MM-DD_domain_metric-caveat_topic.md`

Example:

`2026-07-05_service-account_metric-caveat_closure-does-not-equal-resolution.md`

## Standard Caveat Statement

Use this pattern:

The metric [metric name] should be interpreted with caution because [caveat]. This matters because [interpretation risk]. The metric may support [safe use], but it should not be used for [unsafe use]. Human review is [required/not required] before [intended use].

## Review Checklist

Before using or storing this caveat note, check:

- Metric is named
- Source is named
- Source type is labelled
- Metric definition is clear
- Caveat type is labelled
- Caveat is specific
- Why it matters is clear
- Severity is labelled
- Confidence is labelled
- Safe use is defined
- Unsafe use is defined
- Human review requirement is clear
- Related files to update are identified
- Raw data is excluded
- Customer-level records are excluded

## Failure Modes

This template is failing if:

- caveats are too vague to guide interpretation
- caveats are not linked to a metric
- caveats are buried after strong claims
- severity is missing
- confidence is missing
- safe and unsafe uses are unclear
- caveats are not reused in analytical summaries
- caveats are not reflected in Genie context or review prompts
- human review is skipped for high-risk use

## Minimal Use Rule

Capture caveats that change interpretation.

Do not create caveat notes for every minor limitation.

Focus on caveats that affect decisions, confidence, trust or reuse.
