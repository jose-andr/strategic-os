-- 12_support_yoy_vwsupport_draft.sql
-- Purpose:
-- Calculate draft YoY support demand using vwsupport as the preferred support source.
--
-- Current EOFY celebration analysis decision:
-- Support numerator should use vwsupport, not vwsupport_enriched.
--
-- Working definition:
-- Self-Service Support =
--     distinct support cases from vwsupport
--     where is_after_service_enablement = true
--
-- This is used as the numerator for:
-- Self-Service Support Rate =
--     Self-Service Support / Self-Service Activity * 100

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

support_records AS (
    SELECT
        case_id,
        case_number,
        date_time_opened,
        channel,
        service_group,
        ask_service_name,
        portal_service_name,
        portal_enable_date,
        is_after_service_enablement,

        CASE
            WHEN date_time_opened >= TIMESTAMP('2024-07-01')
                AND date_time_opened < TIMESTAMP('2025-07-01')
                THEN 'Previous FY'

            WHEN date_time_opened >= TIMESTAMP('2025-07-01')
                AND date_time_opened < TIMESTAMP('2026-07-01')
                THEN 'Current FY'

            ELSE 'Outside comparison window'
        END AS comparison_period

    FROM support_base
    WHERE is_after_service_enablement = true
      AND date_time_opened IS NOT NULL
),

support_yoy AS (
    SELECT
        comparison_period,
        COUNT(DISTINCT case_id) AS self_service_support_cases,
        COUNT(*) AS support_rows
    FROM support_records
    WHERE comparison_period IN ('Previous FY', 'Current FY')
    GROUP BY comparison_period
)

SELECT
    comparison_period,
    self_service_support_cases,
    support_rows
FROM support_yoy
ORDER BY
    CASE
        WHEN comparison_period = 'Previous FY' THEN 1
        WHEN comparison_period = 'Current FY' THEN 2
        ELSE 3
    END;
