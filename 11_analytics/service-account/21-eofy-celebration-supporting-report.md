# EOFY Celebration Supporting Report

## Service Account / Portal CX

This report supports the one-slide EOFY analysis for Service Account / Portal CX.

It documents the evidence, governed metric definitions, caveats, validation status and slide-safe interpretation behind the EOFY story.

The report distinguishes between:

- customer adoption
- full-lifecycle portal service activity
- pre-outcome online application activity
- portal support demand
- Activity CSAT
- mapped Support CSAT
- optional GA4 portal-entry behaviour

---

## Executive summary

Service Account adoption and portal usage are growing.

Current evidence indicates that:

- Customer sign-ups increased.
- Full-lifecycle Portal service activity increased from 38,422 to 39,898.
- Online application activity increased from 5,674 to 8,739.
- Portal support cases increased from 10,976 to 13,910.
- Support cases per 100 portal service activities increased from 28.57 to 34.86.
- Portal-enabled Activity CSAT improved from 76.5% to 80.6%.
- Activity CSAT valid responses increased from 889 to 1,721.

The evidence supports a positive adoption and usage story.

It does not support a claim that support demand reduced.

The governed interpretation of the support result is:

> Support demand increased relative to portal service activity.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

GA4 portal-entry behaviour may be added as contextual supporting evidence once its CSV export and Power BI visuals are refreshed. Current GA4 values are old and must not be used as final slide evidence.

---

## Slide story

The EOFY slide should be based on five connected proof points:

1. More customers are adopting Service Account.
2. More portal-enabled service activity is occurring.
3. Pre-outcome online application activity increased strongly.
4. Activity CSAT improved with a larger response base.
5. Support demand increased relative to portal service activity and should be presented as an operational watchpoint.

Support CSAT may be included only where the manual service mapping has been applied and documented.

GA4 portal-entry behaviour can be used as optional supporting context once refreshed.

---

## Slide-safe wording

Service Account adoption and portal usage continued to grow. Portal service activity increased from 38,422 to 39,898, while pre-outcome online application activity increased from 5,674 to 8,739.

Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support cases increased faster than portal service activity. Support demand rose from 28.57 to 34.86 cases per 100 portal service activities, identifying an opportunity to investigate where customers need additional assistance across the portal-enabled service lifecycle.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

---

## Validated headline results

Use FY2024/25 as the previous financial year and FY2025/26 as the current financial year.

| Metric | FY2024/25 | FY2025/26 | Movement | Interpretation |
|---|---:|---:|---:|---|
| Customers / Service Account sign-ups | 9,838 | 15,570 | +58.3% | More customers are adopting Service Account and portal access. |
| Portal service activities | 38,422 | 39,898 | +3.8% | Full-lifecycle activity associated with portal-enabled services increased. |
| Online application activity | 5,674 | 8,739 | +54.0% | Pre-outcome application workflow activity increased strongly. |
| Portal support cases | 10,976 | 13,910 | +26.7% | Distinct post-enablement support cases increased. |
| Support cases per 100 portal service activities | 28.57 | 34.86 | +22.0% | Support demand increased relative to portal service activity. |
| Activity CSAT | 76.5% | 80.6% | +4.1 pp | Portal-enabled Activity CSAT improved. |
| Activity CSAT valid responses | 889 | 1,721 | +832 | The Activity CSAT evidence base strengthened. |

Power BI displays Portal service activity growth as `4%` because the result is rounded to a whole percentage.

The support-demand rate reconciles to the recorded numerator and denominator values:

- FY2024/25: `10,976 / 38,422 * 100 = 28.57`
- FY2025/26: `13,910 / 39,898 * 100 = 34.86`

The denominator values were read directly from Power BI. They were not reconstructed from rounded rate values.

---

## Headline support metric

### Governed label

**Support cases per 100 portal service activities**

### Business definition

The metric compares distinct post-enablement portal support cases with distinct portal service activities across the broader portal-enabled service lifecycle.

Customers may use the portal for activities including:

- starting an application
- progressing an application
- receiving an outcome
- managing an approved permit
- renewing or extending a permit
- other post-approval service interactions

The metric is not limited to pre-outcome online applications.

### Current Power BI reference values

| Measure | FY2024/25 | FY2025/26 | Absolute change | Relative change |
|---|---:|---:|---:|---:|
| Portal service activities | 38,422 | 39,898 | +1,476 | +3.8% |
| Portal support cases | 10,976 | 13,910 | +2,934 | +26.7% |
| Support cases per 100 portal service activities | 28.57 | 34.86 | +6.29 | +22.0% |

### Governed interpretation

Support demand increased relative to portal service activity.

The support numerator increased substantially faster than the activity denominator:

- portal support cases increased by `26.7%`
- portal service activity increased by `3.8%`
- support demand per 100 activities increased by `22.0%`

This result must not be presented as:

- reduced support demand
- improved self-service performance
- a celebratory improvement
- evidence that customers required less assistance
- evidence of operational efficiency
- evidence of successful channel shift

The result may be presented neutrally as an operational watchpoint or an opportunity to investigate support needs across the portal-enabled lifecycle.

---

## Separate diagnostic: Online application activity

Online application activity is retained as a supporting diagnostic.

It measures pre-outcome workflow activity and is narrower than the headline Portal service activity metric.

### Current Power BI result

| Measure | FY2024/25 | FY2025/26 | Absolute change | Relative change |
|---|---:|---:|---:|---:|
| Online application activity | 5,674 | 8,739 | +3,065 | +54.0% |

### Governed workflow stages

The workflow order is:

1. Draft
2. Submitted
3. In Progress
4. In Assessment
5. Pending Payment

`In Progress` is a separate stage and must not be grouped under Draft.

### Use restriction

Online application activity must not be used as the denominator for the headline Portal Support Demand Rate.

It is a supporting diagnostic only.

---

## Optional supporting evidence: GA4 portal-entry behaviour

GA4 portal-entry behaviour can support the EOFY story as contextual evidence once refreshed.

The existing Power BI visual created from GA4 CSV exports should be treated as a layout and analysis pattern only.

Do not use the current GA4 values as final slide evidence.

### Intended use

GA4 can help explain how customers enter selected portal login and registration journeys by:

- device
- entry page
- weekday
- hour of day
- login versus sign-up destination
- source channel, where available
- business-hours share, where available

### Slide role

GA4 should be used only as a supporting digital behaviour insight.

It must not replace the governed Databricks or Power BI headline metrics for:

- Customers
- Portal service activity
- Online application activity
- Portal support demand
- Activity CSAT
- mapped Support CSAT

### Refresh required before use

Before including GA4 in the slide or final report, confirm:

| Requirement | Status |
|---|---|
| Refreshed GA4 export completed | Pending |
| Reporting window confirmed | Pending |
| Selected portal links confirmed | Pending |
| Login versus sign-up tracking validated | Pending |
| Device mix refreshed | Pending |
| Entry-page pattern refreshed | Pending |
| Weekday pattern refreshed | Pending |
| Hour-of-day pattern refreshed | Pending |
| Source channel refreshed, where available | Pending |
| Business-hours share refreshed, where available | Pending |
| Caveat wording confirmed | Pending |

### Validation questions

| Question | Decision needed |
|---|---|
| What is the refreshed GA4 reporting window? | Confirm start and end dates. |
| Are selected portal links representative enough for a supporting insight? | Confirm caveat wording. |
| Does GA4 track login and registration links consistently across key portal entry pages? | Validate event and link coverage. |
| Can refreshed GA4 data be reconciled with Service Account sign-ups? | Keep separate unless reconciliation is validated. |
| Should GA4 be shown on the slide or kept in the supporting report only? | Decide after refreshed results are reviewed. |

### GA4 caveat wording

Use this wording until refreshed data is validated:

> GA4 portal-entry analysis is contextual only and is based on selected portal login and registration links. It should not be treated as total portal usage or as a replacement for governed Service Account, activity, support or CSAT metrics.

---

# Metric definitions

## Customers

Customers means Service Account or portal sign-ups.

Customers does not mean all CRM accounts.

### Source

`datahub_datamart.customer_account_management.vwaccount`

### Definition

    Customers =
      count distinct account_id
      where customer_portal = TRUE
      and first_account_portal_on_date is within the reporting window

---

## Portal service activity

### Business definition

Portal service activity measures distinct service activities associated with portal-enabled services after the related service became portal enabled.

It covers the broader portal-enabled service lifecycle.

### Sources

Activity records:

`datahub_datamart.customer_account_management.vwpermit`

CRM case creation date and service relationship:

`datahub_refined.customer.vwcase`

Portal enablement:

`datahub_datamart.customer_account_management.vwservice_enablement`

### Count

Count distinct:

`vwpermit.application_id`

### Required lineage

The Power BI relationship lineage is:

`vwpermit[case_id]`
→ `DimCase[case_id]`
→ `DimCase[service_name]`
→ `DimService[service_name]`
→ `DimService[first_portal_enable_date]`

The equivalent Databricks implementation must:

1. Join `vwpermit` to the related CRM case using `case_id`.
2. Obtain the related service from the CRM case.
3. Join the related service to `vwservice_enablement`.
4. Apply the portal enablement condition.

### Activity date

Use the related CRM case creation date.

Do not use:

`vwpermit.period_start`

Power BI `transaction_date` is a calculated date-only representation of the related CRM case creation date. It is not a native Databricks field.

### Required conditions

Count a distinct `application_id` where:

- the related CRM case has a valid case creation date
- the related service has a nonblank `first_portal_enable_date`
- the related case creation date is on or after `first_portal_enable_date`
- the related case creation date falls within the reporting window
- no application-status filter is applied

### Reporting windows

Use half-open reporting windows:

- FY2024/25: `2024-07-01 <= case creation date < 2025-07-01`
- FY2025/26: `2025-07-01 <= case creation date < 2026-07-01`

### Prohibited logic

Do not:

- use `vwpermit.period_start` as the activity date
- apply an application-status filter
- restrict the measure to pre-outcome stages
- count permit rows instead of distinct `application_id`
- include activity before the related service was portal enabled
- infer the denominator from a rounded support-demand rate

---

## Online application activity

### Purpose

Online application activity is a supporting diagnostic for pre-outcome workflow stages.

It is not the headline lifecycle activity metric.

### Source

`datahub_datamart.customer_account_management.vwpermit`

Additional case and status-mapping sources may be required according to the governed Power BI lineage.

### Count

Count distinct applications in these workflow stages:

1. Draft
2. Submitted
3. In Progress
4. In Assessment
5. Pending Payment

### Status-map rule

`In Progress` is a separate stage.

Do not group `In Progress` under Draft.

### Use restriction

Do not use Online application activity as the denominator for the full-lifecycle Portal Support Demand Rate.

---

## Portal support cases

### Business definition

Portal support cases measure distinct support cases created after the related service became portal enabled.

The numerator covers support demand across the broader portal-enabled service lifecycle.

### Source

`datahub_datamart.customer_account_management.vwsupport`

### Count

Count distinct:

`case_id`

### Date field

Use:

`case_created_date`

### Required filters

Apply:

`is_after_service_enablement = TRUE`

Also require:

- `case_created_date >= period_start`
- `case_created_date < period_end`

Use the same half-open reporting windows as Portal service activity.

### Prohibited logic

Do not:

- use `date_time_opened` where it differs from the governed `case_created_date`
- count support rows instead of distinct `case_id`
- include support cases before portal enablement
- restrict support cases only to pre-outcome applications
- use `customer_account_management.vwsupport_enriched` for the headline support KPI

---

## Portal Support Demand Rate

### Governed label

Support cases per 100 portal service activities

### Formula

    Portal Support Demand Rate =
      distinct post-enablement portal support cases
      divided by
      distinct portal service activities
      multiplied by
      100

Equivalent expression:

    Portal Support Demand Rate =
      Portal support cases / Portal service activities * 100

### Interpretation

A higher value means more support demand relative to portal service activity.

A lower value means less support demand relative to portal service activity.

The current result shows an increase.

Do not describe the current result as reduced support demand.

---

## Activity CSAT

Activity CSAT means satisfaction related to portal-enabled application activity.

### Source

`datahub_datamart.customer_intelligence.vwcase`

### Portal service cohort source

`datahub_datamart.customer_account_management.vwservice_enablement`

### Date field

`Survey_Completion_Date`

### Score field

`Satisfaction_Score_5`

### Formula

    Activity CSAT =
      count where Satisfaction_Score_5 is 4 or 5
      divided by
      count where Satisfaction_Score_5 is not null

### Interpretation

Portal-enabled Activity CSAT improved from 76.5% to 80.6%, while valid responses increased from 889 to 1,721.

Do not claim that portal enablement caused the CSAT improvement unless causal evidence is available.

---

## Support CSAT

Support CSAT means satisfaction for mapped portal-relevant support pathways only.

Support CSAT must use the manual mapping documented in:

`11_analytics/service-account/20-support-csat-service-mapping.md`

Working Databricks workspace copy:

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

Support CSAT should include only CSAT cases where:

`customer_intelligence.vwcase.Service_Name`

matches a mapped:

`support_service_name`

Do not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

Support CSAT is not yet a repeatable self-service Genie metric because the mapping is not implemented as a governed Databricks table or curated view.

Candidate future governed assets:

- `datahub_datamart.customer_account_management.support_csat_service_mapping`
- `datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

---

# Source decisions

| Purpose | Source |
|---|---|
| Customers | `datahub_datamart.customer_account_management.vwaccount` |
| Portal service activity records | `datahub_datamart.customer_account_management.vwpermit` |
| CRM case date and service relationship | `datahub_refined.customer.vwcase` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |
| Portal support demand | `datahub_datamart.customer_account_management.vwsupport` |
| Activity and Support CSAT | `datahub_datamart.customer_intelligence.vwcase` |
| Support CSAT mapping | `11_analytics/service-account/20-support-csat-service-mapping.md` |

Do not use:

| Source or field | Decision |
|---|---|
| `customer_account_management.vwsupport_enriched` | Do not use for headline support KPIs or CSAT. |
| `customer_intelligence.vwsurvey_feedback` | Do not use unless later response-level validation is required. |
| `vwcase_survey` | Do not use for this pilot. |
| `Record_Type` | Do not use as a Support CSAT definition. |
| `vwpermit.period_start` | Do not use as the Portal service activity date. |
| Old GA4 CSV exports | Do not use as final slide evidence until refreshed. |
| Salesforce configuration | Do not use to infer governed metric logic. |

---

# Evidence narrative

## 1. More customers

Service Account or portal sign-ups increased from 9,838 in FY2024/25 to 15,570 in FY2025/26.

This is an increase of 5,732 sign-ups, or 58.3%.

### Slide implication

> More customers are adopting Service Account and portal access.

---

## 2. More portal service activity

Full-lifecycle Portal service activity increased from 38,422 in FY2024/25 to 39,898 in FY2025/26.

This is an increase of 1,476 activities, or 3.8%.

### Slide implication

> Activity across portal-enabled service workflows continued to grow.

---

## 3. Stronger online application activity

The separate Online application activity diagnostic increased from 5,674 to 8,739.

This is an increase of 3,065 applications, or 54.0%.

### Slide implication

> Pre-outcome online application workflow activity increased strongly.

Do not use this diagnostic as the denominator for full-lifecycle support demand.

---

## 4. Higher support demand relative to activity

Portal support cases increased from 10,976 to 13,910.

Portal service activity increased from 38,422 to 39,898.

Support cases per 100 portal service activities increased from 28.57 to 34.86.

### Slide implication

> Support demand increased relative to portal service activity, identifying an opportunity to investigate where customers require additional assistance.

This is an operational watchpoint, not a celebratory improvement.

---

## 5. Better Activity CSAT

Portal-enabled Activity CSAT improved from 76.5% to 80.6%.

This is an increase of 4.1 percentage points.

Valid responses increased from 889 to 1,721.

### Slide implication

> Customer satisfaction for portal-enabled application activity improved, with a stronger response base.

---

## 6. Support CSAT only where manually mapped

Support CSAT should not be treated as a general or self-service metric yet.

It is valid only where the manual support service mapping has been applied and documented.

### Slide implication

> Support CSAT can be referenced only with the mapping caveat.

---

## 7. GA4 portal-entry behaviour after refresh

GA4 can add context about how customers access selected portal login and registration journeys.

This may help explain:

- whether customers enter mainly from desktop, mobile or tablet
- which service pages drive portal entry
- whether portal access is concentrated during business hours
- whether customers are primarily logging in or creating accounts from selected entry points

### Slide implication after refresh

> GA4 portal-entry tracking provides supporting context on how customers access selected portal login and registration journeys.

Do not include GA4 values until refreshed and validated.

---

# Caveats

- Customers means Service Account or portal sign-ups, not all CRM accounts.
- Portal service activity covers the broader portal-enabled service lifecycle.
- Portal service activity uses the related CRM case creation date.
- `vwpermit.period_start` is not the governed Portal service activity date.
- No application-status filter is applied to Portal service activity.
- Online application activity is a separate pre-outcome diagnostic.
- Online application activity must not be used as the support-rate denominator.
- Portal support cases use `case_created_date`.
- Portal support cases require `is_after_service_enablement = TRUE`.
- Support demand must be shown against full-lifecycle Portal service activity.
- Raw support cases increased.
- Support demand per 100 portal service activities also increased.
- The support result is not a celebratory improvement.
- Activity CSAT is satisfaction related to portal-enabled application activity.
- Activity CSAT improvement should not be described as caused by portal enablement.
- FY2023/24 Activity CSAT should not be used as the main baseline because it has only 18 valid responses.
- Support CSAT should only be discussed where the manual support service mapping has been applied and documented.
- RPP Support CSAT proxy does not represent full Service Account Support CSAT.
- `Record_Type` is CRM metadata and does not define Support CSAT.
- `vwsupport_enriched` must not be used for headline KPIs or CSAT.
- GA4 portal-entry behaviour can be used only as contextual supporting evidence after refresh.
- Current GA4 values are old and must not be used as final slide evidence.
- GA4 must not replace governed headline metrics.
- Databricks and Account Management Genie reconciliation remain pending.

---

# Do not claim

Do not claim that:

- support demand reduced
- support cases increased more slowly than portal service activity
- the support result demonstrates improved self-service
- the support result is a celebratory improvement
- Online application activity is the full portal service activity denominator
- `vwpermit.period_start` is the governed activity date
- application-status filters apply to the headline Portal service activity metric
- Support CSAT improved overall unless the manual mapping has been applied
- portal enablement caused CSAT improvement
- pre/post-enablement CSAT improved across the full portal service cohort
- RPP Support CSAT proxy represents full Service Account Support CSAT
- `vwsupport_enriched` is a source for headline support KPIs
- `Record_Type` defines Support CSAT
- GA4 portal-entry values represent total portal usage
- old GA4 CSV export values are current EOFY evidence
- Power BI values have been reproduced in Databricks or Genie until reconciliation is completed

---

# Recommended slide content

## Slide title

Service Account adoption and portal usage continue to grow

## Subtitle

More customers, growing portal activity and improved Activity CSAT, with support demand identified as an operational watchpoint.

## KPI strip

| KPI | Result |
|---|---:|
| Customer sign-ups | +58.3% |
| Portal service activity | +3.8% |
| Online application activity | +54.0% |
| Support cases per 100 portal service activities | 28.57 to 34.86 |
| Activity CSAT | 76.5% to 80.6% |
| Activity CSAT valid responses | 889 to 1,721 |

## Supporting statement

Service Account adoption and portal usage continued to grow.

Full-lifecycle Portal service activity increased from 38,422 to 39,898, while the separate pre-outcome Online application activity diagnostic increased from 5,674 to 8,739.

Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Portal support cases increased faster than portal service activity. Support demand rose from 28.57 to 34.86 cases per 100 portal service activities and should be treated as an operational watchpoint.

## Optional GA4 callout after refresh

Use only after refreshed GA4 data is validated:

> GA4 portal-entry tracking provides supporting context on how customers access selected portal login and registration journeys. It is contextual only and should not be treated as total portal usage.

## Footnote

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

GA4 portal-entry analysis is contextual only and must not replace governed Databricks or Power BI headline metrics.

Databricks and Account Management Genie reconciliation of the Portal service activity and support-demand metrics remains pending.

---

# Strategic interpretation

The evidence shows positive movement in adoption, portal usage and Activity CSAT.

The strongest supported interpretation is that:

- customer adoption is increasing
- full-lifecycle portal service activity is growing
- pre-outcome online application activity increased strongly
- Activity CSAT improved with a larger response base
- support demand increased relative to portal service activity

The support result should not be hidden or reframed as an improvement.

Instead, it provides a useful service-design signal: increasing support demand may indicate friction, complexity, changing customer needs, greater use of support-intensive lifecycle stages, or changes in channel behaviour.

Further analysis is required before attributing the increase to any specific cause.

GA4 may strengthen the analysis once refreshed by adding a digital-entry behaviour lens showing how customers reach selected portal login and registration journeys.

This framing preserves the positive adoption and satisfaction story while clearly identifying support demand as an area requiring investigation.

---

# Validation status

## Power BI references recorded

The following Power BI reference values are recorded:

- Portal service activities
- Portal support cases
- Support cases per 100 portal service activities
- Online application activity

## Pending validation

The following work remains pending:

- Databricks replication of Portal service activity
- Databricks replication of Portal support cases
- Account Management Genie replication
- source and date-field reconciliation
- join-path reconciliation
- unmatched case and service-mapping checks
- duplicate and many-to-many expansion checks
- governed Support CSAT mapping
- ownership and update process for Support CSAT mapping
- refreshed GA4 portal-entry export
- confirmed GA4 reporting window
- production-grade Databricks SQL or curated views where required

## Slide-safety position

The recorded Power BI values may be used as the current reference values with the documented definitions and caveats.

The support metric must be described as:

> Support demand increased relative to portal service activity.

Do not describe the support result as reduced demand or improved self-service.

Databricks and Genie outputs must not be classified as slide-safe until they reproduce the governed definitions and reconcile to the approved Power BI references.

---

# Current decision

The evidence is strong enough to support an EOFY slide focused on:

- Service Account adoption
- growth in portal-enabled activity
- strong growth in pre-outcome online application activity
- improved Activity CSAT
- a stronger Activity CSAT response base

The slide should include the increase in support demand as a transparent operational watchpoint rather than a celebratory proof point.

The GA4 portal-entry visual may be used as a layout and analysis pattern, but refreshed GA4 data is required before any GA4 values are included in the EOFY slide or supporting report.

The reusable reporting standard still requires:

- Databricks reconciliation of the headline Portal service activity metric
- Databricks reconciliation of the Portal support numerator
- Account Management Genie reconciliation
- governed Support CSAT mapping
- ownership and maintenance processes for Support CSAT mapping
- channel-segmentation validation
- refreshed GA4 portal-entry data
- production-grade SQL or curated views where required
