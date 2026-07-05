# Analytical Decision Support Evidence

## Purpose

This template converts analytical findings into safe, caveated evidence that can support Strategic OS decision-making.

It helps prevent raw analysis, dashboard observations or Genie outputs from being used as decisions before source, metric, caveat and confidence checks are complete.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Analytical evidence should improve judgement, not create false certainty.

## When To Use

Use this template when analytical work may support:

- decision brief
- opportunity review
- service review
- operating model recommendation
- channel strategy recommendation
- stakeholder discussion
- executive-facing advice
- quarterly Strategic OS assessment
- strategic planning
- prioritisation decision

Do not use this template for temporary exploratory queries with no decision relevance.

## Evidence Summary

### Decision Or Judgement Being Supported

[What decision, judgement or question could this evidence support?]

### Analytical Question

[What analytical question was asked?]

### Domain

[Analytics domain]

Example:

`service-account`

### Source

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

### Metric Or Evidence Used

[Name the metric, signal or analytical output.]

### Metric Definition

[Define the metric before interpreting it.]

### Grain

[Account / case / request / interaction / transaction / customer / service / channel / team / day / month / unknown]

### Timeframe

[State the timeframe used.]

### Observation

[What does the evidence appear to show?]

### Caveats

[List relevant caveats.]

### Data Quality Notes

[List relevant data quality issues.]

### Confidence

Choose one:

- high confidence
- medium confidence
- low confidence
- do not use yet

### Confidence Rationale

[Explain why this confidence level is appropriate.]

## Interpretation

### What This May Mean

[Provide a careful interpretation.]

Use cautious language where appropriate:

- may indicate
- suggests
- appears to show
- is consistent with
- could reflect
- requires review before formal use

### What Cannot Be Concluded

[State what the evidence does not prove.]

### Alternative Explanations

[List other plausible explanations.]

### Decision Relevance

[Explain how this evidence may affect the decision or judgement.]

### Recommended Use

Choose one:

- can support decision-making
- can support decision-making with caveats
- useful for sensemaking only
- useful for further investigation
- not safe to use yet
- do not use

## Human Review

### Human Review Required

Choose one:

- yes
- no

### Reason

[Explain why review is or is not required.]

Human review is required when evidence is:

- executive-facing
- governance-facing
- stakeholder-sensitive
- used for performance claims
- used for customer experience claims
- used for public-facing claims
- used for funding or resourcing decisions
- based on unclear source or metric definition
- affected by material caveats
- based on exploratory analysis
- likely to be mistaken for official reporting

## Recommended Next Step

Choose one:

- use in decision brief
- send to Sensemaking Agent
- send to Stakeholder Journey Agent
- strengthen caveats
- clarify source
- clarify metric definition
- confirm data quality
- request human review
- store as reusable evidence
- discard

## Storage Recommendation

### Store This Output?

Choose one:

- yes
- no
- only after review

### Recommended Location

[File path]

Example:

`11_analytics/service-account/`

### Recommended File Type

Choose one:

- analytical summary
- decision-support evidence
- metric caveat note
- source rules update
- metric definition update
- data quality note
- Genie context update
- temporary working note
- do not store

## Evidence Quality Checklist

Before using this evidence, check:

- Source is named
- Source type is labelled
- Metric is defined
- Grain is clear
- Timeframe is clear
- Caveats are visible
- Data quality issues are considered
- Observation is separated from interpretation
- Confidence is proportionate
- What cannot be concluded is stated
- Human review requirement is clear
- Storage recommendation is safe
- Raw data is not copied into Strategic OS
- Customer-level records are excluded
- Claims do not exceed evidence

## Final Evidence Statement

Use this pattern:

Based on [source type] from [source], the evidence [appears to show / suggests / may indicate] [observation]. This should be interpreted with [confidence level] because [caveats and data quality notes]. It may support [decision or judgement], but it should not be used to claim [unsupported claim]. Human review is [required / not required] before [use case].

## Failure Modes

This template is failing if:

- raw analysis is treated as a decision
- source type is not labelled
- metrics are interpreted before being defined
- caveats are missing
- confidence is too high
- exploratory analysis becomes official reporting
- data quality issues are ignored
- stakeholder-sensitive claims are made without review
- evidence is stored without reuse value
- the output creates more certainty than the data supports

## Minimal Use Rule

Use this template only when analytical evidence may influence a decision.

Keep the evidence concise, caveated and decision-relevant.
