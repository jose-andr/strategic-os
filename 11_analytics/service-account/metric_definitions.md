# Service Account Metric Definitions

## Purpose

This file defines key metrics used in the Service Account analytical domain.

It helps the Service Account Analytical Agent interpret metrics consistently, avoid definition drift and support decision-making with clear analytical language.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Metric definitions support better decisions by making service account evidence clearer, more consistent and easier to interpret.

## Domain

Service Account

## Core Principle

Define the metric before interpreting the metric.

If the metric definition is not clear enough for the intended use, lower confidence and require human review.

## Source Context

Primary governed source:

[Add once confirmed.]

Approved reporting sources:

[Add once confirmed.]

Approved analytical sources:

[Add once confirmed.]

Until sources are confirmed, service account metric outputs should be treated as contextual or exploratory and should not be used for formal decision support without human review.

## Metric Register

| Metric | Plain-English Definition | Source | Grain | Refresh | Caveat |
| --- | --- | --- | --- | --- | --- |
| Service account volume | Number of service account records, cases, requests or interactions within scope | To confirm | To confirm | To confirm | Definition and grain must be confirmed |
| Active service accounts | Number of service accounts considered active within the reporting period | To confirm | To confirm | To confirm | Active status rules must be confirmed |
| New service accounts | Number of service accounts created within the period | To confirm | To confirm | To confirm | Creation date and duplicate handling must be confirmed |
| Closed or resolved service accounts | Number of service account items closed or resolved within the period | To confirm | To confirm | To confirm | Closure may not equal customer resolution |
| Service account age | Time since service account creation, request, case opening or relevant start event | To confirm | To confirm | To confirm | Start and end points must be confirmed |
| Time to resolution | Time between service account start event and closure or resolution event | To confirm | To confirm | To confirm | May measure system closure rather than full customer outcome |
| Repeat contact | Follow-up or repeat interaction associated with a service account | To confirm | To confirm | To confirm | Attribution and matching rules must be confirmed |
| Channel of contact | Channel used for the service account interaction or request | To confirm | To confirm | To confirm | Channel mix may affect interpretation |
| Escalation rate | Share or count of service account items escalated | To confirm | To confirm | To confirm | Escalation definition must be confirmed |
| Reopen rate | Share or count of service account items reopened after closure | To confirm | To confirm | To confirm | Reopen rules and timing must be confirmed |

## Detailed Definitions

### Service Account Volume

Plain-English definition:

The number of service account items within a defined scope and period.

Technical definition:

[Add calculation once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm: account, case, request, interaction or transaction.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- [To confirm.]

Exclusions:

- [To confirm.]

Calculation logic:

[To confirm.]

Related caveats:

- Definition caveat
- Grain caveat
- Duplicate record caveat
- Source caveat

Safe use:

- Directional volume understanding once source and grain are confirmed
- Trend review if definition is stable over time
- Service planning support when caveats are visible

Unsafe use:

- Formal reporting without confirmed source
- Performance comparison without source and caveat review
- Customer impact claims without supporting evidence

Human review trigger:

Human review is required before this metric is used in a decision brief, governance setting or executive-facing material.

Review date:

[Add review date.]

### Active Service Accounts

Plain-English definition:

The number of service accounts considered active during the reporting period.

Technical definition:

[Add active-status logic once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Accounts, cases or records meeting the active-status definition.

Exclusions:

- Closed, inactive or excluded records as defined by the source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Active-status definition caveat
- Source lag caveat
- Filter caveat

Safe use:

- Understanding current operational load once active-status definition is confirmed
- Directional capacity or demand review

Unsafe use:

- Claims about backlog without confirmed definition
- Service performance claims without resolution and ageing context
- Comparisons across teams or services without review

Human review trigger:

Human review is required when active status affects prioritisation, resourcing or executive-facing advice.

Review date:

[Add review date.]

### New Service Accounts

Plain-English definition:

The number of service accounts created during a defined period.

Technical definition:

[Add creation logic once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Records created during the selected period.

Exclusions:

- Duplicates, test records or migrated records if excluded by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Creation-date caveat
- Duplicate record caveat
- Migration caveat
- Source lag caveat

Safe use:

- Directional demand monitoring once creation logic is confirmed
- Trend review where source rules are stable

Unsafe use:

- Customer demand claims without channel and service context
- Cause claims without supporting evidence
- Formal reporting without governed source confirmation

Human review trigger:

Human review is required before using this metric for service planning, resourcing or formal performance interpretation.

Review date:

[Add review date.]

### Closed Or Resolved Service Accounts

Plain-English definition:

The number of service account items closed or resolved during a defined period.

Technical definition:

[Add closure or resolution logic once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Items with a closure, completion or resolution status during the selected period.

Exclusions:

- Reopened, duplicate or cancelled items if excluded by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Closure does not always equal customer resolution
- Reopen caveat
- Status definition caveat
- Data entry caveat

Safe use:

- Operational workflow review once status logic is confirmed
- Throughput understanding when paired with volume and age

Unsafe use:

- Customer outcome claims without customer evidence
- Service quality claims without repeat-contact or satisfaction evidence
- Formal resolution claims without status definition review

Human review trigger:

Human review is required before claiming that closure equals customer resolution or improved service experience.

Review date:

[Add review date.]

### Service Account Age

Plain-English definition:

The length of time a service account item has existed or remained unresolved.

Technical definition:

[Add age calculation once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Items where start date and current or end date are available.

Exclusions:

- Items without valid date fields unless handled by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Start-date caveat
- End-date caveat
- Source lag caveat
- Missing date fields

Safe use:

- Identifying ageing patterns
- Prioritising review of long-running items when source is confirmed
- Supporting operational sensemaking

Unsafe use:

- Individual performance comparison without review
- Customer harm claims without supporting evidence
- Formal backlog claims without confirmed status rules

Human review trigger:

Human review is required when age is used to support escalation, resourcing or performance claims.

Review date:

[Add review date.]

### Time To Resolution

Plain-English definition:

The time between a service account start event and a closure or resolution event.

Technical definition:

[Add calculation once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Items with valid start and closure or resolution timestamps.

Exclusions:

- Items without valid dates, reopened items or cancelled items if excluded by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- System closure may not equal customer resolution
- Reopen caveat
- Missing timestamp caveat
- Process variation caveat

Safe use:

- Directional workflow performance interpretation
- Comparing process patterns when source and definitions are stable

Unsafe use:

- Customer experience claims without customer evidence
- Team comparison without review
- Formal service standard reporting without governed source confirmation

Human review trigger:

Human review is required before using this metric in executive-facing, governance or performance-comparison contexts.

Review date:

[Add review date.]

### Repeat Contact

Plain-English definition:

A follow-up or repeated interaction associated with a service account, customer, request or issue.

Technical definition:

[Add matching and timeframe rules once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Repeat contacts matching the approved definition.

Exclusions:

- Contacts outside the matching window or unrelated contacts if excluded by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Attribution caveat
- Matching logic caveat
- Channel switching caveat
- Customer preference caveat

Safe use:

- Signal for further investigation
- Directional indicator of possible unresolved need or friction

Unsafe use:

- Proof of failure demand without deeper analysis
- Cause attribution without supporting evidence
- Customer dissatisfaction claims without customer evidence

Human review trigger:

Human review is required before using repeat contact to make claims about cause, performance or service failure.

Review date:

[Add review date.]

### Channel Of Contact

Plain-English definition:

The channel through which the service account interaction or request occurred.

Technical definition:

[Add channel mapping logic once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Channel categories included in the approved source.

Exclusions:

- Unknown, unmapped or deprecated channels if excluded by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Channel mix caveat
- Channel mapping caveat
- Multi-channel journey caveat
- Unknown channel caveat

Safe use:

- Channel mix interpretation
- Identifying possible channel demand patterns
- Supporting service design questions

Unsafe use:

- Channel preference claims without customer evidence
- Channel effectiveness claims without outcome metrics
- Digital containment claims without supporting definitions

Human review trigger:

Human review is required before using channel data to recommend channel strategy, resourcing or customer communication changes.

Review date:

[Add review date.]

### Escalation Rate

Plain-English definition:

The count or proportion of service account items that are escalated.

Technical definition:

[Add escalation definition and denominator once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Items meeting the approved escalation definition.

Exclusions:

- Informal, duplicate or non-standard escalations if excluded by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Escalation definition caveat
- Process variation caveat
- Sensitivity caveat
- Denominator caveat

Safe use:

- Directional indicator of complexity, risk or process friction once definition is confirmed

Unsafe use:

- Performance comparison without review
- Blame or accountability claims
- Cause claims without supporting evidence

Human review trigger:

Human review is required before using escalation metrics in stakeholder-sensitive or performance-related contexts.

Review date:

[Add review date.]

### Reopen Rate

Plain-English definition:

The count or proportion of service account items reopened after closure.

Technical definition:

[Add reopen logic and denominator once confirmed.]

Source:

[To confirm.]

Source type:

Unknown source until confirmed.

Grain:

[To confirm.]

Timeframe:

[To confirm.]

Refresh cadence:

[To confirm.]

Inclusions:

- Items meeting the approved reopen definition.

Exclusions:

- Administrative reopenings or duplicate records if excluded by source rules.

Calculation logic:

[To confirm.]

Related caveats:

- Reopen definition caveat
- Closure quality caveat
- Administrative process caveat
- Attribution caveat

Safe use:

- Signal for possible unresolved work or process issue
- Directional service quality investigation when paired with other evidence

Unsafe use:

- Proof of poor resolution without review
- Team comparison without review
- Customer dissatisfaction claims without customer evidence

Human review trigger:

Human review is required before using reopen rate to support formal performance or service quality claims.

Review date:

[Add review date.]

## Common Definition Risks

Service account metrics may be misread when:

- account, case, request and interaction are used interchangeably
- closure is treated as resolution
- active status is not defined
- duplicate records are not handled
- migrated or historical records are included without caveat
- channel fields are incomplete or inconsistently mapped
- time periods mix created date and closed date
- repeat contact logic is unclear
- reopened items distort closure or resolution metrics
- source refresh timing is unknown

## Standard Metric Definition Block

Use this block inside service account analytical summaries.

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

Human review is required when a service account metric is:

- unclear
- newly defined
- contested
- used in executive-facing material
- used in governance
- used for performance comparison
- used for funding or resourcing decisions
- used in stakeholder-sensitive communication
- affected by caveats or data quality issues
- based on exploratory analysis
- not linked to a confirmed source of truth

## Related Files

Use this file with:

- `source_rules.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`

## Review Checklist

Before using a service account metric, check:

- Is the metric name clear?
- Is the plain-English definition clear?
- Is the source confirmed?
- Is source type labelled?
- Is the grain clear?
- Is the timeframe clear?
- Are inclusions visible?
- Are exclusions visible?
- Are caveats linked?
- Is safe use defined?
- Is unsafe use defined?
- Is human review required?
- Is the definition current?

## Success Measures

Metric definitions are working when:

- the agent uses service account metrics consistently
- users understand what each metric means
- source uncertainty is visible
- caveats are applied consistently
- decision briefs use clearer evidence
- similar metrics are not confused
- confidence levels are proportionate
- Strategic OS avoids unsupported analytical claims

## Failure Modes

Metric definitions are failing if:

- metrics are interpreted before being defined
- definitions drift without review
- account, case, request and interaction are blended
- agents invent calculations
- source uncertainty is hidden
- caveats are ignored
- exploratory metrics become official claims
- users make decisions from misunderstood metrics

## Minimal Use Rule

Define only the service account metrics that are reused or decision-relevant.

Keep this file focused on interpretation, caveats and decision support, not a full data dictionary.
