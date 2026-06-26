# Metric Definitions

This file documents the working metric definitions for the Service Account EOFY celebration analysis.

The purpose of this file is to keep the pilot metrics clear, reproducible, and honest about assumptions.

These definitions are intended for the EOFY Service Account / Portal CX celebration pilot. They should not yet be treated as final enterprise reporting standards.

## Financial year

City of Melbourne financial year runs from July to June.

For SQL analysis, financial year is calculated using this logic:

    CASE
      WHEN month(date_field) >= 7 THEN year(date_field) + 1
      ELSE year(date_field)
    END AS financial_year

Example:

| Date | Financial year label |
|---|---|
| 2024-07-01 | FY2025 |
| 2025-06-30 | FY2025 |
| 2025-07-01 | FY2026 |

For the current EOFY comparison:

| Comparison period | Start date | End date |
|---|---:|---:|
| Previous FY | 2023-07-01 | 2024-06-30 |
| Current FY | 2024-07-01 | 2025-06-30 |

In SQL, use half-open date windows:

    date_field >= start_date
    AND date_field < end_date

For FY2025, the end date should therefore be:

    DATE('2025-07-01')

## Glossary alignment

This file should be read alongside:

`10-glossary.md`

For this EOFY celebration analysis, the slide language is intentionally simple.

| Slide term | Internal definition |
|---|---|
| Customers | Service Account / portal sign-ups |
| Activity | Application workflow activity through the portal |
| Support | Portal support demand relative to Activity |
| CSAT on Activity | Customer satisfaction related to portal-enabled application activity |
| CSAT on Support | Customer satisfaction related to support interactions |
| All accounts | Total CRM account base, used as context only |

Important distinction:

- Customers does not mean all CRM accounts.
- Customers means Service Account / portal sign-ups.
- All accounts means the total CRM account base and is used only for context.
- Activity means application workflow activity, not permit lifecycle activity.
- Support should be shown as a rate, not as raw support volume.

Existing Power BI measures should be treated as the first source of truth for business logic, then translated into reusable SQL templates where appropriate.

## Celebration metric frame

The one-slide EOFY celebration analysis uses this frame:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Better activity CSAT
5. Better support CSAT

## Source system principles

The pilot uses curated Databricks views where possible.

| Area | Pilot source |
|---|---|
| Customers | `datahub_datamart.customer_account_management.vwaccount` |
| Activity | `datahub_datamart.customer_account_management.vwpermit` |
| Support | `datahub_datamart.customer_account_management.vwsupport` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |
| CSAT | `datahub_datamart.customer_intelligence.vwcase` |

Do not use the following for pilot headline KPI production:

| Source | Decision |
|---|---|
| `customer_account_management.vwsupport_enriched` | Do not use for headline KPI production or CSAT calculation. Optional exploratory context only. |
| `customer_intelligence.vwsurvey_feedback` | Do not use unless later response-level survey validation is required. |
| `vwcase_survey` | Do not use for this pilot. |

## 1. Customers

### Business question

Did customer adoption of Service Account grow year on year?

### Slide label

Customers

### Business definition

Service Account / portal sign-ups.

### Working definition

Count of distinct accounts where:

- `customer_portal = TRUE`
- `first_account_portal_on_date` is within the reporting window

### Source

`datahub_datamart.customer_account_management.vwaccount`

### Required fields

| Concept | Field |
|---|---|
| Account identifier | `account_id` |
| Portal sign-up indicator | `customer_portal` |
| Portal sign-up date | `first_account_portal_on_date` |

### Power BI reference logic

    Account Sign-Ups =
    VAR StartDate = [Window Start]
    VAR EndDate = [Window End]
    RETURN
    CALCULATE (
        DISTINCTCOUNT ( vwaccount[account_id] ),
        KEEPFILTERS (
            FILTER (
                vwaccount,
                vwaccount[customer_portal] = TRUE ()
                    && vwaccount[first_account_portal_on_date] >= StartDate
                    && vwaccount[first_account_portal_on_date] < EndDate
            )
        )
    )

### SQL logic pattern

    COUNT(DISTINCT account_id)
    WHERE customer_portal = TRUE
      AND first_account_portal_on_date >= start_date
      AND first_account_portal_on_date < end_date

### Status

Validated as the pilot definition.

Final YoY result still required.

## 2. All accounts

### Business question

What is the total CRM account base for context?

### Slide role

Context only.

### Business definition

Total CRM accounts.

### Working definition

Count of distinct CRM accounts, independent of reporting date filters.

### Source

`datahub_datamart.customer_account_management.vwaccount`

### Required fields

| Concept | Field |
|---|---|
| Account identifier | `account_id` |

### Power BI reference logic

    All Accounts =
    CALCULATE (
        DISTINCTCOUNT ( vwaccount[account_id] ),
        REMOVEFILTERS ( 'Date Basis' ),
        REMOVEFILTERS ( 'Calendar Year' ),
        REMOVEFILTERS ( 'Calendar Month' ),
        REMOVEFILTERS ( 'Fiscal Year' ),
        REMOVEFILTERS ( 'Financial Quarter' )
    )

### Status

Validated as a context metric only.

Do not use this as the slide definition of Customers.

## 3. Activity

### Business question

Did customers complete more Service Account enabled activity year on year?

### Slide label

Activity

### Business definition

Application workflow activity through the portal.

### Working definition

Distinct applications where `application_status` is one of the accepted application workflow statuses.

For the EOFY celebration pilot, include:

| Included status |
|---|
| Draft |
| Submitted |
| Further information requested |
| In Progress |
| Pending Payment |

Exclude unless later confirmed:

| Excluded status |
|---|
| Withdrawn |
| Declined |
| Issued |
| Extended |
| Renewed |
| Lapsed |

### Source

`datahub_datamart.customer_account_management.vwpermit`

### Required fields

| Concept | Field |
|---|---|
| Application identifier | `application_id` |
| Activity date | `period_start` |
| Application workflow status | `application_status` |

### Date field

Use:

`vwpermit.period_start`

This is the current Databricks candidate equivalent for the Power BI `vwpermit[transaction_date]` logic.

### Working SQL logic pattern

    COUNT(DISTINCT application_id)
    WHERE LOWER(TRIM(application_status)) IN (
      'draft',
      'submitted',
      'further information requested',
      'in progress',
      'pending payment'
    )

## Current draft metric results

| Story point | Metric | Previous FY / baseline | Current FY / current period | Movement | Status |
|---|---|---:|---:|---:|---|
| More customers | Service Account / portal sign-ups | 5,500 | 9,838 | +78.9% | Validated |
| More self-service activity | Activity applications | 2,209 | 3,766 | +70.5% | Draft accepted |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 409.3 | -17.6% | Draft accepted |
| Better activity CSAT | Portal-enabled Activity CSAT | 18 responses / 88.9% | 888 responses / 76.5% | Do not frame as YoY improvement | Accepted with caveat |
| Better support CSAT | RPP Support CSAT proxy: Residential Parking expert enquiry | 69% post-portal impact | 78% current ELT period | +9 pts | Proxy accepted with caveat |

## Current slide-safe interpretation

The celebration slide can safely claim:

- Customer sign-ups increased by 78.9%.
- Application workflow activity increased by 70.5%.
- Support demand per 100 activities reduced by 17.6%.
- Portal-enabled Activity CSAT is strong at 76.5% from 888 current-year responses.
- Residential Parking expert support is showing signs of stabilisation, with proxy CSAT recovering from 69% post-portal to 78% in the current ELT period.

The slide should not claim:

- Activity CSAT improved year on year.
- Support CSAT improved overall across all Service Account services.
- Pre/post enablement CSAT improved across the full portal service cohort.
### Status

Accepted for the EOFY celebration pilot.

Not yet finalised as a reusable enterprise reporting standard.

## 4. Activity by category

### Business question

Which permit or service categories contributed most to activity growth?

### Working definition

Activity applications grouped by service, permit category, or other available category fields.

### Source

`datahub_datamart.customer_account_management.vwpermit`

Optional enrichment:

`datahub_datamart.customer_account_management.vwservice_enablement`

### Required fields

| Concept | Candidate field |
|---|---|
| Application identifier | `application_id` |
| Activity date | `period_start` |
| Application status | `application_status` |
| Service or permit category | To confirm from `vwpermit` |
| Service name | To confirm from `vwpermit` or service mapping |

### Status

Partially validated.

Use for driver analysis, not as a headline metric unless category mapping is confirmed.

## 5. Support cases

### Business question

How much support demand was created by customers using Service Account?

### Slide label

Support

### Business definition

Portal support demand.

### Working definition

Distinct support cases from `vwsupport` where:

- case is after service enablement
- support is related to a portal-enabled service

### Source

`datahub_datamart.customer_account_management.vwsupport`

### Required fields

| Concept | Field |
|---|---|
| Support case identifier | `case_id` |
| Support opened date | `date_time_opened` |
| Support closed date | `date_time_closed` |
| Support channel | `channel` |
| Account identifier | `account_id` |
| Service group | `service_group` |
| Ask service name | `ask_service_name` |
| Portal service name | `portal_service_name` |
| Portal enablement date | `portal_enable_date` |
| After enablement flag | `is_after_service_enablement` |

### Working SQL logic pattern

    COUNT(DISTINCT case_id)
    WHERE is_after_service_enablement = TRUE

### Status

Validated as the preferred support numerator source for the pilot.

Do not use `vwsupport_enriched` for headline support case counting.

## 6. Support per 100 activities

### Business question

Did support demand reduce relative to self-service activity?

### Slide label

Support

### Business definition

Portal support demand relative to Activity.

### Working definition

Support cases divided by Activity applications, multiplied by 100.

Formula:

    Support per 100 activities =
      distinct support cases / distinct activity applications * 100

Where:

| Component | Definition |
|---|---|
| Support cases | Distinct `vwsupport.case_id` where `is_after_service_enablement = TRUE` |
| Activity applications | Distinct `vwpermit.application_id` using accepted application workflow statuses |

### Sources

| Component | Source |
|---|---|
| Support numerator | `datahub_datamart.customer_account_management.vwsupport` |
| Activity denominator | `datahub_datamart.customer_account_management.vwpermit` |

### Current draft result

| Metric | Previous FY | Current FY | Movement |
|---|---:|---:|---:|
| Activity applications | 2,209 | 3,766 | +70.5% |
| Self-service support cases | 10,976 | 15,413 | +40.4% |
| Support per 100 activities | 496.9 | 409.3 | -17.6% |

### Interpretation

Raw support volume increased, but support demand reduced relative to activity.

This supports the celebration story:

> Less support demand relative to activity.

### Status

Accepted for the EOFY celebration pilot.

## 7. CSAT

### Business question

How satisfied were customers with portal-relevant services?

### Business definition

Percentage of valid survey responses with a satisfaction score of 4 or 5.

### Pilot source

`datahub_datamart.customer_intelligence.vwcase`

### Canonical descriptor source

Use `datahub_refined.customer.vwcase` as the canonical descriptor source for CRM case fields.

### Required fields

| Concept | Field |
|---|---|
| Survey completion date | `Survey_Completion_Date` |
| Satisfaction score | `Satisfaction_Score_5` |
| Service name | `Service_Name` |
| Service group | `Service_Group` |
| Channel | `Channel` |
| Case reference | `Case_Number` |
| Record type | `Record_Type` |

### CSAT formula

    CSAT =
      positive valid responses / total valid responses

Where:

    positive valid responses =
      Satisfaction_Score_5 IN (4, 5)

And:

    total valid responses =
      Satisfaction_Score_5 IS NOT NULL

Express as a percentage.

### Raw all-service CSAT baseline

This baseline is used only as a sanity check. It includes all surveyed services, not only Service Account / portal-relevant services.

| Metric | Previous FY | Current FY |
|---|---:|---:|
| Valid CSAT responses | 1,036 | 14,363 |
| Positive CSAT responses | 677 | 9,219 |
| CSAT | 65.3% | 64.2% |

### Interpretation caution

The response volume changes significantly between periods.

This may reflect survey coverage, rollout, sampling, operational, or data capture changes.

Do not use the all-service baseline as a celebration headline.

### Status

Pilot CSAT source validated.

## 8. Activity CSAT

### Business question

How satisfied were customers with portal-relevant application services?

### Slide label

CSAT on Activity

### Business definition

Customer satisfaction related to portal-enabled application activity.

### Working definition

CSAT for survey responses in `customer_intelligence.vwcase` where:

- the service belongs to the Service Account / portal-relevant service-name cohort
- the CRM `Record_Type` is `Apply`, where this field is available and validated

### Sources

| Purpose | Source |
|---|---|
| CSAT responses | `datahub_datamart.customer_intelligence.vwcase` |
| Portal service cohort | `datahub_datamart.customer_account_management.vwservice_enablement` |
| Canonical CRM case descriptors | `datahub_refined.customer.vwcase` |

### Portal-relevant service cohort logic

Identify portal-relevant services from:

`datahub_datamart.customer_account_management.vwservice_enablement`

using:

- `service_name`
- `service_group`
- `first_portal_enable_date`

For the main EOFY comparison, use the service-name cohort to compare CSAT across reporting windows.

Do not rely only on:

    Survey_Completion_Date >= first_portal_enable_date

as the main comparison rule.

Instead, use the enablement date as a diagnostic dimension for pre/post analysis.

### Service-name match

Join `customer_intelligence.vwcase` to `vwservice_enablement` using normalised service name:

    LOWER(TRIM(vwcase.Service_Name)) =
    LOWER(TRIM(vwservice_enablement.service_name))

This text match should be checked for unmatched services.

### Pre/post enablement diagnostic

Use pre/post enablement analysis to answer a separate diagnostic question:

> Did CSAT change after a service became portal-enabled?

This is different from the main EOFY comparison question:

> How satisfied were customers with the relevant service cohort this year compared with last year?

### Current draft result

The earlier post-enablement-only query returned:

| Metric | Previous FY | Current FY | Note |
|---|---:|---:|---|
| Portal-enabled Activity CSAT | 88.9% | 76.5% | Previous FY has only 18 valid responses. |

Current FY Activity CSAT:

    76.5% from 888 valid responses

### Interpretation caution

The Previous FY base is very small, with only 18 valid responses.

Avoid direct YoY improvement framing for the celebration slide unless a more stable service-cohort comparison is agreed.

Recommended interim slide wording:

> Strong satisfaction on portal-enabled activity: 76.5% CSAT from 888 current-year responses.

### Status

Source and CSAT formula validated.

Comparison method revised: use service-name cohort as the main comparison and pre/post enablement as diagnostic analysis.

## 9. Support CSAT
### RPP Support CSAT proxy

Because direct portal-service CSAT does not provide a reliable pre-enable baseline for many portal-enabled services, a proxy has been developed for Residential Parking Permit support.

This proxy uses enquiry/support services in the CRM that relate to the RPP customer support pathway.

It is intended to support pre/post impact analysis, not to replace the core Activity CSAT metric.

### Proxy purpose

The proxy helps answer:

> Did satisfaction with Residential Parking Permit support change after portal migration, and is it stabilising in the current ELT period?

### Proxy service labels

Current proxy service labels include:

| Service label |
|---|
| Residential parking enquiry - expert |
| Residential parking enquiry - resolved |
| Disabled or medical parking enquiry - expert |
| Disabled or medical parking enquiry - resolved |

### Proxy periods

| Period | Meaning |
|---|---|
| Pre-portal baseline | Support experience before the relevant portal migration / impact period. |
| Post-portal impact | Early post-portal support experience after migration. |
| Current ELT period | Current reporting period used for executive / ELT interpretation. |

### Power BI proxy support case measure

    RPP Proxy Support Cases =
    VAR StartDate =
        [RPP Analysis Start Date]
    VAR EndDate =
        [RPP Analysis End Date]
    VAR SelectedAskServices =
        VALUES ( 'RPP Proxy Support Service'[Ask Service Name Norm] )
    RETURN
    CALCULATE (
        DISTINCTCOUNT ( Support_logic[case_number] ),
        FILTER (
            Support_logic,
            Support_logic[case_created_date] >= StartDate
                && Support_logic[case_created_date] < EndDate
        ),
        TREATAS (
            SelectedAskServices,
            Support_logic[Ask Service Name Norm]
        )
    )

### Proxy interpretation

The proxy analysis indicates that the early post-portal CSAT decline was concentrated in Residential Parking support, particularly expert or escalated enquiries.

The current ELT period shows recovery for Residential parking enquiry - expert, improving from 69% in the post-portal impact period to 78% in the current ELT period.

This suggests service stabilisation:

> The most complex RPP support pathway is improving, although overall permit-support CSAT remains below the pre-portal baseline.

### Current proxy result notes

| Service label | Period | Proxy support cases | Survey responses | Low CSAT responses | Proxy support CSAT |
|---|---|---:|---:|---:|---:|
| Residential parking enquiry - expert | Pre-portal baseline | 3,159 | 212 | 42 | 74% |
| Residential parking enquiry - expert | Post-portal impact | 3,032 | 206 | 51 | 69% |
| Residential parking enquiry - expert | Current ELT period | 452 | 18 | 3 | 78% |
| Residential parking enquiry - resolved | Pre-portal baseline | 8,982 | 724 | 54 | 90% |
| Residential parking enquiry - resolved | Post-portal impact | 4,982 | 308 | 54 | 77% |
| Residential parking enquiry - resolved | Current ELT period | 712 | 37 | 6 | 78% |
| Disabled or medical parking enquiry - expert | Pre-portal baseline | 166 | 21 | 3 | 86% |
| Disabled or medical parking enquiry - expert | Post-portal impact | 267 | 36 | 3 | 89% |
| Disabled or medical parking enquiry - expert | Current ELT period | 62 | 3 | 1 | 67% |
| Disabled or medical parking enquiry - resolved | Pre-portal baseline | 1,199 | 82 | 6 | 91% |
| Disabled or medical parking enquiry - resolved | Post-portal impact | 1,043 | 81 | 6 | 85% |
| Disabled or medical parking enquiry - resolved | Current ELT period | 161 | 7 | 1 | 86% |

### Caveats

- This is a proxy, not a direct portal transaction CSAT measure.
- It depends on the selected RPP ask-service mapping.
- Current ELT period response counts are smaller, especially for Disabled or medical parking enquiry services.
- Use this for explanatory analysis and support-pathway stabilisation, not as the sole headline CSAT metric.
### Business question

How satisfied were customers with support interactions related to portal-relevant services?

### Slide label

CSAT on Support

### Business definition

Customer satisfaction related to support interactions.

### Working definition

CSAT for survey responses in `customer_intelligence.vwcase` that can be confidently interpreted as support interactions for the Service Account / portal context.

### Sources

| Purpose | Source |
|---|---|
| CSAT responses | `datahub_datamart.customer_intelligence.vwcase` |
| Portal service cohort | `datahub_datamart.customer_account_management.vwservice_enablement` |
| Support case logic | `datahub_datamart.customer_account_management.vwsupport` |
| Canonical CRM case descriptors | `datahub_refined.customer.vwcase` |

### Record Type caution

`Record_Type` is a CRM classification field.

The silver-layer descriptor defines `Record_Type` as:

    Defines the type of record associated with the service case, which can help in understanding the nature of the case.

For analysis:

| Record_Type | Working interpretation | Caution |
|---|---|---|
| `Ask` | Enquiry or request for information. | May indicate support-style demand, but should not be assumed to represent all Service Account support without validation. |
| `Apply` | Application-related case. | Closest fit for portal-enabled application activity CSAT. |
| `Report` | Customer lets Council know something needs attention. | Generally outside current Service Account headline scope unless linked to portal services. |
| `Object` | Customer contests or objects to a decision. | Generally outside current Service Account headline scope unless explicitly included later. |

### Current support filter candidate

`Record_Type = 'Ask'` is only a candidate support filter.

It should not be used as the final Support CSAT definition until validated against:

- service names
- channels
- `vwsupport` logic
- support case patterns
- business interpretation

### Channel segmentation

Support CSAT can be segmented by channel type.

Current working channel classification:

    CASE
      WHEN Channel IN ('Phone', 'Live Chat', 'Face-to-Face')
        THEN 'In Real-time'
      ELSE 'Async'
    END AS channel_type

This classification requires validation against the actual `Channel` values in `customer_intelligence.vwcase`.

### Status

Source confirmed.

Support CSAT filter and results still require validation.
## 10. Portal service enablement

### Business question

Which services were available through the portal, and from when?

### Source

`datahub_datamart.customer_account_management.vwservice_enablement`

### Required fields

| Concept | Field |
|---|---|
| Service identifier | `service_key` |
| Service group | `service_group` |
| Service name | `service_name` |
| First portal enablement date | `first_portal_enable_date` |

### Use in analysis

Use this table to:

- identify portal-enabled services
- filter CSAT to post-enablement responses
- explain structural changes in activity, support, and CSAT
- avoid manually guessing which services belong in the Service Account / portal scope

### Status

Validated as the portal service enablement bridge for the pilot.

## 11. Capability milestones

Metric interpretation should consider known capability milestones.

Milestones are documented in:

`14-capability-milestones.md`

Examples of milestone types that may affect metric movement:

- Salesforce or CRM changes
- Genesys introduction
- website platform changes
- digital assistant launch
- Service Account releases
- service migrations
- permit type additions
- major channel or operating model changes

Milestones should be considered before making YoY claims.

A metric movement may reflect a capability change rather than a pure performance change.

## Current accepted assumptions

| Area | Current accepted assumption |
|---|---|
| Customers | Service Account / portal sign-ups |
| All accounts | Total CRM accounts, context only |
| Activity | Application workflow activity |
| Activity included statuses | Draft, Submitted, Further information requested, In Progress, Pending Payment |
| Activity excluded statuses | Withdrawn, Declined, Issued, Extended, Renewed, Lapsed |
| Activity date | `vwpermit.period_start` |
| Support source | `vwsupport` |
| Support numerator | Distinct `case_id` where `is_after_service_enablement = TRUE` |
| Support KPI | Support per 100 activities |
| Support enriched view | Excluded from headline KPI production |
| CSAT source | `customer_intelligence.vwcase` |
| Positive CSAT logic | `Satisfaction_Score_5 IN (4, 5)` |
| Portal service filter | `vwservice_enablement` |
| Portal CSAT date rule | `Survey_Completion_Date >= first_portal_enable_date` |
| Support CSAT filter | Candidate: `Record_Type = 'Ask'` |
| Real-time vs async CSAT | Channel segmentation rule, not separate Power BI measures |

## Current draft metric results

| Story point | Metric | Previous FY | Current FY | Movement | Status |
|---|---|---:|---:|---:|---|
| More customers | Service Account / portal sign-ups | To calculate | To calculate | To calculate | Pending |
| More self-service activity | Activity applications | 2,209 | 3,766 | +70.5% | Draft accepted |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 409.3 | -17.6% | Draft accepted |
| Better activity CSAT | Portal-enabled Activity CSAT | 88.9% | 76.5% | Not recommended as YoY claim | Accepted with caveat |
| Better support CSAT | Support CSAT | To calculate | To calculate | To calculate | Pending |

## Current caveats

- These definitions are pilot definitions, not final enterprise reporting standards.
- `vwpermit_statused` logic exists in Power BI and has not yet been fully upstreamed into Databricks.
- Activity inclusion logic is accepted for this celebration slide but requires future business confirmation.
- Support CSAT still requires validation of the correct support interaction filter.
- Current FY and Previous FY CSAT response volumes are not directly comparable without considering survey coverage and capability milestones.
- Activity CSAT Previous FY response volume is very small, so direct YoY improvement framing is not recommended.
- Service name joins use normalised text matching and should be checked for unmatched services.
- No raw organisational data or customer-level data should be stored in this repository.
