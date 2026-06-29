-- Analysis: Service Account EOFY celebration analysis
-- File: 05_category_drivers_yoy.sql
-- Purpose: Identify permit or service categories contributing most to year-on-year Activity change.
-- Business question: Which permit or service categories drove the change in Service Account self-service Activity?
--
-- Driver analysis status:
-- Category / service driver analysis is diagnostic only.
--
-- Headline metrics are:
-- - Customers
-- - Activity
-- - Support per 100 activities
-- - Activity CSAT
-- - mapped Support CSAT only where manual mapping is applied
--
-- Do not use category or service driver outputs to redefine the headline KPIs.
-- Do not infer Support CSAT from service/category names.
-- Support CSAT requires the manual mapping documented in:
-- analytics/service-account/20-support-csat-service-mapping.md
-- Use driver outputs to explain what may be contributing to movement, not as
-- replacement metric definitions.
-- Tables used:
--   datahub_datamart.customer_account_management.vwservice_enablement
--   datahub_datamart.customer_account_management.vwpermit
-- Grain:
--   To validate.
-- Metric definition:
--   Diagnostic count of application workflow Activity grouped by category,
--   service, and financial year.
-- Activity definition for pilot:
--   Distinct application_id where application_status is one of:
--   - Draft
--   - Submitted
--   - Further information requested
--   - In Progress
--   - Pending Payment
-- Caveats:
--   Field names are placeholders until validated.
--   Need to confirm preferred category field.
--   Need to confirm whether categories should come from permit, service enablement, or both.
--   Driver outputs are diagnostic only and should not redefine headline KPIs.
-- Last updated: 2026-06-29

WITH activity_by_category_fy AS (
  SELECT
    CASE
      WHEN month(activity_completed_date) >= 7 THEN year(activity_completed_date) + 1
      ELSE year(activity_completed_date)
    END AS financial_year,

    activity_category,

    COUNT(DISTINCT activity_id) AS self_service_transactions

  FROM datahub_datamart.customer_account_management.vwservice_enablement

  WHERE activity_completed_date IS NOT NULL
    AND activity_status = 'Completed'

  GROUP BY 1, 2
),

yoy AS (
  SELECT
    current.financial_year,
    current.activity_category,

    current.self_service_transactions AS current_fy_transactions,
    previous.self_service_transactions AS previous_fy_transactions,

    current.self_service_transactions
      - previous.self_service_transactions AS yoy_change,

    ROUND(
      100.0 * (current.self_service_transactions - previous.self_service_transactions)
      / NULLIF(previous.self_service_transactions, 0),
      1
    ) AS yoy_change_pct

  FROM activity_by_category_fy current

  LEFT JOIN activity_by_category_fy previous
    ON current.financial_year = previous.financial_year + 1
    AND current.activity_category = previous.activity_category
)

SELECT *
FROM yoy
ORDER BY financial_year DESC, yoy_change DESC;
