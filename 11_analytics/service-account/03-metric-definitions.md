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
| Service Account sign-ups | Distinct accounts that first became portal-enabled during the reporting window |
| Portal service activity | Distinct portal-enabled application or permit lifecycle records created during the reporting window |
| Online application activity | Distinct applications in qualifying pre-outcome workflow stages |
| Support demand | Post-enablement support cases relative to Portal service activity |
| CSAT on Activity | Customer satisfaction related to portal-enabled services |
| CSAT on Support | Customer satisfaction related to mapped portal-relevant support pathways |
| All accounts | Total CRM account base, used as context only |

Important distinctions:

- Service Account sign-ups does not mean all CRM accounts.
- All accounts means the total CRM account base and is used only for context.
- Portal service activity is the broader lifecycle denominator used for the headline support-demand rate.
- Online application activity is a narrower diagnostic focused on pre-outcome application stages.
- Online application activity must not be used as the denominator for full portal support demand.
- Support demand should be shown as a rate, not as raw support volume.
- Activity CSAT and Support CSAT are separate metrics.
- Support CSAT must use the manually mapped support service list.

Existing Power BI measures and model logic are evidence of the current business implementation.

The governed definitions in this file must be translated into permanent Databricks Genie instructions and reproducible Databricks logic before they are treated as reusable production metrics.

## Celebration metric frame

The one-slide EOFY celebration analysis uses this frame:

1. More Service Account sign-ups
2. More portal service activity
3. Support demand relative to portal service activity
4. Better Activity CSAT
5. Support CSAT only where manually mapped and documented

Online application activity remains available as a supporting diagnostic but is not the denominator for the headline full-portal support metric.

Diagnostics such as account quality, service mapping quality, workflow status distribution, and knowledge-content performance must remain separate from headline celebration metrics.

## Source system principles

The pilot uses curated Databricks views where possible.

| Area | Pilot source |
|---|---|
| Service Account sign-ups | `datahub_datamart.customer_account_management.vwaccount` |
| Portal service activity | `datahub_datamart.customer_account_management.vwpermit` |
| Online application activity diagnostic | `datahub_datamart.customer_account_management.vwpermit` plus governed status mapping |
| Support demand | `datahub_datamart.customer_account_management.vwsupport` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |
| CSAT | `datahub_datamart.customer_intelligence.vwcase` |
| CRM case descriptors | `datahub_refined.customer.vwcase` |
| Support CSAT mapping | Manual mapping documented in `20-support-csat-service-mapping.md` |

Do not use the following for pilot headline KPI production:

| Source or field | Decision |
|---|---|
| `customer_intelligence.vwsurvey_feedback` | Do not use unless later response-level survey validation is required. |
| `vwcase_survey` | Do not use for this pilot. |
| `Record_Type` | Do not use as a Support CSAT definition. CRM metadata only. |
| Knowledge article tables | Use only for separate knowledge and self-help diagnostics unless a governed metric is added. |

## 1. Service Account sign-ups

### Business question

Did customer adoption of Service Account grow year on year?

### Slide label

Service Account sign-ups

### Business definition

Distinct accounts that first became portal-enabled during the reporting window.

### Working definition

Count distinct accounts where:

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

### Current reconciliation references

Existing repo benchmark:

| Period | Service Account sign-ups |
|---|---:|
| FY2024/25 | 9,838 |
| FY2025/26 | 15,570 |

Latest Genie output:

| Period | Service Account sign-ups |
|---|---:|
| FY2024/25 | 9,837 |
| FY2025/26 | 15,699 |

Latest Genie movement:

    +5,862 sign-ups
    +59.6%

### Validation status

The definition is stable.

The current output values require reconciliation before final slide lock because the latest Genie output differs from the existing benchmark.

### Slide-safety rule

Use the latest values only after confirming:

- source table
- distinct account identifier
- portal indicator filter
- sign-up date field
- reporting windows
- source refresh date
- reason for the difference from the previous benchmark

### Status

Definition aligned.

Values require reconciliation before final slide lock.

## 2. All accounts

### Business question

What is the total CRM account base for context?

### Slide role

Context only.

### Business definition

Total CRM accounts.

### Working definition

Count distinct CRM accounts, independent of reporting date filters.

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

Do not use this as the slide definition of Service Account sign-ups.

## 3. Portal service activity

### Business question

How much portal-enabled service activity occurred across the full customer service lifecycle?

### Slide label

Portal service activity

### Business definition

Distinct application or permit lifecycle records associated with portal-enabled services, using the related CRM case creation date as the activity date.

This metric represents the broader portal service lifecycle available to customers.

It includes activity associated with applying for, progressing, receiving, renewing, extending, or managing a permit or portal-enabled service.

### Working definition

Count distinct `application_id` values where:

- the related CRM case has a valid creation date
- the related service has a valid first portal enablement date
- the related CRM case creation date is on or after the service's first portal enablement date
- the related CRM case creation date falls within the reporting window

Do not apply an application-status filter to the headline Portal service activity metric.

### Included lifecycle scope

The metric may include application or permit records with statuses such as:

- Draft
- Submitted
- In Progress
- Further Information Requested
- Pending Payment
- Withdrawn
- Declined
- Issued
- Extended
- Renewed
- Lapsed

The presence of these statuses does not mean each status is counted as a separate activity event.

The metric counts distinct `application_id`.

### Governed sources

| Purpose | Source |
|---|---|
| Application and permit lifecycle records | `datahub_datamart.customer_account_management.vwpermit` |
| Related CRM case creation date | `datahub_refined.customer.vwcase` |
| Related service name and group | `datahub_refined.customer.vwcase` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |

### Required fields

| Concept | Field |
|---|---|
| Activity identifier | `vwpermit.application_id` |
| Related case identifier | `vwpermit.case_id` |
| Activity timestamp | Related CRM case creation timestamp |
| Related service name | CRM case service name |
| Related service group | CRM case service group |
| First portal enablement date | `vwservice_enablement.first_portal_enable_date` |

### Activity date

The activity date is the creation date of the CRM case associated with the application or permit lifecycle record.

Power BI lineage:

`vwcase.case_created_date`  
→ `DimCase[CaseCreatedDate]`  
→ related to `vwpermit` through `case_id`  
→ `vwpermit[transaction_date]`

The Power BI `transaction_date` field is a calculated date-only value:

    transaction_date =
        DATE (
            YEAR ( RELATED ( DimCase[CaseCreatedDate] ) ),
            MONTH ( RELATED ( DimCase[CaseCreatedDate] ) ),
            DAY ( RELATED ( DimCase[CaseCreatedDate] ) )
        )

Do not use `vwpermit.period_start` as the portal activity date.

`period_start` represents the permit period start and does not represent when the digital service activity began.

Do not describe `transaction_date` as a native Databricks field.

In Databricks and Genie, use the related CRM case creation timestamp directly.

### Portal enablement condition

A record is eligible only where:

- the related service has a nonblank `first_portal_enable_date`
- the activity date is on or after `first_portal_enable_date`

Portal enablement is a service-level milestone indicating when the service became available through the portal.

Portal-facing display-name mappings do not determine activity eligibility.

Fields such as the following are diagnostic or presentation controls only:

- `portal_service_mapping_result`
- `portal_mapping_status`
- `service_requires_business_confirmation`
- `requires_business_confirmation`

They must not automatically exclude an otherwise qualifying record.

### Power BI reference logic

    Self-Service Activity =
    VAR StartDate = [Window Start]
    VAR EndDate = [Window End]
    RETURN
        CALCULATE (
            DISTINCTCOUNT ( vwpermit[application_id] ),
            KEEPFILTERS (
                FILTER (
                    vwpermit,
                    vwpermit[transaction_date] >= StartDate
                        && vwpermit[transaction_date] < EndDate
                        && NOT ISBLANK (
                            RELATED ( DimService[first_portal_enable_date] )
                        )
                        && vwpermit[transaction_date]
                            >= RELATED ( DimService[first_portal_enable_date] )
                )
            )
        )

The Power BI measure name may remain `Self-Service Activity` temporarily.

The governed documentation and Genie language should use `Portal service activity`.

### Reporting window

`[Window Start]` and `[Window End]` are Power BI measures controlled by the dashboard date selection.

The governed metric is not dependent on a specific Power BI slicer implementation.

Any Databricks or Genie implementation must receive explicit start and end dates and apply the same half-open date-window logic.

### Databricks translation requirements

The reusable Databricks implementation must:

1. Start from `datahub_datamart.customer_account_management.vwpermit`.
2. Join the related CRM case using `case_id`.
3. Use the related CRM case creation timestamp as the activity date.
4. Obtain the related service name from the CRM case.
5. Join the related service to `vwservice_enablement`.
6. Require a nonblank `first_portal_enable_date`.
7. Require the CRM case creation timestamp to be on or after first portal enablement.
8. Apply the requested half-open reporting window.
9. Count distinct `application_id`.
10. Do not filter application status for the headline Portal service activity metric.

### Conceptual SQL pattern

    COUNT(DISTINCT permit.application_id)

    WHERE case.case_created_date >= start_date
      AND case.case_created_date < end_date
      AND enablement.first_portal_enable_date IS NOT NULL
      AND case.case_created_date >= enablement.first_portal_enable_date

The exact CRM case field names, service join, and service-name normalisation must be validated in Databricks before this becomes a production SQL standard.

### Current Power BI support-rate test

The Portal service activity denominator was tested indirectly through the current Power BI support-rate measures.

| Period | Support cases per 100 portal service activities |
|---|---:|
| FY2024/25 | 28.57 |
| FY2025/26 | 34.86 |

Direct denominator values must be recorded from Power BI or reproduced in Databricks before being treated as validated output.

Do not treat denominator values inferred from rounded rates as final.

### Interpretation

Portal service activity is the appropriate denominator for full portal support because customers can use the portal across the broader service lifecycle, not only during pre-outcome application stages.

### Current validation status

The business definition has been selected.

The Power BI rate has been tested.

Pending:

- direct Portal service activity counts
- Databricks replication
- permanent Genie instruction
- source and join validation
- service-name match diagnostics
- final slide decision

### Status

Business definition selected.

Not yet fully validated in Databricks.

## 3A. Online application activity diagnostic

### Business question

How much activity occurred in pre-outcome online application workflow stages?

### Role

Supporting diagnostic only.

This metric is not the denominator for full portal support demand.

### Slide label

Online applications

### Business definition

Distinct applications in qualifying pre-outcome workflow stages.

This metric represents online application workflow activity rather than the full permit or service lifecycle.

### Qualifying workflow stages

| Application status | Workflow bucket | Workflow order |
|---|---|---:|
| Draft | Draft | 10 |
| Submitted | Submitted | 20 |
| In Progress | In Progress | 30 |
| Further Information Requested | In Assessment | 40 |
| Pending Payment | Pending Payment | 50 |

`In Progress` is a separate workflow stage.

It must not be grouped under Draft.

Submitted must appear before In Progress in the governed workflow sequence.

### Excluded workflow stages

Exclude outcomes and permit lifecycle states, including:

- Withdrawn
- Declined
- Issued
- Extended
- Renewed
- Lapsed

These states may be used for workflow or lifecycle diagnostics, but they are not part of the Online application activity diagnostic.

### Working definition

Count distinct `application_id` values where:

- the workflow bucket is one of the five qualifying pre-outcome stages
- the related CRM case creation date falls within the reporting window
- the related service has a valid first portal enablement date
- the related CRM case creation date is on or after first portal enablement

### Governed sources

| Purpose | Source |
|---|---|
| Application records | `datahub_datamart.customer_account_management.vwpermit` |
| Related CRM case creation date | `datahub_refined.customer.vwcase` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |
| Workflow status classification | Governed status mapping derived from the Power BI `Status Map` logic |

### Status mapping logic

Application status classification follows this precedence:

1. Match on `application_status + case_status`.
2. When no specific match exists, use the `application_status` mapping where `case_status = "Any"`.

The status mapping must produce:

- status display name
- application workflow bucket
- application workflow order
- application outcome indicator
- permit lifecycle bucket
- activity inclusion indicator
- mapping diagnostics

### Governed status map

| Application status | Case status | Display name | Workflow bucket | Workflow order | Include in application diagnostic |
|---|---|---|---|---:|---:|
| Draft | Any | Draft | Draft | 10 | 1 |
| Submitted | Any | Submitted | Submitted | 20 | 1 |
| In Progress | Any | In Progress | In Progress | 30 | 1 |
| Further Information Requested | Any | Further Information Requested | In Assessment | 40 | 1 |
| Pending Payment | Any | Pending Payment | Pending Payment | 50 | 1 |
| Withdrawn | Draft | Withdrawn from Draft | Draft Stopped | 60 | 0 |
| Lapsed | Draft | Draft Lapsed | Draft Lapsed | 65 | 0 |
| Withdrawn | Closed | Withdrawn | Withdrawn Outcome | 70 | 0 |
| Withdrawn | Any | Withdrawn | Withdrawn Outcome | 70 | 0 |
| Declined | Any | Declined | Declined Outcome | 80 | 0 |
| Issued | Any | Issued | Issued Outcome | 90 | 0 |
| Renewed | Any | Renewed | Renewal Outcome | 90 | 0 |
| Extended | Any | Extended | Not Application Workflow | 99 | 0 |
| Lapsed | Closed | Lapsed | Lapsed Permit | 99 | 0 |
| Lapsed | Any | Lapsed | Lapsed Permit | 99 | 0 |

### Power BI reference model

Power BI uses the transformed table:

`vwpermit_statused`

The table is derived from `vwpermit` and enriched with:

- workflow status mappings
- related case service fields
- portal display mappings
- activity date
- portal enablement date

Relationship path:

`DimService[service_name]`  
→ `DimCase[service_name]`  
→ `vwpermit_statused[case_id]`

The relationship from `vwpermit_statused` to `DimCase` is:

- active
- many-to-one
- single direction from `DimCase` to `vwpermit_statused`

For the pilot model, assume `service_name` maps one-to-one to the relevant service record.

A future production model should introduce a stable service key if duplicate service names are identified.

### Power BI activity-date column

    activity_date =
    VAR CaseCreatedDate =
        RELATED ( DimCase[CaseCreatedDate] )
    RETURN
        IF (
            ISBLANK ( CaseCreatedDate ),
            BLANK (),
            DATE (
                YEAR ( CaseCreatedDate ),
                MONTH ( CaseCreatedDate ),
                DAY ( CaseCreatedDate )
            )
        )

### Power BI portal-enablement column

    portal_enable_date =
        RELATED ( DimService[first_portal_enable_date] )

### Power BI reference measure

    Digital Self-Service Activity =
    VAR StartDate = [Window Start]
    VAR EndDate = [Window End]
    RETURN
        CALCULATE (
            DISTINCTCOUNT ( vwpermit_statused[application_id] ),
            KEEPFILTERS (
                FILTER (
                    vwpermit_statused,
                    vwpermit_statused[activity_date] >= StartDate
                        && vwpermit_statused[activity_date] < EndDate
                        && NOT ISBLANK (
                            vwpermit_statused[portal_enable_date]
                        )
                        && vwpermit_statused[activity_date]
                            >= vwpermit_statused[portal_enable_date]
                        && vwpermit_statused[application_workflow_bucket]
                            IN {
                                "Draft",
                                "Submitted",
                                "In Progress",
                                "In Assessment",
                                "Pending Payment"
                            }
                )
            )
        )

### Current Power BI test result

| Period | Online application activity |
|---|---:|
| FY2024/25 | 5,674 |
| FY2025/26 | 8,739 |

Movement:

    +3,065 applications
    +54.0%

### Interpretation

This metric describes growth in online application workflow activity.

It must not be divided into the full portal support numerator because that numerator includes support across the broader service and permit lifecycle.

### Status

Validated as a supporting Power BI diagnostic.

Not the governed support-rate denominator.

Pending Databricks replication.

## 4. Activity by category

### Business question

Which services, service groups, or workflow stages contributed most to portal activity growth?

### Working definition

Portal service activity grouped by governed dimensions such as:

- service
- service group
- permit category
- application status
- application workflow bucket
- permit lifecycle bucket

### Headline category analysis

For analysis of the full portal lifecycle, inherit the Portal service activity eligibility logic from Section 3.

Do not apply a workflow-stage filter unless the analysis is explicitly labelled as Online application activity.

### Online application diagnostic analysis

For pre-outcome workflow analysis, inherit the Online application activity eligibility logic from Section 3A.

### Sources

Primary sources:

- `datahub_datamart.customer_account_management.vwpermit`
- `datahub_refined.customer.vwcase`
- `datahub_datamart.customer_account_management.vwservice_enablement`

### Required fields

| Concept | Candidate field |
|---|---|
| Application identifier | `application_id` |
| Activity date | Related CRM case creation date |
| Application status | `application_status` |
| Case status | `case_status` |
| Workflow bucket | Governed status map |
| Permit lifecycle bucket | Governed status map |
| Service group | Related CRM case service group |
| Service name | Related CRM case service name |
| Permit category | Confirm from `vwpermit` |

### Rules

All category analysis must inherit the same:

- reporting window
- portal enablement condition
- distinct application count
- activity-date definition

Do not use `period_start` as the portal activity date.

Do not mix the full lifecycle measure and pre-outcome application diagnostic without clear labelling.

### Status

Partially validated.

Use for driver analysis, not as a headline metric unless category mapping is confirmed.

## 5. Portal support cases

### Business question

How much support demand was created after relevant services became portal-enabled?

### Slide role

Numerator for the Portal Support Demand Rate.

### Business definition

Distinct support cases created after the relevant service became portal-enabled.

### Working definition

Count distinct `case_id` values where:

- `case_created_date` falls within the reporting window
- `is_after_service_enablement = TRUE`

### Source

`datahub_datamart.customer_account_management.vwsupport`

### Required fields

| Concept | Field |
|---|---|
| Support case identifier | `case_id` |
| Support creation date | `case_created_date` |
| Support opened timestamp | `date_time_opened`, diagnostic only where needed |
| Support closed timestamp | `date_time_closed`, diagnostic only where needed |
| Support channel | `channel` |
| Account identifier | `account_id` |
| Service group | `service_group` |
| Ask service name | `ask_service_name` |
| Portal service name | `portal_service_name` |
| Portal enablement date | `portal_enable_date` |
| After enablement flag | `is_after_service_enablement` |

### Power BI reference logic

    Self-Service Support =
    VAR StartDate = [Window Start]
    VAR EndDate = [Window End]
    RETURN
        CALCULATE (
            DISTINCTCOUNT ( Support_logic[case_id] ),
            KEEPFILTERS (
                FILTER (
                    Support_logic,
                    Support_logic[case_created_date] >= StartDate
                        && Support_logic[case_created_date] < EndDate
                        && Support_logic[is_after_service_enablement] = TRUE ()
                )
            )
        )

### SQL logic pattern

    COUNT(DISTINCT case_id)

    WHERE case_created_date >= start_date
      AND case_created_date < end_date
      AND is_after_service_enablement = TRUE

### Current Power BI test result

| Period | Portal support cases |
|---|---:|
| FY2024/25 | 10,976 |
| FY2025/26 | 13,910 |

Movement:

    +2,934 support cases
    +26.7%

### Support-service scope

The current numerator includes support across the broader portal-enabled service lifecycle.

Examples include:

- application support
- permit-management support
- renewals and extensions
- active permit enquiries
- service-specific resolved enquiries
- assisted enquiries
- expert enquiries

This broader scope is intentional for the Portal Support Demand Rate.

It must not be divided by the narrower Online application activity diagnostic.

### Interpretation

Raw support volume increased.

Raw support cases should not be used as the headline support story without the Portal service activity denominator.

### Validation status

The numerator definition is aligned with the Power BI measure.

Databricks must reproduce the same result before the values are treated as governed production outputs.

### Status

Power BI logic tested.

Pending Databricks and Genie replication.

## 6. Portal Support Demand Rate

### Business question

How much support demand occurred relative to activity across the full portal-enabled service lifecycle?

### Slide label

Support demand

### Business definition

Distinct post-enablement support cases divided by distinct Portal service activities, multiplied by 100.

### Formula

    Portal Support Demand Rate =
      distinct qualifying portal support cases
      / distinct qualifying portal service activities
      * 100

### Numerator

Use the Portal support cases definition in Section 5.

The numerator counts distinct support cases where:

- the support case creation date falls within the reporting window
- `is_after_service_enablement = TRUE`

### Denominator

Use the Portal service activity definition in Section 3.

The denominator counts distinct `application_id` values where:

- the related CRM case creation date falls within the same reporting window
- the related service has a nonblank first portal enablement date
- the related CRM case creation date is on or after first portal enablement

Do not apply an application-status filter to the headline denominator.

### Power BI reference formula

    Self-Service Support Rate =
        DIVIDE (
            [Self-Service Support],
            [Self-Service Activity]
        ) * 100

The current Power BI measure name may remain temporarily.

The governed documentation, Genie instructions, and slide language should use Portal Support Demand Rate.

### Current Power BI result

| Metric | FY2024/25 | FY2025/26 |
|---|---:|---:|
| Distinct portal support cases | 10,976 | 13,910 |
| Support cases per 100 portal service activities | 28.57 | 34.86 |

Movement:

    +6.29 support cases per 100 portal service activities
    +22.0%

### Interpretation

The metric represents support demand across the broader portal-enabled service lifecycle.

It includes support related to customers:

- applying for services
- progressing applications
- receiving outcomes
- managing active permits
- renewing or extending permits
- requesting service-specific assistance

The current result indicates that support demand increased relative to Portal service activity.

Do not describe this result as reduced support demand.

### Slide wording

Slide-safe factual wording:

> Support demand was 34.9 cases per 100 portal service activities.

Comparison wording:

> Support demand increased from 28.6 to 34.9 cases per 100 portal service activities.

Do not use celebratory language for this result.

### Distinction from application support

This is not an application-only support rate.

A future application-support metric would require a separately governed numerator restricted to support pathways directly associated with pre-outcome application activity.

### Denominator labelling

Use:

> support cases per 100 portal service activities

Do not label the denominator as:

- online applications
- customers
- permit applications
- transactions

unless the metric uses that specific governed denominator.

### Previous output reconciliation

Earlier outputs included rates such as:

- 513.1 to 491.9 support cases per 100 applications
- 496.9 to 412.6 support cases per 100 activities
- approximately 30 support cases per 100 transactions

These outputs used different denominator definitions.

They must not be treated as interchangeable with the Portal Support Demand Rate.

The current Power BI test of 28.57 to 34.86 aligns most closely with the broader full-lifecycle denominator.

### Required reconciliation record

Before the metric is used on the EOFY slide, record:

- support numerator
- Portal service activity denominator
- support rate per 100
- support source table
- support date field
- support filters
- activity source tables
- activity date field
- portal enablement condition
- reporting windows
- join keys
- service-name normalisation
- unmatched service records
- duplicate application records
- source refresh date
- explanation of differences from previous outputs

### Required conformance checks

Confirm:

1. The numerator counts distinct `vwsupport.case_id`.
2. The numerator uses `case_created_date`.
3. The numerator applies `is_after_service_enablement = TRUE`.
4. The denominator counts distinct `vwpermit.application_id`.
5. The denominator uses the related CRM case creation date.
6. The denominator does not use `period_start`.
7. The denominator does not apply an application-status filter.
8. The denominator applies the portal enablement condition.
9. The numerator and denominator use the same reporting window.
10. The result can be reproduced in both Power BI and Databricks.

### Required Genie output

For every calculation, Genie must return:

1. reporting periods
2. support numerator values
3. Portal service activity denominator values
4. support cases per 100 Portal service activities
5. absolute and relative changes
6. support source and date field
7. activity sources and date field
8. join keys
9. portal enablement filters
10. duplicate and unmatched-service diagnostics
11. whether the output matches this definition
12. whether the result is slide-safe

### Current validation status

The business definition has been selected.

The Power BI result has been tested.

Direct Portal service activity counts have not yet been recorded.

The Databricks and Genie implementation has not yet been reconciled.

### Slide-safety rule

Do not publish the comparison result until:

1. direct denominator values are recorded
2. Databricks reproduces the same logic
3. differences from previous outputs are explained
4. the result is marked slide-safe in the analysis log

### Status

Business definition selected.

Power BI rate tested.

Pending Databricks and Genie replication.

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
      positive valid responses
      / total valid responses

Where:

    positive valid responses =
      Satisfaction_Score_5 IN (4, 5)

And:

    total valid responses =
      Satisfaction_Score_5 IS NOT NULL

Express as a percentage.

### Raw all-service CSAT baseline

This baseline is used only as a sanity check.

It includes all surveyed services, not only Service Account or portal-relevant services.

| Metric | FY2024/25 | FY2025/26 |
|---|---:|---:|
| Valid CSAT responses | 1,036 | 14,363 |
| Positive CSAT responses | 677 | 9,219 |
| CSAT | 65.3% | 64.2% |

### Interpretation caution

The response volume changes significantly between periods.

This may reflect changes in:

- survey coverage
- rollout
- sampling
- operations
- data capture

Do not use the all-service baseline as a celebration headline.

### Status

Pilot CSAT source validated.

## 8. Activity CSAT

### Business question

How satisfied were customers with portal-relevant services?

### Slide label

CSAT on Activity

### Business definition

Customer satisfaction related to portal-enabled services.

### Working definition

CSAT for survey responses in `customer_intelligence.vwcase` where the service belongs to the Service Account or portal-relevant service cohort.

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

Use the enablement date as a diagnostic dimension for separate pre/post analysis.

### Service-name match

Join `customer_intelligence.vwcase` to `vwservice_enablement` using normalised service name:

    LOWER(TRIM(vwcase.Service_Name)) =
    LOWER(TRIM(vwservice_enablement.service_name))

Check and record unmatched services.

### Pre/post enablement diagnostic

Use pre/post enablement analysis to answer:

> Did CSAT change after a service became portal-enabled?

This is separate from the main EOFY comparison:

> How satisfied were customers with the relevant service cohort this year compared with last year?

### Current validated result

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2023/24 | 18 | 16 | 88.9% |
| FY2024/25 | 889 | 680 | 76.5% |
| FY2025/26 | 1,721 | 1,387 | 80.6% |

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
| Manual Support CSAT mapping documentation | `20-support-csat-service-mapping.md` |
| Working Databricks workspace mapping file | `/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md` |
| Canonical CRM case descriptors | `datahub_refined.customer.vwcase` |

### Do not calculate Support CSAT from

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
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
- dependent on developer or data-platform support before production use

### Future production requirement

Create a governed mapping asset, such as:

`datahub_datamart.customer_account_management.support_csat_service_mapping`

or:

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

Direct portal-service CSAT does not provide a reliable pre-enable baseline for many portal-enabled services.

A proxy was therefore developed for Residential Parking Permit support.

This proxy uses CRM enquiry and support services related to the RPP customer support pathway.

It supports pre/post impact analysis.

It does not replace:

- Activity CSAT
- mapped Support CSAT
- direct portal transaction CSAT

### Proxy service labels

| Service label |
|---|
| Residential parking enquiry - expert |
| Residential parking enquiry - resolved |
| Disabled or medical parking enquiry - expert |
| Disabled or medical parking enquiry - resolved |

### Proxy periods

| Period | Meaning |
|---|---|
| Pre-portal baseline | Support experience before the relevant portal migration or impact period |
| Post-portal impact | Early post-portal support experience after migration |
| Current ELT period | Current reporting period used for executive interpretation |

### Proxy interpretation

The proxy analysis indicates that the early post-portal CSAT decline was concentrated in Residential Parking support, particularly expert or escalated enquiries.

The current ELT period shows recovery for Residential parking enquiry - expert, improving from 69% in the post-portal impact period to 78% in the current ELT period.

Slide interpretation:

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
- Current ELT response counts are smaller, especially for Disabled or medical parking enquiry services.
- Use this for explanatory analysis and support-pathway stabilisation.
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

### Power BI reference dimension

`DimService` is derived from `vwservice_enablement`.

It:

- retains `service_name`
- retains `service_group`
- retains `first_portal_enable_date`
- trims service names and groups
- deduplicates on `service_name + service_group`
- adds portal-facing display mappings
- falls back to backend service names where no display mapping exists

Portal display mappings do not change `first_portal_enable_date`.

### Use in analysis

Use this source to:

- identify portal-enabled services
- enforce the Portal service activity eligibility date
- enforce the Online application activity eligibility date
- define the Activity CSAT service cohort
- explain structural changes in activity, support, and CSAT
- support pre/post diagnostics where a valid baseline exists
- avoid manually guessing which services belong in portal scope

For Support CSAT, use the manual Support CSAT mapping.

Do not infer Support CSAT from `vwservice_enablement` alone.

### Status

Validated as the portal service enablement bridge for the pilot.

## 12. Capability milestones

Metric interpretation should consider known capability milestones.

Milestones are documented in:

`14-capability-milestones.md`

Examples include:

- Salesforce or CRM changes
- Genesys introduction
- website platform changes
- digital assistant launch
- Service Account releases
- service migrations
- permit type additions
- major channel changes
- operating model changes

Milestones should be considered before making year-on-year claims.

A metric movement may reflect a capability change rather than a pure performance change.

## Current accepted assumptions

| Area | Current accepted assumption |
|---|---|
| Service Account sign-ups | Distinct portal-enabled accounts using `first_account_portal_on_date` |
| All accounts | Total CRM accounts, context only |
| Portal service activity | Distinct `application_id` across the broader portal-enabled lifecycle |
| Portal service activity date | Related CRM case creation date |
| Portal service activity status filter | No application-status filter |
| Online application activity | Distinct applications in qualifying pre-outcome workflow stages |
| Included application diagnostic stages | Draft, Submitted, In Progress, In Assessment, Pending Payment |
| Excluded application diagnostic stages | Withdrawn, Declined, Issued, Extended, Renewed, Lapsed |
| Permit period start | Not used as the portal activity date |
| Portal eligibility | Activity date must be on or after first portal enablement |
| Support source | `vwsupport` |
| Support numerator | Distinct `case_id` where `is_after_service_enablement = TRUE` |
| Support date | `case_created_date` |
| Headline support KPI | Support cases per 100 Portal service activities |
| Online application support rate | Not currently governed |
| CSAT source | `customer_intelligence.vwcase` |
| Positive CSAT logic | `Satisfaction_Score_5 IN (4, 5)` |
| Activity CSAT filter | Portal-enabled service cohort from `vwservice_enablement` |
| Support CSAT filter | Manual mapped support service list only |
| Support CSAT production status | Not yet a repeatable self-serve Genie metric |
| Knowledge article metrics | Separate diagnostics only |
| Real-time vs asynchronous CSAT | Channel segmentation rule, not separate Power BI measures |

## Current metric result status

| Story point | Metric | FY2024/25 | FY2025/26 | Movement | Status |
|---|---|---:|---:|---:|---|
| More sign-ups | Service Account sign-ups | 9,837 latest Genie | 15,699 latest Genie | +59.6% | Reconcile before slide lock |
| Portal lifecycle activity | Portal service activity | Direct count pending | Direct count pending | Pending | Not yet reconciled |
| Online application diagnostic | Pre-outcome online applications | 5,674 | 8,739 | +54.0% | Power BI diagnostic |
| Portal support volume | Distinct post-enablement support cases | 10,976 | 13,910 | +26.7% | Power BI test |
| Portal support demand | Support cases per 100 Portal service activities | 28.57 | 34.86 | +22.0% | Power BI test; Databricks pending |
| Better Activity CSAT | Portal-enabled Activity CSAT | 76.5% | 80.6% | +4.1 pp | Accepted |
| Better Activity CSAT response base | Valid responses | 889 | 1,721 | +832 responses | Accepted |
| Support CSAT | Mapped support pathways | Manual analysis only | Manual analysis only | Do not claim unless mapping applied | Pilot only |

## Current slide-safe interpretation

The celebration slide can currently use:

- Portal-enabled Activity CSAT improved from 76.5% to 80.6%.
- Valid Activity CSAT responses increased from 889 to 1,721.

Service Account sign-ups may be used only after the latest Genie values are reconciled against the previous benchmark.

Online application activity may be used as a supporting diagnostic after Databricks replication or explicit acknowledgement that it is currently a Power BI result.

Portal Support Demand Rate must not be described as an improvement.

The current Power BI result indicates that support demand increased from 28.57 to 34.86 cases per 100 Portal service activities.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## The slide should not claim

- Support demand reduced.
- Online application activity is the denominator for full portal support demand.
- Portal service activity and Online application activity are the same metric.
- `period_start` represents when portal activity occurred.
- Approximately 30 support cases per 100 transactions is interchangeable with an application-only support rate.
- Support CSAT improved overall unless the manual mapping has been applied.
- Portal enablement caused CSAT improvement.
- Pre/post enablement CSAT improved across the full portal service cohort.
- RPP Support CSAT proxy represents full Service Account Support CSAT.
- Account quality improved unless year-on-year diagnostic values exist.
- Knowledge content reduced support demand unless a governed metric is defined.

## Current caveats

- These definitions are pilot definitions, not final enterprise reporting standards.
- Portal service activity has been tested through the existing Power BI measure but direct denominator values have not yet been recorded.
- Portal service activity has not yet been reproduced in Databricks.
- The activity date is derived from the related CRM case creation date.
- The service eligibility rule depends on `first_portal_enable_date`.
- The Power BI model currently assumes service names provide a valid relationship key.
- The workflow status map is currently maintained in Power BI.
- Online application activity is a separate diagnostic and is not the Portal Support Demand Rate denominator.
- Service Account sign-up outputs differ slightly between the existing benchmark and latest Genie run.
- Support CSAT requires a manually documented mapping and is not yet implemented as a governed Databricks asset.
- Support CSAT is not yet a repeatable self-serve Genie metric.
- FY2023/24 Activity CSAT response volume is very small and should not be used as the main baseline.
- Service-name joins for Activity CSAT use normalised text matching and should be checked for unmatched services.
- No raw organisational data or customer-level data should be stored in this repository.

## Genie implementation requirement

Permanent Account Management Genie instructions should be maintained separately in:

`21-account-management-genie-instructions.md`

The Genie instructions must define:

- governed source tables
- activity date logic
- portal enablement conditions
- distinct-count logic
- Portal service activity as the support denominator
- Online application activity as a separate diagnostic
- required reconciliation output
- slide-safety classification

Genie must not infer alternate metric definitions from field names or previous exploratory outputs.

## Contextual metric: GA4 portal entry behaviour

GA4 portal-entry behaviour is a contextual digital behaviour insight.

It is not a headline Service Account or Portal CX KPI.

It may support the EOFY celebration story once refreshed, but it must not replace the governed Databricks headline metrics.

### Intended use

GA4 can help describe how customers enter selected portal login and registration journeys, including:

- device mix
- entry page pattern
- weekday pattern
- hour-of-day pattern
- login versus sign-up destination split
- source channel, where available
- business-hours share, where available

### Current status

The current Power BI visual was created from older GA4 CSV exports.

Do not use current GA4 values as final slide evidence.

Treat the existing visual as a layout and analysis pattern only until the GA4 export is refreshed.

### Source rule

GA4 should remain contextual only.

It should not replace Databricks metrics for:

- Service Account sign-ups
- Portal service activity
- Online application activity
- Support demand
- Activity CSAT
- mapped Support CSAT

### Do not claim

Do not claim:

- GA4 portal-entry values represent total portal usage.
- Old GA4 CSV export values are current EOFY evidence.
- GA4 replaces Databricks sign-up, activity, support, or CSAT metrics.
- GA4 can be reconciled with Service Account sign-ups unless reconciliation is validated.

### Current Power BI reference values

| Measure | FY2024/25 | FY2025/26 | Change | Relative change |
|---|---:|---:|---:|---:|
| Portal service activities | 38,422 | 39,898 | +1,476 | +3.8% |
| Portal support cases | 10,976 | 13,910 | +2,934 | +26.7% |
| Support cases per 100 portal service activities | 28.57 | 34.86 | +6.29 | +22.0% |

The Power BI dashboard displays Portal service activity growth as 4% because the percentage is rounded to a whole number.

The reference rates reconcile to the direct denominator values:

- FY2024/25: `10,976 / 38,422 * 100 = 28.57`
- FY2025/26: `13,910 / 39,898 * 100 = 34.86`

These values confirm that support demand increased faster than portal service activity. The result must not be described as reduced support demand or as a positive improvement without further evidence.
