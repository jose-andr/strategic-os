# Analytical Source Conflict Note

## Purpose

This template documents conflicts between analytical sources, metrics, dashboards, queries or interpretations.

It helps Strategic OS avoid blending incompatible evidence or choosing a source without making the source hierarchy, caveats and confidence visible.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Source conflict notes support better decisions by making uncertainty explicit before analytical evidence is reused.

## When To Use

Use this template when:

- two sources show different values
- a dashboard and query disagree
- Genie output conflicts with approved reporting
- metric definitions differ between systems
- source hierarchy is unclear
- a contextual signal conflicts with governed data
- user-provided interpretation conflicts with source evidence
- an analytical output may be unsafe because sources do not align

Do not use it for minor differences that do not affect interpretation, confidence or decision-making.

## Conflict Summary

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
- under review
- resolved
- unresolved
- needs source clarification
- needs metric clarification
- needs human review
- archived

## Analytical Question

[What question or claim is affected by the source conflict?]

## Conflicting Sources

| Source | Source Type | Metric Or Claim | Value Or Interpretation | Notes |
| --- | --- | --- | --- | --- |
| Source A | Governed / Approved / Contextual / Exploratory / Unknown |  |  |  |
| Source B | Governed / Approved / Contextual / Exploratory / Unknown |  |  |  |

## Source Hierarchy

### Current Source Hierarchy

[State the known hierarchy from `source_rules.md`, or mark as unknown.]

### Preferred Source For Formal Claims

[State which source should be preferred, if known.]

### Reason

[Explain why this source should be preferred.]

## Metric Definition Check

### Metric A Definition

[Define the metric or claim from Source A.]

### Metric B Definition

[Define the metric or claim from Source B.]

### Definition Difference

[Explain whether the sources are measuring the same thing.]

Common causes of apparent conflict:

- different grain
- different timeframe
- different filters
- different inclusions or exclusions
- different refresh cadence
- different source system
- different status logic
- dashboard transformation
- query logic difference
- metric definition drift
- contextual interpretation being compared to governed metric

## Caveats

[List caveats affecting the conflict.]

## Data Quality Notes

[List known or suspected data quality issues.]

## Confidence

Choose one:

- high confidence
- medium confidence
- low confidence
- do not use yet

### Confidence Rationale

[Explain why this confidence level is appropriate.]

Use low confidence or do not use yet when:

- source of truth is unclear
- metric definitions differ
- refresh cadence differs
- caveats are material
- data quality issues may explain the conflict
- the conflict affects a decision
- human review has not occurred

## Interpretation

### What The Conflict May Mean

[Provide a careful interpretation.]

Use cautious language:

- may reflect
- could indicate
- appears consistent with
- may be caused by
- requires review before formal use

### What Cannot Be Concluded

[State what cannot be concluded while the conflict remains unresolved.]

### Decision Risk

[Explain how the conflict could affect decisions, recommendations or communication.]

## Recommended Action

Choose one or more:

- defer to governed source
- clarify metric definition
- clarify source hierarchy
- check dashboard filters
- check query logic
- check refresh cadence
- check data quality notes
- request human review
- do not use yet
- update `source_rules.md`
- update `metric_definitions.md`
- update `metric_caveats.md`
- update `data_quality_notes.md`
- send to Sensemaking Agent after resolution

## Human Review

### Human Review Required

Choose one:

- yes
- no

### Reason

[Explain why.]

Human review is required when:

- the conflict affects a decision
- output may be executive-facing
- output may be used in governance
- output may support performance claims
- output may affect stakeholder communication
- source of truth is unclear
- metric definition is contested
- data quality issues may materially affect interpretation

## Resolution

### Resolution Status

Choose one:

- unresolved
- resolved
- partially resolved
- superseded
- archived

### Resolution Summary

[Explain how the conflict was resolved or why it remains unresolved.]

### Source To Use Going Forward

[State source to use.]

### Files To Update

| File | Update Needed |
| --- | --- |
| `source_rules.md` |  |
| `metric_definitions.md` |  |
| `metric_caveats.md` |  |
| `data_quality_notes.md` |  |
| `genie_context.md` |  |

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

`YYYY-MM-DD_domain_source-conflict_topic.md`

Example:

`2026-07-05_service-account_source-conflict_active-account-count.md`

## Standard Source Conflict Statement

Use this pattern:

A source conflict exists between [Source A] and [Source B] for [metric or claim]. The difference may reflect [definition/source/filter/refresh/data quality issue]. Until resolved, this evidence should be treated with [confidence level] and should not be used for [restricted use]. Human review is [required/not required] before [intended use].

## Review Checklist

Before using or storing the note, check:

- Both sources are named
- Source types are labelled
- Source hierarchy is stated or marked unknown
- Metric definitions are compared
- Timeframes are compared
- Filters are checked
- Caveats are visible
- Data quality issues are considered
- Confidence is lowered where needed
- Human review requirement is clear
- Recommended action is practical
- Raw data is excluded
- Customer-level records are excluded

## Failure Modes

This template is failing if:

- conflicting sources are blended without explanation
- the preferred source is chosen without rationale
- source hierarchy is ignored
- metric definition differences are missed
- confidence remains too high
- unresolved conflict is treated as resolved
- caveats are omitted
- data quality issues are ignored
- sensitive data is copied into Strategic OS
- conflict notes become a substitute for official data governance

## Minimal Use Rule

Use this template only for conflicts that affect interpretation, confidence, decisions or reuse.

Do not document every minor discrepancy.
