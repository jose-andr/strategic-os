# Analytical Metric Definition Note

## Purpose

This template captures or clarifies the definition of a specific analytical metric.

It helps Strategic OS prevent definition drift, inconsistent interpretation and unsupported decision-making.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Metric definition notes support better decisions by making analytical language clear, stable and reusable.

## When To Use

Use this template when:

- a metric is being used repeatedly
- a metric definition is unclear
- a dashboard label needs plain-English explanation
- two similar metrics are being confused
- a metric may support a decision brief
- a metric is used in executive-facing material
- a metric definition has changed
- Genie or Databricks outputs need clearer terminology
- a caveat depends on the metric definition

Do not use it for one-off exploratory metrics that are unlikely to be reused.

## Definition Details

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
- needs source confirmation
- needs metric owner confirmation
- superseded
- archived

## Metric

[Name the metric.]

## Plain-English Definition

[Describe what the metric means in everyday language.]

## Technical Definition

[Describe the calculation or technical definition where needed.]

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

## Grain

[Account / case / request / interaction / transaction / customer / service / channel / team / day / week / month / unknown]

## Timeframe

[State the period or reporting logic.]

## Refresh Cadence

[State refresh cadence if known.]

## Inclusions

[List what is included.]

- Inclusion:
- Inclusion:

## Exclusions

[List what is excluded.]

- Exclusion:
- Exclusion:

## Filters Or Segments

[List common filters or segments that affect meaning.]

- Filter:
- Segment:

## Calculation Logic

[State calculation logic if known.]

## Related Metrics

| Related Metric | Difference |
| --- | --- |
|  |  |

## Caveats

[List caveats or reference related caveat note.]

Related file:

`metric_caveats.md`

## Data Quality Notes

[List known data quality issues or reference related note.]

Related file:

`data_quality_notes.md`

## Safe Use

This metric can support:

- [Safe use]
- [Safe use]

## Unsafe Use

This metric should not be used for:

- [Unsafe use]
- [Unsafe use]

## Human Review

### Human Review Required

Choose one:

- yes
- no

### Reason

[Explain why.]

Human review is required when the metric definition is:

- unclear
- contested
- newly created
- changed over time
- used in executive-facing material
- used in governance
- used for performance comparison
- used in stakeholder-sensitive communication
- used for public-facing claims
- based on exploratory analysis
- affected by material caveats or data quality issues

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

### Store This Definition?

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

`YYYY-MM-DD_domain_metric-definition_topic.md`

Example:

`2026-07-05_service-account_metric-definition_time-to-resolution.md`

## Standard Definition Statement

Use this pattern:

The metric [metric name] means [plain-English definition]. It is sourced from [source] and measured at [grain] grain over [timeframe]. It can support [safe use], but it should not be used for [unsafe use]. Human review is [required/not required] before [intended use].

## Review Checklist

Before using or storing this definition note, check:

- Metric is named
- Plain-English definition is clear
- Source is named
- Source type is labelled
- Grain is clear
- Timeframe is clear
- Refresh cadence is stated or marked unknown
- Inclusions are visible
- Exclusions are visible
- Caveats are linked
- Data quality notes are linked
- Safe use is defined
- Unsafe use is defined
- Human review requirement is clear
- Related files to update are identified

## Failure Modes

This template is failing if:

- metric names are used without definition
- definitions are too vague to guide interpretation
- source is missing
- grain is unclear
- inclusions or exclusions are hidden
- related metrics are confused
- caveats are separated from the definition
- human review is skipped for contested or high-risk use
- the note becomes a copied data dictionary without decision value

## Minimal Use Rule

Define metrics that are reused, contested or decision-relevant.

Do not recreate full organisational data dictionaries.
