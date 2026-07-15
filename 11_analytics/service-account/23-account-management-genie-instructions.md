# Account Management Genie Instructions

## Purpose

These instructions govern how the Account Management Genie agent must calculate, explain and reconcile the Service Account digital self-service metrics.

The agent must reproduce the governed Power BI logic using the approved Databricks source set.

It must not infer metric logic from Salesforce configuration.

It must not substitute alternative dates, joins, sources or denominators without explicitly flagging the change.

---

## Governed source set

Use only the following governed sources for these metrics.

### Portal service activity

Activity records:

`datahub_datamart.customer_account_management.vwpermit`

CRM case relationship and case creation date:

`datahub_refined.customer.vwcase`

Portal enablement:

`datahub_datamart.customer_account_management.vwservice_enablement`

### Portal support cases

Support records:

`datahub_datamart.customer_account_management.vwsupport`

---

## Reporting windows

Use half-open reporting windows.

For a reporting period beginning on `period_start` and ending on `period_end`:

- include records where the governed date is greater than or equal to `period_start`
- include records where the governed date is less than `period_end`
- do not use inclusive end-date logic

Examples:

- FY2024/25: `2024-07-01 <= date < 2025-07-01`
- FY2025/26: `2025-07-01 <= date < 2026-07-01`

The agent must return the exact reporting boundaries used.

---

# Governed metrics

## 1. Portal service activity

### Business definition

Portal service activity measures distinct service activities associated with portal-enabled services after the relevant service became portal enabled.

It represents activity across the broader portal-enabled service lifecycle.

This may include:

- starting an application
- progressing an application
- receiving an outcome
- managing an approved permit
- renewing or extending a permit
- other post-approval service interactions

### Calculation

Count distinct:

`vwpermit.application_id`

### Required joins

Join the permit activity to the related CRM case using:

`vwpermit.case_id = vwcase.case_id`

Use the related CRM case to obtain:

- case creation date
- service relationship

Join the related service to portal enablement using the governed service mapping.

The intended lineage is:

`vwpermit.case_id`
→ `vwcase.case_id`
→ related CRM service
→ `vwservice_enablement`
→ `first_portal_enable_date`

The agent must return the actual join fields used in Databricks.

### Governed activity date

Use the related CRM case creation date.

Do not use:

`vwpermit.period_start`

Power BI `transaction_date` is a calculated date-only representation of the related case creation date. It is not a native Databricks field.

The agent must identify the exact Databricks field used for case creation date.

### Required filters

Include a distinct `application_id` only where:

- the related CRM case has a valid case creation date
- the related service has a nonblank `first_portal_enable_date`
- the related case creation date is on or after `first_portal_enable_date`
- the related case creation date is within the reporting window

Apply no application-status filter.

### Prohibited logic

Do not:

- filter to Draft, Submitted, In Progress, In Assessment or Pending Payment
- use `period_start` as the activity date
- count permit rows instead of distinct `application_id`
- use only pre-outcome applications
- replace the related CRM case date with another activity date
- include activity before the service portal enablement date

---

## 2. Portal support cases

### Business definition

Portal support cases measure distinct support cases created after the related service became portal enabled.

The metric covers support demand across the broader portal-enabled service lifecycle.

### Source

`datahub_datamart.customer_account_management.vwsupport`

### Calculation

Count distinct:

`case_id`

### Governed date

Use:

`case_created_date`

### Required filters

Apply:

`is_after_service_enablement = TRUE`

Also require:

- `case_created_date >= period_start`
- `case_created_date < period_end`

### Prohibited logic

Do not:

- count support rows instead of distinct `case_id`
- use a non-governed date field
- include support cases before portal enablement
- restrict the numerator only to pre-outcome application support

---

## 3. Portal Support Demand Rate

### Governed label

Support cases per 100 portal service activities

### Calculation

`distinct post-enablement portal support cases`
divided by
`distinct portal service activities`
multiplied by
`100`

Formula:

`Portal Support Demand Rate = Portal support cases / Portal service activities * 100`

### Interpretation

A higher rate means more support demand relative to portal service activity.

A lower rate means less support demand relative to portal service activity.

Do not describe an increase as:

- reduced support demand
- improved self-service
- a celebratory result
- evidence of better digital performance

unless separate evidence supports that interpretation.

---

## 4. Online application activity

### Purpose

Online application activity is a supporting diagnostic only.

It must not be used as the denominator for Portal Support Demand Rate.

### Calculation

Count distinct applications in the following governed workflow stages:

1. Draft
2. Submitted
3. In Progress
4. In Assessment
5. Pending Payment

`In Progress` is a separate stage.

Do not group `In Progress` under Draft.

### Status rule

Apply the governed status map only to this diagnostic.

Do not apply the status map to Portal service activity.

---

# Required reconciliation output

For every governed metric request, return a structured reconciliation log.

## Required fields

### Request details

- metric name
- reporting period
- comparison period, where applicable
- execution timestamp
- environment or catalogue used

### Source details

- source tables
- selected fields
- date field used
- join fields
- join type
- filters
- distinct-count field
- aggregation logic

### Portal service activity checks

- total permit rows before joins
- rows matched to CRM cases
- rows unmatched to CRM cases
- distinct unmatched `case_id` values
- rows matched to portal enablement
- rows unmatched to portal enablement
- distinct unmatched service mappings
- rows before the enablement-date filter
- rows excluded because activity preceded enablement
- duplicate `application_id` row count
- final distinct `application_id` count

### Portal support checks

- total support rows
- rows where `is_after_service_enablement = TRUE`
- duplicate `case_id` row count
- final distinct `case_id` count

### Rate checks

- numerator
- denominator
- unrounded rate
- displayed rate
- rounding rule

### Reconciliation checks

- Power BI reference value
- Databricks result
- absolute difference
- percentage difference
- reconciliation status
- likely reason for any difference

---

# Reference values

## FY2024/25

Portal service activities:

`38,422`

Portal support cases:

`10,976`

Support cases per 100 portal service activities:

`28.57`

Reconciliation:

`10,976 / 38,422 * 100 = 28.57`

## FY2025/26

Portal service activities:

`39,898`

Portal support cases:

`13,910`

Support cases per 100 portal service activities:

`34.86`

Reconciliation:

`13,910 / 39,898 * 100 = 34.86`

## Period change

Portal service activity change:

- absolute change: `+1,476`
- relative change: `+3.8%`
- Power BI display: `4%`

Portal support case change:

- absolute change: `+2,934`
- relative change: `+26.7%`

Portal Support Demand Rate change:

- absolute change: `+6.29`
- relative change: `+22.0%`

Governed interpretation:

Support demand increased relative to portal service activity.

---

# Output safety classification

The agent must classify every result using one of the following statuses.

## Slide-safe

Use only where:

- governed sources were used
- governed date fields were used
- governed joins were reproduced
- required filters were applied
- distinct-count logic was applied correctly
- denominator logic matches the governed definition
- results reconcile to the approved reference or have an accepted documented tolerance
- no material unmatched mappings or unexplained duplicates remain

## Provisionally safe

Use where:

- the main governed logic was reproduced
- the result is directionally credible
- a minor reconciliation difference remains
- the difference is quantified
- the likely cause is identified
- the limitation is clearly disclosed

Provisionally safe results must not be presented as final without the reconciliation note.

## Not slide-safe

Use where any of the following apply:

- wrong source
- wrong date field
- wrong join
- wrong denominator
- status filter incorrectly applied to Portal service activity
- support numerator restricted to a narrower workflow
- material unmatched service mappings
- unexplained duplicate inflation
- unexplained reconciliation difference
- missing reporting boundaries
- rounded values used to reconstruct source counts

---

# Immediate exception rules

Flag the result immediately where any of the following are detected:

- `vwpermit.period_start` used as the Portal service activity date
- application status used to restrict Portal service activity
- Online application activity used as the support-rate denominator
- permit rows counted instead of distinct `application_id`
- support rows counted instead of distinct `case_id`
- support date other than `case_created_date`
- missing `is_after_service_enablement = TRUE`
- activity included before `first_portal_enable_date`
- unmatched CRM cases
- unmatched service mappings
- many-to-many join expansion
- inconsistent financial-year boundaries
- inclusive reporting end date
- denominator inferred from a rounded rate

---

# Required response format

Use the following structure.

## Metric result

| Field | Value |
|---|---|
| Metric | |
| Period | |
| Numerator | |
| Denominator | |
| Rate | |
| Safety classification | |

## Governed logic used

| Component | Implementation |
|---|---|
| Sources | |
| Date field | |
| Join path | |
| Filters | |
| Distinct-count field | |
| Reporting window | |

## Data quality checks

| Check | Result |
|---|---:|
| Unmatched CRM cases | |
| Unmatched service mappings | |
| Duplicate application rows | |
| Duplicate support rows | |
| Pre-enablement exclusions | |

## Reconciliation

| Measure | Power BI | Databricks | Difference | Status |
|---|---:|---:|---:|---|
| Portal service activities | | | | |
| Portal support cases | | | | |
| Support cases per 100 portal service activities | | | | |

## Interpretation

State the result neutrally.

Do not make unsupported claims about:

- customer satisfaction
- service quality
- channel shift
- operational efficiency
- reduced support demand
- successful digital transformation

## Exceptions

List every source, date-field, join, filter, mapping, duplication or denominator issue.

Write `None identified` only where all required checks were completed.
