# Domain Analytical Agent Metric Caveats

## Purpose

This pattern defines how Domain Analytical Agents should document, recall and apply metric caveats.

Metric caveats help prevent analytical outputs from being overclaimed, misread or used outside their valid context.

They make sure strategic decisions are informed by evidence that is interpreted with the right limits.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Metric caveats support the North Star by making analytical evidence safer, clearer and more decision-ready.

## Core Principle

Every metric has a context.

A metric is only useful when the user understands:

- what it measures
- what it does not measure
- where it comes from
- how it is defined
- how fresh it is
- what filters or exclusions apply
- what caveats affect interpretation
- what decisions it can and cannot support

## When To Use

Use this pattern when an analytical domain has metrics that are reused across analysis, reporting, decision briefs or stakeholder conversations.

Use it for:

- governed metrics
- dashboard metrics
- service performance metrics
- customer experience metrics
- operational metrics
- channel metrics
- demand metrics
- quality metrics
- cost-to-serve metrics
- data quality indicators
- contextual signals used repeatedly

Do not create caveat files for one-off metrics that are unlikely to be reused.

## Recommended Location

General pattern:

`11_analytics/domain_agent_metric_caveats.md`

Domain-specific caveats:

`11_analytics/[domain]/metric_caveats.md`

Examples:

- `11_analytics/service-account/metric_caveats.md`
- `11_analytics/channel-strategy/metric_caveats.md`
- `11_analytics/customer-demand/metric_caveats.md`
- `11_analytics/support-csat/metric_caveats.md`
- `11_analytics/executive-metrics/metric_caveats.md`
- `11_analytics/data-quality/metric_caveats.md`

## Standard Caveat Register

Use this structure for a domain caveat register.

| Metric | Caveat | Why It Matters | Interpretation Guidance | Review Needed |
| --- | --- | --- | --- | --- |
|  |  |  |  | Yes / No |

## Caveat Types

Common caveat types include:

| Caveat Type | Meaning |
| --- | --- |
| Definition caveat | The metric definition may not match common interpretation |
| Source caveat | The source has limits, exclusions or known issues |
| Lag caveat | The data is delayed or refreshed on a schedule |
| Completeness caveat | Records may be missing or incomplete |
| Duplication caveat | Records may be duplicated or counted more than once |
| Filter caveat | Results depend heavily on filters or segmentation |
| Channel caveat | Channel mix affects interpretation |
| Volume caveat | Low or uneven volume affects reliability |
| Sample caveat | The sample is small, biased or partial |
| Attribution caveat | The metric cannot confidently assign cause |
| Context caveat | External factors may affect interpretation |
| Transition caveat | System, process or definition changed over time |
| Governance caveat | The metric is not approved for formal reporting use |
| Sensitivity caveat | The metric may be sensitive if used to compare teams, people or performance |

## Standard Caveat Structure

Use this structure when documenting a caveat.

### Metric

[Metric name]

### Caveat Type

[Definition / Source / Lag / Completeness / Duplication / Filter / Channel / Volume / Sample / Attribution / Context / Transition / Governance / Sensitivity]

### Caveat

[Describe the caveat clearly.]

### Why It Matters

[Explain how the caveat could change interpretation.]

### Safe Interpretation

[State how the metric can be used safely.]

### Unsafe Interpretation

[State what should not be claimed.]

### Human Review Trigger

[State when human review is required.]

### Related Source Rule

[Reference source rule if relevant.]

### Review Date

[Date or trigger for checking the caveat again.]

## Safe Caveat Language

Use plain and careful language.

Examples:

- This metric should be interpreted as directional.
- This metric is suitable for trend review but not individual performance comparison.
- This signal may indicate demand pressure, but it does not explain cause.
- This view depends on the selected channel, timeframe and filter settings.
- This source is useful for context but should not be treated as the governed source of truth.
- This result should be checked against the approved dashboard before formal use.
- The metric definition changed during the period, so trend comparison may be unreliable.
- Low volume means small changes may appear larger than they are.

## Unsafe Caveat Language

Avoid language that hides uncertainty or overstates confidence.

Avoid:

- This proves the cause.
- This confirms performance is improving.
- This definitively shows demand has changed.
- This team is underperforming.
- This is the single source of truth.
- The data is clear.
- No caveats apply.
- This can be used for reporting without review.

## Applying Caveats In Outputs

Every analytical output using a caveated metric should include:

- metric name
- source
- metric definition
- relevant caveat
- confidence level
- safe interpretation
- human review requirement

## Caveat Severity

Use severity labels when helpful.

| Severity | Meaning | Use |
| --- | --- | --- |
| Low | Caveat is minor and does not materially affect interpretation | Mention briefly |
| Medium | Caveat may affect interpretation depending on use | Include clearly |
| High | Caveat materially limits use | Require human review |
| Blocking | Caveat prevents reliable use for the intended purpose | Do not use yet |

## Caveat Confidence

Use confidence labels.

| Confidence | Meaning |
| --- | --- |
| High confidence | Caveat is known, stable and well understood |
| Medium confidence | Caveat is likely but may need confirmation |
| Low confidence | Caveat is suspected or inferred |
| Unknown | Caveat status needs review |

## Metric Use Boundaries

For each important metric, define what it can and cannot support.

| Metric | Can Support | Cannot Support |
| --- | --- | --- |
|  |  |  |

Examples of “can support”:

- trend monitoring
- operational sensemaking
- decision brief evidence
- service improvement prioritisation
- hypothesis generation
- dashboard interpretation
- data quality review

Examples of “cannot support”:

- individual performance comparison
- public reporting
- formal governance decision
- causal claim
- financial claim
- team ranking
- executive-facing claim without review

## Caveat Review Triggers

Review caveats when:

- source systems change
- metric definitions change
- dashboards change
- data pipelines change
- reporting cadence changes
- new data quality issues are found
- users misinterpret the metric
- the metric is used in a new decision context
- the metric is used in executive-facing material
- a caveat becomes outdated
- a caveat affects a decision recommendation

## Human Review Required

Human review is required when a caveated metric is used for:

- formal reporting
- governance decisions
- executive-facing advice
- stakeholder-sensitive communication
- public-facing claims
- performance comparison
- funding or resourcing decisions
- claims about organisational performance
- claims where data quality is uncertain
- decisions with material consequences

## Domain Caveat File Template

Use this structure for a domain-specific `metric_caveats.md` file.

# Metric Caveats

## Purpose

This file documents known caveats for metrics used in this analytics domain.

## Domain

[Domain name]

## Source Context

[Briefly describe the source systems or dashboards.]

## Caveat Register

| Metric | Caveat | Severity | Confidence | Review Date |
| --- | --- | --- | --- | --- |
|  |  | Low / Medium / High / Blocking | High / Medium / Low / Unknown |  |

## Metric Use Boundaries

| Metric | Safe Use | Unsafe Use |
| --- | --- | --- |
|  |  |  |

## Human Review Triggers

[List domain-specific review triggers.]

## Notes

[Add safe interpretation notes.]

## Standard Analytical Caveat Block

Use this block inside analytical summaries.

### Metric Caveat

Metric:

Source:

Caveat:

Severity:

Confidence:

Safe interpretation:

Human review required:

## Caveat Examples

### Definition Caveat

Metric:

Resolution time

Caveat:

Resolution time may measure system closure time rather than the full customer experience from first contact to final understanding.

Safe interpretation:

Use for operational workflow review, but do not treat it as a complete measure of customer effort.

### Channel Caveat

Metric:

Digital containment

Caveat:

Digital containment may be affected by channel mix, service type and availability of assisted support.

Safe interpretation:

Use alongside customer effort, complaint and repeat-contact indicators.

### Attribution Caveat

Metric:

Repeat contact rate

Caveat:

Repeat contact may reflect unclear communication, unresolved issues, customer preference, channel switching or process delay.

Safe interpretation:

Use as a signal for investigation, not as proof of a single cause.

### Sample Caveat

Metric:

Survey satisfaction

Caveat:

Survey responses may represent a self-selected subset of customers.

Safe interpretation:

Use as a directional customer sentiment signal and compare with other evidence.

## Relationship To Source Rules

Source rules define where evidence comes from.

Metric caveats define how evidence should be interpreted.

Use both together.

A strong analytical output should answer:

- What source was used?
- What metric was used?
- What does the metric mean?
- What caveat applies?
- What can and cannot be concluded?
- What human review is required?

## Relationship To Data Quality Notes

Metric caveats are about interpretation limits.

Data quality notes are about known data problems.

Sometimes they overlap.

Use:

- `metric_caveats.md` when the metric is valid but needs careful interpretation
- `data_quality_notes.md` when the data itself may be incomplete, incorrect or unreliable

## Review Checklist

Before using a metric caveat, check:

- Is the metric named clearly?
- Is the source clear?
- Is the caveat specific?
- Is the impact on interpretation clear?
- Is safe use defined?
- Is unsafe use defined?
- Is severity labelled?
- Is confidence labelled?
- Is human review required?
- Is the caveat still current?
- Does the caveat support better decision-making?

## Success Measures

Metric caveats are working when:

- analytical outputs are interpreted more carefully
- metric misuse decreases
- decision briefs include appropriate limits
- agents remember caveats consistently
- confidence labels are more proportionate
- governed and contextual metrics are not confused
- sensitive or high-risk metric use is reviewed
- users understand what a metric can and cannot prove

## Failure Modes

Metric caveats are failing if:

- caveats are absent
- caveats are too generic
- caveats are buried after strong claims
- caveats are not reused
- caveats are outdated
- agents ignore caveats in outputs
- users overclaim from caveated metrics
- metrics are used for decisions they cannot support
- confidence is too high despite caveats
- caveats create confusion instead of clarity

## Minimal Use Rule

Document caveats that change interpretation.

Do not create caveat bureaucracy for every metric.

Focus on the caveats that affect decisions, recommendations, trust or reuse.
