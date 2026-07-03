-- Activity CSAT uses the portal-enabled service cohort.
--
-- Use:
--   datahub_datamart.customer_intelligence.vwcase
-- joined or matched to:
--   datahub_datamart.customer_account_management.vwservice_enablement
--
-- Match Service_Name to service_name using normalised text unless a stronger
-- governed key is available.
--
-- Main comparison:
--   FY2024/25 to FY2025/26
--
-- Current validated Activity CSAT result:
--   FY2024/25: 889 valid responses, 680 positive, 76.5%
--   FY2025/26: 1,721 valid responses, 1,387 positive, 80.6%
--
-- Do not use FY2023/24 as the main baseline because it has only 18 valid
-- responses.
--
-- Do not claim portal enablement caused the CSAT improvement unless causality
-- is supported.
--
-- This file is for Activity CSAT only.
-- Do not use it to calculate Support CSAT.
-- Support CSAT requires the manual mapping documented in:
-- analytics/service-account/20-support-csat-service-mapping.md

WITH params AS (
  SELECT
    DATE('2023-07-01') AS previous_fy_start,
    DATE('2024-07-01') AS current_fy_start,
    DATE('2025-07-01') AS current_fy_end
),

portal_service_cohort AS (
  SELECT DISTINCT
    LOWER(TRIM(service_name)) AS service_name_norm,
    service_group,
    service_name,
    first_portal_enable_date
  FROM datahub_datamart.customer_account_management.vwservice_enablement
  WHERE service_name IS NOT NULL
),

base AS (
  SELECT
    CASE
      WHEN c.Survey_Completion_Date >= (SELECT previous_fy_start FROM params)
       AND c.Survey_Completion_Date <  (SELECT current_fy_start FROM params)
        THEN 'Previous FY'
      WHEN c.Survey_Completion_Date >= (SELECT current_fy_start FROM params)
       AND c.Survey_Completion_Date <  (SELECT current_fy_end FROM params)
        THEN 'Current FY'
    END AS comparison_period,

    c.Record_Type,
    c.Service_Group,
    c.Service_Name,
    c.Channel,
    c.Satisfaction_Score_5,

    s.service_group AS portal_service_group,
    s.service_name AS portal_service_name,
    s.first_portal_enable_date,

    CASE
      WHEN c.Survey_Completion_Date >= s.first_portal_enable_date
        THEN 'Post enablement'
      WHEN c.Survey_Completion_Date < s.first_portal_enable_date
        THEN 'Pre enablement'
      ELSE 'Enablement date unknown'
    END AS enablement_timing

  FROM datahub_datamart.customer_intelligence.vwcase c
  INNER JOIN portal_service_cohort s
    ON LOWER(TRIM(c.Service_Name)) = s.service_name_norm
  WHERE c.Survey_Completion_Date >= (SELECT previous_fy_start FROM params)
    AND c.Survey_Completion_Date <  (SELECT current_fy_end FROM params)
    AND c.Satisfaction_Score_5 IS NOT NULL
)

SELECT
  comparison_period,
  Record_Type,
  enablement_timing,
  COUNT(*) AS valid_csat_responses,
  SUM(CASE WHEN Satisfaction_Score_5 IN (4, 5) THEN 1 ELSE 0 END) AS positive_csat_responses,
  ROUND(
    100.0 * SUM(CASE WHEN Satisfaction_Score_5 IN (4, 5) THEN 1 ELSE 0 END) / COUNT(*),
    1
  ) AS csat_percent
FROM base
WHERE comparison_period IS NOT NULL
GROUP BY
  comparison_period,
  Record_Type,
  enablement_timing
ORDER BY
  comparison_period,
  Record_Type,
  enablement_timing;
