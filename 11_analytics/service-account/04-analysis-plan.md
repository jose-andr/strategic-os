# EOFY Celebration Analysis Plan

This file documents the step-by-step plan for producing a one-slide EOFY celebration analysis for Service Account / Portal CX.

## Analysis question

How did Service Account / Portal CX perform this financial year compared with the previous financial year?

## Scope

Use the curated Databricks schemas:

`datahub_datamart.customer_account_management`

`datahub_datamart.customer_intelligence`

Use the canonical CRM descriptor source only for field meaning:

`datahub_refined.customer.vwcase`

## Source of truth approach

For this pilot, existing Power BI measures are treated as the first source of truth for business logic where available.

Databricks SQL is used to translate and test that logic against curated schema objects.

The workflow is:

1. Identify the relevant Power BI measure or dashboard logic.
2. Understand the DAX or semantic logic.
3. Map the logic to Databricks schema fields.
4. Translate the logic into reusable SQL.
5. Validate results against Power BI or Genie outputs.
6. Document caveats, assumptions, and definition questions.
7. Capture reusable prompts, SQL patterns, and lessons learned in the repository.

## Target output

A one-slide EOFY celebration summary with five headline story points:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Better Activity CSAT
5. Support CSAT only where manually mapped and documented

## Current celebration comparison

Use FY2024/25 as the previous period and FY2025/26 as the current period.

Use half-open date windows:

| Period | Start date | End date |
|---|---:|---:|
| Previous FY, FY2024/25 | 2024-07-01 | 2025-07-01 |
| Current FY, FY2025/26 | 2025-07-01 | 2026-07-01 |

## Current validated results

| Story point | Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement |
|---|---|---:|---:|---:|
| More customers | Service Account / portal sign-ups | 9,838 | 15,570 | +58.3% |
| More self-service activity | Application workflow Activity | 2,209 | 3,751 | +69.8% |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 412.6 | about -17.0% |
| Better Activity CSAT | Portal-enabled Activity CSAT | 76.5% | 80.6% | +4.1 percentage points |
| Better Activity CSAT response base | Valid responses | 889 | 1,721 | +832 responses |
| Support CSAT | Mapped support pathways | Manual mapping only | Manual mapping only | Do not claim unless mapping applied |

## Analysis sequence

1. Validate available tables and fields.
2. Confirm table grain for each required metric.
3. Confirm the correct date field for financial year reporting.
4. Confirm the Service Account / portal inclusion logic.
5. Calculate customer growth year on year.
6. Calculate application workflow Activity growth year on year.
7. Calculate support demand year on year.
8. Calculate support per 100 activities.
9. Calculate Activity CSAT year on year using the portal-enabled service cohort.
10. Apply Support CSAT only where the manual mapping has been used.
11. Identify the main activity, service, and support drivers contributing to change.
12. Produce a slide-ready celebration summary.
13. Capture caveats, assumptions, lessons learned, and productionisation backlog items.

## Out of scope for first pass

- Predictive analytics
- Root-cause modelling
- Customer-level extracts
- Personal data analysis
- Full channel strategy analysis
- Automated workflow orchestration
- Agent memory integration
- Productionising Databricks assets without data/platform owner involvement
- Treating Support CSAT as a repeatable Genie metric before a governed mapping asset exists

## Success criteria

This analysis is successful if it produces:

- clear metric definitions
- valid financial year comparison
- reusable SQL logic
- visible caveats
- an executive-ready celebration narrative
- documented support mapping limitations
- a documented pattern that can be reused for future analytics work

## Metric plan

### Customers plan

Use:

`datahub_datamart.customer_account_management.vwaccount`

Count distinct:

`account_id`

where:

`customer_portal = TRUE`

and:

`first_account_portal_on_date`

falls within the reporting window.

Current result:

| Period | Customers |
|---|---:|
| FY2024/25 | 9,838 |
| FY2025/26 | 15,570 |

Movement:

`+58.3%`

### Activity plan

Use:

`datahub_datamart.customer_account_management.vwpermit`

Count distinct:

`application_id`

where:

`period_start`

falls within the reporting window and `application_status` is one of:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

Exclude unless later confirmed:

- Withdrawn
- Declined
- Issued
- Extended
- Renewed
- Lapsed

Current result:

| Period | Activity applications |
|---|---:|
| FY2024/25 | 2,209 |
| FY2025/26 | 3,751 |

Movement:

`+69.8%`

### Support demand plan

Use:

`datahub_datamart.customer_account_management.vwsupport`

Count distinct:

`case_id`

where:

`is_after_service_enablement = TRUE`

and:

`date_time_opened`

falls within the reporting window.

Calculate support as a rate:

    Support per 100 activities =
      distinct support cases / distinct activity applications * 100

Current result:

| Period | Activity applications | Support cases | Support per 100 activities |
|---|---:|---:|---:|
| FY2024/25 | 2,209 | 10,976 | 496.9 |
| FY2025/26 | 3,751 | 15,475 | 412.6 |

Movement:

`about -17.0%`

Interpretation:

Raw support cases increased, but Activity grew faster, so support demand reduced relative to Activity.

### Activity CSAT plan

Use:

`datahub_datamart.customer_intelligence.vwcase`

Scope to portal-enabled services from:

`datahub_datamart.customer_account_management.vwservice_enablement`

Calculate:

    Activity CSAT =
      Satisfaction_Score_5 IN (4, 5)
      divided by
      Satisfaction_Score_5 IS NOT NULL

Use:

`Survey_Completion_Date`

as the reporting date.

Use service-name cohort matching for the main EOFY comparison.

Use enablement date only as a diagnostic dimension where needed.

Current result:

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2023/24 | 18 | 16 | 88.9% |
| FY2024/25 | 889 | 680 | 76.5% |
| FY2025/26 | 1,721 | 1,387 | 80.6% |

Interpretation:

Activity CSAT improved from 76.5% to 80.6% between FY2024/25 and FY2025/26.

Valid responses increased from 889 to 1,721.

Do not use FY2023/24 as the main baseline because it has only 18 valid responses.

Do not claim portal enablement caused the CSAT improvement unless causality is supported.

### Support CSAT plan

Support CSAT is not calculated from schema inference alone.

For the celebration pilot, use only the manually documented Support CSAT mapping:

`analytics/service-account/20-support-csat-service-mapping.md`

Support CSAT should be calculated from:

`datahub_datamart.customer_intelligence.vwcase`

where:

`Service_Name`

matches a mapped:

`support_service_name`

Do not use:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

If the manual mapping is not available, do not calculate Support CSAT. State that Support CSAT is not yet validated.

Future self-serve analysis requires a governed Databricks mapping asset before Genie can repeat this metric reliably.

Candidate asset names:

- `datahub_datamart.customer_account_management.support_csat_service_mapping`
- `datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

## Revised CSAT analysis path

The CSAT path has been revised based on validation findings.

Use different CSAT approaches for different questions.

| Question | Method | Status |
|---|---|---|
| How satisfied were customers with portal-enabled application activity? | Use direct CSAT from `customer_intelligence.vwcase` for the portal-enabled service cohort. | Validated for pilot. |
| Did portal enablement improve CSAT pre/post? | Use pre/post enablement diagnostics only where pre-enable data exists. | Not viable as headline due missing pre-enable CSAT base for many services. |
| How satisfied were customers with mapped portal-relevant support pathways? | Use manual Support CSAT mapping and `customer_intelligence.vwcase`. | Pilot only; not productionised. |
| Is support demand reducing relative to activity? | Use support per 100 activities from `vwsupport` and `vwpermit`. | Accepted for pilot. |
| How did Residential Parking Permit support experience change after migration? | Use RPP Support CSAT proxy as explanatory evidence only. | Proxy only, not full Support CSAT. |

## Support CSAT proxy interpretation

The RPP Support CSAT proxy indicates that early post-portal CSAT decline was concentrated in Residential Parking support, particularly expert or escalated enquiries.

Current ELT period results suggest service stabilisation, especially for Residential parking enquiry - expert, which recovered from 69% in the post-portal impact period to 78%.

Use this only as explanatory support-pathway evidence.

Do not present the RPP proxy as full Service Account Support CSAT.

## Slide-safe synthesis

The celebration slide can safely claim:

- Customer sign-ups increased by 58.3%.
- Application workflow Activity increased by 69.8%.
- Support demand per 100 activities reduced by about 17.0%.
- Portal-enabled Activity CSAT improved from 76.5% to 80.6%.
- Valid Activity CSAT responses increased from 889 to 1,721.
- Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

The slide should not claim:

- Support CSAT improved overall unless the manual mapping has been applied.
- Portal enablement caused CSAT improvement.
- Pre/post enablement CSAT improved across the full portal service cohort.
- RPP Support CSAT proxy represents full Service Account Support CSAT.

## Remaining validation tasks

- Confirm whether the Activity inclusion rules should become a reusable reporting standard.
- Confirm exact reusable support numerator logic beyond the pilot `is_after_service_enablement = TRUE` rule.
- Implement Support CSAT mapping as a governed Databricks table or curated view.
- Confirm ownership and update process for the Support CSAT mapping.
- Validate channel segmentation for Support CSAT after mapping is governed.
- Confirm whether any service exclusions are required for Activity CSAT.
- Decide whether the celebration slide uses Activity CSAT only or also references mapped Support CSAT with caveats.
## GA4 portal-entry refresh plan

GA4 portal-entry behaviour can be added as contextual evidence after the headline Databricks metrics are complete.

The current GA4 Power BI visual was created from older CSV exports and should not be used as final EOFY evidence.

### Purpose

Use refreshed GA4 data to understand how customers enter selected portal login and registration journeys.

GA4 should support, not replace, the validated Databricks story.

### Refresh steps

1. Export refreshed GA4 data for selected portal login and registration links.
2. Confirm the reporting window.
3. Confirm which portal login and registration links are included.
4. Refresh the Power BI visual.
5. Validate login vs sign-up destination tracking.
6. Review device, entry page, weekday, hour-of-day, source channel, and business-hours patterns.
7. Decide whether GA4 belongs on the slide or only in the supporting report.

### Analysis outputs

| Output | Use |
|---|---|
| Portal entries | Contextual access signal only. |
| Device mix | Shows how customers access selected portal entry points. |
| Entry page pattern | Shows which service pages drive selected portal entry. |
| Weekday pattern | Shows when selected portal entry is concentrated. |
| Hour-of-day pattern | Shows whether entry is concentrated during business hours. |
| Login vs sign-up split | Shows selected destination behaviour, not total account creation. |
| Source channel | Optional context where available. |

### Rules

Do not use GA4 values until refreshed.

Do not treat GA4 portal-entry values as total portal usage.

Do not reconcile GA4 sign-up clicks with Service Account sign-ups unless tracking coverage and attribution are validated.

Do not replace Databricks headline metrics with GA4 metrics.
