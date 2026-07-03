-- Analysis: Service Account EOFY celebration analysis
-- File: 06_eofy_summary_output.sql
-- Purpose: Combine headline EOFY metrics into a single slide-ready summary output.
-- Business question: What are the headline metrics for the Service Account EOFY celebration slide?
--
-- Final summary output should preserve the slide-safe interpretation.
--
-- Current validated headline results:
-- - Customers: 9,838 to 15,570, +58.3%
-- - Activity: 2,209 to 3,751, +69.8%
-- - Support per 100 activities: 496.9 to 412.6, about -17.0%
-- - Activity CSAT: 76.5% to 80.6%
-- - Activity CSAT valid responses: 889 to 1,721
--
-- Support CSAT should only be included if the manual Support CSAT mapping has
-- been applied and documented.
--
-- Do not claim:
-- - Support CSAT improved overall unless the manual mapping has been applied
-- - portal enablement caused CSAT improvement
-- - pre/post enablement CSAT improved across the full portal service cohort
-- - RPP Support CSAT proxy represents full Service Account Support CSAT
--
-- Support demand should be shown as a rate relative to Activity, not as raw
-- support volume.
--
-- Tables used:
--   datahub_datamart.customer_account_management.vwaccount
--   datahub_datamart.customer_account_management.vwpermit
--   datahub_datamart.customer_account_management.vwsupport
--   datahub_datamart.customer_account_management.vwservice_enablement
--   datahub_datamart.customer_intelligence.vwcase
--
-- Do not use:
--   datahub_datamart.customer_account_management.vwsupport_enriched
--
-- Grain:
--   Aggregated by financial year and metric.
--
-- Metric definitions:
--   Customers:
--     distinct account_id where customer_portal = TRUE
--     and first_account_portal_on_date is within the reporting window.
--
--   Activity:
--     distinct application_id where application_status is one of:
--     - Draft
--     - Submitted
--     - Further information requested
--     - In Progress
--     - Pending Payment.
--
--   Support per 100 activities:
--     distinct vwsupport.case_id where is_after_service_enablement = TRUE
--     divided by Activity applications
--     multiplied by 100.
--
--   Activity CSAT:
--     positive Activity CSAT responses / total valid Activity CSAT responses,
--     where Satisfaction_Score_5 is 4 or 5.
--
--   Support CSAT:
--     mapped Support CSAT only, using the manual mapping documented in:
--     analytics/service-account/20-support-csat-service-mapping.md
--
-- Caveats:
--   This output is intended as a slide summary template.
--   Support CSAT is pilot-only unless a governed Databricks mapping asset exists.
--   Do not store raw organisational data, customer-level records, survey comments,
--   case URLs, or personal information in this repository.
--
-- Last updated: 2026-06-29

WITH customers_by_fy AS (
  SELECT
    CASE
      WHEN month(account_created_date) >= 7 THEN year(account_created_date) + 1
      ELSE year(account_created_date)
    END AS financial_year,
    COUNT(DISTINCT account_id) AS metric_value
  FROM datahub_datamart.customer_account_management.vwaccount
  WHERE account_created_date IS NOT NULL
  GROUP BY 1
),

activity_by_fy AS (
  SELECT
    CASE
      WHEN month(activity_completed_date) >= 7 THEN year(activity_completed_date) + 1
      ELSE year(activity_completed_date)
    END AS financial_year,
    COUNT(DISTINCT activity_id) AS metric_value
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

support_per_100_by_fy AS (
  SELECT
    activity_by_fy.financial_year,
    ROUND(
      100.0 * support_by_fy.support_cases
      / NULLIF(activity_by_fy.metric_value, 0),
      1
    ) AS metric_value
  FROM activity_by_fy
  LEFT JOIN support_by_fy
    ON activity_by_fy.financial_year = support_by_fy.financial_year
),

csat_by_fy AS (
  SELECT
    CASE
      WHEN month(csat_response_date) >= 7 THEN year(csat_response_date) + 1
      ELSE year(csat_response_date)
    END AS financial_year,
    csat_context,
    ROUND(
      100.0 * COUNT(DISTINCT CASE
        WHEN csat_positive_flag = 1 THEN csat_response_id
      END)
      / NULLIF(COUNT(DISTINCT csat_response_id), 0),
      1
    ) AS metric_value
  FROM datahub_datamart.customer_account_management.vwsupport_enriched
  WHERE csat_response_date IS NOT NULL
    AND csat_context IN ('Activity', 'Support')
  GROUP BY 1, 2
),

headline_metrics AS (
  SELECT financial_year, 'New service accounts' AS metric_name, metric_value
  FROM customers_by_fy

  UNION ALL

  SELECT financial_year, 'Self-service transactions' AS metric_name, metric_value
  FROM activity_by_fy

  UNION ALL

  SELECT financial_year, 'Support cases per 100 transactions' AS metric_name, metric_value
  FROM support_per_100_by_fy

  UNION ALL

  SELECT financial_year, 'Activity CSAT' AS metric_name, metric_value
  FROM csat_by_fy
  WHERE csat_context = 'Activity'

  UNION ALL

  SELECT financial_year, 'Support CSAT' AS metric_name, metric_value
  FROM csat_by_fy
  WHERE csat_context = 'Support'
),

yoy AS (
  SELECT
    current.metric_name,
    current.financial_year,
    current.metric_value AS current_fy_value,
    previous.metric_value AS previous_fy_value,
    current.metric_value - previous.metric_value AS yoy_change,
    ROUND(
      100.0 * (current.metric_value - previous.metric_value)
      / NULLIF(previous.metric_value, 0),
      1
    ) AS yoy_change_pct
  FROM headline_metrics current
  LEFT JOIN headline_metrics previous
    ON current.metric_name = previous.metric_name
    AND current.financial_year = previous.financial_year + 1
)

SELECT *
FROM yoy
ORDER BY financial_year DESC, metric_name;
