-- RPP Support CSAT Proxy
--
-- Purpose:
-- Estimate support CSAT for Residential Parking Permit support pathways
-- using CRM enquiry/support services as a proxy.
--
-- This is not a direct portal transaction CSAT measure.
-- It supports pre/post impact analysis and current-period stabilisation analysis.
--
-- Power BI reference:
-- RPP Proxy Support Cases =
-- DISTINCTCOUNT(Support_logic[case_number])
-- filtered by:
-- - RPP analysis period
-- - selected ask service names
--
-- Key dependency:
-- A maintained mapping of RPP proxy support services is required.

WITH rpp_proxy_services AS (
  SELECT 'residential parking enquiry - expert' AS ask_service_name_norm
  UNION ALL
  SELECT 'residential parking enquiry - resolved'
  UNION ALL
  SELECT 'disabled or medical parking enquiry - expert'
  UNION ALL
  SELECT 'disabled or medical parking enquiry - resolved'
),

analysis_periods AS (
  -- Replace these dates with the confirmed RPP analysis windows.
  SELECT
    'Pre-portal baseline' AS period,
    DATE('YYYY-MM-DD') AS start_date,
    DATE('YYYY-MM-DD') AS end_date

  UNION ALL

  SELECT
    'Post-portal impact' AS period,
    DATE('YYYY-MM-DD') AS start_date,
    DATE('YYYY-MM-DD') AS end_date

  UNION ALL

  SELECT
    'Current ELT period' AS period,
    DATE('YYYY-MM-DD') AS start_date,
    DATE('YYYY-MM-DD') AS end_date
),

support_cases AS (
  SELECT
    p.period,
    LOWER(TRIM(s.ask_service_name)) AS ask_service_name_norm,
    s.case_number
  FROM datahub_datamart.customer_account_management.vwsupport s
  INNER JOIN analysis_periods p
    ON s.date_time_opened >= p.start_date
   AND s.date_time_opened <  p.end_date
  INNER JOIN rpp_proxy_services r
    ON LOWER(TRIM(s.ask_service_name)) = r.ask_service_name_norm
),

support_csat AS (
  SELECT
    p.period,
    LOWER(TRIM(c.Service_Name)) AS ask_service_name_norm,
    c.Case_Number,
    c.Satisfaction_Score_5
  FROM datahub_datamart.customer_intelligence.vwcase c
  INNER JOIN analysis_periods p
    ON c.Survey_Completion_Date >= p.start_date
   AND c.Survey_Completion_Date <  p.end_date
  INNER JOIN rpp_proxy_services r
    ON LOWER(TRIM(c.Service_Name)) = r.ask_service_name_norm
  WHERE c.Satisfaction_Score_5 IS NOT NULL
)

SELECT
  COALESCE(sc.ask_service_name_norm, cs.ask_service_name_norm) AS ask_service_name_norm,
  COALESCE(sc.period, cs.period) AS period,

  COUNT(DISTINCT sc.case_number) AS rpp_proxy_support_cases,

  COUNT(DISTINCT cs.Case_Number) AS rpp_proxy_support_survey_responses,

  COUNT(DISTINCT CASE
    WHEN cs.Satisfaction_Score_5 IN (1, 2, 3)
      THEN cs.Case_Number
  END) AS rpp_proxy_support_low_csat_responses,

  ROUND(
    100.0 * COUNT(DISTINCT CASE
      WHEN cs.Satisfaction_Score_5 IN (4, 5)
        THEN cs.Case_Number
    END)
    / NULLIF(COUNT(DISTINCT cs.Case_Number), 0),
    1
  ) AS rpp_proxy_support_csat_percent

FROM support_cases sc
FULL OUTER JOIN support_csat cs
  ON sc.ask_service_name_norm = cs.ask_service_name_norm
 AND sc.period = cs.period

GROUP BY
  COALESCE(sc.ask_service_name_norm, cs.ask_service_name_norm),
  COALESCE(sc.period, cs.period)

ORDER BY
  ask_service_name_norm,
  period;
