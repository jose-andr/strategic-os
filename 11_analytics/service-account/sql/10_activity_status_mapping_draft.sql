-- 10_activity_status_mapping_draft.sql
-- Purpose:
-- Draft a Databricks SQL structure for recreating the Power BI vwpermit_statused logic.
--
-- Current working definition:
-- Activity = application workflow activity
-- not permit lifecycle activity.
--
-- This draft should be validated against the Power BI Status Map or business owner decision
-- before being used in final EOFY outputs.

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
            WHEN application_status_norm = 'draft'
                THEN 'Draft'

            WHEN application_status_norm = 'submitted'
                THEN 'Submitted'

            WHEN application_status_norm = 'further information requested'
                THEN 'Further information requested'

            WHEN application_status_norm = 'in progress'
                THEN 'In Progress'

            WHEN application_status_norm = 'pending payment'
                THEN 'Pending Payment'

            WHEN application_status_norm IN ('withdrawn', 'declined')
                THEN 'Application outcome'

            WHEN application_status_norm IN ('issued', 'extended', 'renewed')
                THEN 'Active permit lifecycle'

            WHEN application_status_norm = 'lapsed'
                THEN 'Inactive permit lifecycle'

            ELSE 'Unmapped'
        END AS status_group,

        CASE
            WHEN application_status_norm = 'draft'
                THEN 1
            ELSE 0
        END AS is_draft_application,

        CASE
            WHEN application_status_norm = 'submitted'
                THEN 1
            ELSE 0
        END AS is_submitted_application,

        CASE
            WHEN application_status_norm IN ('withdrawn', 'declined')
                THEN 1
            ELSE 0
        END AS is_application_outcome,

        CASE
            WHEN application_status_norm IN ('issued', 'extended', 'renewed')
                THEN 1
            ELSE 0
        END AS is_active_permit,

        CASE
            WHEN application_status_norm = 'lapsed'
                THEN 1
            ELSE 0
        END AS is_inactive_permit,

        CASE
            WHEN application_status_norm IN (
                'draft',
                'submitted',
                'further information requested',
                'in progress'
            )
                THEN 1

            WHEN application_status_norm = 'pending payment'
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
)

SELECT
    workflow_type,
    status_group,
    application_status_norm,
    case_status_norm,
    category_norm,
    COUNT(*) AS row_count,
    COUNT(DISTINCT application_id) AS distinct_applications,
    SUM(include_in_activity_kpi_draft) AS draft_activity_rows,
    COUNT(DISTINCT CASE WHEN include_in_activity_kpi_draft = 1 THEN application_id END) AS draft_activity_applications,
    MIN(period_start) AS first_period_start,
    MAX(period_start) AS latest_period_start
FROM status_mapped
GROUP BY
    workflow_type,
    status_group,
    application_status_norm,
    case_status_norm,
    category_norm
ORDER BY
    workflow_type,
    draft_activity_applications DESC,
    distinct_applications DESC;
