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
## Revised CSAT analysis path

The CSAT path has been revised based on validation findings.

### Key decision

Use different CSAT approaches for different questions.

| Question | Method | Status |
|---|---|---|
| How satisfied were customers with portal-enabled application activity? | Use direct CSAT from `customer_intelligence.vwcase` for portal-relevant `Apply` services. | Validated with caveat. |
| Did portal enablement improve CSAT pre/post? | Use pre/post enablement diagnostics where pre-enable data exists. | Not viable for current pilot due to missing pre-enable CSAT base. |
| How did Residential Parking Permit support experience change after migration? | Use RPP Support CSAT proxy based on selected enquiry/support service names. | Documented as proxy. |
| Is support demand reducing relative to activity? | Use support per 100 activities from `vwsupport` and `vwpermit`. | Draft accepted. |

### Current CSAT interpretation

Direct Activity CSAT should be treated as a current-state strength metric:

> Strong satisfaction on portal-enabled activity: 76.5% CSAT from 888 current-year responses.

Do not frame Activity CSAT as a YoY improvement unless a stable baseline is identified.

### Support CSAT proxy interpretation

The RPP Support CSAT proxy indicates that early post-portal CSAT decline was concentrated in Residential Parking support, particularly expert or escalated enquiries.

Current ELT period results suggest service stabilisation, especially for Residential parking enquiry - expert, which recovered from 69% in the post-portal impact period to 78%.

### Remaining validation tasks

- Confirm final RPP proxy period dates.
- Confirm source of the RPP proxy service mapping.
- Convert RPP proxy logic from Power BI to Databricks SQL if required.
- Decide whether the celebration slide uses:
  - Activity CSAT only
  - RPP Support CSAT proxy
  - both, with caveats
