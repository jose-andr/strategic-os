-- 09_csat_source_validation.sql
-- Purpose:
-- Validate the Databricks sources for CSAT survey logic.
--
-- Current finding:
-- CSAT survey data comes from the customer_intelligence schema, not customer_account_management.
--
-- Power BI source lineage includes:
-- - datahub_datamart.customer_intelligence.vwcase
-- - datahub_datamart.customer_intelligence.vwsurvey_feedback
--
-- Do not use vwsupport_enriched for CSAT source validation.

-- Inspect customer intelligence case fields.
SELECT
    *
FROM datahub_datamart.customer_intelligence.vwcase
LIMIT 100;

-- Inspect survey feedback fields.
SELECT
    *
FROM datahub_datamart.customer_intelligence.vwsurvey_feedback
LIMIT 100;
