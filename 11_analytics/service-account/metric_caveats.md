# Service Account Metric Caveats

## Purpose

This file documents known and likely caveats for metrics used in the Service Account analytical domain.

It helps the Service Account Analytical Agent interpret metrics carefully, avoid overclaiming and support better decision-making.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Metric caveats support better decisions by making the limits of service account evidence visible.

## Domain

Service Account

## Core Principle

Do not interpret service account metrics without stating what they can and cannot prove.

A service account metric may be useful while still having important caveats.

## Caveat Register

| Metric | Caveat | Severity | Confidence | Review Date |
| --- | --- | --- | --- | --- |
| Service account volume | Grain must be confirmed: account, case, request, interaction or transaction | High | High confidence | To confirm |
| Service account volume | Duplicate, migrated or test records may affect volume | Medium | Medium confidence | To confirm |
| Active service accounts | Active status definition must be confirmed | High | High confidence | To confirm |
| New service accounts | Creation date may not equal first customer contact or demand start | Medium | Medium confidence | To confirm |
| Closed or resolved service accounts | Closure may not equal customer resolution | High | High confidence | To confirm |
| Service account age | Start and end date rules must be confirmed | High | High confidence | To confirm |
| Time to resolution | System resolution may not represent full customer experience | High | High confidence | To confirm |
| Repeat contact | Matching and attribution rules must be confirmed | High | High confidence | To confirm |
| Channel of contact | Channel mix and mapping may affect interpretation | Medium | Medium confidence | To confirm |
| Escalation rate | Escalation definition and denominator must be confirmed | High | High confidence | To confirm |
| Reopen rate | Reopen logic may reflect administrative handling, not unresolved need | Medium | Medium confidence | To confirm |

## Metric Use Boundaries

| Metric | Safe Use | Unsafe Use |
| --- | --- | --- |
| Service account volume | Directional demand or workload review once source and grain are confirmed | Formal reporting or performance claims without source confirmation |
| Active service accounts | Operational load sensemaking once active definition is confirmed | Backlog or resourcing claims without review |
| New service accounts | Directional demand monitoring | Customer demand claims without channel and service context |
| Closed or resolved service accounts | Workflow throughput review | Customer resolution or experience claims without supporting evidence |
| Service account age | Identifying ageing patterns | Individual or team performance comparison without review |
| Time to resolution | Directional workflow timing analysis | Service quality claims without customer evidence |
| Repeat contact | Signal for further investigation | Proof of failure demand or cause |
| Channel of contact | Channel mix interpretation | Channel preference or effectiveness claims without supporting evidence |
| Escalation rate | Complexity or process-friction signal | Blame, accountability or performance claims |
| Reopen rate | Signal for unresolved work or process issue | Proof of poor resolution without review |

## Standard Caveats

### Grain Caveat

Metric:

Service account volume

Caveat type:

Definition caveat

Caveat:

The unit of measurement must be confirmed before interpretation. Service account volume may refer to accounts, cases, requests, interactions, transactions or another unit.

Why it matters:

Different grains produce different meanings. A count of interactions may overstate customer demand compared with a count of accounts or cases.

Safe interpretation:

Use only as directional until grain is confirmed.

Unsafe interpretation:

Do not compare volume across periods, teams or services without confirming grain and source rules.

Human review trigger:

Required before volume is used in decision briefs, governance or executive-facing material.

### Duplicate Or Migrated Record Caveat

Metric:

Service account volume

Caveat type:

Data quality caveat

Caveat:

Duplicate, test, cancelled or migrated records may affect volume.

Why it matters:

Volume may be overstated or distorted if records are counted more than once or included from system migration activity.

Safe interpretation:

Use as directional until duplicate and migration rules are confirmed.

Unsafe interpretation:

Do not treat raw count as final demand or workload without source review.

Human review trigger:

Required when volume affects resourcing, prioritisation or performance claims.

### Active Status Caveat

Metric:

Active service accounts

Caveat type:

Definition caveat

Caveat:

Active status must be confirmed. Active may mean open, recently updated, not closed, currently valid, operationally live or another status.

Why it matters:

Different active-status rules change the apparent size of current workload or backlog.

Safe interpretation:

Use only after active-status logic is confirmed.

Unsafe interpretation:

Do not treat active count as backlog without definition review.

Human review trigger:

Required before using active service accounts for backlog, resourcing or prioritisation decisions.

### Creation Date Caveat

Metric:

New service accounts

Caveat type:

Definition caveat

Caveat:

Creation date may not equal first customer contact, issue start or demand start.

Why it matters:

New service account counts may reflect system entry timing rather than actual demand timing.

Safe interpretation:

Use for system-created volume only unless demand-start logic is confirmed.

Unsafe interpretation:

Do not claim new demand has increased or decreased without checking source and context.

Human review trigger:

Required before using new account metrics for demand planning or executive-facing advice.

### Closure Versus Resolution Caveat

Metric:

Closed or resolved service accounts

Caveat type:

Definition caveat

Caveat:

Closure may not equal customer resolution.

Why it matters:

A record may be closed in the system while the customer still has unresolved need, repeat contact or dissatisfaction.

Safe interpretation:

Use closure as workflow throughput unless resolution logic and customer evidence are confirmed.

Unsafe interpretation:

Do not claim customer issues are resolved from closure count alone.

Human review trigger:

Required before using closure metrics to support customer experience, service quality or improvement claims.

### Time To Resolution Caveat

Metric:

Time to resolution

Caveat type:

Definition caveat

Caveat:

Time to resolution may measure system closure time rather than full customer experience from first contact to final understanding.

Why it matters:

Operational cycle time may not reflect customer effort, repeat contact, waiting time or perceived resolution.

Safe interpretation:

Use for directional workflow analysis and pair with repeat contact, reopen or customer evidence where possible.

Unsafe interpretation:

Do not claim improved customer experience from reduced time to resolution without supporting evidence.

Human review trigger:

Required before using this metric in executive-facing, governance or service-quality claims.

### Repeat Contact Attribution Caveat

Metric:

Repeat contact

Caveat type:

Attribution caveat

Caveat:

Repeat contact may reflect unresolved need, unclear communication, customer preference, channel switching, related issues or process delay.

Why it matters:

Repeat contact is a signal for investigation, not proof of a single cause.

Safe interpretation:

Use repeat contact to identify where deeper analysis may be needed.

Unsafe interpretation:

Do not describe repeat contact as proof of failure demand without supporting evidence.

Human review trigger:

Required before making claims about cause, service failure or customer dissatisfaction.

### Channel Mix Caveat

Metric:

Channel of contact

Caveat type:

Channel caveat

Caveat:

Channel data may reflect available channels, service type, customer capability, digital design, assisted support, operational routing or customer preference.

Why it matters:

Channel mix does not automatically explain customer preference or channel effectiveness.

Safe interpretation:

Use as a signal for channel design and service journey investigation.

Unsafe interpretation:

Do not infer channel preference or digital success from channel count alone.

Human review trigger:

Required before using channel metrics to support channel strategy, digital investment or assisted-support changes.

### Escalation Definition Caveat

Metric:

Escalation rate

Caveat type:

Definition caveat

Caveat:

Escalation may be defined differently across systems, teams or processes.

Why it matters:

Escalation rates may reflect process design, risk appetite, complexity, policy or coding behaviour rather than poor performance.

Safe interpretation:

Use as a signal of complexity, risk or process friction once definition is confirmed.

Unsafe interpretation:

Do not use escalation rate for blame, team comparison or performance claims without review.

Human review trigger:

Required before stakeholder-sensitive or performance-related use.

### Reopen Logic Caveat

Metric:

Reopen rate

Caveat type:

Definition caveat

Caveat:

Reopened items may reflect unresolved need, administrative handling, additional information, customer follow-up or process rules.

Why it matters:

Reopen rate can indicate possible service friction but does not explain cause on its own.

Safe interpretation:

Use as a signal for further investigation and pair with repeat contact and closure caveats.

Unsafe interpretation:

Do not claim poor resolution quality from reopen rate alone.

Human review trigger:

Required before formal service-quality or performance claims.

## Standard Caveat Block

Use this block inside service account analytical summaries.

### Metric Caveat

Metric:

Source:

Caveat:

Severity:

Confidence:

Safe interpretation:

Unsafe interpretation:

Human review required:

## Human Review Required

Human review is required when caveated service account metrics are used for:

- decision briefs
- executive-facing advice
- governance
- performance claims
- service quality claims
- customer experience claims
- stakeholder-sensitive communication
- team or individual comparison
- channel strategy recommendations
- funding, resourcing or prioritisation decisions

## Related Files

Use this file with:

- `source_rules.md`
- `metric_definitions.md`
- `data_quality_notes.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`

## Review Checklist

Before using a service account metric caveat, check:

- Is the metric named?
- Is the caveat specific?
- Is severity labelled?
- Is confidence labelled?
- Is safe use defined?
- Is unsafe use defined?
- Is human review required?
- Is the caveat still current?
- Does the caveat change interpretation?
- Does the output avoid overclaiming?

## Success Measures

Metric caveats are working when:

- service account analysis is more careful
- metrics are not overclaimed
- decision briefs include interpretation limits
- agents apply caveats consistently
- confidence labels are more proportionate
- stakeholder-sensitive claims are reviewed
- source and definition uncertainty is visible
- Strategic OS avoids unsupported analytical claims

## Failure Modes

Metric caveats are failing if:

- caveats are omitted
- caveats are too generic
- agents ignore known caveats
- closure is treated as resolution
- repeat contact is treated as proof of failure demand
- channel mix is treated as preference
- exploratory metrics are treated as official reporting
- confidence stays high despite caveats
- caveats are not reviewed

## Minimal Use Rule

Use caveats that change interpretation.

Do not add caveats for their own sake.

Prioritise caveats that affect decisions, trust, communication or reuse.
