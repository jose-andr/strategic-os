# Analytical Anomaly Summary

## Purpose

This template structures anomaly observations for Strategic OS analytical domains.

It helps convert an unexpected data point, spike, drop or irregular pattern into a caveated, decision-relevant summary without overstating cause or certainty.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Anomaly summaries support better decisions by clarifying what appears unusual, how reliable the evidence is and what follow-up may be required.

## When To Use

Use this template when analysis shows an unexpected or unusual pattern.

Use it for:

- unexpected volume spikes
- sudden demand drops
- unusual channel movement
- unexpected resolution-time change
- repeat-contact increase
- escalation or reopen spike
- data quality irregularity
- dashboard movement that does not match expectations
- Genie or Databricks output that needs review
- source conflict or metric inconsistency

Do not use this template for normal variation unless the anomaly may affect interpretation, risk, confidence or decision-making.

## Anomaly Summary Details

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
- needs source clarification
- needs metric clarification
- needs caveat strengthening
- needs data quality review
- needs human review
- safe for decision-support use
- archived

## Anomaly Question

[What anomaly or unexpected pattern is being reviewed?]

Example:

Why did active service accounts increase sharply in the last reporting period?

## Source

### Source Name

[Name source, dashboard, reporting layer, query, Genie output or contextual input.]

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

## Metric Definition

### Metric Or Signal

[Name metric or signal.]

### Plain-English Definition

[Define the metric before interpreting the anomaly.]

### Grain

[Account / case / request / interaction / transaction / customer / service / channel / team / day / week / month / unknown]

### Timeframe

Anomaly period:

Comparison period:

### Filters Or Segments

[List filters or segments used.]

## Anomaly Observation

[Describe what appears unusual.]

Keep this descriptive.

Do not explain cause yet.

Example:

The metric appears materially higher than the previous reporting period and is outside the recent observed range.

## Anomaly Type

Choose one or more:

- spike
- drop
- step change
- outlier
- reversal
- missing data
- unexpected stability
- volatility
- source mismatch
- segment-specific anomaly
- unclear anomaly

## Baseline Or Comparison

### Expected Pattern

[What was expected or typical?]

### Actual Pattern

[What was observed?]

### Difference

[Describe the difference without overclaiming.]

## Caveats

[List relevant caveats.]

Examples:

- source of truth not confirmed
- metric grain unclear
- refresh cadence unknown
- small sample size
- definition changed during period
- dashboard filter changed
- source system changed
- categorisation changed
- missing or duplicate records may affect result
- channel mix affects interpretation
- contextual signal only
- exploratory analysis only

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

Lower confidence when:

- source is unclear
- metric definition is unclear
- anomaly may be caused by data quality issue
- comparison period is weak
- volume is low
- source has changed
- filters or segments changed
- refresh cadence is unknown
- caveats materially affect interpretation

## Interpretation

### What This Anomaly May Mean

[Provide careful interpretation.]

Use cautious language:

- may indicate
- suggests
- appears consistent with
- could reflect
- may be associated with
- requires review before formal use

### What Cannot Be Concluded

[State what the anomaly does not prove.]

Examples:

- cause cannot be confirmed
- customer preference cannot be inferred
- service quality cannot be concluded
- performance cannot be compared
- demand change cannot be confirmed without source review
- issue cannot be escalated without human review

### Plausible Explanations

[List possible explanations.]

Examples:

- real demand change
- reporting lag
- dashboard filter change
- source system change
- process change
- communication or campaign effect
- staffing or operating change
- categorisation change
- data migration
- duplicate record effect
- missing data
- channel routing change
- one-off external event

## Decision Relevance

### Decision Or Judgement Supported

[What decision or judgement could this anomaly inform?]

### Usefulness

Choose one:

- strong decision-support evidence
- useful with caveats
- useful for sensemaking
- useful for further investigation
- not safe to use yet
- do not use

### Recommended Next Step

Choose one:

- use in decision brief
- send to Sensemaking Agent
- send to Stakeholder Journey Agent
- clarify source
- clarify metric definition
- strengthen caveats
- confirm data quality
- compare with another metric
- check source system change
- request human review
- monitor next period
- archive
- discard

## Human Review

### Human Review Required

Choose one:

- yes
- no

### Reason

[Explain why.]

Human review is required when the anomaly may be used for:

- executive-facing material
- governance
- formal decision-making
- stakeholder-sensitive communication
- performance claims
- customer experience claims
- public-facing claims
- funding or resourcing advice
- comparison between teams, individuals or services
- official reporting interpretation
- escalation or issue response

## Storage

### Store This Anomaly Summary?

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

`YYYY-MM-DD_domain_anomaly-summary_topic.md`

Example:

`2026-07-05_service-account_anomaly-summary_active-account-spike.md`

## Standard Anomaly Statement

Use this pattern:

Based on [source type] from [source], [metric or signal] appears to show a [anomaly type] during [timeframe] compared with [baseline or comparison period]. This should be interpreted with [confidence level] because [caveats/data quality notes]. The anomaly may support [decision or judgement], but it does not prove [unsupported claim]. Human review is [required/not required] before [intended use].

## Review Checklist

Before using or storing the anomaly summary, check:

- Source is named
- Source type is labelled
- Source-of-truth status is clear
- Metric is defined
- Grain is clear
- Anomaly period is clear
- Comparison period is clear
- Baseline is explained
- Filters are visible
- Observation is separated from interpretation
- Caveats are included
- Data quality notes are included
- Confidence is proportionate
- Plausible explanations are considered
- What cannot be concluded is stated
- Human review requirement is clear
- Raw data is excluded
- Customer-level records are excluded
- Storage location is appropriate

## Failure Modes

This template is failing if:

- normal variation is overstated as an anomaly
- anomaly is treated as proof of cause
- source changes are ignored
- dashboard or filter changes are ignored
- caveats are missing
- confidence is too high
- data quality issues are ignored
- stakeholder-sensitive claims are made without review
- raw data is copied into Strategic OS
- anomaly response is implied before human review

## Minimal Use Rule

Use this template for anomalies worth remembering, reviewing or acting on.

Keep the summary concise, caveated and decision-relevant.
