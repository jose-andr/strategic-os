-- Analysis: Service Account EOFY celebration analysis
-- File: 03_support_yoy.sql
-- Purpose: Calculate support demand and support per 100 self-service transactions year on year.
-- Business question: Did support demand reduce relative to self-service activity?
-- Tables used:
--   datahub_datamart.customer_account_management.vwsupport_enriched
--   datahub_datamart.customer_account_management.vwservice_enablement
-- Grain: To validate.
-- Metric definition:
--   Support cases divided by self-service transactions, multiplied by 100.
-- Caveats:
--   Field names are placeholders until validated.
--   Need to confirm support case identifier and created date.
--   Need to confirm activity source of truth.
--   Need to confirm Service Account inclusion logic.
-- Last updated: 2026-06-23

WITH activity_by_fy AS (
  SELECT
    CASE
      WHEN month(activity_completed_date) >= 7 THEN year(activity_completed_date) + 1
      ELSE year(activity_completed_date)
    END AS financial_year,

    COUNT(DISTINCT activity_id) AS self_service_transactions

  FROM datahub_datamart.customer_account_management.vwservice_enablement

  WHERE activity_completed_date IS NOT NULL
    AND activity_status = 'Completed'

  GROUP BY 1
),

support_by_fy AS (
  SELECT
    CASE
      WHEN month(support_created_date) >= 7 THEN year(support_created_date) + 1
      ELSE year(support_created_date)
    END AS financial_year,

    COUNT(DISTINCT support_case_id) AS support_cases

  FROM datahub_datamart.customer_account_management.vwsupport_enriched

  WHERE support_created_date IS NOT NULL

  GROUP BY 1
),

support_rate AS (
  SELECT
    activity_by_fy.financial_year,
    activity_by_fy.self_service_transactions,
    support_by_fy.support_cases,

    ROUND(
      100.0 * support_by_fy.support_cases
      / NULLIF(activity_by_fy.self_service_transactions, 0),
      1
    ) AS support_cases_per_100_transactions

  FROM activity_by_fy

  LEFT JOIN support_by_fy
    ON activity_by_fy.financial_year = support_by_fy.financial_year
),

yoy AS (
  SELECT
    current.financial_year,

    current.self_service_transactions AS current_fy_transactions,
    previous.self_service_transactions AS previous_fy_transactions,

    current.support_cases AS current_fy_support_cases,
    previous.support_cases AS previous_fy_support_cases,

    current.support_cases_per_100_transactions AS current_fy_support_per_100,
    previous.support_cases_per_100_transactions AS previous_fy_support_per_100,

    current.support_cases_per_100_transactions
      - previous.support_cases_per_100_transactions AS yoy_change_per_100

  FROM support_rate current

  LEFT JOIN support_rate previous
    ON current.financial_year = previous.financial_year + 1
)

SELECT *
FROM yoy
ORDER BY financial_year DESC;
