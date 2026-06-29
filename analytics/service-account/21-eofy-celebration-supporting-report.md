# EOFY Celebration Supporting Report

## Service Account / Portal CX

This report supports the one-slide EOFY celebration analysis for Service Account / Portal CX.

It documents the evidence, metric definitions, caveats, and slide-safe interpretation behind the celebration story.

## Executive summary

Service Account adoption and usage are growing.

In FY2025/26 compared with FY2024/25:

- Customer sign-ups increased by 58.3%.
- Application workflow activity increased by 69.8%.
- Support demand per 100 activities reduced by about 17.0%.
- Portal-enabled Activity CSAT improved from 76.5% to 80.6%.
- Activity CSAT valid responses increased from 889 to 1,721.

Together, these results support the slide message that Service Account / Portal CX is scaling: more customers are using the portal, more application workflow activity is occurring through self-service, and support demand is reducing relative to activity.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Slide story

The EOFY celebration slide is based on five connected proof points:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Better Activity CSAT
5. Support CSAT only where manually mapped and documented

## Slide-safe wording

Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Validated headline results

Use FY2024/25 as the previous FY and FY2025/26 as the current FY.

| Metric | FY2024/25 | FY2025/26 | Movement | Interpretation |
|---|---:|---:|---:|---|
| Customers / Service Account sign-ups | 9,838 | 15,570 | +58.3% | More customers are adopting Service Account / portal access. |
| Activity / application workflow activity | 2,209 | 3,751 | +69.8% | More portal-enabled application workflow activity is occurring. |
| Support cases | 10,976 | 15,475 | +41.0% | Raw support volume increased, but slower than activity. |
| Support per 100 activities | 496.9 | 412.6 | about -17.0% | Support demand reduced relative to activity. |
| Activity CSAT | 76.5% | 80.6% | +4.1 pp | Portal-enabled Activity CSAT improved. |
| Activity CSAT valid responses | 889 | 1,721 | +832 | The Activity CSAT evidence base strengthened. |

## Metric definitions

### Customers

Customers means Service Account / portal sign-ups.

Customers does not mean all CRM accounts.

Source:

`datahub_datamart.customer_account_management.vwaccount`

Definition:

    Customers =
      distinct account_id
      where customer_portal = TRUE
      and first_account_portal_on_date is within the reporting window

### Activity

Activity means application workflow activity through the portal.

Activity does not mean permit lifecycle activity.

Source:

`datahub_datamart.customer_account_management.vwpermit`

Definition:

    Activity =
      distinct application_id
      where period_start is within the reporting window
      and application_status is included in the accepted application workflow status set

Included statuses:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

Excluded unless later confirmed:

- Withdrawn
- Declined
- Issued
- Extended
- Renewed
- Lapsed

### Support demand

Support demand should be interpreted as support relative to activity, not raw support volume.

Source:

`datahub_datamart.customer_account_management.vwsupport`

Definition:

    Support cases =
      distinct case_id
      where is_after_service_enablement = TRUE
      and date_time_opened is within the reporting window

Headline rate:

    Support per 100 activities =
      distinct support cases / distinct activity applications * 100

Interpretation:

Support cases increased from 10,976 to 15,475. However, activity increased faster than support volume, which means support demand reduced relative to activity.

Do not use:

`customer_account_management.vwsupport_enriched`

for headline support KPI production.

### Activity CSAT

Activity CSAT means satisfaction related to portal-enabled application activity.

Source:

`datahub_datamart.customer_intelligence.vwcase`

Portal service cohort source:

`datahub_datamart.customer_account_management.vwservice_enablement`

Date field:

`Survey_Completion_Date`

Score field:

`Satisfaction_Score_5`

Formula:

    Activity CSAT =
      Satisfaction_Score_5 IN (4, 5)
      divided by
      Satisfaction_Score_5 IS NOT NULL

Interpretation:

Portal-enabled Activity CSAT improved from 76.5% to 80.6%, while valid responses increased from 889 to 1,721.

Do not claim portal enablement caused the CSAT improvement unless causality is supported.

### Support CSAT

Support CSAT means satisfaction for mapped portal-relevant support pathways only.

Support CSAT must use the manual mapping documented in:

`analytics/service-account/20-support-csat-service-mapping.md`

Working Databricks workspace copy:

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

Support CSAT should only include CSAT cases where:

`customer_intelligence.vwcase.Service_Name`

matches a mapped:

`support_service_name`

Do not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

Support CSAT is not yet a repeatable self-serve Genie metric because the mapping is not implemented as a governed Databricks table or curated view.

Candidate future governed assets:

- `datahub_datamart.customer_account_management.support_csat_service_mapping`
- `datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

## Source decisions

| Purpose | Source |
|---|---|
| Customers | `datahub_datamart.customer_account_management.vwaccount` |
| Activity | `datahub_datamart.customer_account_management.vwpermit` |
| Support demand | `datahub_datamart.customer_account_management.vwsupport` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |
| CSAT | `datahub_datamart.customer_intelligence.vwcase` |
| CRM descriptors only | `datahub_refined.customer.vwcase` |
| Support CSAT mapping | `analytics/service-account/20-support-csat-service-mapping.md` |

Do not use:

| Source | Decision |
|---|---|
| `customer_account_management.vwsupport_enriched` | Do not use for headline KPIs or CSAT. |
| `customer_intelligence.vwsurvey_feedback` | Do not use unless later response-level validation is needed. |
| `vwcase_survey` | Do not use for this pilot. |
| `Record_Type` | Do not use as a Support CSAT definition. |

## Evidence narrative

### 1. More customers

Service Account / portal sign-ups increased from 9,838 in FY2024/25 to 15,570 in FY2025/26.

This is an increase of 5,732 sign-ups, or 58.3%.

Slide implication:

> More customers are adopting Service Account / portal access.

### 2. More self-service activity

Application workflow activity increased from 2,209 in FY2024/25 to 3,751 in FY2025/26.

This is an increase of 1,542 applications, or 69.8%.

Slide implication:

> More customers are using the portal for application workflow activity.

### 3. Less support demand relative to activity

Support cases increased from 10,976 to 15,475.

However, application workflow activity increased faster than support volume.

Support per 100 activities reduced from 496.9 to 412.6, a reduction of about 17.0%.

Slide implication:

> Support demand is reducing relative to self-service activity.

### 4. Better Activity CSAT

Portal-enabled Activity CSAT improved from 76.5% to 80.6%.

This is an increase of 4.1 percentage points.

Valid responses also increased from 889 to 1,721.

Slide implication:

> Customer satisfaction for portal-enabled application activity improved, with a stronger response base.

### 5. Support CSAT only where manually mapped

Support CSAT should not be treated as a general or self-serve metric yet.

It is valid only where the manual support service mapping has been applied and documented.

Slide implication:

> Support CSAT can be referenced only with the mapping caveat.

## Caveats

- Customers means Service Account / portal sign-ups, not all CRM accounts.
- Activity means application workflow activity, not permit lifecycle activity.
- Support demand should be shown as a rate per 100 activities, not as raw support volume.
- Raw support cases increased, but support demand reduced relative to activity.
- Activity CSAT is satisfaction related to portal-enabled application activity.
- Activity CSAT improvement should not be described as caused by portal enablement.
- FY2023/24 Activity CSAT should not be used as the main baseline because it has only 18 valid responses.
- Support CSAT should only be discussed where the manual support service mapping has been applied and documented.
- RPP Support CSAT proxy does not represent full Service Account Support CSAT.
- `Record_Type` is CRM metadata and does not define Support CSAT.
- `vwsupport_enriched` should not be used for headline KPIs or CSAT.

## Do not claim

Do not claim:

- Support CSAT improved overall unless the manual mapping has been applied.
- Portal enablement caused CSAT improvement.
- Pre/post enablement CSAT improved across the full portal service cohort.
- RPP Support CSAT proxy represents full Service Account Support CSAT.
- `vwsupport_enriched` is a source for headline support KPIs.
- `Record_Type` defines Support CSAT.
## GA4 portal entry behaviour

GA4 portal-entry behaviour can be used as supporting context for the EOFY celebration story once refreshed.

The current Power BI visual is based on older CSV exports and should be treated as a layout and analysis pattern only.

Do not use the current GA4 values as final slide evidence.

### Intended use

GA4 can help explain how customers enter selected portal login and registration journeys by:

- device
- entry page
- weekday
- hour of day
- login vs sign-up destination
- source channel, where available
- business-hours share, where available

### Slide role

GA4 should be used only as a supporting digital behaviour insight.

It should not replace the validated Databricks headline metrics for:

- Customers
- Activity
- Support demand
- Activity CSAT
- mapped Support CSAT

### Required refresh before use

Before including GA4 in the slide or final report, confirm:

| Requirement | Status |
|---|---|
| Refreshed GA4 export completed | Pending |
| Reporting window confirmed | Pending |
| Selected portal links confirmed | Pending |
| Login vs sign-up tracking validated | Pending |
| Device, weekday, and hourly patterns refreshed | Pending |
| Caveat wording confirmed | Pending |

### Caveat wording

Use this wording until refreshed data is validated:

> GA4 portal-entry analysis is contextual only and is based on selected portal login and registration links. It should not be treated as total portal usage or as a replacement for Databricks Service Account, Activity, Support, or CSAT metrics.
## Recommended slide content

### Slide title

Service Account / Portal CX is scaling well

### Subtitle

More customers, more self-service activity, and lower support demand relative to activity.

### KPI strip

| KPI | Result |
|---|---:|
| Customer sign-ups | +58.3% |
| Application workflow activity | +69.8% |
| Support per 100 activities | about -17.0% |
| Activity CSAT | 76.5% to 80.6% |
| Activity CSAT valid responses | 889 to 1,721 |

### Supporting statement

Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%.

Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

### Footnote

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Strategic interpretation

The result is not simply that volume increased.

The stronger interpretation is that Service Account / Portal CX appears to be scaling in a healthier direction:

- customer adoption is increasing
- application workflow activity is increasing faster than support volume
- support demand is reducing relative to activity
- Activity CSAT improved with a larger response base

This supports the EOFY celebration story while preserving the required caveats around causality, support mapping, and production readiness.

## Current decision

The evidence is strong enough to support the EOFY celebration slide.

The reusable reporting standard still needs:

- formal Activity KPI validation
- support numerator validation beyond the pilot rule
- governed Support CSAT mapping
- ownership and update process for Support CSAT mapping
- channel segmentation validation
- production-grade Databricks SQL or curated views where required
