# Schema Inventory

## Catalog

`datahub_datamart`

## Schema

`customer_account_management`

## Schema purpose

This curated datamart supports analysis and management of customers accessing the Salesforce portal, including Service Account related reporting.

## Tables

| Table | Initial assumed purpose | Validation status |
|---|---|---|
| `vwaccount` | Customer/account records | To validate |
| `vwcase` | Case/request records | To validate |
| `vwpermit` | Permit activity | To validate |
| `vwservice_enablement` | Service enablement / portal-enabled activity | To validate |
| `vwsupport` | Support interactions | To validate |
| `vwsupport_enriched` | Support interactions with additional dimensions, channel or CSAT fields | To validate |

## Validation questions

For each table, confirm:

1. What business entity does one row represent?
2. What is the grain of the table?
3. Which date field should be used for financial year reporting?
4. Which fields identify customers, accounts, cases, transactions or support interactions?
5. Which fields support the EOFY celebration metrics?
6. Which fields require business definition before use?

## EOFY celebration metrics to validate

| Metric | Likely table | Status |
|---|---|---|
| New service accounts YoY | `vwaccount` | To validate |
| Active service accounts YoY | `vwaccount` | To validate |
| Self-service activity YoY | `vwpermit`, `vwservice_enablement` | To validate |
| Activity by category | `vwpermit`, `vwservice_enablement` | To validate |
| Support cases YoY | `vwsupport`, `vwsupport_enriched` | To validate |
| Support per 100 transactions | `vwsupport_enriched` + activity table | To validate |
| Activity CSAT | To confirm | To validate |
| Support CSAT | `vwsupport_enriched` | To validate |
| Support by channel | `vwsupport_enriched` | To validate |
## Validation summary

Detailed schema validation findings are captured in:

`09-schema-validation-summary.md`

Use this file to record which fields were found, which metrics are supported, and which definition questions need to be resolved before final YoY analysis.
