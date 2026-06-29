# Service Account / Portal CX Glossary

This glossary documents the working language for the Service Account EOFY celebration analysis.

It is adapted from the broader Portal CX Dashboard glossary and refined for the one-slide celebration use case.

The glossary has two purposes:

1. Keep slide language simple and audience-friendly.
2. Keep internal metric language precise enough to support SQL, Power BI, Databricks validation, Genie testing, and future reuse.

## Dashboard context

The Service Account celebration analysis sits within the broader Portal CX Dashboard analytics domain.

The broader dashboard helps understand customer experience across:

- portal adoption
- Service Account / portal accounts
- portal-enabled application activity
- support demand
- feedback and CSAT
- channel behaviour
- service migration and capability milestones
- comparison across reporting periods
- data quality and metric definitions

## Celebration slide language

For the EOFY celebration slide, use simple language.

| Slide term | Internal definition |
|---|---|
| Customers | Service Account / portal sign-ups |
| Activity | Application workflow activity through the portal |
| Support | Portal support demand relative to Activity |
| CSAT on Activity | Customer satisfaction related to portal-enabled application activity |
| CSAT on Support | Customer satisfaction related to mapped portal-relevant support pathways |
| All accounts | Total CRM account base, used as a context metric only |

Important distinction:

- `Customers` does not mean all CRM accounts.
- `Customers` means Service Account / portal sign-ups.
- `All accounts` means the total CRM account base and is used only for context.
- `Activity` means application workflow activity, not permit lifecycle activity.
- `Support` should be shown as a rate, not as raw support volume.
- `Activity CSAT` and `Support CSAT` are separate metrics.
- `Support CSAT` must use the manually mapped support service list.

## Celebration story frame

The one-slide EOFY celebration analysis uses this story frame:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Better Activity CSAT
5. Support CSAT only where manually mapped and documented

## Customers

### Slide label

Customers

### Internal definition

Customers means Service Account / portal sign-ups.

This is a subset of all CRM accounts.

### Confirmed Power BI logic

The Power BI measure `Account Sign-Ups` counts distinct `vwaccount[account_id]` where:

- `vwaccount[customer_portal] = TRUE()`
- `vwaccount[first_account_portal_on_date]` is within the selected reporting window

### Databricks source

`datahub_datamart.customer_account_management.vwaccount`

### Key fields

| Concept | Field |
|---|---|
| Account identifier | `account_id` |
| Portal sign-up indicator | `customer_portal` |
| Portal sign-up date | `first_account_portal_on_date` |

### Important distinction

`Customers` on the celebration slide is not the same as `All accounts`.

## All accounts

### Slide label

All accounts

### Internal definition

Total distinct CRM accounts.

### Confirmed Power BI logic

The Power BI measure `All Accounts` counts distinct `vwaccount[account_id]` and removes reporting date filters.

### Databricks source

`datahub_datamart.customer_account_management.vwaccount`

### Use in celebration analysis

Use as supporting context only.

Example:

Service Account sign-ups represent approximately 5% of all CRM accounts to date.

Do not use `All accounts` as the headline customer metric.

## Portal account

An account that has been onboarded or enabled for portal use.

For the celebration analysis, portal account adoption is represented by the Service Account / portal sign-up logic.

Primary date field:

`vwaccount[first_account_portal_on_date]`

## New onboarded account

An account newly onboarded during the selected reporting period.

For this analysis, this aligns to:

`first_account_portal_on_date` within the selected reporting window.

## Existing onboarded account

An account that was already onboarded before the selected reporting period.

This may be useful for customer segmentation, but it is not currently the headline definition of `Customers`.

## Activity

### Slide label

Activity

### Internal definition

Application workflow activity through the portal.

Activity is not permit lifecycle activity.

### Included application workflow statuses

For the EOFY celebration pilot, Activity includes applications with these statuses:

| Included status |
|---|
| Draft |
| Submitted |
| Further information requested |
| In Progress |
| Pending Payment |

### Excluded statuses unless later confirmed

| Excluded status |
|---|
| Withdrawn |
| Declined |
| Issued |
| Extended |
| Renewed |
| Lapsed |

### Databricks source

`datahub_datamart.customer_account_management.vwpermit`

### Key fields

| Concept | Field |
|---|---|
| Application identifier | `application_id` |
| Activity date | `period_start` |
| Application workflow status | `application_status` |

### Current pilot meaning

For the EOFY celebration slide:

`Activity = Digital Self-Service Activity`

In Databricks, this is currently reproduced using accepted application workflow statuses because `vwpermit_statused` appears to be a Power BI-derived layer rather than a native Databricks view.

## Portal transaction

A broad phrase that may refer to customer activity through the portal.

For this pilot, prefer the more precise term `Activity` and define it as application workflow activity.

Avoid using `portal transaction` as a standalone metric unless the transaction grain and status rules are confirmed.

## Digital self-service activity

Digital activity completed or progressed by customers through the portal.

For this pilot, this means distinct application workflow records using the accepted Activity status logic.

Likely source:

`datahub_datamart.customer_account_management.vwpermit`

## Application workflow activity

Application workflow activity refers to customer progress through the application process before final permit lifecycle outcomes.

For this pilot, application workflow activity includes:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

This is the preferred internal definition for the slide term `Activity`.

## Permit lifecycle activity

Permit lifecycle activity refers to downstream permit outcomes or lifecycle states.

Examples include:

- Issued
- Extended
- Renewed
- Lapsed

These are excluded from the current Activity KPI unless later business validation confirms they should be included.

## Service group

A high-level grouping used to explain what is driving activity, support, or CSAT.

Examples include:

- Business
- Construction
- Community
- Parking

Service group labels may vary by source table and should be checked before joining or grouping across schemas.

## Service name

The specific service associated with an account, case, support interaction, survey response, or permit activity.

Service name is important because it is currently used to connect CSAT responses to portal-relevant services.

For Activity CSAT analysis, service names should be matched using normalised text logic unless a stronger key is available:

    LOWER(TRIM(service_name))

For Support CSAT analysis, do not rely on automatic service-name matching. Use the manually mapped support service list.

## Portal service enablement

The service-level record of when a service became available through the portal.

### Databricks source

`datahub_datamart.customer_account_management.vwservice_enablement`

### Key fields

| Field | Meaning |
|---|---|
| `service_key` | Unique identifier for each service. |
| `service_group` | Broader group for the service. |
| `service_name` | Specific service name. |
| `first_portal_enable_date` | Date when the service was first made available on the portal. |

### Use in analysis

Use `vwservice_enablement` to:

- identify portal-enabled services
- define the portal-relevant service cohort
- filter or segment Activity CSAT by service
- support pre/post enablement diagnostics
- avoid manually guessing which application services belong in the portal scope

For Support CSAT, `vwservice_enablement` helps identify the portal service cohort, but the final Support CSAT filter must come from the manually mapped support service list.

## Support

### Slide label

Support

### Internal definition

Portal support demand relative to Activity.

Support should be shown as a rate rather than raw volume.

### Preferred KPI

Support per 100 activities.

### Formula

    Support per 100 activities =
      distinct support cases / distinct activity applications * 100

## Support case

A support case is a customer support interaction or case related to portal use, service access, service understanding, or getting unstuck.

For headline support counting in this pilot, use `vwsupport`.

### Databricks source

`datahub_datamart.customer_account_management.vwsupport`

### Key fields

| Concept | Field |
|---|---|
| Support case identifier | `case_id` |
| Case number | `case_number` |
| Opened date/time | `date_time_opened` |
| Closed date/time | `date_time_closed` |
| Channel | `channel` |
| Account identifier | `account_id` |
| Service group | `service_group` |
| Ask service name | `ask_service_name` |
| Portal service name | `portal_service_name` |
| Portal enablement date | `portal_enable_date` |
| After service enablement flag | `is_after_service_enablement` |

### Pilot support numerator

Distinct `case_id` where:

    is_after_service_enablement = TRUE

## Portal support

Support considered relevant to portal activity based on service, enablement, or account linkage.

For the pilot, the preferred support source is:

`datahub_datamart.customer_account_management.vwsupport`

Do not use `customer_account_management.vwsupport_enriched` for headline support KPI production.

## Support enriched view

`customer_account_management.vwsupport_enriched` is an enriched interaction or event-style layer.

For the EOFY celebration pilot:

- do not use it for headline KPI production
- do not use it as the support numerator
- do not use it for CSAT calculation
- treat it as optional exploratory context only

## Support pathway taxonomy

Support pathway describes how the contact centre handled an enquiry.

| Pathway | Meaning |
|---|---|
| Resolved | Contact centre resolved the enquiry during the interaction without assistance from another business area. |
| Assisted | Contact centre resolved the enquiry during the interaction with assistance from another business area. |
| Expert Enquiry | Contact centre could not resolve the enquiry during the interaction, so the case was assigned to an expert to contact the customer. |

For Support CSAT, support pathway should come from the manually mapped `support_pathway` values where available.

Low `Assisted` usage should be treated as a business validation question, not a confirmed conclusion about agent behaviour.

## Channel

Channel describes the source or channel through which a case, support interaction, or customer contact was initiated.

The canonical silver-layer descriptor for `Channel` is:

> Identifies the communication channel through which the service case was initiated, such as phone, email, or online portal.

Use Channel for:

- channel mix analysis
- support segmentation
- real-time vs async classification
- CSAT by channel diagnostics

Canonical CRM case descriptors should align to `datahub_refined.customer.vwcase`.

## Channel type

A derived grouping of channels into real-time or asynchronous support.

### Real-time support

Real-time or near-real-time support, such as:

- Phone
- Live Chat
- Face-to-Face

### Async support

Non-real-time support, such as:

- Email
- Web
- Web Messaging, if treated asynchronously
- other non-real-time channels

### Current working classification

    CASE
      WHEN Channel IN ('Phone', 'Live Chat', 'Face-to-Face')
        THEN 'In Real-time'
      ELSE 'Async'
    END AS channel_type

This classification should be validated against actual channel values before using in final reporting.

## CSAT

Customer Satisfaction score.

For this pilot, CSAT is based on `Satisfaction_Score_5`.

### Pilot CSAT source

`datahub_datamart.customer_intelligence.vwcase`

### Canonical field descriptor

The silver-layer descriptor for `Satisfaction_Score_5` is:

> Captures the overall satisfaction score from the customer, which is vital for evaluating service performance.

### CSAT formula

    CSAT =
      positive valid responses / total valid responses

Where:

    positive valid responses =
      Satisfaction_Score_5 IN (4, 5)

And:

    total valid responses =
      Satisfaction_Score_5 IS NOT NULL

Express CSAT as a percentage.

## CSAT on Activity

### Slide label

CSAT on Activity

### Internal definition

Customer satisfaction related to portal-enabled application activity.

For the pilot, this is represented by survey responses for the portal-relevant service-name cohort from `vwservice_enablement`.

### Databricks source

`datahub_datamart.customer_intelligence.vwcase`

### Portal relevance source

`datahub_datamart.customer_account_management.vwservice_enablement`

### Current validated result

For the current celebration comparison:

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2024/25 | 889 | 680 | 76.5% |
| FY2025/26 | 1,721 | 1,387 | 80.6% |

FY2023/24 has only 18 valid responses and should not be used as the main baseline.

### Interpretation caution

Activity CSAT can be compared between FY2024/25 and FY2025/26 for the celebration pilot.

Do not claim that portal enablement caused the CSAT improvement unless causality is supported.

Recommended slide wording:

> Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

## CSAT on Support

### Slide label

CSAT on Support

### Internal definition

Customer satisfaction related to mapped portal-relevant support pathways.

Support CSAT is not all Customer Enquiry CSAT.

For the celebration pilot, Support CSAT must use the manually documented Support CSAT mapping.

### Manual mapping documentation

`analytics/service-account/20-support-csat-service-mapping.md`

### Working Databricks workspace mapping file

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

### Support CSAT inclusion rule

Only include CSAT cases where:

`customer_intelligence.vwcase.Service_Name`

matches a mapped:

`support_service_name`

### Do not calculate Support CSAT from

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

### Current productionisation status

Support CSAT is valid for the celebration pilot only where the manual mapping and analysis outputs are explicitly documented.

Support CSAT is not yet a repeatable self-serve Genie metric because the mapping has not been implemented as a governed Databricks table or curated view.

Future self-serve Support CSAT requires developer support to create a governed mapping asset.

Candidate governed asset names:

- `datahub_datamart.customer_account_management.support_csat_service_mapping`
- `datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

## CSAT comparison principle

For the EOFY Service Account / Portal CX pilot, CSAT should be compared by clearly defined service cohorts.

The preferred pilot framing is:

1. Activity CSAT: identify relevant Service Account / portal application service names using `vwservice_enablement`.
2. Support CSAT: use the manually mapped support service list.
3. Use pre/post portal enablement analysis as a diagnostic layer only where a usable pre-enable baseline exists.

This separates different questions:

| Question | Purpose |
|---|---|
| How satisfied were customers with portal-enabled application activity this year compared with last year? | Activity CSAT comparison. |
| How satisfied were customers with mapped portal-relevant support pathways? | Support CSAT comparison, only where manual mapping is applied. |
| Did CSAT change after a service became portal-enabled? | Diagnostic / impact analysis only where a valid pre-enable baseline exists. |

## CRM case data

Canonical CRM case field descriptions should align to the silver-layer view:

`datahub_refined.customer.vwcase`

This view is treated as the descriptor source for common case fields that may appear in downstream curated datamart views, including:

- `datahub_datamart.customer_account_management.vwcase`
- `datahub_datamart.customer_intelligence.vwcase`

For the EOFY Service Account / Portal CX pilot:

| Purpose | Source |
|---|---|
| Canonical case field descriptions | `datahub_refined.customer.vwcase` |
| CSAT calculation | `datahub_datamart.customer_intelligence.vwcase` |
| Operational support case counting | `datahub_datamart.customer_account_management.vwsupport` |

## Common CRM case fields

| Field | Silver-layer description | Use in Service Account analysis |
|---|---|---|
| `Case_Id` | A unique identifier assigned to each service case, facilitating easy tracking and reference. | Useful for case-level joins and validation where available. |
| `Case_Number` | An additional reference number for the service case, often used for customer communication and case management. | Used as the visible case reference in CSAT analysis. |
| `Date_Time_Opened` | Records the exact date and time when the service case was initiated, providing a timeline for case management. | Used for operational case timing where available. |
| `Date_Time_Closed` | Indicates the date and time when the service case was resolved and officially closed, allowing for analysis of case duration. | Used for case duration and closure timing where available. |
| `Status` | Describes the current state of the service case, such as open, in progress, or closed, which is essential for monitoring case flow. | Useful for operational case flow analysis. |
| `Milestone_Status` | Indicates key milestones achieved during the case handling process, helping to assess progress against predefined goals. | Useful for service level and milestone analysis. |
| `Case_Closure_Reason` | Captures the reason for closing the case, providing insights into case outcomes and potential areas for improvement. | Useful for outcome analysis and diagnostic review. |
| `Channel` | Identifies the communication channel through which the service case was initiated, such as phone, email, or online portal. | Used for channel mix analysis and real-time vs async segmentation. |
| `Subject` | Summarizes the main topic or issue of the service case, aiding in categorization and analysis of case types. | Useful for diagnostics, not a headline KPI field. |
| `Record_Type` | Defines the type of record associated with the service case, which can help in understanding the nature of the case. | Used as a case segmentation field, not as a standalone metric definition. |
| `Case_Type` | Categorizes the service case into specific types, allowing for better analysis of case trends and service performance. | Useful for deeper case trend analysis if present in downstream views. |
| `Suburb` | Specifies the suburb related to the service case, which can be useful for demographic and regional analysis. | Not used in headline metrics; useful for later geographic analysis. |
| `Service_Name` | Names the specific service associated with the case, helping to identify service performance and trends. | Used to match CSAT responses to Service Account / portal-relevant services. |
| `Service_Group` | Categorizes the service into broader groups, facilitating analysis of service delivery across different areas. | Used to group and validate portal-relevant services. |
| `Service_Theme` | Describes the overarching theme of the service provided, which can help in understanding service focus areas. | Useful for higher-level service grouping if present downstream. |
| `Time_Taken_Working_Days` | Calculates the total working days taken to resolve the case, providing insights into case efficiency. | Useful for operational diagnostics. |
| `Complaints_Flag` | Indicates whether the service case is associated with a complaint, which can help prioritize case handling. | Useful for excluding or segmenting complaints if needed. |
| `Complaints_Category` | Categorizes the complaint type if applicable, aiding in analysis of complaint trends and service improvements. | Useful for complaints diagnostics, not current headline scope. |
| `Satisfaction_Score_5` | Captures the overall satisfaction score from the customer, which is vital for evaluating service performance. | Primary field for CSAT calculation. |
| `Net_Ease_Score_5` | Measures the ease of service experience for the customer, providing insights into service efficiency. | Optional supporting CX metric. |
| `Timeliness_Score_5` | Indicates how timely the service was delivered, helping to assess adherence to service level agreements. | Optional supporting CX metric. |
| `Number_of_Contacts_5` | Records the number of contacts made regarding the service case, which can indicate complexity and engagement level. | Optional effort / complexity signal. |
| `Improvement_Feedback` | Gathers feedback from customers on potential improvements, which is essential for continuous service enhancement. | Useful for qualitative diagnostics, not stored in repo if sensitive. |
| `Survey_Feedback` | Collects responses from customers regarding their experience, providing valuable insights for service evaluation. | Useful for qualitative diagnostics, not stored in repo if sensitive. |
| `Survey_Mailout_Date` | Records the date when the survey was sent to the customer, which is important for tracking feedback timelines. | Useful for survey timing validation. |
| `Survey_Completion_Date` | Indicates when the customer completed the survey, helping to analyze response rates and feedback timing. | Primary date field for CSAT reporting windows. |
| `Survey_Completion_Boolean` | Marks whether the survey was completed, which is useful for understanding engagement levels. | Useful for response eligibility and completion analysis. |
| `Eligible_For_Survey` | Indicates if the service case is eligible for a survey, helping to manage customer feedback collection. | Useful for response-rate diagnostics. |
| `Account_Id` | A unique identifier for the account associated with the service case, facilitating account management. | Useful for account-level linkage where appropriate. |
| `Salesforce_URL` | URL of the Salesforce case. | Useful for validation only; do not store case-level URLs in repo outputs. |
| `SourceSystem` | Identifies the system from which the service case data originated, which can be useful for data integration and analysis. | Useful for lineage and source validation. |

## CRM Record Type

`Record_Type` should be treated as a CRM classification field first, not a metric definition.

The silver-layer descriptor defines `Record_Type` as:

> Defines the type of record associated with the service case, which can help in understanding the nature of the case.

### Working interpretation

| Record_Type | Working interpretation | Analysis caution |
|---|---|---|
| `Ask` | Enquiry or request for information. | May indicate support-style demand, but should not be assumed to represent Support CSAT. |
| `Apply` | Application-related case. | May help identify application-style CSAT records, but Activity CSAT should still be scoped by portal-enabled services. |
| `Report` | Customer lets Council know something needs attention. | Generally outside the current Service Account application workflow scope unless linked to a portal-enabled service. |
| `Object` | Customer contests or objects to a decision. | Generally outside the current Service Account activity/support headline scope unless explicitly included later. |

### Important caution

Do not use `Record_Type` as the main Support CSAT breakdown or rationale.

Support CSAT requires the manually mapped support service list.

## Portal eligibility

The rule deciding whether an account, service, application, support case, or feedback record belongs in portal reporting.

For this pilot, portal eligibility is defined differently by metric:

| Metric area | Portal eligibility logic |
|---|---|
| Customers | `vwaccount.customer_portal = TRUE` and `first_account_portal_on_date` in reporting window |
| Activity | Application workflow activity in accepted statuses |
| Support demand | `vwsupport.is_after_service_enablement = TRUE` |
| Activity CSAT | CSAT responses for portal-relevant services, identified through `vwservice_enablement` |
| Support CSAT | CSAT responses for manually mapped portal-relevant support services only |

## Date logic

The agreed decision about which date field controls selected-period reporting.

| Metric area | Date field |
|---|---|
| Customers | `vwaccount.first_account_portal_on_date` |
| Activity | `vwpermit.period_start` |
| Support demand | `vwsupport.date_time_opened` |
| CSAT | `customer_intelligence.vwcase.Survey_Completion_Date` |
| Portal service enablement | `vwservice_enablement.first_portal_enable_date` |

Use half-open date windows in SQL:

    date_field >= start_date
    AND date_field < end_date

For FY2024/25:

    date_field >= DATE('2024-07-01')
    AND date_field < DATE('2025-07-01')

For FY2025/26:

    date_field >= DATE('2025-07-01')
    AND date_field < DATE('2026-07-01')

## Celebration comparison

For the current EOFY celebration analysis, use:

| Period | Date window |
|---|---|
| Previous FY | FY2024/25 |
| Current FY | FY2025/26 |

Known live results:

| Metric | Previous FY | Current FY | Movement |
|---|---:|---:|---:|
| Customers | 9,838 | 15,570 | +58.3% |
| Activity | 2,209 | 3,751 | +69.8% |
| Support per 100 activities | 496.9 | 412.6 | about -17.0% |
| Activity CSAT | 76.5% | 80.6% | +4.1 percentage points |
| Activity CSAT valid responses | 889 | 1,721 | +832 responses |

## Capability milestone

A material service, channel, platform, migration, or operating model change that may affect metric interpretation.

Examples include:

- Salesforce introduction
- Genesys go-live
- website platform upgrade
- digital assistant launch
- Service Account releases
- residential parking migration
- new permit types added to the portal

Milestones are documented in:

`14-capability-milestones.md`

Use milestones to explain structural changes in:

- customer sign-ups
- activity volume
- support demand
- CSAT response volume
- channel mix
- comparability across reporting periods

## Source of truth

The authoritative field, table, measure, or governed reference asset used for a metric definition.

For this work:

- Existing Power BI measures are the first source of truth for business logic where available.
- Curated Databricks views are used to reproduce and scale the logic.
- `datahub_refined.customer.vwcase` is used as the canonical descriptor source for common CRM case fields.
- The GitHub repo stores reusable logic, assumptions, caveats, non-sensitive synthesis, and lessons learned.
- Support CSAT mapping is currently documented manually and needs a governed Databricks table or curated view before it becomes a repeatable self-serve Genie metric.

## Data quality warning

A note highlighting missing mappings, low response counts, incomplete data, or known limitations.

Any EOFY celebration analysis should keep data quality warnings outside the slide but available in supporting notes.

Current known warnings:

- FY2023/24 Activity CSAT has a very small response base and should not be used as the main comparison baseline.
- Support CSAT is valid for the celebration pilot only where the manually documented mapping and outputs are explicitly applied.
- Support CSAT is not yet a repeatable self-serve Genie metric.
- Service name joins for Activity CSAT use normalised text matching and should be checked for unmatched services.
- Capability milestones may explain major changes in activity, support, and CSAT volumes.
- No raw organisational data or customer-level data should be stored in the repository.
## GA4 portal-entry terms

### GA4 portal entry behaviour

Contextual digital behaviour evidence from Google Analytics 4 showing how customers enter selected portal login and registration journeys.

GA4 portal-entry behaviour is not a headline Service Account / Portal CX KPI.

It should not replace Databricks metrics for Customers, Activity, Support demand, Activity CSAT, or mapped Support CSAT.

### Portal entries

Tracked entries from selected portal login and registration links in GA4.

Portal entries should not be interpreted as total portal usage unless GA4 coverage has been validated.

### Device mix

The split of tracked portal entries by device category, such as desktop, mobile, or tablet.

Device mix may help explain how customers access selected portal entry points.

### Entry page pattern

The pages or service journeys where customers clicked selected portal login or registration links.

Entry page pattern may help identify which service pages are driving portal access.

### Login vs sign-up destination split

The split between customers clicking through to login journeys and customers clicking through to registration or sign-up journeys.

This should not be reconciled with Service Account sign-ups unless tracking coverage and attribution are validated.

### Source channel

The GA4 acquisition or traffic source associated with selected portal-entry events, where available.

Source channel should be used as contextual evidence only.

### Business-hours share

The share of selected portal-entry events occurring during defined business hours.

Business-hours share may help interpret whether portal access is being used during operational support windows or outside them.

### GA4 caveat

Current GA4 values are based on older CSV exports and should not be used as final EOFY slide evidence.

GA4 values may be included only after the CSV export, reporting window, selected links, and tracking logic are refreshed and validated.
