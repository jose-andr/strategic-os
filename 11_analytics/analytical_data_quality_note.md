# Analytical Data Quality Note

## Purpose

This template captures a specific data quality issue that affects analytical interpretation.

It helps Strategic OS make reliability risks visible without storing raw data, customer-level records or governed source extracts.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Data quality notes support better decisions by making evidence limits clear before analysis is reused.

## When To Use

Use this template when a data quality issue affects:

- metric confidence
- source reliability
- trend interpretation
- anomaly interpretation
- source conflict
- decision-support evidence
- stakeholder communication
- executive-facing material
- governance or reporting interpretation

Do not use it for minor irregularities that do not affect interpretation, confidence or reuse.

## Note Details

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

- open
- monitoring
- resolved
- superseded
- archived

## Issue Summary

[Describe the data quality issue clearly.]

Do not include raw data rows or sensitive extracts.

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

### Source Of Truth Status

Choose one:

- confirmed source of truth
- approved reporting source
- approved analytical source
- contextual only
- exploratory only
- unknown
- to confirm

## Affected Metric Or Output

[Name affected metric, dashboard, query, output or interpretation.]

## Affected Timeframe

[State timeframe if known.]

## Issue Type

Choose one or more:

- missing records
- incomplete fields
- duplicate records
- inconsistent categorisation
- source lag
- refresh issue
- metric drift
- manual entry risk
- mapping issue
- integration issue
- dashboard filter issue
- unclear ownership
- historical definition change
- known exception
- source conflict
- other

## Severity

Choose one:

- low
- medium
- high
- blocking

### Severity Rationale

[Explain why this severity level is appropriate.]

## Confidence Impact

Choose one:

- minor impact
- moderate impact
- major impact
- prevents reliable use
- unknown

### Confidence Rationale

[Explain how this issue changes confidence.]

## Why It Matters

[Explain how the issue may affect interpretation or decisions.]

## Safe Interpretation

[State how the affected data or metric can still be used, if at all.]

## Unsafe Interpretation

[State what should not be claimed while this issue exists.]

## Workaround

[Describe any safe workaround, comparison source or review step.]

## Human Review

### Human Review Required

Choose one:

- yes
- no

### Reason

[Explain why.]

Human review is required when the issue affects:

- decision briefs
- executive-facing advice
- governance
- performance claims
- customer experience claims
- stakeholder-sensitive communication
- public-facing claims
- funding or resourcing decisions
- source-of-truth interpretation
- metric definitions or caveats

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

### Store This Note?

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

`YYYY-MM-DD_domain_data-quality-note_topic.md`

Example:

`2026-07-05_service-account_data-quality-note_refresh-cadence-uncertainty.md`

## Standard Data Quality Statement

Use this pattern:

A data quality issue affects [metric/source/output]. The issue is [issue summary] and has [severity] severity. This means the evidence should be interpreted with [confidence impact] because [reason]. It may still be used for [safe use], but it should not be used for [unsafe use]. Human review is [required/not required] before [intended use].

## Review Checklist

Before using or storing this note, check:

- Issue is clearly described
- Source is named
- Source type is labelled
- Affected metric or output is clear
- Timeframe is stated where known
- Severity is labelled
- Confidence impact is explained
- Safe use is defined
- Unsafe use is defined
- Human review requirement is clear
- Related files to update are identified
- Raw data is excluded
- Customer-level records are excluded
- Sensitive source extracts are excluded

## Failure Modes

This template is failing if:

- it stores raw data
- it duplicates official data quality systems without adding interpretation value
- issue descriptions are too vague to use
- severity is missing
- confidence impact is unclear
- unresolved issues are treated as resolved
- human review is skipped for material issues
- related caveats or source rules are not updated
- old issues continue lowering confidence after they are resolved

## Minimal Use Rule

Capture data quality issues that change interpretation, confidence, decisions or reuse.

Do not document every minor irregularity.
