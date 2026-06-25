-- 08_support_logic_validation.sql
-- Purpose:
-- Validate the Databricks support source that can reproduce the Power BI
-- Self-Service Support numerator used in Self-Service Support Rate.
--
-- Power BI measure confirmed:
-- Self-Service Support Rate =
--     DIVIDE ( [Self-Service Support], [Self-Service Activity] ) * 100
--
-- Current decision:
-- Use vwsupport as the preferred source for the support numerator.
-- vwsupport_enriched has been reviewed and excluded from EOFY headline KPI production.
--
-- Working support numerator direction:
-- Self-Service Support =
--     distinct support cases from vwsupport
--     where support is related to portal-enabled services
--     and support occurred after service enablement

WITH support_base AS (
    SELECT
        case_id,
        case_number,
        date_time_opened,
        date_time_closed,
        channel,
        account_id,
        service_group,
        ask_service_name,
        portal_service_name,
        portal_enable_date,
        is_after_service_enablement
    FROM datahub_datamart.customer_account_management.vwsupport
    WHERE case_id IS NOT NULL
),

support_profile AS (
    SELECT
        channel,
        service_group,
        ask_service_name,
        portal_service_name,
        portal_enable_date,
        is_after_service_enablement,
        COUNT(*) AS row_count,
        COUNT(DISTINCT case_id) AS distinct_cases,
        MIN(date_time_opened) AS first_opened_date,
        MAX(date_time_opened) AS latest_opened_date
    FROM support_base
    GROUP BY
        channel,
        service_group,
        ask_service_name,
        portal_service_name,
        portal_enable_date,
        is_after_service_enablement
)

SELECT
    channel,
    service_group,
    ask_service_name,
    portal_service_name,
    portal_enable_date,
    is_after_service_enablement,
    row_count,
    distinct_cases,
    first_opened_date,
    latest_opened_date
FROM support_profile
ORDER BY
    distinct_cases DESC,
    row_count DESC;
