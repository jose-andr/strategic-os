# Domain Analytical Agent Metric Definitions

## Purpose

This pattern defines how Domain Analytical Agents should document and use metric definitions.

Metric definitions help agents interpret data consistently, avoid definition drift and support decision-making with clear analytical language.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Metric definitions support the North Star by making analytical evidence clearer, more consistent and easier to use in strategic decisions.

## Core Principle

Define the metric before interpreting the metric.

A Domain Analytical Agent should not analyse, compare or recommend action from a metric unless the metric definition is clear enough for the intended use.

## When To Use

Use this pattern when an analytics domain uses repeated metrics across:

- analytical summaries
- decision briefs
- performance reviews
- dashboards
- stakeholder conversations
- operating reviews
- service reviews
- strategic planning
- Genie or Databricks prompts
- quarterly Strategic OS assessments

Do not create metric definition files for one-off exploratory questions unless the metric is likely to be reused.

## Recommended Location

General pattern:

`11_analytics/domain_agent_metric_definitions.md`

Domain-specific definitions:

`11_analytics/[domain]/metric_definitions.md`

Examples:

- `11_analytics/service-account/metric_definitions.md`
- `11_analytics/channel-strategy/metric_definitions.md`
- `11_analytics/customer-demand/metric_definitions.md`
- `11_analytics/support-csat/metric_definitions.md`
- `11_analytics/executive-metrics/metric_definitions.md`
- `11_analytics/data-quality/metric_definitions.md`

## What To Define

For each repeated metric, define:

- metric name
- plain-English definition
- technical definition, where needed
- source
- source type
- grain
- timeframe
- refresh cadence
- inclusions
- exclusions
- filters
- calculation logic
- caveats
- safe use
- unsafe use
- human review triggers

## Standard Metric Register

Use this table for domain-specific files.

| Metric | Plain-English Definition | Source | Grain | Refresh | Caveat |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Standard Metric Definition Structure

Use this structure for each important metric.

### Metric Name

[Metric name]

### Plain-English Definition

[Describe what this metric means in everyday language.]

### Technical Definition

[Describe the calculation or technical definition where needed.]

### Source

[Name the source system, table, dashboard or reporting layer.]

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

### Grain

What does one row, record or unit represent?

Examples:

- customer
- case
- request
- interaction
- transaction
- channel contact
- account
- day
- month
- service
- team

### Timeframe

What period does the metric cover?

Timeframe:

### Refresh Cadence

How often is the metric refreshed?

Refresh cadence:

### Inclusions

What is included?

- Inclusion:
- Inclusion:
- Inclusion:

### Exclusions

What is excluded?

- Exclusion:
- Exclusion:
- Exclusion:

### Filters Or Segments

What filters or segments commonly affect the metric?

- Filter:
- Segment:

### Calculation Logic

How is the metric calculated?

Calculation:

### Related Metrics

What metrics are commonly confused with this one?

| Related Metric | Difference |
| --- | --- |
|  |  |

### Caveats

What caveats affect interpretation?

Related caveat file:

`metric_caveats.md`

### Safe Use

This metric can safely support:

- [Use case]
- [Use case]

### Unsafe Use

This metric should not be used for:

- [Unsafe use]
- [Unsafe use]

### Human Review Trigger

Human review is required when:

- [Trigger]
- [Trigger]

### Review Date

[Date or trigger for reviewing the definition.]

## Source Type Guidance

### Governed Source

Use for metrics that are approved sources of truth.

A governed source metric may support formal decision-making if caveats are visible and human review occurs where required.

### Approved Reporting Source

Use for metrics in approved dashboards or reporting views.

These may support performance interpretation, but should not be copied into Strategic OS as raw values.

### Approved Analytical Source

Use for reviewed analytical queries or datasets.

These may support decision evidence when source rules and caveats are clear.

### Contextual Signal

Use for supporting interpretation only.

Contextual signals may suggest what to investigate, but should not be treated as definitive proof.

### Exploratory Analysis

Use for one-off investigation.

Exploratory metrics require strong caveats and should not be used as official reporting.

## Metric Grain

Always identify the grain of a metric.

Metric grain affects interpretation.

Examples:

| Metric Grain | Interpretation Risk |
| --- | --- |
| Customer | May hide multiple interactions or cases |
| Case | May not represent total customer effort |
| Interaction | May count repeat contacts separately |
| Transaction | May exclude support or follow-up activity |
| Channel contact | May reflect channel preference or failure demand |
| Account | May not reflect individual customer experience |
| Day or month | May be affected by seasonality or reporting lag |
| Team | May be sensitive if used for comparison |
| Service | May hide process or channel variation |

## Inclusions And Exclusions

Every metric should make visible what is included and excluded.

Examples:

- Does the metric include closed cases only?
- Does it include abandoned contacts?
- Does it include repeat contacts?
- Does it include internal transfers?
- Does it include assisted and self-service channels?
- Does it include reopened cases?
- Does it exclude incomplete records?
- Does it exclude test or duplicate records?
- Does it exclude migrated records?
- Does it exclude particular services, teams or time periods?

## Common Definition Risks

Metric definitions often fail when:

- the name sounds obvious but the calculation is not
- the dashboard label differs from the technical definition
- the metric changes over time
- filters materially change meaning
- grain is unclear
- exclusions are hidden
- contextual signals are treated as governed metrics
- similar metrics are used interchangeably
- the same metric name means different things in different systems

## Definition Drift

Definition drift happens when a metric’s meaning changes over time.

Causes may include:

- source system change
- dashboard redesign
- data pipeline change
- business rule change
- manual coding change
- category mapping change
- filter update
- reporting-period change
- inclusion or exclusion change

When definition drift is suspected, create or update:

- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `source_rules.md`

## Standard Metric Definition Block

Use this block inside analytical summaries.

### Metric Definition

Metric:

Plain-English definition:

Source:

Source type:

Grain:

Timeframe:

Key inclusions:

Key exclusions:

Caveat:

Human review required:

## Human Review Required

Human review is required when a metric definition is:

- unclear
- contested
- newly created
- changed over time
- used in executive-facing material
- used in governance
- used for performance comparison
- used to support funding or resourcing decisions
- used in stakeholder-sensitive communication
- used in public-facing claims
- based on exploratory analysis
- affected by material caveats or data quality issues

## Relationship To Source Rules

Metric definitions explain what the metric means.

Source rules explain where the metric should come from.

Use both together.

A metric definition without source rules may create confidence risk.

A source rule without metric definition may create interpretation risk.

## Relationship To Metric Caveats

Metric definitions explain what the metric measures.

Metric caveats explain what limits interpretation.

Use:

- `metric_definitions.md` to define the metric
- `metric_caveats.md` to explain how not to overread the metric

## Relationship To Data Quality Notes

Metric definitions describe intended meaning.

Data quality notes describe issues that affect actual data reliability.

Use:

- `metric_definitions.md` for stable metric meaning
- `data_quality_notes.md` for known quality issues affecting the metric

## Domain Metric Definition File Template

Use this structure for a domain-specific `metric_definitions.md` file.

# Metric Definitions

## Purpose

This file defines key metrics used in this analytics domain.

## Domain

[Domain name]

## Source Context

[Briefly describe the source systems, dashboards or reporting layers.]

## Metric Register

| Metric | Definition | Source | Grain | Refresh | Caveat |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Detailed Definitions

### [Metric Name]

Plain-English definition:

Technical definition:

Source:

Source type:

Grain:

Timeframe:

Refresh cadence:

Inclusions:

Exclusions:

Calculation logic:

Related caveats:

Safe use:

Unsafe use:

Human review trigger:

Review date:

## Review Notes

[Add safe notes about definition changes, uncertainties or review requirements.]

## Agent Use

Domain Analytical Agents should use this file to:

- define metrics consistently
- explain metric meaning in plain English
- avoid mixing similar metrics
- include caveats
- identify human review needs
- lower confidence when definitions are unclear
- support decision briefs with clearer evidence

## Review Checklist

Before using a metric definition, check:

- Is the metric name clear?
- Is the plain-English definition clear?
- Is the source clear?
- Is source type labelled?
- Is the grain clear?
- Is the timeframe clear?
- Are inclusions visible?
- Are exclusions visible?
- Is calculation logic clear enough?
- Are caveats linked?
- Is safe use defined?
- Is unsafe use defined?
- Is human review required?
- Is the definition current?

## Success Measures

Metric definitions are working when:

- agents use metrics consistently
- users understand what metrics mean
- dashboards are interpreted more carefully
- similar metrics are not confused
- decision briefs use clearer evidence
- caveats are applied consistently
- confidence levels are more proportionate
- source rules, caveats and data quality notes connect cleanly

## Failure Modes

Metric definitions are failing if:

- metric names are used without definitions
- definitions drift without review
- agents invent calculations
- grain is unclear
- filters or exclusions are hidden
- caveats are separated from the metric
- contextual signals are treated as governed metrics
- users make decisions from misunderstood metrics
- the definition file becomes a copy of official data dictionaries without added decision value

## Minimal Use Rule

Define metrics that are reused or decision-relevant.

Do not recreate full organisational data dictionaries.

Keep Strategic OS focused on the definitions that improve interpretation, caveats and decision quality.
