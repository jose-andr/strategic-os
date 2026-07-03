-- Analysis: Service Account EOFY celebration analysis
-- File: 00_schema_validation.sql
-- Purpose: Inspect available fields and confirm table structure in the curated customer_account_management schema.
-- Business question: Can the curated schema support the one-slide EOFY celebration analysis?
-- Tables used:
--   datahub_datamart.customer_account_management.vwaccount
--   datahub_datamart.customer_account_management.vwcase
--   datahub_datamart.customer_account_management.vwpermit
--   datahub_datamart.customer_account_management.vwservice_enablement
--   datahub_datamart.customer_account_management.vwsupport
--   datahub_datamart.customer_account_management.vwsupport_enriched
-- Grain: To validate.
-- Caveats: This file inspects schema only. It does not calculate metrics.
-- Last updated: 2026-06-23

DESCRIBE TABLE datahub_datamart.customer_account_management.vwaccount;

DESCRIBE TABLE datahub_datamart.customer_account_management.vwcase;

DESCRIBE TABLE datahub_datamart.customer_account_management.vwpermit;

DESCRIBE TABLE datahub_datamart.customer_account_management.vwservice_enablement;

DESCRIBE TABLE datahub_datamart.customer_account_management.vwsupport;

DESCRIBE TABLE datahub_datamart.customer_account_management.vwsupport_enriched;
