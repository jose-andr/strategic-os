-- Analysis: Service Account EOFY celebration analysis
-- File: 04_csat_yoy.sql
-- Purpose: Calculate Activity CSAT and Support CSAT year on year.
-- Business question: Did satisfaction with Service Account activity and support improve year on year?
-- Tables used:
--   datahub_datamart.customer_account_management.vwsupport_enriched
--   Activity CSAT source table to confirm
-- Grain: To validate.
-- Metric definition:
--   Percentage of positive CSAT responses during the financial year.
-- Caveats:
--   Field names are placeholders until validated.
--   Need to confirm where Activity CSAT is stored.
--   Need to confirm where Support CSAT is stored.
--   Need to confirm CSAT score scale and positive-response logic.
-- Last updated: 2026-06-23

WITH csat_by_fy AS (
  SELECT
    CASE
      WHEN month(csat_response_date) >= 7 THEN year(csat_response_date) + 1
      ELSE year(csat_response_date)
    END AS financial_year,

    csat_context,

    COUNT(DISTINCT csat_response_id) AS total_responses,

    COUNT(DISTINCT CASE
      WHEN csat_positive_flag = 1 THEN csat_response_id
    END) AS positive_responses,

    ROUND(
      100.0 * COUNT(DISTINCT CASE
        WHEN csat_positive_flag = 1 THEN csat_response_id
      END)
      / NULLIF(COUNT(DISTINCT csat_response_id), 0),
      1
    ) AS csat_pct

  FROM datahub_datamart.customer_account_management.vwsupport_enriched

  WHERE csat_response_date IS NOT NULL
    AND csat_context IN ('Activity', 'Support')

  GROUP BY 1, 2
),

yoy AS (
  SELECT
    current.financial_year,
    current.csat_context,

    current.csat_pct AS current_fy_csat_pct,
    previous.csat_pct AS previous_fy_csat_pct,

    current.csat_pct - previous.csat_pct AS yoy_change_points,

    current.total_responses AS current_fy_responses,
    previous.total_responses AS previous_fy_responses

  FROM csat_by_fy current

  LEFT JOIN csat_by_fy previous
    ON current.financial_year = previous.financial_year + 1
    AND current.csat_context = previous.csat_context
)

SELECT *
FROM yoy
ORDER BY financial_year DESC, csat_context;
