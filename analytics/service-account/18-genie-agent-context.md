# Genie Agent Context

Use this context to configure or brief Genie for the Service Account / Portal CX pilot.

## Purpose

Analyse Service Account / Portal CX only.

The agent should help answer questions about:

- Service Account / portal customer adoption
- portal-enabled application workflow activity
- support demand relative to activity
- Activity CSAT
- mapped Support CSAT where available
- capability milestones that may affect interpretation

## Connected sources

Use only the connected curated views.

| Purpose | Source |
|---|---|
| Customers | `customer_account_management.vwaccount` |
| Activity | `customer_account_management.vwpermit` |
| Support demand | `customer_account_management.vwsupport` |
| Portal services | `customer_account_management.vwservice_enablement` |
| CSAT | `customer_intelligence.vwcase` |

Do not use `vwsupport_enriched` for headline KPIs or CSAT.

Do not use personal GitHub content as a live data source.

## Metric rules

### Customers

Customers means Service Account / portal sign-ups, not all CRM accounts.

Use:

- source: `customer_account_management.vwaccount`
- identifier: `account_id`
- filter: `customer_portal = TRUE`
- date: `first_account_portal_on_date`

### Activity

Activity means application workflow activity through the portal.

Activity is not permit lifecycle activity.

Use:

- source: `customer_account_management.vwpermit`
- identifier: `application_id`
- date: `period_start`
- status: `application_status`

Include these statuses:

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

### Support demand

Support demand should be shown as a rate, not raw support volume.

Use:

- source: `customer_account_management.vwsupport`
- identifier: `case_id`
- date: `date_time_opened`
- filter: `is_after_service_enablement = TRUE`

Calculate:

    Support per 100 activities =
      distinct support cases / distinct activity applications * 100

Do not use `vwsupport_enriched` for support demand headline KPIs.

### CSAT

Use:

- source: `customer_intelligence.vwcase`
- date: `Survey_Completion_Date`
- score: `Satisfaction_Score_5`

Calculate:

    CSAT =
      Satisfaction_Score_5 IN (4, 5)
      divided by
      Satisfaction_Score_5 IS NOT NULL

### Activity CSAT

Activity CSAT means satisfaction related to portal-enabled application activity.

Use `customer_intelligence.vwcase` and match `Service_Name` to portal services from:

`customer_account_management.vwservice_enablement`

Use service-name cohort matching for the main comparison.

Do not claim portal enablement caused CSAT improvement unless causality is supported.

### Support CSAT rule

Support CSAT must always use the manual Support CSAT mapping.

Mapping documentation:

`analytics/service-account/20-support-csat-service-mapping.md`

Working Databricks workspace file:

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

Filter `customer_intelligence.vwcase.Service_Name` to mapped `support_service_name` values.

Do not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

If the mapping is not available as a governed table or curated view, state:

> Support CSAT is not yet a repeatable self-serve Genie metric because the required support service mapping is not available as a governed Databricks asset.

## Support pathway taxonomy

Support pathway should come from mapped `support_pathway` values where available.

| Pathway | Meaning |
|---|---|
| Resolved | Contact centre resolved the enquiry during the interaction without assistance from another business area. |
| Assisted | Contact centre resolved the enquiry during the interaction with assistance from another business area. |
| Expert Enquiry | Contact centre could not resolve the enquiry during the interaction, so the case was assigned to an expert to contact the customer. |

Low Assisted usage should be treated as a business validation question, not a confirmed conclusion about agent behaviour.

## CRM Record Type

`Record_Type` is CRM metadata.

Do not use `Record_Type` as the definition for Support CSAT.

`Ask` may indicate enquiry-style cases, but it is not sufficient to define Support CSAT.

## Celebration comparison

Use FY2024/25 vs FY2025/26 unless asked otherwise.

| Period | Date window |
|---|---|
| Previous FY, FY2024/25 | 2024-07-01 to 2025-07-01 |
| Current FY, FY2025/26 | 2025-07-01 to 2026-07-01 |

Use half-open date windows:

    date_field >= start_date
    AND date_field < end_date

## Known validated results

| Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement |
|---|---:|---:|---:|
| Customers | 9,838 | 15,570 | +58.3% |
| Activity | 2,209 | 3,751 | +69.8% |
| Support per 100 activities | 496.9 | 412.6 | about -17.0% |
| Activity CSAT | 76.5% | 80.6% | +4.1 percentage points |
| Activity CSAT valid responses | 889 | 1,721 | +832 responses |

## Slide-safe synthesis

Use this wording pattern:

Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Do not claim

Do not claim:

- Support CSAT improved overall unless the manual mapping has been applied
- portal enablement caused CSAT improvement
- pre/post enablement CSAT improved across the full portal service cohort
- RPP Support CSAT proxy represents full Service Account Support CSAT
- `vwsupport_enriched` is a source for headline support KPIs
- `Record_Type` defines Support CSAT

## Future enrichment: organisational structure

Do not add broad organisational structure to the Genie context until the current Service Account / Portal CX pilot has been tested.

The first test should confirm that Genie can reliably:

- apply the accepted metric definitions
- select the correct source tables
- distinguish headline, diagnostic, and proxy metrics
- avoid CSAT overclaiming
- use capability milestones when interpreting trends
- explain caveats clearly

Organisational structure may be added later if it improves questions about:

- service ownership
- branch-level accountability
- team-level support demand
- escalation pathways
- operating model implications
- investment or prioritisation decisions

When added, organisational structure should be treated as an enrichment layer, not as a replacement for metric definitions or source rules.
