-- Analysis: Service Account EOFY celebration analysis
-- File: 02_activity_yoy.sql
-- Purpose: Calculate Service Account self-service activity growth year on year.
-- Business question: Did customers complete more Service Account enabled transactions year on year?
-- Tables used:
--   datahub_datamart.customer_account_management.vwpermit
--   datahub_datamart.customer_account_management.vwservice_enablement
-- Grain: To validate.
-- Metric definition:
--   Count of completed customer self-service transactions during the financial year.
-- Caveats:
--   Field names are placeholders until validated.
--   Need to confirm whether vwpermit or vwservice_enablement is the preferred source of truth.
--   Need to confirm completion/status logic.
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

yoy AS (
  SELECT
    current.financial_year,
    current.self_service_transactions AS current_fy_transactions,
    previous.self_service_transactions AS previous_fy_transactions,
    current.self_service_transactions - previous.self_service_transactions AS yoy_change,
    ROUND(
      100.0 * (current.self_service_transactions - previous.self_service_transactions)
      / NULLIF(previous.self_service_transactions, 0),
      1
    ) AS yoy_change_pct

  FROM activity_by_fy current

  LEFT JOIN activity_by_fy previous
    ON current.financial_year = previous.financial_year + 1
)

SELECT *
FROM yoy
ORDER BY financial_year DESC;
