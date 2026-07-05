# Analytical Summary Template

## Purpose

This template structures analytical findings into a concise, caveated summary for Strategic OS use.

It is for turning analytical observations into reusable interpretation, not for storing raw data.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Analytical summaries should help clarify what the evidence may mean, what it does not prove and what decision it may support.

## When To Use

Use this template when you need to summarise:

- governed reporting interpretation
- approved analytical query results
- Databricks or Genie-supported analysis
- trend observations
- anomaly observations
- source comparison
- data quality implications
- metric caveats
- decision-support evidence

Do not use it for temporary queries with no reuse or decision value.

## Summary Details

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

## Analytical Question

[What question is this summary answering?]

## Source

### Source Name

[Name the source, dashboard, reporting layer, query, Genie output or contextual input.]

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

[Define the metric before interpreting it.]

### Grain

[Account / case / request / interaction / transaction / customer / service / channel / team / day / month / unknown]

### Timeframe

[State timeframe.]

### Filters Or Segments

[List filters or segments used.]

## Observation

[State what the data or evidence appears to show.]

Keep this descriptive.

Do not interpret cause yet.

## Caveats

[List relevant caveats.]

Examples:

- source of truth not confirmed
- metric grain unclear
- refresh cadence unknown
- small sample size
- definition changed over time
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

## Interpretation

### What This May Mean

[Explain the likely meaning, using careful language.]

Use:

- may indicate
- suggests
- appears consistent with
- could reflect
- should be checked against
- requires review before formal use

Avoid:

- proves
- confirms
- definitively shows
- the cause is
- no caveats apply

### What Cannot Be Concluded

[State what the evidence does not prove.]

### Alternative Explanations

[List plausible alternative explanations.]

## Decision Relevance

### Decision Or Judgement Supported

[What decision or judgement could this inform?]

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
- request human review
- archive
- discard

## Human Review

### Human Review Required

Choose one:

- yes
- no

### Reason

[Explain why.]

Human review is required when the summary may be used for:

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

### Store This Summary?

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

`YYYY-MM-DD_domain_analytical-summary_topic.md`

Example:

`2026-07-05_service-account_analytical-summary_active-account-pattern.md`

## Standard Summary Statement

Use this pattern:

Based on [source type] from [source], [metric or signal] appears to show [observation] for [timeframe]. This should be interpreted with [confidence level] because [caveats/data quality notes]. It may support [decision or judgement], but it does not prove [unsupported claim]. Human review is [required/not required] before [intended use].

## Review Checklist

Before using or storing the summary, check:

- Source is named
- Source type is labelled
- Source-of-truth status is clear
- Metric is defined
- Grain is clear
- Timeframe is clear
- Filters are visible
- Observation is separated from interpretation
- Caveats are included
- Data quality notes are included
- Confidence is proportionate
- What cannot be concluded is stated
- Human review requirement is clear
- Raw data is excluded
- Customer-level records are excluded
- Storage location is appropriate

## Failure Modes

This template is failing if:

- it stores raw data
- it treats exploratory analysis as official reporting
- it interprets metrics before defining them
- it omits caveats
- it hides source uncertainty
- it overstates confidence
- it implies cause without evidence
- it supports stakeholder-sensitive claims without review
- it creates a long report where a concise summary would work

## Minimal Use Rule

Use this template for analytical findings worth reusing.

Keep summaries concise, caveated and decision-relevant.
