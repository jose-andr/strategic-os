# Account Management Genie Reconciliation

## Purpose

Use this procedure to test whether the Account Management Genie agent reproduces the governed Power BI results for:

- Portal service activity
- Portal support cases
- Support cases per 100 portal service activities

The reconciliation must use the permanent instructions in:

`23-account-management-genie-instructions.md`

Do not use Salesforce configuration to infer metric logic.

---

## Prescriptive Genie prompt

Calculate and reconcile the governed Portal Support Demand Rate for FY2024/25 and FY2025/26.

Use only these governed Databricks sources:

- `datahub_datamart.customer_account_management.vwpermit`
- `datahub_refined.customer.vwcase`
- `datahub_datamart.customer_account_management.vwservice_enablement`
- `datahub_datamart.customer_account_management.vwsupport`

### Portal service activity

For each financial year:

1. Start from `vwpermit`.
2. Join `vwpermit` to the related CRM case using `case_id`.
3. Use the related CRM case creation date as the activity date.
4. Do not use `vwpermit.period_start`.
5. Obtain the related service from the CRM case.
6. Join that service to `vwservice_enablement`.
7. Require a nonblank `first_portal_enable_date`.
8. Require the CRM case creation date to be on or after `first_portal_enable_date`.
9. Apply the half-open financial-year reporting window.
10. Apply no application-status filter.
11. Count distinct `vwpermit.application_id`.

Use these reporting windows:

- FY2024/25: `2024-07-01 <= case creation date < 2025-07-01`
- FY2025/26: `2025-07-01 <= case creation date < 2026-07-01`

### Portal support cases

For each financial year:

1. Use `vwsupport`.
2. Use `case_created_date` as the reporting date.
3. Require `is_after_service_enablement = TRUE`.
4. Apply the same half-open reporting window.
5. Count distinct `case_id`.

### Portal Support Demand Rate

Calculate:

`distinct portal support cases / distinct portal service activities * 100`

Use the label:

`Support cases per 100 portal service activities`

Do not use Online application activity as the denominator.

### Required diagnostic output

Return:

- every source table used
- every selected date field
- every join field
- every join type
- every filter
- distinct-count fields
- raw numerator
- raw denominator
- unrounded rate
- displayed rate
- unmatched CRM case count
- unmatched service mapping count
- duplicate application-row count
- duplicate support-row count
- records excluded before portal enablement
- any many-to-many join expansion
- Power BI reference value
- Databricks result
- absolute reconciliation difference
- percentage reconciliation difference
- likely cause of every difference

Immediately flag:

- use of `vwpermit.period_start`
- application-status filtering of Portal service activity
- use of Online application activity as the denominator
- row counts used instead of distinct counts
- missing portal-enablement filtering
- inclusive financial-year end dates
- unmatched service mappings
- unexplained duplicate inflation
- denominator values reconstructed from rounded rates

Classify each result as:

- Slide-safe
- Provisionally safe
- Not slide-safe

Do not classify a result as Slide-safe where a source, date, join, filter, denominator or material reconciliation mismatch remains.

---

## Power BI reference values

| Measure | FY2024/25 | FY2025/26 |
|---|---:|---:|
| Portal service activities | 38,422 | 39,898 |
| Portal support cases | 10,976 | 13,910 |
| Support cases per 100 portal service activities | 28.57 | 34.86 |

Expected changes:

| Measure | Absolute change | Relative change |
|---|---:|---:|
| Portal service activities | +1,476 | +3.8% |
| Portal support cases | +2,934 | +26.7% |
| Support cases per 100 portal service activities | +6.29 | +22.0% |

Governed interpretation:

Support demand increased relative to portal service activity.

---

# Reconciliation log

## Run metadata

| Field | Value |
|---|---|
| Run date | |
| Run by | |
| Genie agent | Account Management |
| Environment | |
| Catalogue | |
| Permanent instruction version | |
| Query or conversation reference | |

## Logic returned by Genie

| Component | Genie implementation | Governed requirement | Match |
|---|---|---|---|
| Permit source | | `vwpermit` | |
| CRM case source | | `vwcase` | |
| Enablement source | | `vwservice_enablement` | |
| Support source | | `vwsupport` | |
| Activity date | | Related CRM case creation date | |
| Support date | | `case_created_date` | |
| Permit-to-case join | | `case_id` | |
| Case-to-service mapping | | Related CRM service | |
| Service-to-enablement join | | Governed service mapping | |
| Activity distinct count | | `application_id` | |
| Support distinct count | | `case_id` | |
| Portal enablement filter | | Activity date on or after enablement | |
| Support enablement filter | | `is_after_service_enablement = TRUE` | |
| Activity status filter | | None | |
| Reporting windows | | Half-open | |

## FY2024/25 result

| Measure | Power BI | Genie | Difference | Difference % | Status |
|---|---:|---:|---:|---:|---|
| Portal service activities | 38,422 | | | | |
| Portal support cases | 10,976 | | | | |
| Support cases per 100 portal service activities | 28.57 | | | | |

## FY2025/26 result

| Measure | Power BI | Genie | Difference | Difference % | Status |
|---|---:|---:|---:|---:|---|
| Portal service activities | 39,898 | | | | |
| Portal support cases | 13,910 | | | | |
| Support cases per 100 portal service activities | 34.86 | | | | |

## Data-quality diagnostics

| Check | FY2024/25 | FY2025/26 | Assessment |
|---|---:|---:|---|
| Permit rows before joins | | | |
| Rows matched to CRM cases | | | |
| Rows unmatched to CRM cases | | | |
| Distinct unmatched case IDs | | | |
| Rows matched to enablement | | | |
| Rows unmatched to enablement | | | |
| Distinct unmatched services | | | |
| Pre-enablement exclusions | | | |
| Duplicate application rows | | | |
| Duplicate support rows | | | |
| Many-to-many expansion | | | |

## Exceptions

| Type | Description | Metric impact | Resolution required |
|---|---|---|---|
| Source mismatch | | | |
| Date-field mismatch | | | |
| Join mismatch | | | |
| Filter mismatch | | | |
| Denominator mismatch | | | |
| Mapping gap | | | |
| Duplication issue | | | |
| Reporting-window issue | | | |

Write `None identified` only after all required checks have been completed.

## Final classification

| Metric | Classification | Reason |
|---|---|---|
| Portal service activity | | |
| Portal support cases | | |
| Support cases per 100 portal service activities | | |

## Reconciliation conclusion

Record:

- whether Genie reproduced the governed metrics
- every unresolved difference
- whether the outputs are suitable for EOFY slides
- the next corrective action, where required
