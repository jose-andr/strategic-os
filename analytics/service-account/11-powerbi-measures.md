# Power BI Measures

This file documents the existing Power BI measures used as the first source of truth for the Service Account / Portal CX EOFY celebration analysis.

The purpose is to understand the business logic before translating it into reusable Databricks SQL or Genie instructions.

## Source of truth approach

Existing Power BI measures are treated as the first source of truth for:

- metric definitions
- eligibility rules
- date-window logic
- inclusion and exclusion rules
- customer portal logic
- support demand logic
- CSAT logic

Databricks SQL translates this logic after fields, mappings, and governance rules are confirmed.

## Measures captured

| Celebration metric | Power BI measure | Status |
|---|---|---|
| Customers | Account Sign-Ups | Captured and validated |
| All accounts | All Accounts | Captured; context only |
| Activity | Digital Self-Service Activity | Captured; Databricks pilot translation accepted |
| Support demand | Self-Service Support Rate | Captured; pilot numerator accepted from `vwsupport` |
| Activity CSAT | CSAT on Self-Service Activity | Captured; Databricks source validated |
| Support CSAT | CSAT on Self-Service Support | Captured; manual mapping required |
| Real-time support CSAT | Support CSAT filtered by channel_type = In Real-time | Segmentation rule captured; not productionised |
| Async support CSAT | Support CSAT filtered by channel_type = Async | Segmentation rule captured; not productionised |

## Account Sign-Ups

### Business meaning

Service Account / portal sign-ups.

This is the metric used for the celebration slide label:

Customers

Customers does not mean all CRM accounts.

### DAX

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

### DAX logic summary

- Counts distinct `vwaccount[account_id]`
- Filters to `vwaccount[customer_portal] = TRUE()`
- Uses `vwaccount[first_account_portal_on_date]`
- Applies the selected reporting window using `[Window Start]` and `[Window End]`

### Source fields

| Field | Use |
|---|---|
| `vwaccount[account_id]` | Account identifier |
| `vwaccount[customer_portal]` | Customer portal / Service Account inclusion filter |
| `vwaccount[first_account_portal_on_date]` | Service Account sign-up date |

### Databricks source

`datahub_datamart.customer_account_management.vwaccount`

### Current validated result

| Period | Customers |
|---|---:|
| FY2024/25 | 9,838 |
| FY2025/26 | 15,570 |

Movement:

`+58.3%`

### Definition decision

For this analysis:

Customers = Service Account / portal sign-ups

Customers does not mean all CRM accounts.

## All Accounts

### Business meaning

Total CRM accounts.

This is a context metric only.

### DAX

    All Accounts =
    CALCULATE (
        DISTINCTCOUNT ( vwaccount[account_id] ),
        REMOVEFILTERS ( 'Date Basis' ),
        REMOVEFILTERS ( 'Calendar Year' ),
        REMOVEFILTERS ( 'Calendar Month' ),
        REMOVEFILTERS ( 'Fiscal Year' ),
        REMOVEFILTERS ( 'Financial Quarter' )
    )

### DAX logic summary

- Counts distinct `vwaccount[account_id]`
- Removes reporting date filters
- Represents all CRM accounts, not Service Account sign-ups

### Source fields

| Field | Use |
|---|---|
| `vwaccount[account_id]` | Account identifier |

### Databricks source

`datahub_datamart.customer_account_management.vwaccount`

### Definition decision

All Accounts should not be used as the headline Customers tile.

It may be used as context, for example:

Service Account sign-ups represent approximately 5% of all CRM accounts to date.

## Activity / Digital Self-Service Activity

### Business meaning

Activity represents application workflow activity through the Service Account / portal.

For the EOFY celebration slide, the preferred slide label is:

Activity

Activity means application workflow activity.

Activity does not mean permit lifecycle activity.

### Base application measure

The base application count is:

    Applications =
    DISTINCTCOUNT ( vwpermit[application_id] )

### Initial self-service activity measure

The initial Power BI measure was:

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
                    && NOT ISBLANK ( RELATED ( DimService[first_portal_enable_date] ) )
                    && vwpermit[transaction_date] >= RELATED ( DimService[first_portal_enable_date] )
            )
        )
    )

### Initial DAX logic summary

- Counts distinct `vwpermit[application_id]`
- Uses `vwpermit[transaction_date]` for reporting window logic
- Includes only activity after the related service first became portal-enabled
- Uses `DimService[first_portal_enable_date]` to validate portal enablement timing

### Refined statused measures

The refined Power BI logic uses `vwpermit_statused`.

Base measure:

    Applications =
    DISTINCTCOUNT ( vwpermit[application_id] )

Statused measures:

    Submitted Applications =
    CALCULATE (
        [Applications],
        vwpermit_statused[is_submitted_application] = 1
    )

    Draft Applications =
    CALCULATE (
        [Applications],
        vwpermit_statused[is_draft_application] = 1
    )

    Digital Self-Service Activity =
    CALCULATE (
        [Applications],
        vwpermit_statused[include_in_activity_kpi] = 1
    )

    Application Outcomes =
    CALCULATE (
        [Applications],
        vwpermit_statused[is_application_outcome] = 1
    )

    Active Permits =
    CALCULATE (
        [Applications],
        vwpermit_statused[is_active_permit] = 1
    )

### Refined DAX logic summary

- Uses distinct count of `vwpermit[application_id]`
- Applies status flags from `vwpermit_statused`
- Treats Digital Self-Service Activity as the preferred Activity KPI
- Uses `include_in_activity_kpi = 1` to determine which application records belong in the Activity metric

### Source fields

| Field | Use |
|---|---|
| `vwpermit[application_id]` | Application identifier |
| `vwpermit[transaction_date]` | Power BI activity reporting date |
| `vwpermit[application_status]` | Application status used in status mapping |
| `vwpermit[case_status]` | Case status used in status mapping |
| `vwpermit[category]` | Cleaned and used in transformation logic |
| `vwpermit[permit_type]` | Cleaned and used in transformation logic |
| `vwpermit[case_id]` | Used to join permit activity to case and service context |
| `vwpermit_statused[include_in_activity_kpi]` | Inclusion flag for Digital Self-Service Activity |
| `vwpermit_statused[is_draft_application]` | Draft application flag |
| `vwpermit_statused[is_submitted_application]` | Submitted application flag |
| `vwpermit_statused[is_application_outcome]` | Application outcome flag |
| `vwpermit_statused[is_active_permit]` | Active permit flag |

### Databricks source

`datahub_datamart.customer_account_management.vwpermit`

The current Databricks date candidate is:

`vwpermit.period_start`

This appears to correspond to the Power BI `vwpermit[transaction_date]` logic for pilot validation.

### Databricks pilot translation

Because `include_in_activity_kpi` is created in Power BI, Databricks SQL cannot directly reproduce the refined Activity KPI from `vwpermit` alone unless the same status mapping logic is recreated or upstreamed.

For the pilot, Activity is reproduced using accepted application workflow statuses.

Include:

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

### Current validated result

| Period | Activity applications |
|---|---:|
| FY2024/25 | 2,209 |
| FY2025/26 | 3,751 |

Movement:

`+69.8%`

### Definition decision

For the EOFY celebration slide:

Activity = Digital Self-Service Activity

In Databricks pilot analysis:

    Activity =
        DISTINCTCOUNT(vwpermit.application_id)
        where application_status in:
            draft
            submitted
            further information requested
            in progress
            pending payment

This is accepted for the celebration pilot.

It is not yet the final reusable enterprise reporting standard.

## Support / Self-Service Support Rate

### Business meaning

Support represents portal support demand relative to self-service activity.

For the EOFY celebration slide, the preferred slide label is:

Support

The intended business meaning is:

Support interactions per 100 activities

This is a rate-based KPI, not a raw support case count.

### Power BI measure

    Self-Service Support Rate =
    DIVIDE (
        [Self-Service Support],
        [Self-Service Activity]
    ) * 100

### DAX logic summary

- Divides `[Self-Service Support]` by `[Self-Service Activity]`
- Multiplies the result by 100
- Expresses support demand as interactions per 100 self-service activities
- Lower values indicate less support demand relative to activity

### Source measures

| Measure | Use |
|---|---|
| `[Self-Service Support]` | Numerator: support interactions related to self-service / portal activity |
| `[Self-Service Activity]` | Denominator: self-service activity / portal transactions |
| `[Self-Service Support Rate]` | Rate of support interactions per 100 activities |

### Databricks source

Use:

`datahub_datamart.customer_account_management.vwsupport`

Do not use:

`customer_account_management.vwsupport_enriched`

for headline support KPI production.

### Databricks pilot numerator

For the celebration pilot:

    Self-Service Support =
        DISTINCTCOUNT(vwsupport.case_id)
        where is_after_service_enablement = TRUE

### SQL pattern

    support_rate_per_100_activities =
        self_service_support / self_service_activity * 100

Where:

    self_service_activity = Activity applications

And:

    self_service_support =
        distinct support cases from vwsupport
        where is_after_service_enablement = TRUE

### Current validated result

| Period | Activity applications | Support cases | Support per 100 activities |
|---|---:|---:|---:|
| FY2024/25 | 2,209 | 10,976 | 496.9 |
| FY2025/26 | 3,751 | 15,475 | 412.6 |

Movement:

`about -17.0%`

### Definition decision

For the EOFY celebration slide, Support should be shown as a rate rather than a raw volume.

This supports the story:

More self-service activity with less support demand relative to activity.

The pilot logic is accepted for the celebration analysis.

The reusable `[Self-Service Support]` numerator still needs business / data-owner validation before becoming a production standard.

## CSAT / Customer Feedback

### Business meaning

CSAT represents customer satisfaction for portal-related activity or mapped support pathways.

For the EOFY celebration slide, there are two CSAT concepts:

| Celebration metric | Power BI measure | Slide meaning |
|---|---|---|
| Activity CSAT | CSAT on Self-Service Activity | Satisfaction for portal-enabled application activity |
| Support CSAT | CSAT on Self-Service Support | Satisfaction for mapped portal-relevant support pathways |

Both measures calculate the share of positive survey responses, where a positive response is a satisfaction score of 4 or 5.

### Databricks CSAT source

Use:

`datahub_datamart.customer_intelligence.vwcase`

Do not use:

`customer_account_management.vwsupport_enriched`

for CSAT calculation.

## Activity CSAT / CSAT on Self-Service Activity

### Business meaning

Activity CSAT represents satisfaction for portal-enabled application activity.

### Power BI measure

    CSAT on Self-Service Activity =
    VAR StartDate = [Window Start]
    VAR EndDate = [Window End]
    VAR PortalServices =
        CALCULATETABLE (
            VALUES ( DimService[service_name] ),
            NOT ISBLANK ( DimService[first_portal_enable_date] )
        )
    VAR TotalResponses =
        CALCULATE (
            COUNTROWS ( vwcase_survey ),
            FILTER (
                vwcase_survey,
                vwcase_survey[Survey_Completion_Date] >= StartDate
                    && vwcase_survey[Survey_Completion_Date] < EndDate
                    && NOT ISBLANK ( vwcase_survey[Satisfaction_Score_5] )
            ),
            TREATAS ( PortalServices, vwcase_survey[Service_Name] )
        )
    VAR PositiveResponses =
        CALCULATE (
            COUNTROWS ( vwcase_survey ),
            FILTER (
                vwcase_survey,
                vwcase_survey[Survey_Completion_Date] >= StartDate
                    && vwcase_survey[Survey_Completion_Date] < EndDate
                    && vwcase_survey[Satisfaction_Score_5] IN { 4, 5 }
            ),
            TREATAS ( PortalServices, vwcase_survey[Service_Name] )
        )
    RETURN
    IF (
        TotalResponses = 0,
        BLANK (),
        DIVIDE ( PositiveResponses, TotalResponses )
    )

### DAX logic summary

- Uses `[Window Start]` and `[Window End]` for the reporting period
- Identifies portal-enabled services from `DimService`
- Includes services where `DimService[first_portal_enable_date]` is not blank
- Counts survey responses from `vwcase_survey`
- Uses `vwcase_survey[Survey_Completion_Date]` as the CSAT reporting date
- Excludes responses where `vwcase_survey[Satisfaction_Score_5]` is blank
- Counts positive responses where `Satisfaction_Score_5` is 4 or 5
- Uses `TREATAS` to match portal-enabled services to `vwcase_survey[Service_Name]`
- Returns blank where there are no survey responses
- Otherwise returns positive responses divided by total responses

### Source fields

| Field | Use |
|---|---|
| `DimService[service_name]` | Portal-enabled service list |
| `DimService[first_portal_enable_date]` | Portal service enablement filter |
| `vwcase_survey[Survey_Completion_Date]` | CSAT reporting date |
| `vwcase_survey[Satisfaction_Score_5]` | 5-point satisfaction score |
| `vwcase_survey[Service_Name]` | Survey service name used to match portal-enabled services |

### Databricks translation

Use:

`datahub_datamart.customer_intelligence.vwcase`

with:

- `Survey_Completion_Date`
- `Satisfaction_Score_5`
- `Service_Name`
- `Service_Group`
- `Channel`
- `Case_Number`
- `Record_Type`

Portal service cohort:

`datahub_datamart.customer_account_management.vwservice_enablement`

Service-name match:

    LOWER(TRIM(vwcase.Service_Name)) =
    LOWER(TRIM(vwservice_enablement.service_name))

### Current validated result

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2023/24 | 18 | 16 | 88.9% |
| FY2024/25 | 889 | 680 | 76.5% |
| FY2025/26 | 1,721 | 1,387 | 80.6% |

### Definition decision

For the EOFY celebration slide:

Activity CSAT = CSAT on Self-Service Activity

This represents satisfaction for portal-enabled application activity.

Use FY2024/25 to FY2025/26 as the comparison.

Do not use FY2023/24 as the main baseline because it has only 18 valid responses.

Do not claim portal enablement caused the CSAT improvement unless causality is supported.

## Support CSAT / CSAT on Self-Service Support

### Business meaning

Support CSAT represents satisfaction for mapped portal-relevant support pathways.

It is not all Customer Enquiry CSAT.

It is not defined by `Record_Type`.

### Power BI measure

    CSAT on Self-Service Support =
    VAR StartDate = [Window Start]
    VAR EndDate = [Window End]
    VAR SupportServices =
        CALCULATETABLE (
            VALUES ( Support_logic[Ask Service Name Norm] ),
            Support_logic[is_after_service_enablement] = TRUE (),
            NOT ISBLANK ( Support_logic[Ask Service Name Norm] )
        )
    VAR TotalResponses =
        CALCULATE (
            COUNTROWS ( vwcase_survey ),
            FILTER (
                vwcase_survey,
                vwcase_survey[Survey_Completion_Date] >= StartDate
                    && vwcase_survey[Survey_Completion_Date] < EndDate
                    && NOT ISBLANK ( vwcase_survey[Satisfaction_Score_5] )
            ),
            TREATAS ( SupportServices, vwcase_survey[Service Name Norm] )
        )
    VAR PositiveResponses =
        CALCULATE (
            COUNTROWS ( vwcase_survey ),
            FILTER (
                vwcase_survey,
                vwcase_survey[Survey_Completion_Date] >= StartDate
                    && vwcase_survey[Survey_Completion_Date] < EndDate
                    && vwcase_survey[Satisfaction_Score_5] IN { 4, 5 }
            ),
            TREATAS ( SupportServices, vwcase_survey[Service Name Norm] )
        )
    RETURN
    IF (
        TotalResponses = 0,
        BLANK (),
        DIVIDE ( PositiveResponses, TotalResponses )
    )

### DAX logic summary

- Uses `[Window Start]` and `[Window End]` for the reporting period
- Identifies support-related services from `Support_logic`
- Includes support services where `Support_logic[is_after_service_enablement] = TRUE()`
- Excludes blank `Support_logic[Ask Service Name Norm]` values
- Counts survey responses from `vwcase_survey`
- Uses `vwcase_survey[Survey_Completion_Date]` as the CSAT reporting date
- Excludes responses where `vwcase_survey[Satisfaction_Score_5]` is blank
- Counts positive responses where `Satisfaction_Score_5` is 4 or 5
- Uses `TREATAS` to match support service names to `vwcase_survey[Service Name Norm]`
- Returns blank where there are no survey responses
- Otherwise returns positive responses divided by total responses

### Source fields

| Field | Use |
|---|---|
| `Support_logic[Ask Service Name Norm]` | Normalised support service name |
| `Support_logic[is_after_service_enablement]` | Filter for support after portal service enablement |
| `vwcase_survey[Survey_Completion_Date]` | CSAT reporting date |
| `vwcase_survey[Satisfaction_Score_5]` | 5-point satisfaction score |
| `vwcase_survey[Service Name Norm]` | Normalised survey service name used to match support services |

### Support CSAT mapping note

Power BI support logic can guide the Support CSAT definition, but Support CSAT should not be reproduced in Databricks or Genie from schema inference alone.

For the celebration pilot, Support CSAT requires the manually documented mapping between portal-enabled services and support/enquiry service names.

Manual mapping documentation:

`analytics/service-account/20-support-csat-service-mapping.md`

Working Databricks workspace mapping file:

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

Future Databricks implementation should use a governed mapping asset with a field equivalent to:

`support_service_name`

Candidate governed asset names:

- `datahub_datamart.customer_account_management.support_csat_service_mapping`
- `datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

Until that asset exists, Support CSAT is pilot-only and manually controlled.

### Databricks SQL implication

To reproduce mapped Support CSAT in Databricks SQL, the analysis needs access to:

1. Survey response records from `customer_intelligence.vwcase`
2. Survey completion date
3. 5-point satisfaction score
4. Service name fields
5. Governed Support CSAT mapping with `support_service_name`
6. Optional support pathway field, such as `support_pathway`

The SQL pattern is:

    mapped_support_csat =
        positive_responses / total_valid_responses

Where:

    positive_responses =
        Satisfaction_Score_5 IN (4, 5)

And:

    total_valid_responses =
        Satisfaction_Score_5 IS NOT NULL

And:

    customer_intelligence.vwcase.Service_Name
        matches governed_mapping.support_service_name

### Definition decision

For the EOFY celebration slide:

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

Do not claim Support CSAT improved overall unless the manual mapping has been applied.

Support CSAT is not yet a repeatable self-serve Genie metric.

## Support CSAT channel segmentation

### Business meaning

Real-time and async support CSAT are not separate Power BI measures.

Instead, mapped Support CSAT may later be segmented by support channel type.

The intended segmentation is:

| Channel type | Channels |
|---|---|
| In Real-time | Phone, Live Chat, Face-to-Face |
| Async | Email, Web, Others |

### Current channel classification logic

The Power BI-style classification logic is:

    channel_type =
    IF (
        Support_logic[channel] IN { "Phone", "Live Chat", "Face-to-Face" },
        "In Real-time",
        "Async"
    )

### Definition decision

For future analysis:

Real-time support CSAT = mapped Support CSAT where channel_type = "In Real-time"

Async support CSAT = mapped Support CSAT where channel_type = "Async"

These should be calculated by filtering or grouping mapped Support CSAT by channel type, rather than relying on separate Power BI measures.

### Databricks SQL implication

In Databricks, create a channel classification field using the same logic:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

Then calculate mapped Support CSAT by `channel_type`.

### Caveat for EOFY analysis

Do not productionise channel-based Support CSAT until:

- Support CSAT mapping is governed
- the correct channel field is confirmed
- actual channel values are validated

The current Power BI field reference is:

    Support_logic[channel]

The equivalent Databricks field still needs to be confirmed.

## Current validated results

| Story point | Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement |
|---|---|---:|---:|---:|
| More customers | Service Account / portal sign-ups | 9,838 | 15,570 | +58.3% |
| More self-service activity | Application workflow Activity | 2,209 | 3,751 | +69.8% |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 412.6 | about -17.0% |
| Better Activity CSAT | Portal-enabled Activity CSAT | 76.5% | 80.6% | +4.1 pp |
| Stronger Activity CSAT response base | Valid responses | 889 | 1,721 | +832 responses |
| Support CSAT | Mapped support pathways | Manual mapping only | Manual mapping only | Do not claim unless mapping applied |

## Pending measures to capture

No further Power BI measures are currently required for the EOFY celebration slide.

Remaining work is Databricks mapping, governance, and validation:

1. Confirm whether `vwpermit_statused` should be upstreamed into Databricks or kept as a Power BI-derived layer.
2. Confirm reusable `[Self-Service Support]` numerator logic beyond the pilot `is_after_service_enablement = TRUE` rule.
3. Implement Support CSAT mapping as a governed Databricks table or curated view.
4. Confirm Support CSAT mapping ownership and update process.
5. Confirm the Databricks support `channel` field for CSAT channel segmentation.
6. Validate channel values before producing real-time vs async Support CSAT.
