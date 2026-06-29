# Schema Inventory

This file records the current schema inventory and source decisions for the Service Account / Portal CX EOFY celebration analysis.

## Catalogs and schemas

### Primary catalog

`datahub_datamart`

### Primary schema

`customer_account_management`

### Customer intelligence schema

`customer_intelligence`

### Canonical descriptor schema

`datahub_refined.customer`

## Schema purpose

The curated datamart supports analysis and management of customers accessing the Salesforce portal, including Service Account / Portal CX reporting.

The customer intelligence schema supports CSAT and survey-related analysis.

The refined customer schema is used only as a canonical descriptor source for CRM case field meanings.

## Current source decisions

| Purpose | Source | Decision |
|---|---|---|
| Customers | `datahub_datamart.customer_account_management.vwaccount` | Use for Service Account / portal sign-ups. |
| Activity | `datahub_datamart.customer_account_management.vwpermit` | Use for application workflow Activity. |
| Support demand | `datahub_datamart.customer_account_management.vwsupport` | Use for support numerator and support rate. |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` | Use for portal service cohort and Activity CSAT matching. |
| CSAT | `datahub_datamart.customer_intelligence.vwcase` | Use for Activity CSAT and mapped Support CSAT. |
| CRM case descriptors | `datahub_refined.customer.vwcase` | Use for field meaning only; do not connect to Genie for this pilot. |
| Support CSAT mapping | `20-support-csat-service-mapping.md` | Manual mapping accepted for pilot only; governed Databricks asset required for production. |

## Excluded from headline KPI production

| Source | Decision |
|---|---|
| `customer_account_management.vwsupport_enriched` | Do not use for headline KPIs or CSAT. Optional exploratory context only. |
| `customer_intelligence.vwsurvey_feedback` | Do not use unless later response-level survey validation is required. |
| `vwcase_survey` | Do not use for this pilot. |
| `Record_Type` | Do not use as a Support CSAT definition. |

## Tables and views reviewed

### `datahub_datamart.customer_account_management`

| Table / view | Current purpose | Validation status |
|---|---|---|
| `vwaccount` | Customer/account records for Service Account / portal sign-ups. | Validated for Customers and All accounts. |
| `vwcase` | CRM case/request records with case, service, channel, and portal enablement fields. | Reviewed; not the primary CSAT source for this pilot. |
| `vwpermit` | Permit/application workflow records. | Validated as Activity source using accepted application workflow statuses. |
| `vwservice_enablement` | Portal-enabled service list and first portal enablement dates. | Validated as portal service cohort source. |
| `vwsupport` | Support cases with service, channel, account, and enablement fields. | Validated as support demand source. |
| `vwsupport_enriched` | Enriched interaction / event-style layer with AI/theme fields. | Excluded from headline KPI production and CSAT calculation. |

### `datahub_datamart.customer_intelligence`

| Table / view | Current purpose | Validation status |
|---|---|---|
| `vwcase` | CSAT and survey case records. | Validated for Activity CSAT and mapped Support CSAT. |
| `vwsurvey_feedback` | Survey feedback / response-level candidate source. | Reviewed; not required for current pilot. |

### `datahub_refined.customer`

| Table / view | Current purpose | Validation status |
|---|---|---|
| `vwcase` | Canonical CRM case field descriptions. | Use for field meaning only. Do not connect to Genie for this pilot. |

## Confirmed field inventory

### `customer_account_management.vwaccount`

| Field | Use |
|---|---|
| `account_id` | Account identifier for Customers and All accounts. |
| `customer_portal` | Service Account / portal inclusion flag. |
| `first_account_portal_on_date` | Customer sign-up reporting date. |
| `created_date` | General account creation date; not preferred for Customers. |
| `account_created_month` | Monthly account creation analysis. |
| `account_record_type` | Account classification. |
| `onboarding_type` | Onboarding pathway. |
| `new_or_existing` | New vs existing customer segmentation. |

### `customer_account_management.vwpermit`

| Field | Use |
|---|---|
| `application_id` | Activity identifier. |
| `case_id` | Link to related case where needed. |
| `period_start` | Activity reporting date. |
| `period_end` | End date for application/case period. |
| `application_status` | Main Activity status classification field. |
| `case_status` | Supporting status profiling field. |
| `permit_type` | Permit/service category analysis. |
| `category` | Activity category analysis. |

### `customer_account_management.vwservice_enablement`

| Field | Use |
|---|---|
| `service_key` | Service identifier. |
| `service_group` | Portal service grouping. |
| `service_name` | Portal service cohort and Activity CSAT matching. |
| `first_portal_enable_date` | Portal enablement date and pre/post diagnostic field. |

### `customer_account_management.vwsupport`

| Field | Use |
|---|---|
| `case_id` | Support case identifier. |
| `case_number` | Case reference. |
| `date_time_opened` | Support reporting date. |
| `date_time_closed` | Support closure date. |
| `channel` | Support channel segmentation. |
| `account_id` | Account linkage. |
| `service_group` | Support service grouping. |
| `ask_service_name` | Support/enquiry service name. |
| `portal_service_name` | Related portal service name. |
| `portal_enable_date` | Portal service enablement date. |
| `is_after_service_enablement` | Pilot support eligibility flag. |

### `customer_intelligence.vwcase`

| Field | Use |
|---|---|
| `Survey_Completion_Date` | CSAT reporting date. |
| `Satisfaction_Score_5` | CSAT score. |
| `Service_Name` | Activity CSAT cohort match and mapped Support CSAT match. |
| `Service_Group` | CSAT grouping and validation. |
| `Channel` | CSAT channel diagnostics. |
| `Case_Number` | Case reference for validation. |
| `Record_Type` | CRM metadata only; not a Support CSAT definition. |

## EOFY celebration metrics

| Metric | Source | Current status |
|---|---|---|
| Customers | `vwaccount` | Validated. |
| All accounts | `vwaccount` | Validated as context only. |
| Activity | `vwpermit` | Accepted for pilot using application workflow status logic. |
| Activity by category | `vwpermit`, optional `vwservice_enablement` | Use for diagnostics only until category mapping is confirmed. |
| Support demand | `vwsupport` | Accepted for pilot. |
| Support per 100 activities | `vwsupport` + `vwpermit` | Accepted for pilot. |
| Activity CSAT | `customer_intelligence.vwcase` + `vwservice_enablement` | Validated for pilot. |
| Support CSAT | `customer_intelligence.vwcase` + manual Support CSAT mapping | Pilot only; governed mapping required for production. |
| Support by channel | `vwsupport.channel` or `customer_intelligence.vwcase.Channel` | Pending validation. |

## Current validated results

| Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement |
|---|---:|---:|---:|
| Customers | 9,838 | 15,570 | +58.3% |
| Activity applications | 2,209 | 3,751 | +69.8% |
| Support cases | 10,976 | 15,475 | +41.0% |
| Support per 100 activities | 496.9 | 412.6 | about -17.0% |
| Activity CSAT | 76.5% | 80.6% | +4.1 pp |
| Activity CSAT valid responses | 889 | 1,721 | +832 responses |

## Support CSAT mapping status

Support CSAT cannot be inferred from schema fields alone.

Do not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

For the celebration pilot, Support CSAT uses the manual mapping documented in:

`20-support-csat-service-mapping.md`

Future repeatable Support CSAT requires a governed Databricks mapping asset, such as:

`datahub_datamart.customer_account_management.support_csat_service_mapping`

or

`datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

## Validation questions

For each table, confirm:

1. What business entity does one row represent?
2. What is the grain of the table?
3. Which date field should be used for financial year reporting?
4. Which fields identify customers, accounts, cases, applications, or support interactions?
5. Which fields support the EOFY celebration metrics?
6. Which fields require business definition before use?
7. Which fields are suitable for reusable Genie / SQL logic?
8. Which fields require governed reference mapping before production use?

## Remaining mapping questions

| Area | Question |
|---|---|
| Activity | Should the Power BI `vwpermit_statused` logic be upstreamed into Databricks? |
| Support demand | Is `is_after_service_enablement = TRUE` sufficient for the reusable support numerator? |
| Support CSAT | Should the mapping be implemented as a governed table or curated view? |
| Support CSAT ownership | Who owns updates when new portal services are enabled? |
| Channel segmentation | Should channel segmentation use `vwsupport.channel`, `customer_intelligence.vwcase.Channel`, or both? |
| Category drivers | Which category and service fields should be used for driver analysis? |

## Validation summary

Detailed schema validation findings are captured in:

`09-schema-validation-summary.md`

Use that file to record which fields were found, which metrics are supported, and which definition questions need to be resolved before final reusable reporting.
