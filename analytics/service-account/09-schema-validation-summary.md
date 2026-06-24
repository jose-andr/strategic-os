# Schema Validation Summary

This file summarises what we learned from validating the curated Databricks schema for the Service Account EOFY celebration analysis.

## Schema validated

`datahub_datamart.customer_account_management`

## Tables reviewed

- `vwaccount`
- `vwcase`
- `vwpermit`
- `vwservice_enablement`
- `vwsupport`
- `vwsupport_enriched`

## Glossary and Power BI alignment

This schema validation should align to the glossary in:

`10-glossary.md`

For the EOFY celebration analysis:

| Slide term | Internal definition | Source of truth priority |
|---|---|---|
| Customers | Service Account / portal sign-ups | Existing Power BI measure, then SQL translation |
| Activity | Portal transactions or digital self-service activity | Existing Power BI measure, then SQL translation |
| Support | Portal support demand | Existing Power BI measure, then SQL translation |
| CSAT on Activity | Satisfaction related to portal-enabled activity | Existing Power BI measure / survey logic |
| CSAT on Support | Satisfaction related to support interactions | Existing Power BI measure / survey logic |
| All accounts | Total CRM account base | Context metric only |

Existing Power BI measures should be treated as the first source of truth for business logic. Databricks SQL should translate that logic once the required fields and eligibility rules are confirmed.
## Validation matrix

| Celebration metric | Recommended table | Required fields found? | Support status | Notes |
|---|---|---|---|---|
| New service accounts YoY | To confirm | To confirm | To validate |  |
| Active service accounts YoY | To confirm | To confirm | To validate |  |
| Self-service activity YoY | To confirm | To confirm | To validate |  |
| Activity by category | To confirm | To confirm | To validate |  |
| Support cases YoY | To confirm | To confirm | To validate |  |
| Support per 100 transactions | To confirm | To confirm | To validate |  |
| Activity CSAT | To confirm | To confirm | To validate |  |
| Support CSAT | To confirm | To confirm | To validate |  |
| Support by channel | To confirm | To confirm | To validate |  |

## Field mapping notes

### `vwaccount`

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

Power BI measure: `Account Sign-Ups`

Business meaning: Service Account sign-ups.

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
- What values exist in `account_record_type`, `onboarding_type`, and `new_or_existing`?## vwcase
|col_name|data_type|comment|
|---|---|---|
|case_id|string|A unique identifier assigned to each case for tracking and reference purposes.|
|case_number|string|The number associated with the case, which may be used for easier identification in communications.|
|date_time_opened|timestamp|The timestamp indicating when the case was initially opened, providing context for the case duration.|
|date_time_closed|timestamp|The timestamp marking when the case was resolved or closed, useful for analyzing case resolution times.|
|record_type|string|Indicates the type of record associated with the case, which can help categorize the nature of the case.|
|channel|string|The communication channel through which the case was initiated, such as email, phone, or chat.|
|account_id|string|The unique identifier for the record, essential for referencing and managing individual entries in the dataset.|
|service_group|string|The group responsible for handling the service related to the case, aiding in understanding organizational structure.|
|service_name|string|The specific service that the case pertains to, providing clarity on the subject matter of the case.|
|first_portal_enable_date|date|The date when the customer first gained access to the portal, which can be relevant for understanding customer engagement.|
|is_after_enablement|int|A flag indicating whether the case occurred after the customer was enabled for portal access, useful for analyzing the impact of enablement on case handling.|

## vwpermit
|col_name|data_type|comment|
|---|---|---|
|application_id|string|Identifies the specific application submitted, allowing for tracking and reference throughout the process.|
|case_id|string|Represents the unique identifier for the case associated with the application, facilitating case management and follow-up.|
|case_status|string|Indicates the current status of the case, providing insight into its progress and any actions required.|
|permit_type|string|Describes the type of permit being applied for, which helps in categorizing and processing applications appropriately.|
|application_status|string|Reflects the current status of the application itself, indicating whether it is pending, approved, or denied.|
|period_end|timestamp|Marks the end date of the relevant period for the application or case, which is important for tracking timelines.|
|period_start|timestamp|Indicates the start date of the relevant period for the application or case, providing context for the duration of the process.|
|category|string|Categorizes the application or case, which can assist in sorting and analyzing data based on different criteria.|

## vwservice_enablement
|col_name|data_type|comment|
|---|---|---|
|service_key|string|A unique identifier for each service, which can be used to reference specific services in the system.|
|service_group|string|Categorizes services into broader groups, helping to organize and manage related services effectively.|
|service_name|string|The specific name of the service, providing a clear description of what the service entails.|
|first_portal_enable_date|date|Indicates the date when the service was first made available on the portal, useful for tracking service launch timelines.|

## vwsupport
|col_name|data_type|comment|
|---|---|---|
|case_id|string|A unique identifier for each case, allowing for easy tracking and reference throughout the case management process.|
|case_number|string|The official number assigned to the case, which may be used for reporting and communication purposes.|
|date_time_opened|timestamp|The timestamp indicating when the case was initially opened, providing context for the duration and urgency of the case.|
|date_time_closed|timestamp|The timestamp marking when the case was resolved and closed, useful for analyzing case resolution times.|
|channel|string|The method through which the case was initiated, such as phone, email, or online portal, which can help in understanding customer preferences.|
|account_id|string|The identifier for the account associated with the case, linking the case to a specific customer or organization.|
|service_group|string|The category of services related to the case, which can assist in identifying trends and areas for improvement.|
|ask_service_name|string|The specific service requested by the customer, providing insight into customer needs and service demand.|
|portal_service_name|string|The name of the service as it appears in the customer portal, which can help in aligning customer expectations with service offerings.|
|portal_enable_date|date|The date when the service became available on the customer portal, relevant for understanding service rollout timelines.|
|is_after_service_enablement|boolean|A boolean value indicating whether the case occurred after the service was enabled, which can be useful for analyzing service adoption.|

## vwsupport_enriched
|col_name|data_type|comment|
|---|---|---|
|source_system|string|Indicates the system from which the data was sourced, providing context for the origin of the information.|
|source_id|string|Represents the unique identifier assigned by the source system, allowing for traceability back to the original data entry.|
|account_id|string|The unique identifier for the record, essential for referencing and managing individual entries in the dataset.|
|event_date|date|Denotes the date when the event occurred, which is crucial for time-based analysis and reporting.|
|channel_primary|string|Specifies the primary channel through which the interaction or event took place, helping to categorize the source of the data.|
|theme|string|Describes the overarching topic or subject matter related to the data entry, aiding in thematic analysis.|
|sub_theme|string|Provides additional granularity by identifying a more specific aspect of the theme, useful for detailed categorization.|
|ai_confidence|decimal(2,2)|Represents the confidence level of the AI model in its predictions or classifications, indicating the reliability of the data.|
|top_terms|string|Lists the most significant terms associated with the data entry, which can be useful for keyword analysis and search optimization.|
|sentence|string|Contains the actual text or sentence related to the data entry, providing context and detail for qualitative analysis.|
|handle_seconds|decimal(9,2)|Tracks the duration in seconds taken to handle the event, which can be useful for performance metrics and efficiency analysis.|
|portal_label|int|Serves as a numerical label for categorizing the record within a specific portal, aiding in organization and retrieval.|


## Key definition questions

- What is the preferred definition of a Service Account customer?
- What is the preferred source of truth for self-service activity?
- What is the correct date field for activity financial year reporting?
- What is the correct date field for support financial year reporting?
- What is the correct definition of support demand?
- Where is Activity CSAT stored?
- Where is Support CSAT stored?
- What is the positive CSAT response logic?
- Should support per 100 transactions use all support, Service Account support only, or CX-managed support only?

## Initial conclusion

To complete after field mapping.


## Power BI to Databricks mapping gaps
### Activity validation update

Genie identified that `vwpermit` does not use `transaction_date` for the validation query.

The available Databricks field used for the activity status profile is:

    period_start

This affects `sql/07_activity_status_validation.sql`.

The Power BI measure refers to `vwpermit[transaction_date]`, but the Databricks equivalent currently appears to be `vwpermit.period_start`.

This mapping should be validated before final Activity SQL is produced:

    Power BI: vwpermit[transaction_date]
    Databricks: vwpermit.period_start
The Power BI measure logic for the EOFY celebration slide has now been captured in `11-powerbi-measures.md`.

The remaining validation work is to confirm which Databricks tables and fields can reproduce the Power BI logic.

### Confirmed Databricks base objects

The curated schema is:

    datahub_datamart.customer_account_management

Confirmed visible tables/views:

- `vwaccount`
- `vwcase`
- `vwpermit`
- `vwservice_enablement`
- `vwsupport`
- `vwsupport_enriched`

### Metrics with confirmed or partial Databricks lineage

| Celebration metric | Power BI source | Databricks status |
|---|---|---|
| Customers | `vwaccount` | Base fields confirmed |
| All accounts | `vwaccount` | Base fields confirmed |
| Activity | `vwpermit` plus `vwpermit_statused` logic | Base table confirmed; statused logic not yet native in Databricks |
| Support | `Self-Service Support Rate` | Numerator logic still needs Databricks mapping |
| Activity CSAT | `vwcase_survey`, `DimService` | Databricks source mapping pending |
| Support CSAT | `vwcase_survey`, `Support_logic` | Databricks source mapping pending |
| Real-time support CSAT | Support CSAT filtered by channel type | Databricks channel field mapping pending |
| Async support CSAT | Support CSAT filtered by channel type | Databricks channel field mapping pending |

### Remaining Databricks mapping questions

1. Can `vwpermit_statused` logic be recreated from `vwpermit`, `vwcase`, and mapping rules?
2. Which Databricks table contains the equivalent of `Self-Service Support`?
3. Which Databricks table contains case survey responses equivalent to `vwcase_survey`?
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

### Channel segmentation rule to validate

Support CSAT should be segmented by channel type using this rule:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

### Priority validation order

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
