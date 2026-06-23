-- Analysis: Service Account EOFY celebration analysis
-- File: 01_customer_growth_yoy.sql
-- Purpose: Calculate Service Account customer/account growth year on year.
-- Business question: Did customer adoption of Service Account grow year on year?
-- Tables used:
--   datahub_datamart.customer_account_management.vwaccount
-- Grain: To validate.
-- Metric definition:
--   Count of distinct customer accounts created during the financial year.
-- Caveats:
--   Field names are placeholders until validated against vwaccount.
--   Service Account / portal-enabled inclusion logic must be confirmed.
-- Last updated: 2026-06-23

WITH customers_by_fy AS (
  SELECT
    CASE
      WHEN month(account_created_date) >= 7 THEN year(account_created_date) + 1
      ELSE year(account_created_date)
    END AS financial_year,

    COUNT(DISTINCT account_id) AS new_service_accounts

  FROM datahub_datamart.customer_account_management.vwaccount

  WHERE account_created_date IS NOT NULL

  GROUP BY 1
),

yoy AS (
  SELECT
    current.financial_year,
    current.new_service_accounts AS current_fy_new_accounts,
    previous.new_service_accounts AS previous_fy_new_accounts,
    current.new_service_accounts - previous.new_service_accounts AS yoy_change,
    ROUND(
      100.0 * (current.new_service_accounts - previous.new_service_accounts)
      / NULLIF(previous.new_service_accounts, 0),
      1
    ) AS yoy_change_pct

  FROM customers_by_fy current

  LEFT JOIN customers_by_fy previous
    ON current.financial_year = previous.financial_year + 1
)

SELECT *
FROM yoy
ORDER BY financial_year DESC;
