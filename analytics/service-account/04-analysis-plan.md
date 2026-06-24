# EOFY Celebration Analysis Plan

This file documents the step-by-step plan for producing a one-slide EOFY celebration analysis for Service Account.

## Analysis question

How did Service Account perform this financial year compared with the previous financial year?

## Scope

Use only the curated Databricks schema:

`datahub_datamart.customer_account_management`

## Source of truth approach

For this first pass, existing Power BI measures are treated as the first source of truth for business logic.

Databricks SQL will be used to translate and test that logic against the curated schema.

This means the workflow is:

1. Identify the relevant Power BI measure.
2. Understand the DAX logic.
3. Map the DAX fields to Databricks schema fields.
4. Translate the logic into reusable SQL.
5. Validate results against the Power BI dashboard.
6. Document caveats and definition questions.
## Target output

A one-slide EOFY celebration summary with five headline tiles:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Better activity CSAT
5. Better support CSAT

## Analysis sequence

1. Validate the available tables and fields.
2. Confirm table grain for each required metric.
3. Confirm the correct date field for financial year reporting.
4. Confirm the Service Account inclusion logic.
5. Calculate customer growth year on year.
6. Calculate self-service activity growth year on year.
7. Calculate support demand year on year.
8. Calculate support per 100 transactions.
9. Calculate activity CSAT year on year.
10. Calculate support CSAT year on year.
11. Identify the main activity categories contributing to change.
12. Produce a slide-ready celebration summary.
13. Capture caveats and lessons learned.

## Out of scope for first pass

- Predictive analytics
- Root-cause modelling
- Customer-level extracts
- Personal data analysis
- Full channel strategy analysis
- Automated workflow orchestration
- Agent memory integration

## Success criteria

This analysis is successful if it produces:

- clear metric definitions
- valid financial year comparison
- reusable SQL logic
- visible caveats
- an executive-ready celebration narrative
- a documented pattern that can be reused for future analytics work
