# Schema Validation Summary

This file summarises what we learned from validating the Databricks schemas for the Service Account EOFY celebration analysis.

## Schemas validated

Primary Service Account / Portal CX schema:

    datahub_datamart.customer_account_management

Customer intelligence / survey schema:

    datahub_datamart.customer_intelligence

## Tables and views reviewed

From `datahub_datamart.customer_account_management`:

- `vwaccount`
- `vwcase`
- `vwpermit`
- `vwservice_enablement`
- `vwsupport`
- `vwsupport_enriched`

From `datahub_datamart.customer_intelligence`:

- `vwcase`
- `vwsurvey_feedback`

## Glossary and Power BI alignment

This schema validation should align to the glossary in:

    10-glossary.md

For the EOFY celebration analysis:

| Slide term | Internal definition | Source of truth priority |
|---|---|---|
| Customers | Service Account / portal sign-ups | Existing Power BI measure, then SQL translation |
| Activity | Application workflow activity through the portal | Existing Power BI measure, then SQL translation |
| Support | Portal support demand relative to activity | Existing Power BI measure, then SQL translation |
| CSAT on Activity | Satisfaction related to portal-enabled application activity | Existing Power BI measure / survey logic |
| CSAT on Support | Satisfaction related to support interactions | Existing Power BI measure / survey logic |
| All accounts | Total CRM account base | Context metric only |

Existing Power BI measures should be treated as the first source of truth for business logic.

Databricks SQL should translate that logic once the required fields and eligibility rules are confirmed.

## Validation matrix

| Celebration metric | Recommended table / view | Required fields found? | Support status | Notes |
|---|---|---|---|---|
| Customers | `customer_account_management.vwaccount` | Yes | Confirmed | Uses `account_id`, `customer_portal`, and `first_account_portal_on_date` |
| All accounts | `customer_account_management.vwaccount` | Yes | Confirmed | Context metric only |
| Activity | `customer_account_management.vwpermit` plus status mapping logic | Partially | Accepted for celebration analysis | Activity is based on application workflow, not permit lifecycle workflow |
| Support | `customer_account_management.vwsupport` | Partially | Accepted for celebration analysis | Preferred source for `[Self-Service Support]` numerator |
| Support per 100 activities | `vwsupport` plus Activity denominator | Partially | Accepted for celebration analysis | Power BI logic captured as `Self-Service Support Rate` |
| Activity CSAT | `customer_intelligence.vwcase` and/or `customer_intelligence.vwsurvey_feedback` | Pending | Mapping pending | Need survey date, satisfaction score, service name, and portal-enabled service logic |
| Support CSAT | `customer_intelligence.vwcase` and/or `customer_intelligence.vwsurvey_feedback` | Pending | Mapping pending | Need survey date, satisfaction score, support service logic, and channel linkage |
| Support CSAT by channel type | Survey source plus support channel linkage | Pending | Mapping pending | Need support channel field for real-time vs async segmentation |

## Field mapping notes

### `customer_account_management.vwaccount`

#### Likely business entity

Customer account records for accounts associated with the Salesforce portal / Service Account environment.

#### Likely grain

Likely one row per account.

#### Fields relevant to EOFY celebration analysis

| Field | Possible use | Confidence |
|---|---|---|
| `account_id` | Account identifier used for Service Account sign-up count | High |
| `first_account_portal_on_date` | Confirmed date field for Service Account sign-up reporting | High |
| `customer_portal` | Confirmed Service Account / customer portal inclusion filter | High |
| `created_date` | General account creation date, but not preferred for Service Account sign-ups | Medium |
| `account_created_month` | Monthly account creation trend analysis | Medium |
| `account_record_type` | Account type / classification | Medium |
| `onboarding_type` | Onboarding pathway or account onboarding type | Medium |
| `new_or_existing` | New vs existing account classification | High |

#### Confirmed Power BI measure logic

Power BI measure:

    Account Sign-Ups

Business meaning:

    Service Account sign-ups

Logic summary:

- Counts distinct `vwaccount[account_id]`
- Filters to `vwaccount[customer_portal] = TRUE()`
- Uses `vwaccount[first_account_portal_on_date]`
- Applies the reporting window using `[Window Start]` and `[Window End]`

#### Metrics this table may support

- Service Account sign-ups YoY
- New vs existing account mix
- Customer portal linked account count
- Account onboarding trend

#### Definition questions

- Should the EOFY slide label this metric as `Service Account sign-ups`, `new Service Accounts`, or `customers`?
- Should YoY use the same Power BI window logic or explicit financial year logic?
- What values exist in `account_record_type`, `onboarding_type`, and `new_or_existing`?

## `customer_account_management.vwcase`

| Column name | Data type | Comment |
|---|---|---|
| `case_id` | string | A unique identifier assigned to each case for tracking and reference purposes |
| `case_number` | string | The number associated with the case, which may be used for easier identification in communications |
| `date_time_opened` | timestamp | The timestamp indicating when the case was initially opened |
| `date_time_closed` | timestamp | The timestamp marking when the case was resolved or closed |
| `record_type` | string | Indicates the type of record associated with the case |
| `channel` | string | The communication channel through which the case was initiated |
| `account_id` | string | The unique identifier for the account |
| `service_group` | string | The service group responsible for the case |
| `service_name` | string | The specific service that the case relates to |
| `first_portal_enable_date` | date | The date when the customer first gained access to the portal |
| `is_after_enablement` | int | Flag indicating whether the case occurred after portal enablement |

### Possible uses

`customer_account_management.vwcase` may support:

- Support demand validation
- Case-to-service mapping
- Channel analysis
- Portal enablement filtering
- Support CSAT service matching, if survey data can be linked to cases

## `customer_account_management.vwpermit`

| Column name | Data type | Comment |
|---|---|---|
| `application_id` | string | Identifies the specific application submitted |
| `case_id` | string | Represents the unique identifier for the case associated with the application |
| `case_status` | string | Indicates the current status of the case |
| `permit_type` | string | Describes the type of permit being applied for |
| `application_status` | string | Reflects the current status of the application itself |
| `period_end` | timestamp | Marks the end date of the relevant period for the application or case |
| `period_start` | timestamp | Indicates the start date of the relevant period for the application or case |
| `category` | string | Categorises the application or case |

### Possible uses

`customer_account_management.vwpermit` is the confirmed Databricks base table for portal activity.

It contains the raw fields needed to begin recreating the Power BI `vwpermit_statused` logic, including:

- `application_id`
- `case_id`
- `application_status`
- `case_status`
- `category`
- `permit_type`
- `period_start`
- `period_end`

## `customer_account_management.vwservice_enablement`

| Column name | Data type | Comment |
|---|---|---|
| `service_key` | string | A unique identifier for each service |
| `service_group` | string | Categorises services into broader groups |
| `service_name` | string | The specific name of the service |
| `first_portal_enable_date` | date | Date when the service was first made available on the portal |

### Possible uses

`customer_account_management.vwservice_enablement` may replace or support Power BI `DimService`.

It is likely needed for:

- Portal-enabled service filtering
- Activity eligibility
- Activity CSAT service filtering
- Support eligibility after service enablement

## `customer_account_management.vwsupport`

| Column name | Data type | Comment |
|---|---|---|
| `case_id` | string | A unique identifier for each case |
| `case_number` | string | The official number assigned to the case |
| `date_time_opened` | timestamp | The timestamp indicating when the case was initially opened |
| `date_time_closed` | timestamp | The timestamp marking when the case was resolved and closed |
| `channel` | string | The method through which the case was initiated |
| `account_id` | string | The identifier for the account associated with the case |
| `service_group` | string | The category of services related to the case |
| `ask_service_name` | string | The specific service requested by the customer |
| `portal_service_name` | string | The name of the service as it appears in the customer portal |
| `portal_enable_date` | date | The date when the service became available on the customer portal |
| `is_after_service_enablement` | boolean | Indicates whether the case occurred after the service was enabled |

### Possible uses

`customer_account_management.vwsupport` is the preferred Databricks source for reproducing the Power BI `[Self-Service Support]` numerator.

It may support:

- Support numerator logic
- Support by service
- Support by channel
- Support after portal service enablement
- Real-time vs async support segmentation

### Current support mapping direction

For the current support rate mapping, use this working direction:

    Self-Service Support numerator =
        distinct support cases from vwsupport
        where support is related to portal-enabled services
        and support occurred after service enablement

The exact inclusion rules still need validation, but `vwsupport` is the preferred starting point because it contains:

- `case_id`
- `case_number`
- `date_time_opened`
- `date_time_closed`
- `channel`
- `account_id`
- `service_group`
- `ask_service_name`
- `portal_service_name`
- `portal_enable_date`
- `is_after_service_enablement`

## `customer_account_management.vwsupport_enriched`

| Column name | Data type | Comment |
|---|---|---|
| `source_system` | string | Indicates the system from which the data was sourced |
| `source_id` | string | Source-system identifier |
| `account_id` | string | Account identifier |
| `event_date` | date | Date when the event occurred |
| `channel_primary` | string | Primary channel through which the interaction or event took place |
| `theme` | string | Overarching topic or subject matter |
| `sub_theme` | string | More specific aspect of the theme |
| `ai_confidence` | decimal(2,2) | Confidence level of the AI model classification |
| `top_terms` | string | Significant terms associated with the record |
| `sentence` | string | Text or sentence related to the record |
| `handle_seconds` | decimal(9,2) | Duration in seconds taken to handle the event |
| `portal_label` | int | Label for categorising the record within a portal context |

### Decision for EOFY celebration analysis

`customer_account_management.vwsupport_enriched` was reviewed during schema validation but is not used in the EOFY celebration metric calculations.

It appears to represent an enriched interaction / event layer designed for qualitative or AI-assisted analysis, rather than a governed source for support case counting.

For the current analysis, support metrics should use `customer_account_management.vwsupport` as the preferred Databricks source because it contains the case, service, account, channel, and portal enablement fields required for KPI logic.

`vwsupport_enriched` should be treated as optional exploratory context only.

It should not be used as a denominator or numerator for headline metrics unless a future business rule explicitly requires event-level enriched interactions.

### Role going forward

| View | Role going forward | Use in EOFY celebration metrics |
|---|---|---|
| `vwsupport` | Source of truth candidate for support cases / support demand | Yes |
| `vwsupport_enriched` | Legacy exploratory enrichment / qualitative driver analysis | No |
| Agentic analysis over source tables | Preferred future direction for insight generation | Yes, for synthesis and investigation, not base KPI counts |

## `customer_intelligence.vwcase`

### Power BI lineage

Power BI source:

    let
        Source = Odbc.DataSource("dsn=DataHub_Prod", [HierarchicalNavigation=true]),
        datahub_datamart_Database = Source{[Name="datahub_datamart",Kind="Database"]}[Data],
        customer_intelligence_Schema = datahub_datamart_Database{[Name="customer_intelligence",Kind="Schema"]}[Data],
        vwcase_View = customer_intelligence_Schema{[Name="vwcase",Kind="View"]}[Data]
    in
        vwcase_View

### Possible uses

`customer_intelligence.vwcase` is a CSAT source candidate.

It should be inspected for fields equivalent to:

- `Survey_Completion_Date`
- `Satisfaction_Score_5`
- `Service_Name`
- `Service Name Norm`
- case identifier fields
- channel fields
- service fields

## `customer_intelligence.vwsurvey_feedback`

### Power BI lineage

Power BI source:

    let
        Source = Odbc.DataSource("dsn=DataHub_Prod", [HierarchicalNavigation=true]),
        datahub_datamart_Database = Source{[Name="datahub_datamart",Kind="Database"]}[Data],
        customer_intelligence_Schema = datahub_datamart_Database{[Name="customer_intelligence",Kind="Schema"]}[Data],
        vwsurvey_feedback_View = customer_intelligence_Schema{[Name="vwsurvey_feedback",Kind="View"]}[Data]
    in
        vwsurvey_feedback_View

### Possible uses

`customer_intelligence.vwsurvey_feedback` is a CSAT source candidate.

It should be inspected for fields equivalent to:

- survey completion date
- survey response date
- satisfaction score
- 5-point satisfaction score
- case identifier
- service name
- normalised service name
- channel
- survey type
- survey response source

## Power BI to Databricks mapping gaps

The Power BI measure logic for the EOFY celebration slide has now been captured in:

    11-powerbi-measures.md

The remaining validation work is to confirm which Databricks tables and fields can reproduce the Power BI logic.

### Confirmed Databricks base objects

Primary schema:

    datahub_datamart.customer_account_management

Confirmed visible tables/views:

- `vwaccount`
- `vwcase`
- `vwpermit`
- `vwservice_enablement`
- `vwsupport`
- `vwsupport_enriched`

Customer intelligence schema:

    datahub_datamart.customer_intelligence

Confirmed Power BI lineage views:

- `vwcase`
- `vwsurvey_feedback`

### Metrics with confirmed or partial Databricks lineage

| Celebration metric | Power BI source | Databricks status |
|---|---|---|
| Customers | `vwaccount` | Base fields confirmed |
| All accounts | `vwaccount` | Base fields confirmed |
| Activity | `vwpermit` plus `vwpermit_statused` logic | Base table confirmed; application workflow accepted for celebration analysis |
| Support | `Self-Service Support Rate` | Use `vwsupport` as preferred numerator source; `vwsupport_enriched` excluded from KPI production |
| Activity CSAT | `vwcase_survey`, `DimService` | Use `customer_intelligence.vwcase` and `customer_intelligence.vwsurvey_feedback` as source candidates; field mapping pending |
| Support CSAT | `vwcase_survey`, `Support_logic` | Use `customer_intelligence.vwcase` and `customer_intelligence.vwsurvey_feedback` as source candidates; field and support linkage mapping pending |
| Real-time support CSAT | Support CSAT filtered by channel type | Databricks channel field mapping pending |
| Async support CSAT | Support CSAT filtered by channel type | Databricks channel field mapping pending |

## Activity validation update

Genie identified that `vwpermit` does not use `transaction_date` for the validation query.

The available Databricks field used for the activity status profile is:

    period_start

This affects:

    sql/07_activity_status_validation.sql

The Power BI measure refers to:

    vwpermit[transaction_date]

The Databricks equivalent currently appears to be:

    vwpermit.period_start

This mapping should be validated before final reusable Activity SQL is produced.

## Activity workflow distinction

The key metric for portal activity is application activity.

This means the headline Activity KPI should focus on the application workflow, not the permit lifecycle workflow.

The Power BI dashboard separates portal transactions by status into two related but different workflows:

| Workflow | Example statuses | Relevance to headline Activity KPI |
|---|---|---|
| Application workflow | Draft, Submitted, Further information requested, In Progress, Pending Payment, Withdrawn, Declined | Primary basis for portal activity |
| Permit workflow | Issued, Extended, Renewed, Lapsed | Useful for outcomes / permit lifecycle analysis, but not the primary Activity KPI |

### Application workflow

Application workflow statuses represent customer or assessment activity before a permit outcome is finalised.

Observed or dashboard-aligned statuses include:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment
- Withdrawn
- Declined

For the EOFY celebration slide, Activity should be based on application workflow records.

The accepted Activity statuses for the current celebration analysis are:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

Statuses such as Withdrawn and Declined may represent application outcomes, but they are not included in the headline Activity KPI for the current celebration analysis.

### Permit workflow

Permit workflow statuses represent the permit lifecycle after an application has progressed to a permit state.

Observed or dashboard-aligned statuses include:

- Issued
- Extended
- Renewed
- Lapsed

These statuses are useful for understanding permit outcomes and lifecycle state, but they should not be mixed into the headline portal Activity KPI without a clear rule.

For the celebration slide, permit workflow statuses are treated as contextual or secondary.

### Activity status mapping draft results

The first run of:

    sql/10_activity_status_mapping_draft.sql

successfully separated application workflow statuses from permit lifecycle statuses.

The draft mapping confirmed that the main application workflow activity records are concentrated in:

| Status group | Example status combinations | Draft KPI treatment |
|---|---|---|
| Draft | `draft / draft`, `draft / null`, `draft / new`, `draft / closed` | Included |
| Submitted | `submitted / closed`, `submitted / draft`, `submitted / new`, `submitted / null` | Included |
| Further information requested | `further information requested / further information requested`, `further information requested / closed` | Included |
| In Progress | `in progress / in progress`, `in progress / closed`, `in progress / new` | Included |
| Pending Payment | `pending payment / approved`, `pending payment / closed`, `pending payment / null` | Included |

### Activity draft mapping observations

The draft mapping supports the current working definition:

    Activity = application workflow activity

The largest application workflow groups were draft application records, followed by pending payment, submitted, further information requested, and in-progress records.

This suggests the Activity KPI can be structured around application workflow statuses rather than permit lifecycle statuses.

For the EOFY celebration analysis, Pending Payment is included because it represents an application that has progressed through the portal workflow.

### Draft Activity YoY result

The first run of:

    sql/11_activity_yoy_application_workflow_draft.sql

produced a provisional YoY Activity result using the application workflow definition.

| Comparison period | Activity applications | Applications requiring confirmation |
|---|---:|---:|
| Previous FY | 2,209 | 13 |
| Current FY | 3,766 | 636 |

Draft movement:

    Activity applications increased from 2,209 to 3,766.

    Increase = 1,557 applications

    Growth = 70.5%

### Accepted Activity assumption for EOFY celebration analysis

For the current EOFY celebration analysis, the application workflow Activity definition is accepted as good enough to proceed.

The current Activity KPI includes:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

The current Activity KPI excludes unless later confirmed:

- Withdrawn
- Declined
- Issued
- Extended
- Renewed
- Lapsed

This means the current working Activity logic is:

    Activity =
        distinct applications
        where application_status is one of:
            draft
            submitted
            further information requested
            in progress
            pending payment

This assumption should be documented as accepted for the celebration slide, but not yet treated as the final reusable reporting standard.

The longer-term validation questions are tracked in:

    13-business-validation-backlog.md

## Support validation update

### Support table distinction

| View | Best use | Notes |
|---|---|---|
| `vwsupport` | Candidate source for `[Self-Service Support]` numerator | Contains CRM-style support case fields, service fields, account fields, support channel, and service enablement logic |
| `vwsupport_enriched` | Optional exploratory context only | Contains AI themes, source-system events, handle time, channel primary, and text enrichment fields |

### Support mapping implication

For the EOFY celebration analysis, `vwsupport` is the source to use for reproducing the Power BI `[Self-Service Support]` numerator because it contains the case, service, account, channel, and portal enablement fields required for KPI logic.

`vwsupport_enriched` should not be treated as the primary support numerator source because it does not preserve the same CRM case and service structure.

### Current support validation decision

For the current support rate mapping, use this working direction:

    Self-Service Support numerator =
        distinct support cases from vwsupport
        where support is related to portal-enabled services
        and support occurred after service enablement

`vwsupport_enriched` has been reviewed and excluded from EOFY headline KPI production.

It may still be useful for exploratory theme analysis, but support KPI mapping should proceed from `vwsupport`.

### Draft Support Rate YoY result

The first run of:

    sql/13_support_rate_yoy_draft.sql

calculated support demand relative to Activity.

| Comparison period | Activity applications | Self-service support cases | Support per 100 activities |
|---|---:|---:|---:|
| Previous FY | 2,209 | 10,976 | 496.9 |
| Current FY | 3,766 | 15,413 | 409.3 |

Draft movement:

    Activity increased from 2,209 to 3,766 applications.

    Support cases increased from 10,976 to 15,413.

    Support per 100 activities decreased from 496.9 to 409.3.

    Relative improvement = 17.6% fewer support cases per 100 activities.

### Interpretation

The support numerator increased in raw volume, but activity grew faster.

This supports the EOFY celebration storyline:

    Less support demand relative to activity

### Current Support Rate decision

For the EOFY celebration analysis, the current support rate logic is good enough to proceed:

    Support Rate =
        distinct support cases from vwsupport
        where is_after_service_enablement = true
        divided by application workflow Activity
        multiplied by 100

This should be treated as accepted for the celebration slide, while the exact reusable `[Self-Service Support]` numerator remains a business validation item.

## CSAT validation update

CSAT survey data should not use:

    customer_account_management.vwsupport_enriched

Power BI survey source lineage points to the customer intelligence schema.

### Confirmed CSAT source candidates

Power BI uses:

    datahub_datamart.customer_intelligence.vwcase

Power BI also uses:

    datahub_datamart.customer_intelligence.vwsurvey_feedback

This means CSAT validation should inspect both:

    datahub_datamart.customer_intelligence.vwcase

and:

    datahub_datamart.customer_intelligence.vwsurvey_feedback

### CSAT source implication

For Activity CSAT and Support CSAT, validation should focus on finding the survey-equivalent fields in the customer intelligence views.

Required fields to map include:

- survey completion date
- satisfaction score
- service name
- normalised service name
- case identifier or response identifier
- support linkage fields
- channel fields needed for support CSAT segmentation

### Current CSAT validation decision

For the EOFY celebration analysis:

    CSAT source candidates =
        customer_intelligence.vwcase
        customer_intelligence.vwsurvey_feedback

Do not use:

    customer_account_management.vwsupport_enriched

`vwsupport_enriched` remains excluded from headline KPI production.

## Remaining Databricks mapping questions

1. Can `vwpermit_statused[include_in_activity_kpi]` be recreated from `vwpermit` using an explicit status mapping where the headline Activity KPI is based on application workflow activity rather than permit lifecycle status?
2. What exact `vwsupport` logic reproduces `[Self-Service Support]`?
3. Which customer intelligence view best reproduces `vwcase_survey`?
4. Which Databricks fields correspond to:
   - `Survey_Completion_Date`
   - `Satisfaction_Score_5`
   - `Service_Name`
   - `Service Name Norm`
5. Which Databricks table or logic replaces `DimService[first_portal_enable_date]`?
6. Which Databricks table or logic replaces `Support_logic`?
7. Which Databricks field contains support channel values such as:
   - Phone
   - Live Chat
   - Face-to-Face
   - Email
   - Web
   - Others
8. How should survey responses be linked back to activity or support service logic?

Note: `vwsupport_enriched` has been reviewed and excluded from EOFY headline KPI production. It may still be useful for exploratory theme analysis, but support and CSAT KPI mapping should not proceed from `vwsupport_enriched`.

## Channel segmentation rule to validate

Support CSAT should be segmented by channel type using this rule:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

## Priority validation order

Validate Databricks mapping in this order:

1. Customers
2. Activity
3. Support rate numerator
4. Activity CSAT
5. Support CSAT
6. Support CSAT by channel type

This order keeps the EOFY celebration slide focused on the five headline story points:

- More customers
- More self-service activity
- Less support demand relative to activity
- Better activity CSAT
- Better support CSAT

## Key definition questions

- What is the preferred definition of a Service Account customer?
- What is the preferred source of truth for self-service activity?
- What is the correct date field for activity financial year reporting?
- What is the correct date field for support financial year reporting?
- What is the correct definition of support demand?
- Which customer intelligence view best reproduces `vwcase_survey`?
- Where are Activity CSAT and Support CSAT stored?
- What is the positive CSAT response logic?
- Which field should be used as the CSAT survey completion date?
- Which field should be used as the 5-point satisfaction score?
- Should support per 100 activities use all support, Service Account support only, or CX-managed support only?
- Which application workflow statuses should be included in the formal reusable Activity KPI?
- Should Withdrawn and Declined be counted as activity, outcomes, or exclusions?
- Should Pending Payment remain included in the formal reusable Activity KPI?
- What exact `vwsupport` logic reproduces `[Self-Service Support]`?
- Which Databricks field should be used for support channel segmentation?
- How should survey responses be linked back to support and activity logic?

## Initial conclusion

The Databricks schemas contain the core base objects needed to begin reproducing the EOFY celebration analysis, but several Power BI-derived logic layers still need to be mapped or recreated.

Confirmed:

- Customers can be reproduced from `customer_account_management.vwaccount`.
- All accounts can be reproduced from `customer_account_management.vwaccount`.
- Activity can start from `customer_account_management.vwpermit`.
- For the current EOFY celebration analysis, Activity is accepted as application workflow activity.
- Support should use `customer_account_management.vwsupport` as the preferred numerator source.
- `customer_account_management.vwsupport_enriched` is excluded from EOFY headline KPI production.
- Portal service enablement can likely use `customer_account_management.vwservice_enablement`.
- CSAT should use customer intelligence views, not `vwsupport_enriched`.

Still pending:

- Recreating the Power BI `vwpermit_statused` logic as a reusable reporting standard.
- Mapping the exact `[Self-Service Support]` numerator logic from `vwsupport`.
- Confirming whether `customer_intelligence.vwcase` or `customer_intelligence.vwsurvey_feedback` best reproduces `vwcase_survey`.
- Recreating `DimService` and `Support_logic` logic in Databricks.
- Confirming the support channel field for real-time vs async CSAT segmentation.
- Mapping CSAT survey completion date, satisfaction score, service name, and survey linkage fields.

Current Activity direction:

    Activity should be application workflow activity.

This is accepted for the EOFY celebration analysis.

Current Support direction:

    Support should use vwsupport.

Current CSAT direction:

    CSAT should use customer_intelligence.vwcase and/or customer_intelligence.vwsurvey_feedback.

`vwsupport_enriched` should be treated as optional exploratory context only, not a source for headline KPI production.
