-- 09_csat_source_validation.sql
-- Purpose:
-- Validate which Databricks table and fields can reproduce the Power BI CSAT measures.
--
-- Power BI CSAT measures use:
-- - vwcase_survey[Survey_Completion_Date]
-- - vwcase_survey[Satisfaction_Score_5]
-- - vwcase_survey[Service_Name]
-- - vwcase_survey[Service Name Norm]
--
-- Databricks source still needs to be confirmed.

-- Start with vwcase because survey fields may be embedded there.

SELECT
    *
FROM datahub_datamart.customer_account_management.vwcase
LIMIT 100;

-- Then inspect whether vwsupport_enriched includes CSAT or survey fields.

SELECT
    *
FROM datahub_datamart.customer_account_management.vwsupport_enriched
LIMIT 100;
