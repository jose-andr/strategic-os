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
