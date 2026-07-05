# Domain Analytical Agent Data Quality Notes

## Purpose

This pattern defines how Domain Analytical Agents should capture and use data quality notes.

Data quality notes help make known issues, limitations and interpretation risks visible without copying raw data into Strategic OS.

They support safer analytical interpretation and better decision-making.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Data quality notes support the North Star by helping analytical evidence stay reliable, transparent and proportionate.

## Core Principle

Capture the issue, not the raw data.

A data quality note should explain:

- what issue exists
- where it appears
- why it matters
- what interpretation risk it creates
- how to handle it
- when it should be reviewed again

It should not duplicate source data or become a shadow data-quality register for official systems.

## When To Use

Use this pattern when there is a recurring or material data quality issue that affects analytical interpretation.

Use it for:

- missing records
- incomplete fields
- duplicate records
- inconsistent categories
- source lag
- refresh issues
- metric drift
- manual entry risk
- mapping issues
- integration issues
- dashboard filter issues
- unclear ownership
- historical definition changes
- known exceptions
- data that is directionally useful but not fully reliable

Do not use it for one-off query noise that has no future interpretation value.

## Recommended Location

General pattern:

`11_analytics/domain_agent_data_quality_notes.md`

Domain-specific notes:

`11_analytics/[domain]/data_quality_notes.md`

Examples:

- `11_analytics/service-account/data_quality_notes.md`
- `11_analytics/channel-strategy/data_quality_notes.md`
- `11_analytics/customer-demand/data_quality_notes.md`
- `11_analytics/support-csat/data_quality_notes.md`
- `11_analytics/executive-metrics/data_quality_notes.md`
- `11_analytics/data-quality/data_quality_notes.md`

## What To Capture

Capture:

- issue summary
- affected source
- affected metric
- affected timeframe
- impact on interpretation
- severity
- confidence
- current status
- workaround or safe interpretation
- review date
- human review trigger

Do not capture:

- raw data rows
- customer-level records
- sensitive operational extracts
- screenshots from restricted systems
- full query outputs
- private stakeholder commentary
- confidential source exports

## Data Quality Register

Use this table for domain-specific files.

| Issue | Source | Affected Metric | Severity | Status | Review Date |
| --- | --- | --- | --- | --- | --- |
|  |  |  | Low / Medium / High / Blocking | Open / Monitoring / Resolved / Superseded |  |

## Standard Note Structure

Use this structure for a data quality note.

### Issue

[Describe the issue clearly.]

### Source

[Name the source system, dashboard or dataset.]

### Affected Metric Or Output

[Name affected metric, output or interpretation.]

### Affected Timeframe

[State timeframe if known.]

### Severity

Choose one:

- low
- medium
- high
- blocking

### Confidence

Choose one:

- high confidence
- medium confidence
- low confidence
- unknown

### Why It Matters

[Explain how the issue may affect interpretation or decisions.]

### Safe Interpretation

[State how the data can still be used, if at all.]

### Unsafe Interpretation

[State what should not be claimed.]

### Workaround

[Describe any safe workaround or source to check.]

### Human Review Trigger

[State when human review is required.]

### Status

Choose one:

- open
- monitoring
- resolved
- superseded

### Review Date

[Date or trigger.]

## Severity Levels

| Severity | Meaning | Guidance |
| --- | --- | --- |
| Low | Minor issue with limited interpretation impact | Mention if relevant |
| Medium | Issue may affect interpretation depending on use | Include caveat in outputs |
| High | Issue materially affects confidence or decision use | Require human review |
| Blocking | Issue prevents reliable use for intended purpose | Do not use until resolved |

## Status Values

| Status | Meaning |
| --- | --- |
| Open | Issue is active and unresolved |
| Monitoring | Issue exists but is being watched or mitigated |
| Resolved | Issue has been fixed or no longer affects current use |
| Superseded | Issue has been replaced by a newer definition, source or caveat |

## Common Data Quality Issues

### Missing Records

Records may be absent from the source.

Interpretation risk:

- volume may be understated
- trend comparison may be unreliable
- segments may appear smaller than they are

### Incomplete Fields

Records may exist but contain missing fields.

Interpretation risk:

- category analysis may be distorted
- filters may exclude valid records
- segmentation may be unreliable

### Duplicate Records

Records may appear more than once.

Interpretation risk:

- volume may be overstated
- repeat-contact or case counts may be inflated
- performance ratios may be distorted

### Inconsistent Categorisation

Records may use different category labels or inconsistent tagging.

Interpretation risk:

- category comparisons may be misleading
- trend shifts may reflect coding changes rather than real change
- analysis may require grouping or mapping rules

### Source Lag

Data may not refresh in real time.

Interpretation risk:

- recent periods may appear incomplete
- operational decisions may use stale information
- trend changes may be delayed

### Definition Change

Metric definition may have changed over time.

Interpretation risk:

- historical comparisons may be invalid
- apparent trend changes may reflect definition change
- baseline may need resetting

### Integration Issue

Data may be affected by system handover, integration or pipeline problems.

Interpretation risk:

- records may be missing, delayed or misclassified
- source reconciliation may be required
- confidence should be lowered

### Manual Entry Risk

Data may depend on human coding or manual entry.

Interpretation risk:

- inconsistency may appear across teams or time
- quality may vary by training or process
- categories may need validation

## Relationship To Metric Caveats

Data quality notes describe problems with the data.

Metric caveats describe limits in how a metric should be interpreted.

Use:

- `data_quality_notes.md` when the data may be incomplete, inconsistent, duplicated or unreliable
- `metric_caveats.md` when the metric is valid but easy to misread or misuse

Example:

- Data quality note: some records are missing category values
- Metric caveat: category-level trend analysis should be interpreted carefully because categorisation is incomplete

## Relationship To Source Rules

Source rules define which source should be used.

Data quality notes explain known issues affecting that source.

If a data quality issue changes source reliability, update:

`source_rules.md`

If a data quality issue changes metric interpretation, update:

`metric_caveats.md`

## Applying Data Quality Notes In Outputs

When an analytical output uses an affected source or metric, include:

- data quality issue summary
- affected metric or source
- severity
- confidence impact
- interpretation limit
- human review requirement

## Standard Data Quality Block

Use this block inside analytical summaries.

### Data Quality Note

Issue:

Affected source:

Affected metric:

Severity:

Confidence impact:

Safe interpretation:

Human review required:

## Human Review Required

Human review is required when:

- severity is high or blocking
- data quality issue affects a decision
- output may be executive-facing
- output may be used in governance
- output may compare teams or performance
- output may be public-facing
- issue affects customer, community or service claims
- workaround is uncertain
- source of truth is unclear

## Storage Rules

Store data quality notes in:

`11_analytics/[domain]/data_quality_notes.md`

Store general data quality patterns in:

`11_analytics/domain_agent_data_quality_notes.md`

Do not store:

- raw datasets
- customer-level rows
- copied query outputs
- screenshots of restricted dashboards
- sensitive source extracts
- private operational comments
- confidential troubleshooting records

## Review Cadence

Review data quality notes:

- when source systems change
- when dashboards change
- when metric definitions change
- before quarterly Strategic OS assessment
- before using affected metrics in decision briefs
- when repeated analytical outputs show inconsistency
- when users misinterpret affected metrics
- when data stewards provide updated guidance

## Review Checklist

Before using or storing a data quality note, check:

- Is the issue clearly described?
- Is the source named?
- Is the affected metric or output clear?
- Is severity labelled?
- Is confidence labelled?
- Is the interpretation impact clear?
- Is safe use defined?
- Is unsafe use defined?
- Is human review required?
- Is the note free of raw sensitive data?
- Does this belong in the domain folder?

## Success Measures

Data quality notes are working when:

- known issues are easier to find
- agents mention data quality risks consistently
- analytical outputs avoid false certainty
- decision briefs include appropriate limits
- source rules and caveats stay current
- users understand when confidence should be lowered
- Strategic OS avoids storing raw data
- data quality problems improve interpretation rather than create clutter

## Failure Modes

Data quality notes are failing if:

- they become raw data dumps
- they duplicate official data quality systems
- they are too vague to use
- they are not linked to affected metrics
- they are not reviewed
- agents ignore them
- unresolved issues are treated as solved
- high-severity issues do not trigger human review
- old data quality notes keep lowering confidence after they are resolved

## Minimal Use Rule

Capture data quality issues that affect interpretation.

Do not document every minor irregularity.

Focus on issues that change confidence, caveats, decisions or reuse.
