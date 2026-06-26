# Support CSAT service mapping

## Purpose

This document defines how Support CSAT should be scoped for the Service Account / Portal CX analysis.

Support CSAT should only include support or enquiry services that are meaningfully related to services enabled in the Service Account portal.

Automated service-name matching was tested, but it produced unreliable mappings because portal service names and customer enquiry service names do not share a consistent naming structure. Some services mapped too broadly, while others, such as Residential Parking Permit support pathways, were missed or incorrectly grouped.

Therefore, Support CSAT requires a maintained manual mapping.

## Source principle

The portal-enabled service cohort is defined by:

`datahub_datamart.customer_account_management.vwservice_enablement`

Key fields:

- `service_group`
- `service_name`
- `first_portal_enable_date`

The CSAT source is:

`datahub_datamart.customer_intelligence.vwcase`

Key fields:

- `Service_Group`
- `Service_Name`
- `Survey_Completion_Date`
- `Satisfaction_Score_5`

## Mapping principle

Support CSAT should not include all Customer Enquiry services.

Support CSAT should include only Customer Enquiry services that have been manually mapped to a portal-enabled service.

The mapping should connect:

`vwservice_enablement.service_name`

to one or more related support/enquiry service names from:

`customer_intelligence.vwcase.Service_Name`

## Support pathway categories

Support pathway should be derived from the enquiry service name.

| Pathway | Service-name pattern | Business meaning |
|---|---|---|
| Resolved | `Customer Enquiry - Resolved` | Contact centre resolved the enquiry during the interaction without assistance from another business area. |
| Assisted | `Customer Enquiry - Assisted` | Contact centre resolved the enquiry during the interaction with assistance from another business area. |
| Expert Enquiry | `Customer Enquiry - Expert Enquiry` | Contact centre could not resolve the enquiry during the interaction, so the case was assigned to an expert to contact the customer. |

## Manual mapping table structure

Use this structure for the maintained mapping.

| portal_service_group | portal_service_name | support_service_name | support_pathway | include_in_support_csat | mapping_confidence | mapping_note |
|---|---|---|---|---|---|---|
| PARKING | PARKING PERMIT - PARKING PERMIT APPLICATION | Permit - Residential Parking - Customer Enquiry - Resolved | Resolved | TRUE | High | Residential Parking Permit support pathway. |
| PARKING | PARKING PERMIT - PARKING PERMIT APPLICATION | Permit - Residential Parking - Customer Enquiry - Assisted | Assisted | TRUE | High | Residential Parking Permit support pathway. |
| PARKING | PARKING PERMIT - PARKING PERMIT APPLICATION | Permit - Residential Parking - Customer Enquiry - Expert Enquiry | Expert Enquiry | TRUE | High | Residential Parking Permit support pathway. |
| PARKING | PARKING PERMIT - MEDICAL AND HEALTHCARE PARKING PERMIT APPLICATION | Permit - Disabled Or Medical Parking - Customer Enquiry - Resolved | Resolved | TRUE | High | Disabled / medical parking support pathway. |
| PARKING | PARKING PERMIT - MEDICAL AND HEALTHCARE PARKING PERMIT APPLICATION | Permit - Disabled Or Medical Parking - Customer Enquiry - Assisted | Assisted | TRUE | High | Disabled / medical parking support pathway. |
| PARKING | PARKING PERMIT - MEDICAL AND HEALTHCARE PARKING PERMIT APPLICATION | Permit - Disabled Or Medical Parking - Customer Enquiry - Expert Enquiry | Expert Enquiry | TRUE | High | Disabled / medical parking support pathway. |

## Exclusions

Do not include a support service in Support CSAT only because it contains:

- `Customer Enquiry`
- `Resolved`
- `Assisted`
- `Expert Enquiry`

Do not use `Record_Type` as the support definition.

Do not rely on automatic string matching alone.

Do not include unrelated enquiry services such as:

- Property Rates
- Planning
- Parking Enforcement
- generic Business Support
- generic Business Concierge

unless they are explicitly validated as part of the portal support pathway for a specific enabled service.

## Current working position

For the EOFY celebration analysis:

- Activity CSAT is validated using the portal-enabled service cohort.
- Headline support demand is validated using `vwsupport.is_after_service_enablement = TRUE`.
- Support CSAT is not yet validated as an overall headline metric.
- Support CSAT can only be used where a manual support service mapping exists.
- Residential Parking Permit support CSAT can be used as a proxy or pathway-specific stabilisation indicator if the mapping is documented and caveated.

## Recommended Genie instruction

Use this rule in Genie:

> Support CSAT must use a maintained manual mapping between `vwservice_enablement.service_name` and `customer_intelligence.vwcase.Service_Name`. Do not infer Support CSAT scope using automatic string matching alone. Do not use all Customer Enquiry services. Do not use `Record_Type` as the support definition. If no manual mapping exists, say Support CSAT is not yet validated.

## Validation questions

| Question | Why it matters | Status |
|---|---|---|
| Which Customer Enquiry services should be linked to each portal-enabled service? | Defines the Support CSAT filter. | Open |
| Are Residential Parking, Disabled / Medical Parking, Reserved Parking, and Community Parking separate mappings or part of a broader Parking Permit support scope? | Prevents over- or under-counting parking support CSAT. | Open |
| Is `Assisted` underused by contact centre agents? | May distort pathway comparisons between Resolved and Expert Enquiry. | Open |
| Should generic Business Concierge or Business Support pathways be included for business permits? | Automated matching over-mapped these services. | Open |
| Should Parking Enforcement be excluded from Service Account / Portal Support CSAT? | It may not relate to portal permit support. | Open |
