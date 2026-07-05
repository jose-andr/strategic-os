# Service Account Data Quality Notes

## Purpose

This file captures known and likely data quality issues affecting the Service Account analytical domain.

It helps the Service Account Analytical Agent interpret data carefully, lower confidence where needed and avoid unsupported claims.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Data quality notes support better decisions by making reliability risks visible before analysis is reused.

## Domain

Service Account

## Core Principle

Capture the issue, not the raw data.

This file should document reusable interpretation risks, not store source data.

## Data Quality Register

| Issue | Source | Affected Metric | Severity | Status | Review Date |
| --- | --- | --- | --- | --- | --- |
| Source of truth not yet confirmed | To confirm | All service account metrics | High | Open | To confirm |
| Metric grain not yet confirmed | To confirm | Volume, active accounts, new accounts | High | Open | To confirm |
| Active status logic not yet confirmed | To confirm | Active service accounts | High | Open | To confirm |
| Closure and resolution logic not yet confirmed | To confirm | Closed or resolved accounts, time to resolution | High | Open | To confirm |
| Duplicate, test or migrated records may affect counts | To confirm | Volume, new accounts, closed accounts | Medium | Open | To confirm |
| Channel mapping may be incomplete or inconsistent | To confirm | Channel of contact | Medium | Open | To confirm |
| Repeat contact matching logic not yet confirmed | To confirm | Repeat contact | High | Open | To confirm |
| Reopen and escalation coding may reflect process variation | To confirm | Reopen rate, escalation rate | Medium | Open | To confirm |
| Refresh cadence not yet confirmed | To confirm | All service account metrics | Medium | Open | To confirm |

## Standard Data Quality Notes

### Source Of Truth Not Confirmed

Issue:

The governed source of truth for service account metrics has not yet been confirmed.

Source:

To confirm.

Affected metric or output:

All service account analytical outputs.

Severity:

High

Confidence:

High confidence

Why it matters:

Without a confirmed source of truth, analytical outputs may rely on contextual, exploratory or incomplete sources. This limits decision confidence.

Safe interpretation:

Use outputs as directional or exploratory only until the governed source is confirmed.

Unsafe interpretation:

Do not use outputs for formal reporting, governance, executive-facing advice or final decision support without human review.

Workaround:

Confirm the governed source, approved reporting layer and metric owner before formal use.

Human review trigger:

Required before any service account output is used in a decision brief, governance setting or executive-facing material.

Status:

Open

Review date:

To confirm.

### Metric Grain Not Confirmed

Issue:

The unit of measurement for service account metrics has not yet been confirmed.

Source:

To confirm.

Affected metric or output:

Service account volume, active service accounts, new service accounts and related count metrics.

Severity:

High

Confidence:

High confidence

Why it matters:

Metrics may count accounts, cases, requests, interactions, transactions or another unit. Different grains change interpretation significantly.

Safe interpretation:

Label count-based metrics as directional until grain is confirmed.

Unsafe interpretation:

Do not compare counts across periods, teams or services without confirming the grain.

Workaround:

Confirm whether each metric is counted at account, case, request, interaction or transaction level.

Human review trigger:

Required before volume metrics support prioritisation, resourcing or performance claims.

Status:

Open

Review date:

To confirm.

### Active Status Logic Not Confirmed

Issue:

The rules defining active service accounts are not yet confirmed.

Source:

To confirm.

Affected metric or output:

Active service accounts, backlog-style analysis, operational load analysis.

Severity:

High

Confidence:

High confidence

Why it matters:

Active may mean open, recently updated, currently valid, not closed, operationally live or another status. Different definitions change the apparent workload.

Safe interpretation:

Use active service account figures only as contextual until active-status rules are confirmed.

Unsafe interpretation:

Do not treat active service accounts as backlog without confirming the status logic.

Workaround:

Confirm active status fields, excluded statuses and any date logic.

Human review trigger:

Required before using active account data for prioritisation, capacity or resourcing decisions.

Status:

Open

Review date:

To confirm.

### Closure And Resolution Logic Not Confirmed

Issue:

Closure, completion and resolution logic are not yet confirmed.

Source:

To confirm.

Affected metric or output:

Closed or resolved accounts, time to resolution, reopen rate.

Severity:

High

Confidence:

High confidence

Why it matters:

A system closure may not mean the customer’s need has been resolved. Closure logic may reflect workflow completion, administrative status or process rules.

Safe interpretation:

Use closure as workflow throughput only until resolution logic is confirmed.

Unsafe interpretation:

Do not claim customer resolution, customer satisfaction or improved service quality from closure data alone.

Workaround:

Confirm closure statuses, resolution statuses, reopened item handling and customer outcome indicators.

Human review trigger:

Required before using closure or resolution metrics in customer experience, service quality or governance claims.

Status:

Open

Review date:

To confirm.

### Duplicate, Test Or Migrated Records

Issue:

Duplicate, test, cancelled or migrated records may affect count metrics.

Source:

To confirm.

Affected metric or output:

Service account volume, new service accounts, closed or resolved accounts, active accounts.

Severity:

Medium

Confidence:

Medium confidence

Why it matters:

Counts may be overstated or distorted if duplicate, test or migrated records are included.

Safe interpretation:

Treat count metrics as directional until exclusion rules are confirmed.

Unsafe interpretation:

Do not use raw counts as final demand, workload or throughput metrics without source review.

Workaround:

Confirm duplicate handling, test record exclusions, cancelled record rules and migration periods.

Human review trigger:

Required when count metrics support resourcing, prioritisation or performance claims.

Status:

Open

Review date:

To confirm.

### Channel Mapping Incomplete Or Inconsistent

Issue:

Channel values may be incomplete, inconsistent, manually coded or differently mapped across systems.

Source:

To confirm.

Affected metric or output:

Channel of contact, channel mix analysis, channel strategy evidence.

Severity:

Medium

Confidence:

Medium confidence

Why it matters:

Channel mix may reflect mapping rules, default values, system design or assisted routing rather than genuine customer preference.

Safe interpretation:

Use channel data as a signal for further service design or channel investigation.

Unsafe interpretation:

Do not claim customer channel preference or channel effectiveness from channel count alone.

Workaround:

Confirm channel categories, unmapped values, multi-channel handling and assisted-channel logic.

Human review trigger:

Required before using channel data for channel strategy, digital investment or assisted-support recommendations.

Status:

Open

Review date:

To confirm.

### Repeat Contact Matching Logic Not Confirmed

Issue:

The logic for identifying repeat contact has not yet been confirmed.

Source:

To confirm.

Affected metric or output:

Repeat contact, failure demand signals, customer effort interpretation.

Severity:

High

Confidence:

High confidence

Why it matters:

Repeat contact may depend on matching by account, customer, issue, time window, channel or case relationship. Different matching logic changes interpretation.

Safe interpretation:

Use repeat contact as a signal for investigation only.

Unsafe interpretation:

Do not treat repeat contact as proof of failure demand, unresolved need or poor service without supporting evidence.

Workaround:

Confirm matching fields, repeat-contact window, issue matching and exclusion rules.

Human review trigger:

Required before making claims about cause, customer effort, service failure or channel performance.

Status:

Open

Review date:

To confirm.

### Reopen And Escalation Coding Variation

Issue:

Reopen and escalation fields may reflect process design, administrative handling, policy, risk settings or manual coding variation.

Source:

To confirm.

Affected metric or output:

Reopen rate, escalation rate, complexity indicators, service quality interpretation.

Severity:

Medium

Confidence:

Medium confidence

Why it matters:

Higher reopen or escalation rates may not mean poorer performance. They may reflect process rules, risk management or coding practices.

Safe interpretation:

Use as a signal for complexity, workflow friction or further investigation once definitions are confirmed.

Unsafe interpretation:

Do not use for blame, individual comparison or performance ranking without review.

Workaround:

Confirm reopen and escalation definitions, coding ownership and process context.

Human review trigger:

Required before stakeholder-sensitive, performance or governance use.

Status:

Open

Review date:

To confirm.

### Refresh Cadence Not Confirmed

Issue:

The refresh cadence for service account data has not yet been confirmed.

Source:

To confirm.

Affected metric or output:

All current-period service account outputs.

Severity:

Medium

Confidence:

High confidence

Why it matters:

Recent figures may be incomplete or stale if refresh timing is unknown.

Safe interpretation:

State the known timeframe and avoid claims about currentness beyond the source.

Unsafe interpretation:

Do not describe data as current, real-time or complete unless refresh cadence is confirmed.

Workaround:

Confirm refresh schedule, last refresh timestamp and any reporting lag.

Human review trigger:

Required before current-period metrics support operational or executive-facing decisions.

Status:

Open

Review date:

To confirm.

## Standard Data Quality Block

Use this block inside service account analytical summaries.

### Data Quality Note

Issue:

Affected source:

Affected metric:

Severity:

Confidence impact:

Safe interpretation:

Unsafe interpretation:

Human review required:

## Relationship To Other Files

Use this file with:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`

If a data quality issue changes source reliability, update `source_rules.md`.

If a data quality issue changes metric interpretation, update `metric_caveats.md`.

If a data quality issue changes metric meaning, update `metric_definitions.md`.

## Human Review Required

Human review is required when:

- severity is high or blocking
- the source of truth is not confirmed
- data quality issue affects a decision
- output may be executive-facing
- output may be used in governance
- output may support performance claims
- output may support customer experience claims
- output may affect stakeholder communication
- output compares teams, individuals or services
- source freshness is unclear
- workaround is uncertain

## Storage Rules

Store reusable service account data quality notes in:

`11_analytics/service-account/data_quality_notes.md`

Do not store:

- raw datasets
- customer-level rows
- copied query outputs
- screenshots of restricted dashboards
- sensitive source extracts
- private operational comments
- confidential troubleshooting records

## Review Checklist

Before using or updating a data quality note, check:

- Is the issue clearly described?
- Is the source named or marked to confirm?
- Is the affected metric clear?
- Is severity labelled?
- Is confidence labelled?
- Is interpretation impact clear?
- Is safe use defined?
- Is unsafe use defined?
- Is human review required?
- Is the note free of raw sensitive data?
- Does the note support better decision-making?

## Success Measures

Data quality notes are working when:

- source uncertainty is visible
- service account analysis avoids false certainty
- agents mention known reliability risks
- confidence levels are lowered appropriately
- decision briefs include relevant limits
- unresolved data issues trigger review
- raw data stays out of Strategic OS
- data quality issues improve interpretation rather than create clutter

## Failure Modes

Data quality notes are failing if:

- they become raw data dumps
- source uncertainty is hidden
- unresolved issues are treated as resolved
- agents ignore data quality notes
- high-severity issues do not trigger review
- old issues are never reviewed
- notes duplicate official systems without adding interpretation value
- data quality caveats are too vague to use

## Minimal Use Rule

Capture only issues that affect interpretation, confidence, decisions or reuse.

Do not document every minor irregularity.
