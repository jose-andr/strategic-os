# Business Validation Backlog

This file tracks business rules, assumptions, and interpretation decisions that should be validated with business representatives after the EOFY celebration analysis.

## Purpose

The EOFY celebration analysis needs to move at a practical pace.

Some metric logic is good enough for the celebration slide, but should still be validated before becoming a reusable reporting standard.

This backlog separates:

- decisions accepted for the current celebration analysis
- assumptions that need business confirmation later
- questions that may affect future dashboard, Power BI, Genie, or Databricks production logic

## Current celebration analysis decision

For the EOFY celebration slide, the following working definition is accepted:

    Activity = application workflow activity

This means Activity is based on portal application workflow records, not permit lifecycle records.

For the current analysis, include the following application workflow statuses in Activity:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

This supports the slide story:

    More self-service activity

## Activity workflow decision

### Accepted for current celebration analysis

Pending Payment is included in the Activity KPI for the EOFY celebration analysis.

Rationale:

- It represents an application that has progressed through the portal workflow.
- It reflects meaningful customer self-service activity.
- It is part of the application journey rather than the permit lifecycle.
- Excluding it may understate portal activity where customers have completed meaningful steps but payment is still pending.

### Still to validate with business representatives

Confirm whether Pending Payment should remain included in the formal reusable Activity KPI.

Key question:

    Should Pending Payment count as portal self-service activity?

Recommended business framing:

    A customer has progressed an application to the payment stage. Does this represent completed enough self-service activity to count in the Activity KPI?

## Application workflow vs permit workflow

### Accepted for current celebration analysis

The headline Activity KPI should focus on application workflow activity.

Application workflow statuses include:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment
- Withdrawn
- Declined

Permit lifecycle statuses include:

- Issued
- Extended
- Renewed
- Lapsed

For the current celebration analysis, permit lifecycle statuses are not used as the primary basis for Activity.

### Still to validate with business representatives

Confirm whether the formal reporting model should maintain two separate KPI families:

| KPI family | Purpose |
|---|---|
| Application activity | Measures customer self-service activity through the portal |
| Permit lifecycle / outcomes | Measures issued, active, renewed, extended, or lapsed permit states |

Recommended business framing:

    Do we want Activity to measure customer effort and portal use, or final permit outcomes?

## Withdrawn and Declined applications

### Accepted for current celebration analysis

Withdrawn and Declined are not included in the headline Activity KPI unless later confirmed.

Rationale:

- They are application outcomes rather than core activity progression statuses.
- Including them may inflate the activity story with unsuccessful or discontinued journeys.
- They may be more useful as outcome or conversion indicators.

### Still to validate with business representatives

Confirm whether Withdrawn and Declined should be treated as:

1. Activity
2. Application outcomes
3. Exclusions from the headline KPI
4. A separate quality / conversion measure

Recommended business framing:

    If a customer starts and submits an application but it is later withdrawn or declined, should that count as self-service activity, an outcome, or both?

## Draft applications

### Accepted for current celebration analysis

Draft applications are included in Activity.

Rationale:

- Drafts indicate customers are using the portal to start or progress a task.
- Drafts are part of the digital self-service journey.
- Excluding drafts may understate portal usage and early-stage activity.

### Still to validate with business representatives

Confirm whether the formal Activity KPI should include:

- all drafts
- only drafts with meaningful progress
- only drafts that later become submitted
- drafts as a separate supporting metric

Recommended business framing:

    Does starting an application in the portal count as self-service activity, even if the customer has not submitted it yet?

## Null period_start records

### Accepted for current celebration analysis

Records with `period_start = null` are excluded from the YoY Activity calculation because they cannot be assigned to a reporting period.

### Still to validate with business representatives or data owners

Confirm whether there is a fallback date field for application records where `period_start` is null.

Potential fallback fields to investigate:

- created date
- submitted date
- case opened date
- application modified date
- permit created date

Recommended business framing:

    For applications missing period_start, which date best represents when the portal activity occurred?

## Case status interaction

### Accepted for current celebration analysis

The current draft mapping primarily uses `application_status` to classify activity.

`case_status` is retained for profiling and validation, but it does not currently override the application workflow classification.

### Still to validate with business representatives

Confirm whether certain combinations of `application_status` and `case_status` should change inclusion.

Example questions:

- Should `submitted / closed` count as submitted activity?
- Should `draft / closed` remain activity?
- Should `pending payment / approved` count as activity?
- Should `further information requested / closed` count as activity?

Recommended business framing:

    Are there any application status and case status combinations that should be excluded, even if the application status appears to be activity?

## Category exclusions

### Accepted for current celebration analysis

No specific categories are excluded from the draft Activity KPI unless the current SQL logic or source data already excludes them.

### Still to validate with business representatives

Confirm whether any categories should be excluded from headline Activity reporting.

Categories observed in validation include:

- permit
- waste bin
- skip bins
- mobile plant equipment
- legal point of discharge report
- location of works
- exclusion area / drop zone
- central city
- hand tools
- crane
- gantry

Recommended business framing:

    Are all portal application categories valid for the Activity KPI, or should some be reported separately?

## Support demand numerator

### Accepted for current celebration analysis

For the EOFY celebration analysis, the support numerator is accepted as:

    Self-Service Support =
        distinct support cases from vwsupport
        where is_after_service_enablement = TRUE

The support rate is calculated as:

    Support Rate =
        Self-Service Support / Activity * 100

Where Activity means:

    application workflow Activity

The latest celebration comparison supports the slide story because Activity grew faster than support demand.

| Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement |
|---|---:|---:|---:|
| Activity applications | 2,209 | 3,751 | +69.8% |
| Support cases | 10,976 | 15,475 | +41.0% |
| Support per 100 activities | 496.9 | 412.6 | about -17.0% |

This means support demand decreased relative to activity.

For the celebration slide, this is good enough to proceed.

### Still to validate for reusable reporting

The exact reusable support numerator should still be validated with business representatives or data owners.

Questions to validate:

1. Should support be counted as distinct `case_id` from `vwsupport`?
2. Should `is_after_service_enablement = TRUE` be the main portal support eligibility rule?
3. Should support be limited to Service Account customers only?
4. Should support be limited to specific service groups or portal service names?
5. Should all support channels be included?
6. Should internal staff support interactions be excluded?
7. Should resolved, expert enquiry, and assisted support types be grouped or separated?

### Still to validate with business representatives or data owners

Confirm the exact Databricks equivalent of the Power BI `[Self-Service Support]` numerator.

Questions to validate:

1. Which support records count as portal-related support?
2. Should support be limited to cases after service enablement?
3. Should support be limited to Service Account customers?
4. Should all channels be included?
5. Should internal staff support interactions be excluded?

## CSAT source mapping

### Accepted for current celebration analysis

CSAT uses:

    positive responses / total valid responses

Where positive responses are satisfaction scores of 4 or 5.

The accepted CSAT source for the pilot is:

    datahub_datamart.customer_intelligence.vwcase

Required fields:

- `Survey_Completion_Date`
- `Satisfaction_Score_5`
- `Service_Name`
- `Service_Group`
- `Channel`
- `Record_Type`

### Still to validate with business representatives or data owners

Confirm the reusable Databricks source and governed logic for:

- survey completion date
- satisfaction score
- service name
- normalised service name
- support service eligibility
- portal-enabled service eligibility
- survey-to-support linkage
- survey-to-activity linkage

## Activity CSAT validation

### Accepted for current celebration analysis

Activity CSAT is calculated from:

    datahub_datamart.customer_intelligence.vwcase

and scoped to portal-enabled services from:

    datahub_datamart.customer_account_management.vwservice_enablement

The current celebration comparison is:

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2024/25 | 889 | 680 | 76.5% |
| FY2025/26 | 1,721 | 1,387 | 80.6% |

Accepted slide-safe interpretation:

    Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

### Still to validate

Confirm whether this should become a reusable reporting standard and whether any additional service exclusions or service-group caveats are needed.

Important caveat:

    Do not claim portal enablement caused the CSAT improvement unless causality is supported.

## Support CSAT productionisation

| Validation item | Why it matters | Current working position | Owner / next action |
|---|---|---|---|
| Implement Support CSAT mapping as a governed Databricks asset. | Genie cannot reliably use a personal workspace markdown or SQL file as a reusable Support CSAT filter. | Celebration pilot analysis is complete using the manual mapping, but Support CSAT is not yet a repeatable self-serve Genie metric. | Engage data / platform developers to create a governed reference table or curated view. |
| Confirm target asset name and location. | A stable table or view is needed so Genie and future analysts can reuse the same Support CSAT definition. | Candidate names: `customer_account_management.support_csat_service_mapping` or `customer_account_management.vwsupport_csat_service_mapping`. | Confirm with data governance / Databricks owners. |
| Validate mapped support services before production use. | The current mapping is final for the celebration pilot, but production use needs ownership and change control. | Manual mapping is accepted for the pilot only. | Confirm service owner and update process for future portal-enabled services. |
| Confirm update process when new portal services are enabled. | The Support CSAT mapping must evolve as `vwservice_enablement` evolves. | No governed update process exists yet. | Define ownership between CX, service owners, and data/platform team. |
| Validate low Assisted pathway usage. | Low Assisted usage may reflect operational classification behaviour and affect support pathway interpretation. | Treat as a business validation question, not a confirmed conclusion. | Confirm with Contact Centre / CX operations. |
| Validate channel segmentation for Support CSAT. | Real-time vs async classification depends on actual channel values and business meaning. | Working rule: Phone, Live Chat, Face-to-Face = In Real-time; all others = Async. | Validate against `customer_intelligence.vwcase.Channel` and `vwsupport.channel`. |
| Confirm legacy-system explanation for missing pre-enable Parking CSAT. | Explains why pre/post CSAT is structurally unavailable. | Working hypothesis: Parking permits may have lived in a legacy system before migration into the current CRM / CSAT model. | Validate with CRM / Parking / data owner. |

## Support CSAT mapping decision

### Accepted for current celebration analysis

Support CSAT can only be used for the celebration pilot where the manually mapped support service list and analysis outputs are explicitly documented.

Manual mapping documentation:

    analytics/service-account/20-support-csat-service-mapping.md

Working Databricks workspace mapping file:

    /Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md

### Not accepted as reusable self-serve logic

Do not treat Support CSAT as a repeatable self-serve Genie metric until a governed mapping asset exists.

Do not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

### Future production requirement

Support CSAT needs a governed Databricks reference table or curated view before it can become a reusable reporting standard.

Candidate names:

    datahub_datamart.customer_account_management.support_csat_service_mapping

or

    datahub_datamart.customer_account_management.vwsupport_csat_service_mapping

## Support pathway taxonomy validation

| Validation item | Why it matters | Current working position | Owner / next action |
|---|---|---|---|
| Validate use of Resolved, Assisted, and Expert Enquiry as support pathway categories. | These categories are more meaningful for support analysis than CRM `Record_Type`. | Use mapped `support_pathway` values for Support CSAT where available. | Confirm with Contact Centre / CX operations. |
| Validate the business meaning of Resolved. | Resolved indicates the contact centre resolved the enquiry during the interaction without assistance from another business area. | Current definition accepted as working taxonomy. | Confirm with Contact Centre leads. |
| Validate the business meaning of Assisted. | Assisted indicates the contact centre resolved the enquiry during the interaction with assistance from another business area. | Assisted appears to have low usage in some outputs and may be underused or inconsistently applied. | Confirm whether agents regularly use this classification. |
| Validate the business meaning of Expert Enquiry. | Expert Enquiry indicates the enquiry could not be resolved during the interaction and was assigned to an expert to contact the customer. | Current definition accepted as working taxonomy. | Confirm with Contact Centre and service owners. |
| Investigate low Assisted usage. | Low Assisted usage may distort support pathway analysis by overstating Resolved or Expert Enquiry volumes. | Working hypothesis: Assisted may be underused, with some assisted interactions classified as Resolved. | Compare service-name patterns with operational practice and agent guidance. |

## Channel segmentation

### Accepted for current celebration analysis

Real-time and async support CSAT are not treated as separate Power BI measures.

They should be produced by filtering or grouping Support CSAT by channel type after Support CSAT mapping is governed.

Current classification rule:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

### Still to validate with business representatives

Confirm whether the channel classification is correct.

Questions to validate:

1. Should Phone, Live Chat, and Face-to-Face all be treated as real-time?
2. Should Email, Web, and other channels be treated as async?
3. Are there blended channels that need special treatment?
4. Is the Databricks channel field equivalent to the Power BI `Support_logic[channel]` field?
5. Should channel segmentation use `customer_intelligence.vwcase.Channel`, `vwsupport.channel`, or both?

## Summary of accepted assumptions for EOFY celebration analysis

| Area | Accepted assumption for current analysis |
|---|---|
| Customers | Service Account / portal sign-ups |
| Activity definition | Activity means application workflow activity |
| Permit lifecycle | Permit lifecycle statuses are not the primary Activity KPI |
| Pending Payment | Included in Activity |
| Draft | Included in Activity |
| Submitted | Included in Activity |
| Further information requested | Included in Activity |
| In Progress | Included in Activity |
| Withdrawn | Excluded unless later confirmed |
| Declined | Excluded unless later confirmed |
| Null period_start | Excluded from YoY calculation |
| Support demand | Use support rate rather than raw support cases |
| Support demand source | Use `vwsupport` |
| Support demand filter | `is_after_service_enablement = TRUE` |
| Activity CSAT | Use `customer_intelligence.vwcase` scoped to `vwservice_enablement` |
| Support CSAT | Use manually mapped support services only |
| Support CSAT production | Not yet a repeatable self-serve Genie metric |
| CSAT formula | Positive responses divided by total valid responses |
| Channel segmentation | Real-time vs async is a filter/grouping rule, not separate Power BI measures |

## Priority validation questions

1. Should Pending Payment remain included in the formal Activity KPI?
2. Should Draft applications always count as Activity?
3. Should Withdrawn and Declined count as activity, outcomes, or exclusions?
4. Should any categories be excluded from headline Activity?
5. What is the fallback date for records where `period_start` is null?
6. What Databricks logic reproduces `[Self-Service Support]` beyond the pilot `is_after_service_enablement = TRUE` rule?
7. Should Support CSAT mapping be implemented as a governed table or curated view?
8. Who owns the Support CSAT mapping?
9. How should the Support CSAT mapping be updated when new services are portal-enabled?
10. Which Databricks field should be used for support channel segmentation?
11. How should survey responses be linked back to support and activity logic?
12. Is Assisted underused or inconsistently applied by the contact centre?
13. Does the missing pre-enable Parking CSAT base reflect legacy-system migration?
## GA4 portal entry behaviour refresh

GA4 portal-entry behaviour can support the EOFY celebration story as contextual evidence, but the current Power BI visual is based on older CSV exports.

Before using GA4 values in the slide or supporting report, refresh the GA4 export and Power BI visuals.

### Refresh required

Refresh GA4 data for selected portal login and registration links, including:

- portal entries
- device mix
- entry pages to portal
- login vs sign-up destination split
- weekday pattern
- hour-of-day pattern
- source channel where available
- business-hours share where available

### Current position

Do not use the current GA4 values as final slide evidence.

Treat the existing visual as a layout and analysis pattern only.

### Validation questions

| Question | Decision needed |
|---|---|
| What is the refreshed GA4 reporting window? | Confirm start and end dates. |
| Are selected portal links representative enough for a supporting insight? | Confirm caveat wording. |
| Does GA4 track login and registration links consistently across key portal entry pages? | Validate event/link coverage. |
| Can refreshed GA4 data be reconciled with Service Account sign-ups or should it remain contextual only? | Keep separate unless reconciliation is validated. |

### Slide rule

GA4 should be used only as a supporting digital behaviour insight.

It should not replace the validated Databricks headline metrics for Customers, Activity, Support demand, Activity CSAT, or mapped Support CSAT.
## Current decision

For the EOFY celebration analysis, the current application workflow Activity definition is good enough to proceed.

The current support demand rate logic is good enough to proceed.

Activity CSAT is good enough to proceed using the portal-enabled service cohort.

Support CSAT is good enough for the celebration pilot only where the manually documented mapping and outputs are explicitly applied.

The validation items in this file should be treated as follow-up work for reusable reporting, dashboard refinement, governed Databricks assets, and production-grade SQL.
