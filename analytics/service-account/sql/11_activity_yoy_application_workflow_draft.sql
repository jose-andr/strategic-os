-- 11_activity_yoy_application_workflow_draft.sql
-- Purpose:
-- Calculate YoY portal Activity using the application workflow definition.
--
-- Current EOFY celebration analysis decision:
-- Activity = application workflow activity
-- not permit lifecycle activity.
--
-- For the current celebration analysis, include:
-- - draft
-- - submitted
-- - further information requested
-- - in progress
-- - pending payment
--
-- For the current celebration analysis, exclude:
-- - withdrawn
-- - declined
-- - issued
-- - extended
-- - renewed
-- - lapsed
--
-- Status:
-- Accepted for the EOFY celebration analysis.
-- Still requires later validation before becoming a reusable reporting standard.
--
-- Longer-term validation questions are tracked in:
-- analytics/service-account/13-business-validation-backlog.md

WITH base AS (
    SELECT
        application_id,
        case_id,
        period_start,
        period_end,
        TRIM(LOWER(application_status)) AS application_status_norm,
        TRIM(LOWER(case_status)) AS case_status_norm,
        TRIM(LOWER(category)) AS category_norm,
        TRIM(LOWER(permit_type)) AS permit_type_norm
    FROM datahub_datamart.customer_account_management.vwpermit
    WHERE application_id IS NOT NULL
),

status_mapped AS (
    SELECT
        application_id,
        case_id,
        period_start,
        period_end,
        application_status_norm,
        case_status_norm,
        category_norm,
        permit_type_norm,

        CASE
            WHEN application_status_norm IN (
                'draft',
                'submitted',
                'further information requested',
                'in progress',
                'pending payment',
                'withdrawn',
                'declined'
            )
                THEN 'Application workflow'

            WHEN application_status_norm IN (
                'issued',
                'extended',
                'renewed',
                'lapsed'
            )
                THEN 'Permit workflow'

            ELSE 'Unmapped'
        END AS workflow_type,

        CASE
            WHEN application_status_norm IN (
                'draft',
                'submitted',
                'further information requested',
                'in progress',
                'pending payment'
            )
                THEN 1
            ELSE 0
        END AS include_in_activity_kpi_draft,

        CASE
            WHEN application_status_norm IN (
                'pending payment',
                'withdrawn',
                'declined'
            )
                THEN 1
            ELSE 0
        END AS requires_business_confirmation

    FROM base
),

activity_records AS (
    SELECT
        application_id,
        case_id,
        period_start,
        application_status_norm,
        case_status_norm,
        category_norm,
        permit_type_norm,
        workflow_type,
        include_in_activity_kpi_draft,
        requires_business_confirmation,

        CASE
            WHEN period_start >= TIMESTAMP('2024-07-01')
                AND period_start < TIMESTAMP('2025-07-01')
                THEN 'Previous FY'

            WHEN period_start >= TIMESTAMP('2025-07-01')
                AND period_start < TIMESTAMP('2026-07-01')
                THEN 'Current FY'

            ELSE 'Outside comparison window'
        END AS comparison_period

    FROM status_mapped
    WHERE include_in_activity_kpi_draft = 1
      AND period_start IS NOT NULL
),

activity_yoy AS (
    SELECT
        comparison_period,
        COUNT(DISTINCT application_id) AS activity_applications,
        COUNT(*) AS activity_rows,
        COUNT(DISTINCT CASE WHEN requires_business_confirmation = 1 THEN application_id END) AS applications_requiring_confirmation
    FROM activity_records
    WHERE comparison_period IN ('Previous FY', 'Current FY')
    GROUP BY comparison_period
)

SELECT
    comparison_period,
    activity_applications,
    activity_rows,
    applications_requiring_confirmation
FROM activity_yoy
ORDER BY
    CASE
        WHEN comparison_period = 'Previous FY' THEN 1
        WHEN comparison_period = 'Current FY' THEN 2
        ELSE 3
    END;
