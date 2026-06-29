# Databricks Mapping Backlog

This file tracks the remaining mapping and validation work needed to reproduce the Power BI EOFY celebration metrics in Databricks SQL and Genie.

## Purpose

The Power BI measures captured in `11-powerbi-measures.md` are the current source of truth for business logic where available.

This backlog identifies what still needs to be confirmed, governed, or productionised in Databricks before the SQL and Genie outputs can be treated as reusable reporting standards.

## Mapping backlog

| Priority | Metric area | Mapping question | Current status | Next validation file / action |
|---|---|---|---|---|
| 1 | Activity | Can `vwpermit_statused[include_in_activity_kpi]` be recreated from `vwpermit` using an explicit status mapping where the headline Activity KPI is based on application workflow activity rather than permit lifecycle status? | Accepted for celebration pilot; not yet final enterprise standard | `sql/07_activity_status_validation.sql`, `sql/10_activity_status_mapping_draft.sql`, `sql/11_activity_yoy_application_workflow_draft.sql` |
| 2 | Support demand | What Databricks logic reproduces `[Self-Service Support]` beyond the pilot `is_after_service_enablement = TRUE` rule? | Accepted for celebration pilot; reusable numerator still needs validation | `sql/08_support_logic_validation.sql`, `sql/12_support_source_review.sql`, `sql/13_support_rate_yoy_draft.sql` |
| 3 | Activity CSAT | Which Databricks source and service cohort reproduce Activity CSAT? | Validated for celebration pilot using `customer_intelligence.vwcase` and `vwservice_enablement` | `sql/09_csat_source_validation.sql`, `sql/14_csat_service_cohort_yoy.sql` |
| 4 | Support CSAT | How should mapped portal-relevant support pathways be represented in Databricks? | Manual mapping accepted for celebration pilot only; governed Databricks asset required | Create governed mapping table or curated view |
| 5 | Channel segmentation | Which Databricks field contains support channel values for real-time vs async segmentation? | Pending; do not productionise until Support CSAT mapping is governed | Validate `customer_intelligence.vwcase.Channel` and `vwsupport.channel` |
| 6 | Mapping ownership | Who owns Support CSAT mapping updates when new services are portal-enabled? | Undefined | Confirm owner across CX, service owners, and data/platform team |

## Confirmed business logic

### Customers

Customers means Service Account / portal sign-ups.

    Customers =
        DISTINCTCOUNT(vwaccount.account_id)
        where customer_portal = TRUE
        and first_account_portal_on_date is within the reporting window

Source:

`datahub_datamart.customer_account_management.vwaccount`

Current validated result:

| Period | Customers |
|---|---:|
| FY2024/25 | 9,838 |
| FY2025/26 | 15,570 |

Movement:

`+58.3%`

### All accounts

All accounts means total CRM accounts.

    All accounts =
        DISTINCTCOUNT(vwaccount.account_id)
        with reporting date filters removed

This is a context metric only.

Do not use All accounts as the slide definition of Customers.

### Activity workflow decision

The key metric for portal Activity is application workflow activity.

For the EOFY celebration slide:

    Activity = application workflow activity

not:

    Activity = permit lifecycle activity

This means the headline Activity KPI should focus on application workflow statuses such as:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

Permit lifecycle statuses such as Issued, Extended, Renewed, and Lapsed are useful for outcome or lifecycle analysis, but they should not be the primary basis for the headline Activity KPI.

Withdrawn and Declined may represent application outcomes, but should not automatically be included in the headline Activity KPI unless the Power BI Status Map or business owner confirms they belong.

### Activity

Activity means Digital Self-Service Activity, represented for the pilot as application workflow activity.

    Activity =
        DISTINCTCOUNT(vwpermit.application_id)
        where application_status in:
            draft
            submitted
            further information requested
            in progress
            pending payment

The `include_in_activity_kpi` flag currently comes from Power BI-created `vwpermit_statused` logic.

In Databricks, the pilot reproduces this using accepted application workflow status logic.

Source:

`datahub_datamart.customer_account_management.vwpermit`

Current validated result:

| Period | Activity applications |
|---|---:|
| FY2024/25 | 2,209 |
| FY2025/26 | 3,751 |

Movement:

`+69.8%`

### Support demand

Support means support demand relative to Activity.

    Support =
        Self-Service Support Rate

    Self-Service Support Rate =
        Self-Service Support / Self-Service Activity * 100

Pilot numerator:

    Self-Service Support =
        DISTINCTCOUNT(vwsupport.case_id)
        where is_after_service_enablement = TRUE

Source:

`datahub_datamart.customer_account_management.vwsupport`

Do not use:

`customer_account_management.vwsupport_enriched`

for headline support KPI production.

Current validated result:

| Period | Activity applications | Support cases | Support per 100 activities |
|---|---:|---:|---:|
| FY2024/25 | 2,209 | 10,976 | 496.9 |
| FY2025/26 | 3,751 | 15,475 | 412.6 |

Movement:

`about -17.0%`

### Activity CSAT

Activity CSAT means:

    CSAT on portal-enabled application activity

This is calculated as:

    positive responses / total valid responses

Where positive responses are satisfaction scores of 4 or 5.

Source:

`datahub_datamart.customer_intelligence.vwcase`

Portal service cohort:

`datahub_datamart.customer_account_management.vwservice_enablement`

Current validated result:

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2024/25 | 889 | 680 | 76.5% |
| FY2025/26 | 1,721 | 1,387 | 80.6% |

Movement:

`+4.1 percentage points`

Do not use FY2023/24 as the main baseline because it has only 18 valid responses.

Do not claim portal enablement caused the CSAT improvement unless causality is supported.

### Support CSAT

Support CSAT means:

    CSAT for mapped portal-relevant support pathways

This is calculated as:

    positive responses / total valid responses

Where positive responses are satisfaction scores of 4 or 5.

Support CSAT must use the manual Support CSAT mapping documented in:

`20-support-csat-service-mapping.md`

Working Databricks workspace copy:

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

Support CSAT is valid for the celebration pilot only where the manual mapping and outputs are explicitly documented.

Support CSAT is not yet a repeatable self-serve Genie metric.

## Support CSAT governed mapping asset

Support CSAT is currently a manually mapped pilot metric.

Manual mapping documentation:

`analytics/service-account/20-support-csat-service-mapping.md`

Working Databricks workspace copy:

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

### Required future asset

Create one governed Databricks mapping asset so Support CSAT can become repeatable and Genie-safe.

Candidate table:

`datahub_datamart.customer_account_management.support_csat_service_mapping`

Candidate curated view:

`datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

### Minimum fields

| Field | Purpose |
|---|---|
| `support_service_name` | Service name to match against `customer_intelligence.vwcase.Service_Name`. |
| `support_pathway` | Support pathway taxonomy: Resolved, Assisted, or Expert Enquiry. |
| `portal_service_name` | Related portal-enabled service, where applicable. |
| `include_in_support_csat` | Boolean flag for Support CSAT inclusion. |
| `mapping_status` | Draft, validated, deprecated, or excluded. |
| `mapping_owner` | Business/data owner responsible for the mapping. |
| `last_validated_date` | Date the mapping was last reviewed. |
| `notes` | Caveats or rationale for the mapping decision. |

### Mapping gaps

| Mapping gap | Why it matters | Current position | Required action |
|---|---|---|---|
| Support CSAT mapping is not available as a governed Databricks asset. | Genie and reusable SQL cannot reliably calculate Support CSAT from a personal workspace markdown or SQL file. | Manual mapping is documented and accepted for the celebration pilot only. | Create a governed table or curated view for Support CSAT mapping. |
| Support CSAT cannot be inferred from schema fields alone. | Automatic matching over-selects and misclassifies support services. | Do not use all Customer Enquiry services, automatic matching, `Record_Type`, or `vwsupport_enriched`. | Join CSAT cases to a governed mapping field equivalent to `support_service_name`. |
| Mapping ownership is undefined. | New portal-enabled services will need new support service mappings. | No governed update process exists yet. | Define owner and update process across CX, service owners, and data/platform team. |

### Rule

Support CSAT should only include CSAT cases where:

`customer_intelligence.vwcase.Service_Name`

matches a mapped:

`support_service_name`

with:

`include_in_support_csat = TRUE`

Do not calculate Support CSAT from schema inference, all Customer Enquiry services, `Record_Type`, `vwsupport_enriched`, or unmapped support services.

### Support CSAT by channel type

Real-time and async support CSAT are not separate Power BI measures.

They should be calculated by filtering or grouping mapped Support CSAT by channel type after the governed mapping asset exists.

Possible rule:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

This should not be productionised until:

- Support CSAT mapping is governed
- the correct channel field is confirmed
- actual channel values are validated

## Validation notes

Do not treat Databricks SQL or Genie outputs as reusable reporting standards until the relevant mapping backlog item is resolved.

Any interim analysis should clearly label unresolved measures as provisional or pilot-only.

Slide-safe position:

> Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721. Support CSAT should only be discussed where the manual support service mapping has been applied and documented.
