-- 07_activity_status_validation.sql
-- Purpose:
-- Validate whether the Power BI vwpermit_statused logic can be recreated from Databricks vwpermit.
--
-- This query does not calculate the final Activity KPI yet.
-- It profiles the available status fields and counts distinct applications by status combination.
--
-- Key question:
-- Can we recreate include_in_activity_kpi from vwpermit application_status and case_status?

WITH base AS (
    SELECT
        application_id,
        transaction_date,
        TRIM(LOWER(application_status)) AS application_status_norm,
        TRIM(LOWER(case_status)) AS case_status_norm,
        TRIM(LOWER(category)) AS category_norm,
        TRIM(LOWER(permit_type)) AS permit_type_norm,
        case_id
    FROM datahub_datamart.customer_account_management.vwpermit
    WHERE application_id IS NOT NULL
),

status_profile AS (
    SELECT
        application_status_norm,
        case_status_norm,
        category_norm,
        permit_type_norm,
        COUNT(*) AS row_count,
        COUNT(DISTINCT application_id) AS distinct_applications,
        MIN(transaction_date) AS first_transaction_date,
        MAX(transaction_date) AS latest_transaction_date
    FROM base
    GROUP BY
        application_status_norm,
        case_status_norm,
        category_norm,
        permit_type_norm
)

SELECT
    application_status_norm,
    case_status_norm,
    category_norm,
    permit_type_norm,
    row_count,
    distinct_applications,
    first_transaction_date,
    latest_transaction_date
FROM status_profile
ORDER BY
    distinct_applications DESC,
    row_count DESC;
