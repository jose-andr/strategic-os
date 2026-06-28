# Schema Validation Summary

This file summarises what we learned from validating the Databricks schemas for the Service Account EOFY celebration analysis.

## Schemas validated

Primary Service Account / Portal CX schema:

    datahub_datamart.customer_account_management

Customer intelligence / survey schema:

    datahub_datamart.customer_intelligence

Canonical CRM descriptor schema:

    datahub_refined.customer

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

From `datahub_refined.customer`:

- `vwcase`

## Glossary and Power BI alignment

This schema validation should align to the glossary in:

    10-glossary.md

For the EOFY celebration analysis:

| Slide term | Internal definition | Source of truth priority |
|---|---|---|
| Customers | Service Account / portal sign-ups | Existing Power BI measure, then SQL translation |
| Activity | Application workflow activity through the portal | Existing Power BI measure, then SQL translation |
| Support | Portal support demand relative to Activity | Existing Power BI measure, then SQL translation |
| CSAT on Activity | Satisfaction related to portal-enabled application activity | `customer_intelligence.vwcase` scoped to portal-enabled services |
| CSAT on Support | Satisfaction related to mapped portal-relevant support pathways | Manual Support CSAT mapping, then `customer_intelligence.vwcase` |
| All accounts | Total CRM account base | Context metric only |

Existing Power BI measures should be treated as the first source of truth for business logic where available.

Databricks SQL should translate that logic once the required fields and eligibility rules are confirmed.

## Validation matrix

| Celebration metric | Recommended table / view | Required fields found? | Support status | Notes |
|---|---|---|---|---|
| Customers | `customer_account_management.vwaccount` | Yes | Confirmed | Uses `account_id`, `customer_portal`, and `first_account_portal_on_date`. |
| All accounts | `customer_account_management.vwaccount` | Yes | Confirmed | Context metric only. |
| Activity | `customer_account_management.vwpermit` plus status mapping logic | Partially | Accepted for celebration analysis | Activity is based on application workflow, not permit lifecycle workflow. |
| Support demand | `customer_account_management.vwsupport` | Yes | Accepted for celebration analysis | Preferred source for support numerator. |
| Support per 100 activities | `vwsupport` plus Activity denominator | Yes | Accepted for celebration analysis | Uses support cases divided by Activity applications, multiplied by 100. |
| Activity CSAT | `customer_intelligence.vwcase` plus `vwservice_enablement` | Yes | Accepted for celebration analysis | Uses portal-enabled service cohort. |
| Support CSAT | `customer_intelligence.vwcase` plus manual Support CSAT mapping | Partially | Accepted for pilot only | Manual mapping exists for celebration pilot, but not yet as a governed Databricks asset. |
| Support CSAT by pathway | `customer_intelligence.vwcase` plus manual Support CSAT mapping | Partially | Pilot only | Pathway comes from mapped support service list. |
| Support CSAT by channel type | Survey source plus support channel linkage | Pending | Not productionised | Requires governed support mapping and channel validation. |

## Confirmed source decisions

| Metric / purpose | Source decision |
|---|---|
| Customers | `datahub_datamart.customer_account_management.vwaccount` |
| Activity | `datahub_datamart.customer_account_management.vwpermit` |
| Support demand | `datahub_datamart.customer_account_management.vwsupport` |
| Portal service cohort | `datahub_datamart.customer_account_management.vwservice_enablement` |
| CSAT | `datahub_datamart.customer_intelligence.vwcase` |
| CRM case descriptors | `datahub_refined.customer.vwcase` |
| Support CSAT mapping | Manual mapping documented in `20-support-csat-service-mapping.md` |
| Support CSAT production asset | Not yet available |

Do not use `customer_account_management.vwsupport_enriched` for headline KPI production or CSAT calculation.

Do not use `Record_Type` as a Support CSAT definition.

## Field mapping notes

### `customer_account_management.vwaccount`

#### Business entity

Customer account records for accounts associated with the Salesforce portal / Service Account environment.

#### Likely grain

Likely one row per account.

#### Fields relevant to EOFY celebration analysis

| Field | Use | Confidence |
|---|---|---|
| `account_id` | Account identifier used for Service Account sign-up count | High |
| `first_account_portal_on_date` | Confirmed date field for Service Account sign-up reporting | High |
| `customer_portal` | Confirmed Service Account / customer portal inclusion filter | High |
| `created_date` | General account creation date, not preferred for Service Account sign-ups | Medium |
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

#### Metrics this table supports

- Service Account sign-ups YoY
- New vs existing account mix
- Customer portal linked account count
- Account onboarding trend
- All accounts context metric

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

- Case-to-service mapping
- Channel analysis
- Portal enablement filtering
- Case validation

For the current celebration pilot, support demand uses `vwsupport`, and CSAT uses `customer_intelligence.vwcase`.

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

### Current use

`customer_account_management.vwpermit` is the confirmed Databricks base table for portal Activity.

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

### Current use

`customer_account_management.vwservice_enablement` replaces or supports Power BI `DimService` for portal-enabled service cohort logic.

It is used for:

- portal-enabled service filtering
- Activity CSAT service filtering
- pre/post enablement diagnostics
- identifying which services are in the Service Account / Portal CX scope

For Support CSAT, `vwservice_enablement` identifies the portal service cohort, but the final Support CSAT filter must come from the manually mapped support service list.

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

### Current use

`customer_account_management.vwsupport` is the preferred Databricks source for reproducing the support numerator.

It supports:

- support numerator logic
- support by service
- support by channel
- support after portal service enablement
- real-time vs async support segmentation

### Current support numerator

For the current support rate mapping:

    Self-Service Support numerator =
        distinct support cases from vwsupport
        where is_after_service_enablement = TRUE

The headline Support metric is then:

    Support per 100 activities =
        Self-Service Support / Activity * 100

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

It should not be used for Support CSAT.

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

### Current use

`customer_intelligence.vwcase` is the validated CSAT source for the pilot.

It contains the fields required for pilot CSAT analysis:

| Concept | Field |
|---|---|
| Survey completion date | `Survey_Completion_Date` |
| Satisfaction score | `Satisfaction_Score_5` |
| Service name | `Service_Name` |
| Service group | `Service_Group` |
| Channel | `Channel` |
| Case reference | `Case_Number` |
| Record type | `Record_Type` |

### Decision

Use `customer_intelligence.vwcase` for both Activity CSAT and mapped Support CSAT.

Do not use `Record_Type` alone to define Support CSAT.

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

### Current use

`customer_intelligence.vwsurvey_feedback` was reviewed as a possible survey source but is not required for the current pilot CSAT calculation.

Use only if future response-level survey validation requires it.

## Power BI to Databricks mapping gaps

The Power BI measure logic for the EOFY celebration slide has been captured in:

    11-powerbi-measures.md

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

Confirmed views:

- `vwcase`
- `vwsurvey_feedback`

### Metrics with confirmed or partial Databricks lineage

| Celebration metric | Power BI source | Databricks status |
|---|---|---|
| Customers | `vwaccount` | Base fields confirmed |
| All accounts | `vwaccount` | Base fields confirmed |
| Activity | `vwpermit` plus `vwpermit_statused` logic | Base table confirmed; application workflow accepted for celebration analysis |
| Support demand | `Self-Service Support Rate` | Use `vwsupport` as preferred numerator source; `vwsupport_enriched` excluded from KPI production |
| Activity CSAT | `vwcase_survey`, `DimService` | Use `customer_intelligence.vwcase` and `vwservice_enablement` |
| Support CSAT | `vwcase_survey`, `Support_logic` | Pilot mapping is manual; governed Databricks mapping asset still required |
| Real-time support CSAT | Support CSAT filtered by channel type | Pending governed mapping and channel validation |
| Async support CSAT | Support CSAT filtered by channel type | Pending governed mapping and channel validation |

## Activity validation update

Genie identified that `vwpermit` does not use `transaction_date` for the validation query.

The available Databricks field used for the activity status profile is:

    period_start

The Power BI measure refers to:

    vwpermit[transaction_date]

The Databricks equivalent currently appears to be:

    vwpermit.period_start

This mapping should be validated before final reusable Activity SQL is produced.

## Activity workflow distinction

The key metric for portal Activity is application activity.

This means the headline Activity KPI should focus on the application workflow, not the permit lifecycle workflow.

The Power BI dashboard separates portal transactions by status into two related but different workflows:

| Workflow | Example statuses | Relevance to headline Activity KPI |
|---|---|---|
| Application workflow | Draft, Submitted, Further information requested, In Progress, Pending Payment, Withdrawn, Declined | Primary basis for portal Activity |
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

## Support validation update

### Support table distinction

| View | Best use | Notes |
|---|---|---|
| `vwsupport` | Source for support cases / support demand | Contains CRM-style support case fields, service fields, account fields, support channel, and service enablement logic |
| `vwsupport_enriched` | Optional exploratory context only | Contains AI themes, source-system events, handle time, channel primary, and text enrichment fields |

### Support mapping implication

For the EOFY celebration analysis, `vwsupport` is the source to use for reproducing the support numerator because it contains the case, service, account, channel, and portal enablement fields required for KPI logic.

`vwsupport_enriched` should not be treated as the primary support numerator source because it does not preserve the same CRM case and service structure.

### Current support validation decision

For the current support rate mapping, use this working direction:

    Self-Service Support numerator =
        distinct support cases from vwsupport
        where is_after_service_enablement = TRUE

`vwsupport_enriched` has been reviewed and excluded from EOFY headline KPI production.

It may still be useful for exploratory theme analysis, but support KPI mapping should proceed from `vwsupport`.

### Current Support Rate decision

For the EOFY celebration analysis, the current support rate logic is good enough to proceed:

    Support Rate =
        distinct support cases from vwsupport
        where is_after_service_enablement = TRUE
        divided by application workflow Activity
        multiplied by 100

This should be treated as accepted for the celebration slide, while the exact reusable `[Self-Service Support]` numerator remains a business validation item.

## CSAT validation update

CSAT survey data should not use:

    customer_account_management.vwsupport_enriched

Power BI survey source lineage points to the customer intelligence schema.

### Validated CSAT source

For the EOFY Service Account / Portal CX pilot, use:

`datahub_datamart.customer_intelligence.vwcase`

This view contains the fields required for pilot CSAT analysis:

| Concept | Field |
|---|---|
| Survey completion date | `Survey_Completion_Date` |
| Satisfaction score | `Satisfaction_Score_5` |
| Service name | `Service_Name` |
| Service group | `Service_Group` |
| Channel | `Channel` |
| Case reference | `Case_Number` |
| Record type | `Record_Type` |

### Current CSAT decision

Use `customer_intelligence.vwcase` for:

- Activity CSAT
- mapped Support CSAT where manual mapping and outputs are explicitly documented

Do not use:

- `customer_account_management.vwsupport_enriched`
- `Record_Type` as a Support CSAT definition
- all Customer Enquiry services as Support CSAT
- automatic service-name matching as Support CSAT

## Activity CSAT validation

Activity CSAT uses:

`datahub_datamart.customer_intelligence.vwcase`

scoped to portal-enabled services from:

`datahub_datamart.customer_account_management.vwservice_enablement`

### Important Activity CSAT findings

| Finding | Implication |
|---|---|
| `customer_intelligence.vwcase` does not contain `is_after_enablement`. | Derive portal relevance using `vwservice_enablement`, not an after-enablement flag. |
| FY2024/25 Activity CSAT has 889 valid responses. | Usable as the previous year comparison base. |
| FY2025/26 Activity CSAT has 1,721 valid responses. | Usable as the current year comparison base. |
| Activity CSAT improved from 76.5% to 80.6%. | Slide-safe if framed as correlation, not causality. |
| FY2023/24 Activity CSAT has only 18 valid responses. | Do not use as the main baseline. |
| Most portal-enabled services have no usable pre-enable CSAT base. | Do not use pre/post enablement CSAT as headline impact evidence. |
| Parking contributes strongly to current Activity CSAT response volume. | Interpret Activity CSAT in context of Residential Parking migration. |

### Current Activity CSAT decision

Use direct Activity CSAT as a celebration proof point:

> Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Do not claim that portal enablement caused the improvement unless causality is supported.

## Support CSAT mapping validation

Support CSAT cannot be reliably derived from schema logic alone.

### Tested approaches that are not reliable

- all Customer Enquiry services
- automatic matching between portal service names and enquiry service names
- `Record_Type`
- `vwsupport_enriched`
- personal Databricks workspace markdown files as reusable Genie filters
- personal Databricks workspace SQL files as reusable Genie filters

### Current validated position

- Support demand uses `customer_account_management.vwsupport`
- Activity CSAT uses `customer_intelligence.vwcase` scoped to portal-enabled services
- Support CSAT requires a manually curated mapping between portal-enabled services and support/enquiry service names
- The manual mapping is final for the celebration pilot
- The manual mapping is not yet implemented as a governed Databricks table or curated view
- Support CSAT is not yet a repeatable self-serve Genie metric

### Manual mapping documentation

The manual Support CSAT mapping is documented in:

`20-support-csat-service-mapping.md`

The working Databricks workspace mapping file is:

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

### Production recommendation

Create a governed mapping asset for Support CSAT, such as:

`datahub_datamart.customer_account_management.support_csat_service_mapping`

or

`datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

Until a governed mapping asset exists, Support CSAT should only be discussed where the manual mapping and analysis outputs are explicitly documented.

## Channel segmentation rule to validate

Support CSAT may later be segmented by channel type using this rule:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

This should not be productionised until Support CSAT mapping is governed and channel values are validated.

## Celebration pilot results to preserve

| Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement |
|---|---:|---:|---:|
| Customers | 9,838 | 15,570 | +58.3% |
| Activity applications | 2,209 | 3,751 | +69.8% |
| Support cases | 10,976 | 15,475 | +41.0% |
| Support per 100 activities | 496.9 | 412.6 | about -17.0% |
| Activity CSAT | 76.5% | 80.6% | +4.1 percentage points |
| Activity CSAT valid responses | 889 | 1,721 | +832 responses |

Slide-safe interpretation:

> Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721. Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Remaining Databricks mapping questions

1. Can `vwpermit_statused[include_in_activity_kpi]` be recreated from `vwpermit` using an explicit status mapping where the headline Activity KPI is based on application workflow activity rather than permit lifecycle status?
2. What exact `vwsupport` logic reproduces `[Self-Service Support]` beyond the pilot `is_after_service_enablement = TRUE` logic?
3. Should the Activity status mapping become a governed Databricks view or remain a Power BI-derived layer?
4. Should Support CSAT mapping become a reference table or curated view?
5. Which Databricks field should be used for support channel segmentation?
6. How should survey responses be linked back to support and activity logic in production?
7. What is the update process when new services are enabled in the portal?

## Priority validation order

Validate Databricks mapping in this order:

1. Customers
2. Activity
3. Support rate numerator
4. Activity CSAT
5. Support CSAT governed mapping
6. Support CSAT by channel type

This order keeps the EOFY celebration slide focused on the headline story points:

- More customers
- More self-service activity
- Less support demand relative to activity
- Better Activity CSAT
- Support CSAT only where manually mapped and documented

## Key definition questions

- What is the preferred definition of a Service Account customer?
- What is the preferred source of truth for self-service activity?
- What is the correct date field for activity financial year reporting?
- What is the correct date field for support financial year reporting?
- What is the correct definition of support demand?
- Which application workflow statuses should be included in the formal reusable Activity KPI?
- Should Withdrawn and Declined be counted as activity, outcomes, or exclusions?
- Should Pending Payment remain included in the formal reusable Activity KPI?
- What exact `vwsupport` logic reproduces `[Self-Service Support]`?
- Which Databricks field should be used for support channel segmentation?
- Should Support CSAT mapping be implemented as a table or view?
- Who owns the Support CSAT mapping?
- How should the Support CSAT mapping be updated when new services are portal-enabled?
- How should survey responses be linked back to support and activity logic?

## Initial conclusion

The Databricks schemas contain the core base objects needed to reproduce the EOFY celebration analysis, but several Power BI-derived or manually curated logic layers still need to be mapped, recreated, or productionised.

Confirmed:

- Customers can be reproduced from `customer_account_management.vwaccount`.
- All accounts can be reproduced from `customer_account_management.vwaccount`.
- Activity can start from `customer_account_management.vwpermit`.
- For the current EOFY celebration analysis, Activity is accepted as application workflow activity.
- Support demand should use `customer_account_management.vwsupport` as the preferred numerator source.
- `customer_account_management.vwsupport_enriched` is excluded from EOFY headline KPI production.
- Portal service enablement can use `customer_account_management.vwservice_enablement`.
- CSAT should use `customer_intelligence.vwcase`, not `vwsupport_enriched`.
- Activity CSAT can be calculated using `customer_intelligence.vwcase` scoped to portal-enabled services.
- Support CSAT requires a manual mapping and is not yet productionised as a governed Databricks asset.

Still pending:

- Recreating the Power BI `vwpermit_statused` logic as a reusable reporting standard.
- Mapping the exact `[Self-Service Support]` numerator logic from `vwsupport` beyond the pilot logic.
- Creating a governed Support CSAT mapping asset.
- Confirming the support channel field for real-time vs async CSAT segmentation.
- Defining ownership and update process for the Support CSAT mapping.

Current Activity direction:

    Activity should be application workflow activity.

This is accepted for the EOFY celebration analysis.

Current Support direction:

    Support demand should use vwsupport.

Current Activity CSAT direction:

    Activity CSAT should use customer_intelligence.vwcase scoped to vwservice_enablement.

Current Support CSAT direction:

    Support CSAT should use the manually mapped support service list for the celebration pilot only. Future use requires a governed Databricks mapping asset.

`vwsupport_enriched` should be treated as optional exploratory context only, not a source for headline KPI production or CSAT calculation.
