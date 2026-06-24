# Power BI Measures

This file documents the existing Power BI measures used as the first source of truth for the Service Account EOFY celebration analysis.

The purpose is to understand the business logic before translating it into reusable Databricks SQL.

## Source of truth approach

Existing Power BI measures are treated as the first source of truth for:

- metric definitions
- eligibility rules
- date-window logic
- inclusion and exclusion rules
- customer portal logic
- support and CSAT logic

Databricks SQL will translate this logic after the fields and rules are confirmed.

## Measures captured

| Celebration metric | Power BI measure | Status |
|---|---|---|
| Customers | Account Sign-Ups | Captured |
| All accounts | All Accounts | Captured |
| Activity | Digital Self-Service Activity | Captured, Databricks translation pending |
| Support | Self-Service Support Rate | Captured, numerator logic pending |
| Activity CSAT | To capture | Pending |
| Support CSAT | To capture | Pending |
| Real-time support CSAT | To capture | Pending |
| Async support CSAT | To capture | Pending |

## Account Sign-Ups

### Business meaning

Service Account sign-ups.

This is the metric used for the celebration slide label:

Customers

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

### Definition decision

For this analysis:

Customers = Service Account sign-ups

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

### Definition decision

All Accounts should not be used as the headline Customers tile.

It may be used as context, for example:

Service Account sign-ups represent approximately 5% of all CRM accounts to date.

## Activity / Digital Self-Service Activity

### Business meaning

Activity represents digital self-service activity through the Service Account / portal.

For the EOFY celebration slide, the preferred slide label is:

Activity

The intended business meaning is:

Digital self-service activity / portal transactions

This should not be treated as a raw count of all permit applications unless the inclusion logic has been confirmed.

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

### Definition issue identified

The initial Self-Service Activity measure may include a double-counting or definition issue around permit application status.

The activity metric should distinguish between different application and permit statuses rather than treating all applications as equivalent.

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
| `vwpermit[transaction_date]` | Activity reporting date |
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

### Definition decision

For the EOFY celebration slide:

Activity = Digital Self-Service Activity

This means:

    Activity = DISTINCTCOUNT(vwpermit[application_id])
    where vwpermit_statused[include_in_activity_kpi] = 1

Activity should not be presented as raw Applications unless the status inclusion rules are unavailable and the result is clearly caveated.

### Databricks lineage

The base records come from Databricks:

    datahub_datamart.customer_account_management.vwpermit

Power BI imports `vwpermit` from Databricks, then creates `vwpermit_statused` as a derived Power Query layer.

`vwpermit_statused` does not currently appear to be a native Databricks view in the curated schema.

### Power BI transformation summary

Power BI creates `vwpermit_statused` by:

1. Starting from `vwpermit`
2. Cleaning text fields including:
   - `application_status`
   - `case_status`
   - `category`
   - `permit_type`
   - `case_id`
3. Joining to `Status Map`
4. Applying specific status matching using:
   - `application_status`
   - `case_status`
5. Falling back to `application_status` where `case_status = Any`
6. Adding status flags:
   - `is_draft_application`
   - `is_submitted_application`
   - `is_application_outcome`
   - `is_active_permit`
   - `is_inactive_permit`
   - `include_in_activity_kpi`
   - `requires_business_confirmation`
7. Adding `status_mapping_result`
8. Joining to `vwcase` to bring in:
   - `service_group`
   - `service_name`
9. Joining to `Service Name Map` to bring in:
   - `portal_service_group`
   - `portal_service_name`
   - `portal_start_url`
   - `service_sort_order`
   - `service_requires_business_confirmation`
10. Adding:
   - `portal_service_mapping_result`
   - `portal_service_mapping_method`

### Databricks SQL implication

Because `include_in_activity_kpi` is created in Power BI, Databricks SQL cannot directly reproduce the refined Activity KPI from `vwpermit` alone unless the same status mapping logic is recreated or upstreamed.

For Databricks-based analysis, one of the following is required:

1. Recreate the `vwpermit_statused` logic in SQL
2. Export or reference the Power BI status mapping tables
3. Upstream the statused permit logic into a curated Databricks view
4. Temporarily use a clearly caveated proxy measure

### Caveat for EOFY analysis

Until the `vwpermit_statused` logic is available in Databricks, any Activity metric produced directly from `vwpermit` should be labelled as provisional.

Recommended caveat:

> Activity uses the Power BI-defined Digital Self-Service Activity logic where available. Where analysis is reproduced in Databricks, the `include_in_activity_kpi` status mapping must be recreated before final figures are used.

## Support / Self-Service Support Rate

### Business meaning

Support represents portal support demand relative to self-service activity.

For the EOFY celebration slide, the preferred slide label is:

Support

The intended business meaning is:

Support interactions per 100 self-service activities

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

### Slide interpretation

For the celebration slide:

Support = Self-Service Support Rate

This can be described as:

Interactions per 100 applications

or, if aligning to the broader slide language:

Interactions per 100 activities

### Source measures

| Measure | Use |
|---|---|
| `[Self-Service Support]` | Numerator: support interactions related to self-service / portal activity |
| `[Self-Service Activity]` | Denominator: self-service activity / portal transactions |
| `[Self-Service Support Rate]` | Rate of support interactions per 100 activities |

### Definition decision

For the EOFY celebration slide, Support should be shown as a rate rather than a raw volume.

This better supports the story:

More self-service activity with less support demand relative to activity.

### Current caveat

The exact numerator logic for `[Self-Service Support]` still needs to be captured from Power BI.

Until that measure is documented, the support rate can be treated as the confirmed slide KPI, but the underlying support inclusion rules remain pending.

### Databricks SQL implication

To reproduce this measure in Databricks SQL, both components must be translated:

1. Self-Service Support
2. Self-Service Activity

The SQL pattern will be:

    support_rate_per_100_activities =
        self_service_support / self_service_activity * 100

Where:

    self_service_activity = Digital Self-Service Activity

And:

    self_service_support = support interactions included by the Power BI support eligibility logic
## CSAT / Customer Feedback

### Business meaning

CSAT represents customer satisfaction for portal-related cases and support interactions.

For the EOFY celebration slide, there are two CSAT metrics:

| Celebration metric | Power BI measure | Slide meaning |
|---|---|---|
| Activity CSAT | CSAT on Self-Service Activity | Satisfaction for portal-enabled services / permit applications |
| Support CSAT | CSAT on Self-Service Support | Satisfaction for support-related interactions |

Both measures calculate the share of positive survey responses, where a positive response is a satisfaction score of 4 or 5.

## Activity CSAT / CSAT on Self-Service Activity

### Business meaning

Activity CSAT represents satisfaction for portal-enabled services.

On the Power BI dashboard this appears as:

CSAT for portal-enabled services

The dashboard context describes this as:

permit applications

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

### Definition decision

For the EOFY celebration slide:

Activity CSAT = CSAT on Self-Service Activity

This represents satisfaction for portal-enabled service activity.

## Support CSAT / CSAT on Self-Service Support

### Business meaning

Support CSAT represents satisfaction for support-related interactions.

On the Power BI dashboard this appears as:

CSAT for support related interactions

The dashboard context describes this as:

account access and permit applications assistance

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

### Definition decision

For the EOFY celebration slide:

Support CSAT = CSAT on Self-Service Support

This represents satisfaction for support interactions related to portal-enabled services.

### Databricks SQL implication

To reproduce these CSAT measures in Databricks SQL, the analysis needs access to:

1. Survey response records
2. Survey completion date
3. 5-point satisfaction score
4. Service name fields
5. Portal-enabled service logic
6. Support service eligibility logic

The SQL pattern for both CSAT measures will be:

    csat =
        positive_responses / total_responses

Where:

    positive_responses = responses with Satisfaction_Score_5 in 4 or 5

And:

    total_responses = responses with non-blank Satisfaction_Score_5

### Caveat for EOFY analysis

The Power BI measures confirm the CSAT business logic, but the Databricks source table for `vwcase_survey`, `DimService`, and `Support_logic` still needs to be confirmed before these measures can be fully reproduced in SQL.
## Pending measures to capture

Next measures to capture from Power BI:

1. Activity CSAT
2. Support CSAT
3. Real-time support CSAT
4. Async support CSAT
