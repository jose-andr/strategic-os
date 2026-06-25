-- 13_support_rate_yoy_draft.sql
-- Purpose:
-- Calculate draft YoY support rate using:
-- - application workflow Activity as denominator
-- - vwsupport support cases after service enablement as numerator
--
-- Current EOFY celebration analysis decision:
-- Activity = application workflow activity
-- Support numerator = distinct support cases from vwsupport where is_after_service_enablement = true
--
-- Support Rate =
--     Self-Service Support / Self-Service Activity * 100

WITH activity_base AS (
    SELECT
        application_id,
        period_start,
        TRIM(LOWER(application_status)) AS application_status_norm
    FROM datahub_datamart.customer_account_management.vwpermit
    WHERE application_id IS NOT NULL
),

activity_records AS (
    SELECT
        application_id,
        CASE
            WHEN period_start >= TIMESTAMP('2024-07-01')
                AND period_start < TIMESTAMP('2025-07-01')
                THEN 'Previous FY'

            WHEN period_start >= TIMESTAMP('2025-07-01')
                AND period_start < TIMESTAMP('2026-07-01')
                THEN 'Current FY'

            ELSE 'Outside comparison window'
        END AS comparison_period
    FROM activity_base
    WHERE period_start IS NOT NULL
      AND application_status_norm IN (
          'draft',
          'submitted',
          'further information requested',
          'in progress',
          'pending payment'
      )
),

activity_yoy AS (
    SELECT
        comparison_period,
        COUNT(DISTINCT application_id) AS activity_applications
    FROM activity_records
    WHERE comparison_period IN ('Previous FY', 'Current FY')
    GROUP BY comparison_period
),

support_base AS (
    SELECT
        case_id,
        date_time_opened,
        is_after_service_enablement
    FROM datahub_datamart.customer_account_management.vwsupport
    WHERE case_id IS NOT NULL
),

support_records AS (
    SELECT
        case_id,
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
        COUNT(DISTINCT case_id) AS self_service_support_cases
    FROM support_records
    WHERE comparison_period IN ('Previous FY', 'Current FY')
    GROUP BY comparison_period
),

combined AS (
    SELECT
        a.comparison_period,
        a.activity_applications,
        s.self_service_support_cases,
        (s.self_service_support_cases / a.activity_applications) * 100 AS support_per_100_activities
    FROM activity_yoy a
    LEFT JOIN support_yoy s
        ON a.comparison_period = s.comparison_period
)

SELECT
    comparison_period,
    activity_applications,
    self_service_support_cases,
    ROUND(support_per_100_activities, 1) AS support_per_100_activities
FROM combined
ORDER BY
    CASE
        WHEN comparison_period = 'Previous FY' THEN 1
        WHEN comparison_period = 'Current FY' THEN 2
        ELSE 3
    END;
