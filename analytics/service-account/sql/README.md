# SQL

This folder stores reusable SQL files for the Service Account / Portal CX EOFY celebration analysis.

## Purpose

The SQL files are used to validate curated Databricks schemas and calculate year-on-year metrics for the one-slide EOFY celebration summary.

They support:

- schema validation
- metric translation from Power BI to Databricks
- KPI calculation
- source validation
- caveat documentation
- reusable analysis patterns for future Service Account / Portal CX reporting

## Databricks schemas

Primary Service Account / Portal CX schema:

`datahub_datamart.customer_account_management`

Customer intelligence / survey schema:

`datahub_datamart.customer_intelligence`

Canonical CRM descriptor source:

`datahub_refined.customer.vwcase`

## Data governance

Query outputs and organisational data should remain in Databricks or approved organisational systems.

This folder should store reusable SQL logic only.

Do not store:

- raw organisational data
- customer-level extracts
- case URLs
- survey comments
- personal information
- sensitive operational outputs

## SQL file sequence

| File | Purpose | Status |
|---|---|---|
| `00_schema_validation.sql` | Inspect available fields and confirm table structure. | Created |
| `01_customer_growth_yoy.sql` | Calculate Service Account / portal sign-up growth year on year. | Created |
| `02_activity_yoy.sql` | Calculate application workflow Activity growth year on year. | Created |
| `03_support_yoy.sql` | Calculate support demand and support per 100 activities. | Created |
| `04_csat_yoy.sql` | Calculate CSAT movement where source and cohort logic are validated. | Created |
| `05_category_drivers_yoy.sql` | Identify permit, service, or category drivers contributing to change. | Created |
| `06_eofy_summary_output.sql` | Combine headline metrics for the slide summary. | Created |
| `07_activity_status_validation.sql` | Profile `vwpermit` status combinations to recreate `vwpermit_statused` logic. | Created |
| `08_support_logic_validation.sql` | Profile `vwsupport` for support numerator logic. | Created |
| `09_csat_source_validation.sql` | Inspect customer intelligence CSAT fields and source suitability. | Created |
| `10_activity_status_mapping_draft.sql` | Draft status mapping separating application workflow from permit lifecycle statuses. | Created |
| `11_activity_yoy_application_workflow_draft.sql` | Calculate Activity using accepted application workflow status logic. | Created |
| `12_support_source_review.sql` | Review `vwsupport` and confirm `vwsupport_enriched` exclusion from headline KPI production. | Created |
| `13_support_rate_yoy_draft.sql` | Calculate support per 100 activities using `vwsupport` and Activity denominator. | Created |
| `14_csat_service_cohort_yoy.sql` | Compare Activity CSAT for the portal-relevant service-name cohort across FY windows, with pre/post enablement timing as diagnostic context. | Created |
| `15_rpp_support_csat_proxy.sql` | Template for Residential Parking Permit support CSAT proxy using selected enquiry/support services and analysis periods. | Proxy only |

## Current validated results

| Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement |
|---|---:|---:|---:|
| Customers | 9,838 | 15,570 | +58.3% |
| Activity applications | 2,209 | 3,751 | +69.8% |
| Support cases | 10,976 | 15,475 | +41.0% |
| Support per 100 activities | 496.9 | 412.6 | about -17.0% |
| Activity CSAT | 76.5% | 80.6% | +4.1 pp |
| Activity CSAT valid responses | 889 | 1,721 | +832 responses |

## SQL usage principles

### Customers

Use:

`datahub_datamart.customer_account_management.vwaccount`

Count distinct:

`account_id`

where:

`customer_portal = TRUE`

and:

`first_account_portal_on_date`

falls within the reporting window.

### Activity

Use:

`datahub_datamart.customer_account_management.vwpermit`

Count distinct:

`application_id`

where:

`period_start`

falls within the reporting window and `application_status` is one of:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

Do not include unless later confirmed:

- Withdrawn
- Declined
- Issued
- Extended
- Renewed
- Lapsed

### Support demand

Use:

`datahub_datamart.customer_account_management.vwsupport`

Count distinct:

`case_id`

where:

`is_after_service_enablement = TRUE`

and:

`date_time_opened`

falls within the reporting window.

Support headline KPI:

    Support per 100 activities =
      distinct support cases / distinct activity applications * 100

Do not use `vwsupport_enriched` for headline support KPI production.

### Activity CSAT

Use:

`datahub_datamart.customer_intelligence.vwcase`

Scope to portal-enabled services from:

`datahub_datamart.customer_account_management.vwservice_enablement`

Use:

`Survey_Completion_Date`

as the reporting date.

Use:

`Satisfaction_Score_5`

for CSAT.

Formula:

    CSAT =
      Satisfaction_Score_5 IN (4, 5)
      divided by
      Satisfaction_Score_5 IS NOT NULL

Use service-name cohort matching for the main EOFY comparison.

Use pre/post enablement logic only as a diagnostic where a valid pre-enable baseline exists.

## Support CSAT SQL note

There is no standalone `16_support_csat_mapping_pilot.sql` file.

Do not create one unless a governed Support CSAT mapping asset exists or the team explicitly decides to maintain a pilot-only SQL template.

For now, Support CSAT mapping remains documented in:

`analytics/service-account/20-support-csat-service-mapping.md`

Working Databricks workspace copy:

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

Do not create Support CSAT SQL from schema inference alone.

Support CSAT requires the manual mapping documented in:

`analytics/service-account/20-support-csat-service-mapping.md`

Until the mapping is implemented as a governed Databricks table or curated view, Support CSAT SQL should be treated as pilot-only and manually controlled.

Support CSAT is not yet a repeatable self-serve Genie metric because the mapping is not implemented as a governed Databricks table or curated view.

Support CSAT should only include CSAT cases where:

`customer_intelligence.vwcase.Service_Name`

matches a mapped:

`support_service_name`

Do not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

Future SQL should join `customer_intelligence.vwcase.Service_Name` to a governed mapping field equivalent to:

`support_service_name`

Candidate governed mapping assets:

- `datahub_datamart.customer_account_management.support_csat_service_mapping`
- `datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

## RPP Support CSAT proxy note

Use `15_rpp_support_csat_proxy.sql` only for the Residential Parking Permit support-pathway proxy.

Do not treat the RPP proxy as complete Service Account Support CSAT.

The proxy can support explanatory analysis about Residential Parking support stabilisation, but it should not replace the mapped Support CSAT definition.

## Channel segmentation note

Support CSAT may later be segmented by channel type using a rule such as:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

Do not productionise channel-based Support CSAT until:

- Support CSAT mapping is governed
- the correct channel field is confirmed
- actual channel values are validated

## Current validation priorities

1. Confirm whether `vwpermit_statused[include_in_activity_kpi]` should be recreated in Databricks as a governed view or retained as Power BI-derived logic.
2. Confirm the reusable Databricks equivalent of `[Self-Service Support]` beyond the pilot `is_after_service_enablement = TRUE` rule.
3. Implement Support CSAT mapping as a governed Databricks table or curated view.
4. Confirm ownership and update process for the Support CSAT mapping.
5. Validate the Databricks support channel field for real-time vs async segmentation.
6. Update final SQL files once field mappings and governed assets are confirmed.

## Current principle

Power BI measures remain the business logic source of truth where available.

Databricks SQL outputs are valid for the pilot where definitions are documented and caveats are preserved.

Reusable production SQL requires governed metric logic, governed mapping assets, and business/data-owner validation.
