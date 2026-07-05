# Analytical Trend Summary

## Purpose

This template structures trend observations for Strategic OS analytical domains.

It helps convert a pattern over time into a caveated, decision-relevant summary without overstating cause or certainty.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Trend summaries support better decisions by clarifying what appears to be changing, how reliable the evidence is and what judgement it may support.

## When To Use

Use this template when analysis suggests a repeated movement, pattern or shift over time.

Use it for:

- service demand trends
- channel mix trends
- customer experience trends
- operational workload trends
- case or request volume trends
- resolution or closure trends
- repeat contact trends
- escalation or reopen trends
- satisfaction or sentiment trends
- data quality trends

Do not use this template for a single data point or one-off anomaly.

## Trend Summary Details

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
- needs human review
- safe for decision-support use
- archived

## Trend Question

[What trend question is being answered?]

Example:

Are active service accounts increasing over the last quarter?

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

[Define the metric before interpreting the trend.]

### Grain

[Account / case / request / interaction / transaction / customer / service / channel / team / day / week / month / unknown]

### Trend Period

Start:

End:

Comparison period:

### Filters Or Segments

[List filters or segments used.]

## Trend Observation

[Describe what appears to be changing.]

Keep this descriptive.

Do not explain cause yet.

Example:

The metric appears to increase across the selected period, with a larger rise in the final month.

## Trend Shape

Choose one or more:

- increasing
- decreasing
- stable
- volatile
- seasonal
- step change
- gradual change
- spike
- dip
- recovery
- unclear

## Caveats

[List relevant caveats.]

Examples:

- source of truth not confirmed
- metric grain unclear
- refresh cadence unknown
- definition changed during period
- seasonality may affect trend
- low volume may exaggerate movement
- channel mix affects interpretation
- closure does not equal customer resolution
- repeat contact does not prove failure demand
- contextual signal only
- exploratory analysis only

## Data Quality Notes

[List known data quality issues.]

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
- timeframe is short
- data quality issues exist
- refresh cadence is unknown
- trend is based on small volume
- source changed during the trend period
- caveats materially affect interpretation

## Interpretation

### What This Trend May Mean

[Provide careful interpretation.]

Use cautious language:

- may indicate
- suggests
- appears consistent with
- could reflect
- may be associated with
- requires review before formal use

### What Cannot Be Concluded

[State what the trend does not prove.]

Examples:

- cause cannot be confirmed
- customer preference cannot be inferred
- service quality cannot be concluded
- performance cannot be compared
- demand change cannot be confirmed without source review

### Alternative Explanations

[List plausible alternative explanations.]

Examples:

- reporting change
- source refresh issue
- seasonal demand
- channel routing change
- process change
- campaign or communication effect
- staffing or operating change
- categorisation change
- data migration
- duplicate record effect

## Decision Relevance

### Decision Or Judgement Supported

[What decision or judgement could this trend inform?]

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

Human review is required when the trend may be used for:

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

## Storage

### Store This Trend Summary?

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

`YYYY-MM-DD_domain_trend-summary_topic.md`

Example:

`2026-07-05_service-account_trend-summary_active-account-volume.md`

## Standard Trend Statement

Use this pattern:

Based on [source type] from [source], [metric or signal] appears to show a [trend shape] over [timeframe]. This should be interpreted with [confidence level] because [caveats/data quality notes]. The trend may support [decision or judgement], but it does not prove [unsupported claim]. Human review is [required/not required] before [intended use].

## Review Checklist

Before using or storing the trend summary, check:

- Source is named
- Source type is labelled
- Source-of-truth status is clear
- Metric is defined
- Grain is clear
- Trend period is clear
- Comparison period is clear
- Filters are visible
- Observation is separated from interpretation
- Caveats are included
- Data quality notes are included
- Confidence is proportionate
- Alternative explanations are considered
- What cannot be concluded is stated
- Human review requirement is clear
- Raw data is excluded
- Customer-level records are excluded
- Storage location is appropriate

## Failure Modes

This template is failing if:

- a short-term movement is overstated as a trend
- a trend is treated as proof of cause
- caveats are missing
- source changes are ignored
- confidence is too high
- seasonality is ignored
- data quality issues are ignored
- stakeholder-sensitive claims are made without review
- raw data is copied into Strategic OS

## Minimal Use Rule

Use this template for trends worth remembering or using.

Keep the summary concise, caveated and decision-relevant.
