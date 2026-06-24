-- 08_support_logic_validation.sql
-- Purpose:
-- Validate which Databricks support table and fields can reproduce the Power BI
-- Self-Service Support numerator used in Self-Service Support Rate.
--
-- Power BI measure confirmed:
-- Self-Service Support Rate =
--     DIVIDE ( [Self-Service Support], [Self-Service Activity] ) * 100
--
-- Remaining question:
-- What Databricks logic reproduces [Self-Service Support]?

WITH support_base AS (
    SELECT
        *
    FROM datahub_datamart.customer_account_management.vwsupport
),

support_enriched_base AS (
    SELECT
        *
    FROM datahub_datamart.customer_account_management.vwsupport_enriched
)

-- Profile support records by common support dimensions.
-- Adjust field names if Databricks shows slightly different column names.

SELECT
    'vwsupport_enriched' AS source_table,
    channel,
    service_name,
    service_group,
    COUNT(*) AS row_count,
    COUNT(DISTINCT case_id) AS distinct_cases,
    MIN(created_date) AS first_created_date,
    MAX(created_date) AS latest_created_date
FROM support_enriched_base
GROUP BY
    channel,
    service_name,
    service_group

UNION ALL

SELECT
    'vwsupport' AS source_table,
    channel,
    service_name,
    service_group,
    COUNT(*) AS row_count,
    COUNT(DISTINCT case_id) AS distinct_cases,
    MIN(created_date) AS first_created_date,
    MAX(created_date) AS latest_created_date
FROM support_base
GROUP BY
    channel,
    service_name,
    service_group

ORDER BY
    distinct_cases DESC,
    row_count DESC;
