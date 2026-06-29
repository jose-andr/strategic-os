# Metric Definitions

This file documents the working metric definitions for the Service Account EOFY celebration analysis.

The purpose of this file is to keep the pilot metrics clear, reproducible, and honest about assumptions.

These definitions are intended for the EOFY Service Account / Portal CX celebration pilot. They should not yet be treated as final enterprise reporting standards.

## Financial year

City of Melbourne financial year runs from July to June.

For SQL analysis, use half-open date windows:

    date_field >= start_date
    AND date_field < end_date

For the current celebration comparison:

| Comparison period | Financial year | Start date | End date |
|---|---|---:|---:|
| Previous FY | FY2024/25 | 2024-07-01 | 2025-07-01 |
| Current FY | FY2025/26 | 2025-07-01 | 2026-07-01 |

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
| CSAT on Support | Customer satisfaction related to mapped portal-relevant support pathways |
| All accounts | Total CRM account base, used as context only |

Important distinction:

- Customers does not mean all CRM accounts.
- Customers means Service Account / portal sign-ups.
- All accounts means the total CRM account base and is used only for context.
- Activity means application workflow activity, not permit lifecycle activity.
- Support should be shown as a rate, not as raw support volume.
- Activity CSAT and Support CSAT are separate metrics.
- Support CSAT must use the manually mapped support service list.

Existing Power BI measures should be treated as the first source of truth for business logic, then translated into reusable SQL templates where appropriate.

## Celebration metric frame

The one-slide EOFY celebration analysis uses this frame:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Better Activity CSAT
5. Support CSAT only where manually mapped and documented

## Source system principles

The pilot uses curated Databricks views where possible.

| Area | Pilot source |
|---|---|
| Customers | `datahub_datamart.customer_account_management.vwaccount` |
| Activity | `datahub_datamart.customer_account_management.vwpermit` |
| Support demand | `datahub_datamart.customer_account_management.vwsupport` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |
| CSAT | `datahub_datamart.customer_intelligence.vwcase` |
| CRM case descriptors | `datahub_refined.customer.vwcase` |
| Support CSAT mapping | Manual mapping documented in `20-support-csat-service-mapping.md` |

Do not use the following for pilot headline KPI production:

| Source | Decision |
|---|---|
| `customer_account_management.vwsupport_enriched` | Do not use for headline KPI production or CSAT calculation. Optional exploratory context only. |
| `customer_intelligence.vwsurvey_feedback` | Do not use unless later response-level survey validation is required. |
| `vwcase_survey` | Do not use for this pilot. |
| `Record_Type` | Do not use as a Support CSAT definition. CRM metadata only. |

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

### Current validated result

| Period | Customers |
|---|---:|
| Previous FY, FY2024/25 | 9,838 |
| Current FY, FY2025/26 | 15,570 |

Movement:

    +5,732 customers
    +58.3%

### Status

Validated as the pilot definition.

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

### Current validated result

| Period | Activity applications |
|---|---:|
| Previous FY, FY2024/25 | 2,209 |
| Current FY, FY2025/26 | 3,751 |

Movement:

    +1,542 applications
    +69.8%

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

- support occurred after the relevant service was enabled
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

### Current validated result

| Period | Support cases |
|---|---:|
| Previous FY, FY2024/25 | 10,976 |
| Current FY, FY2025/26 | 15,475 |

Movement:

    +4,499 support cases
    +41.0%

### Interpretation

Raw support volume increased, but this should not be used as the headline support story.

The headline support story should use Support per 100 activities.

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

### Current validated result

| Period | Activity applications | Support cases | Support per 100 activities |
|---|---:|---:|---:|
| Previous FY, FY2024/25 | 2,209 | 10,976 | 496.9 |
| Current FY, FY2025/26 | 3,751 | 15,475 | 412.6 |

Movement:

    Support per 100 activities reduced from 496.9 to 412.6.
    Relative reduction = about 17.0%.

### Interpretation

Raw support volume increased, but activity grew faster.

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

CSAT for survey responses in `customer_intelligence.vwcase` where the service belongs to the Service Account / portal-relevant service-name cohort.

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

### Current validated result

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2023/24 | 18 | 16 | 88.9% |
| Previous FY, FY2024/25 | 889 | 680 | 76.5% |
| Current FY, FY2025/26 | 1,721 | 1,387 | 80.6% |

### Interpretation

Activity CSAT improved from 76.5% to 80.6% between FY2024/25 and FY2025/26.

Valid responses increased from 889 to 1,721.

FY2023/24 should not be used as the main baseline because it has only 18 valid responses.

### Slide-safe wording

> Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Do not claim that portal enablement caused the improvement unless causality is supported.

### Status

Accepted for the EOFY celebration pilot.

## 9. Support CSAT

### Business question

How satisfied were customers with support interactions related to portal-relevant services?

### Slide label

CSAT on Support

### Business definition

Customer satisfaction related to mapped portal-relevant support pathways.

### Working definition

Support CSAT measures satisfaction for mapped portal-relevant support pathways.

For the EOFY celebration pilot, Support CSAT must use the manually documented support service mapping.

Support CSAT should only include CSAT cases where:

`customer_intelligence.vwcase.Service_Name`

matches a mapped:

`support_service_name`

### Sources

| Purpose | Source |
|---|---|
| CSAT responses | `datahub_datamart.customer_intelligence.vwcase` |
| Manual Support CSAT mapping documentation | `analytics/service-account/20-support-csat-service-mapping.md` |
| Working Databricks workspace mapping file | `/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md` |
| Canonical CRM case descriptors | `datahub_refined.customer.vwcase` |

### Do not calculate Support CSAT from

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

### Support pathway taxonomy

Support pathway should come from the mapped `support_pathway` value.

| Pathway | Business meaning |
|---|---|
| Resolved | Contact centre resolved the enquiry during the interaction without assistance from another business area. |
| Assisted | Contact centre resolved the enquiry during the interaction with assistance from another business area. |
| Expert Enquiry | Contact centre could not resolve the enquiry during the interaction, so the case was assigned to an expert to contact the customer. |

Low Assisted usage should be treated as a business validation question, not a confirmed conclusion about agent behaviour.

### Current status

Support CSAT is:

- valid for the celebration pilot only where the manual mapping and analysis outputs are explicitly documented
- not yet a repeatable self-serve Genie metric
- not yet implemented as a governed Databricks table or curated view
- dependent on developer / data platform support before production use

### Future production requirement

Create a governed mapping asset, such as:

`datahub_datamart.customer_account_management.support_csat_service_mapping`

or

`datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

### Status

Accepted for the celebration pilot only where manually mapped and documented.

Not productionised.

## 10. RPP Support CSAT proxy

### Business question

Did Residential Parking Permit support experience stabilise after migration?

### Business definition

A service-specific support pathway proxy for Residential Parking Permit support.

### Proxy purpose

Because direct portal-service CSAT does not provide a reliable pre-enable baseline for many portal-enabled services, a proxy was developed for Residential Parking Permit support.

This proxy uses enquiry/support services in the CRM that relate to the RPP customer support pathway.

It is intended to support pre/post impact analysis, not to replace the core Activity CSAT metric or the mapped Support CSAT definition.

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
- Do not present this as full Service Account Support CSAT.

### Status

Accepted as service-specific explanatory evidence only.

## 11. Portal service enablement

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
- define the Activity CSAT service cohort
- explain structural changes in activity, support, and CSAT
- support pre/post diagnostics where a valid pre-enable baseline exists
- avoid manually guessing which application services belong in the Service Account / portal scope

For Support CSAT, use the manual Support CSAT mapping. Do not infer Support CSAT from `vwservice_enablement` alone.

### Status

Validated as the portal service enablement bridge for the pilot.

## 12. Capability milestones

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
| Support demand source | `vwsupport` |
| Support demand numerator | Distinct `case_id` where `is_after_service_enablement = TRUE` |
| Support KPI | Support per 100 activities |
| Support enriched view | Excluded from headline KPI production and CSAT calculation |
| CSAT source | `customer_intelligence.vwcase` |
| Positive CSAT logic | `Satisfaction_Score_5 IN (4, 5)` |
| Activity CSAT filter | Portal-enabled service cohort from `vwservice_enablement` |
| Support CSAT filter | Manual mapped support service list only |
| Support CSAT production status | Not yet repeatable self-serve Genie metric |
| Real-time vs async CSAT | Channel segmentation rule, not separate Power BI measures |

## Current validated metric results

| Story point | Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement | Status |
|---|---|---:|---:|---:|---|
| More customers | Service Account / portal sign-ups | 9,838 | 15,570 | +58.3% | Validated |
| More self-service activity | Activity applications | 2,209 | 3,751 | +69.8% | Accepted |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 412.6 | about -17.0% | Accepted |
| Better Activity CSAT | Portal-enabled Activity CSAT | 76.5% | 80.6% | +4.1 pp | Accepted |
| Better Activity CSAT response base | Valid responses | 889 | 1,721 | +832 responses | Accepted |
| Support CSAT | Mapped support pathways | Manual analysis only | Manual analysis only | Do not claim unless mapping applied | Pilot only |

## Current slide-safe interpretation

The celebration slide can safely claim:

- Customer sign-ups increased by 58.3%.
- Application workflow activity increased by 69.8%.
- Support demand per 100 activities reduced by about 17.0%.
- Portal-enabled Activity CSAT improved from 76.5% to 80.6%.
- Valid Activity CSAT responses increased from 889 to 1,721.
- Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

The slide should not claim:

- Support CSAT improved overall unless the manual mapping has been applied.
- Portal enablement caused CSAT improvement.
- Pre/post enablement CSAT improved across the full portal service cohort.
- RPP Support CSAT proxy represents full Service Account Support CSAT.

## Current caveats

- These definitions are pilot definitions, not final enterprise reporting standards.
- `vwpermit_statused` logic exists in Power BI and has not yet been fully upstreamed into Databricks.
- Activity inclusion logic is accepted for this celebration slide but requires future business confirmation.
- Support demand logic is accepted for this celebration slide but requires future business confirmation before becoming a reusable reporting standard.
- Support CSAT requires a manually documented mapping and is not yet implemented as a governed Databricks asset.
- Support CSAT is not yet a repeatable self-serve Genie metric.
- FY2023/24 Activity CSAT response volume is very small, so it should not be used as the main baseline.
- Service name joins for Activity CSAT use normalised text matching and should be checked for unmatched services.
- No raw organisational data or customer-level data should be stored in this repository.
