# SQL

This folder stores reusable SQL files for the Service Account EOFY celebration analysis.

## Purpose

The SQL files are used to validate the curated Databricks schema and calculate year-on-year metrics for the one-slide EOFY celebration summary.

## Databricks schema

`datahub_datamart.customer_account_management`

## SQL file sequence

| File | Purpose |
|---|---|
| `00_schema_validation.sql` | Inspect available fields and confirm table structure |
| `01_customer_growth_yoy.sql` | Calculate Service Account customer growth year on year |
| `02_activity_yoy.sql` | Calculate self-service activity growth year on year |
| `03_support_yoy.sql` | Calculate support demand and support per 100 transactions |
| `04_csat_yoy.sql` | Calculate activity and support CSAT year on year |
| `05_category_drivers_yoy.sql` | Identify permit or service categories contributing to change |
| `06_eofy_summary_output.sql` | Combine headline metrics for the slide summary |

## Data governance

Query outputs and organisational data should remain in Databricks or approved organisational systems.

This folder should store reusable SQL logic only.

## Validation SQL sequence

These SQL files support the EOFY Service Account / Portal CX celebration analysis.

Run the validation files before treating the final summary output as production-ready.

| File | Purpose | Status |
|---|---|---|
| `00_schema_validation.sql` | Confirms available tables and fields in the curated Databricks schema | Created |
| `01_customer_growth_yoy.sql` | Calculates Service Account sign-up growth | Created |
| `02_activity_yoy.sql` | Calculates self-service activity growth | Created |
| `03_support_yoy.sql` | Calculates support demand | Created |
| `04_csat_yoy.sql` | Calculates CSAT movement | Created |
| `05_category_drivers_yoy.sql` | Identifies service/category drivers | Created |
| `06_eofy_summary_output.sql` | Produces final one-slide summary output | Created |
| `07_activity_status_validation.sql` | Profiles `vwpermit` status combinations to recreate `vwpermit_statused` logic | Created |
| `08_support_logic_validation.sql` | Profiles `vwsupport` and `vwsupport_enriched` to map `[Self-Service Support]` | Created |
| `09_csat_source_validation.sql` | Inspects `vwcase` and `vwsupport_enriched` for survey / CSAT fields | Created |
| `14_csat_service_cohort_yoy.sql` | Compares CSAT for the portal-relevant service-name cohort across FY windows, with pre/post enablement timing as a diagnostic dimension. | Added; diagnostic result confirms pre/post CSAT is not viable for this pilot. |
| `15_rpp_support_csat_proxy.sql` | Template for Residential Parking Permit support CSAT proxy using selected enquiry/support services and analysis periods. | Added as template; requires confirmed period dates and mapping source before production use. |

## CSAT SQL guidance

Use `14_csat_service_cohort_yoy.sql` for direct Activity CSAT diagnostics.

Use `15_rpp_support_csat_proxy.sql` only for the Residential Parking Permit support-pathway proxy.

Do not treat the RPP proxy as a complete Service Account support CSAT standard.

Do not use `vwsupport_enriched` for headline support KPI production or CSAT calculation.
### Current validation priorities

1. Confirm whether `vwpermit_statused[include_in_activity_kpi]` can be recreated in Databricks.
2. Confirm the Databricks equivalent of `[Self-Service Support]`.
3. Confirm the Databricks source for CSAT survey responses.
4. Confirm the Databricks support channel field for real-time vs async segmentation.
5. Update final SQL files once field mappings are confirmed.
