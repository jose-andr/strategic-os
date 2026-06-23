-- Analysis: Service Account EOFY celebration analysis
-- File: 05_category_drivers_yoy.sql
-- Purpose: Identify permit or service categories contributing most to year-on-year activity change.
-- Business question: Which permit or service categories drove the change in Service Account self-service activity?
-- Tables used:
--   datahub_datamart.customer_account_management.vwservice_enablement
--   datahub_datamart.customer_account_management.vwpermit
-- Grain: To validate.
-- Metric definition:
--   Count of completed customer self-service transactions grouped by category and financial year.
-- Caveats:
--   Field names are placeholders until validated.
--   Need to confirm preferred category field.
--   Need to confirm completion/status logic.
--   Need to confirm whether categories should come from permit, service enablement, or both.
-- Last updated: 2026-06-23

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
