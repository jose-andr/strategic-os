# Support CSAT service mapping

## Purpose

This document defines the Support CSAT scope for the Service Account / Portal CX celebration pilot.

Support CSAT should only include enquiry/support services that have been explicitly mapped to services enabled in the Service Account portal.

This mapping was completed as part of the existing Support Logic work. The portal enablement date has been added so the mapping can be interpreted against the Service Account rollout timeline.

## Current status

Status: **Current and final for celebration pilot**

The mapping is current and final for the EOFY celebration pilot. It does not imply that every service in `vwservice_enablement` has a mapped Support CSAT pathway.

The source mapping file for this pilot is:

`portal_service_mapped_to_enquiry_support_service.csv`

This file should be treated as the source of truth for Support CSAT filtering during the EOFY celebration analysis.

## Why manual mapping is required

Automated matching from portal service names to Customer Enquiry service names was tested but did not produce reliable results.

The automated approach over-mapped some generic services and under-mapped or misclassified others. For example, broad service-name matching could pull in generic Business Concierge, Planning, Parking Enforcement, or unrelated parking enquiry services.

Because support service names do not consistently mirror portal service names, Support CSAT requires a curated mapping.

## Source systems

Portal-enabled service cohort:

`datahub_datamart.customer_account_management.vwservice_enablement`

Key fields:

- `service_group`
- `service_name`
- `first_portal_enable_date`

CSAT source:

`datahub_datamart.customer_intelligence.vwcase`

Key fields:

- `Service_Group`
- `Service_Name`
- `Survey_Completion_Date`
- `Satisfaction_Score_5`

Support logic / mapping source:

`portal_service_mapped_to_enquiry_support_service.csv`

Expected mapping fields:

| Field | Meaning |
|---|---|
| `portal_service_name` | Portal-enabled service name. |
| `support_service_name` | Mapped enquiry/support service name used in CSAT case data. |
| `service_group` | Business support service group from the support logic mapping. |
| `portal_enable_date` | Date the portal service was enabled in Service Account. |
| `support_pathway` | Support pathway category: Resolved, Assisted, or Expert Enquiry. |

## Mapping principle

Support CSAT should be calculated only for support/enquiry services included in the final mapping.

The mapping connects:

`vwservice_enablement.service_name`

to related support/enquiry service names from:

`customer_intelligence.vwcase.Service_Name`

The mapping includes the portal enablement date so Support CSAT can be analysed in relation to when the service became available through Service Account.

## Support pathway categories

Support pathway is derived from the mapped enquiry/support service name.

| Pathway | Service-name pattern | Business meaning |
|---|---|---|
| Resolved | `Resolved` | Contact centre resolved the enquiry during the interaction without assistance from another business area. |
| Assisted | `Assisted` | Contact centre resolved the enquiry during the interaction with assistance from another business area. |
| Expert Enquiry | `Expert Enquiry` | Contact centre could not resolve the enquiry during the interaction, so the case was assigned to an expert to contact the customer. |

## Celebration pilot rule

For the EOFY celebration pilot:

- Use the final mapped support service list.
- Do not infer Support CSAT from all Customer Enquiry services.
- Do not use automatic string matching.
- Do not use `Record_Type` as the support definition.
- Do not include unmapped enquiry services in the Support CSAT result.
- Use `Survey_Completion_Date` as the CSAT date.
- Use `Satisfaction_Score_5` as the CSAT score.
- Treat scores of 4 or 5 as positive CSAT.
- Exclude null satisfaction scores.

## Support CSAT calculation

Support CSAT is calculated as:

`positive Support CSAT responses / valid Support CSAT responses`

Where:

- valid responses = mapped support cases with non-null `Satisfaction_Score_5`
- positive responses = mapped support cases where `Satisfaction_Score_5` is 4 or 5
- CSAT date = `Survey_Completion_Date`

## Mapping table

| portal_service_name | support_service_name | service_group | portal_enable_date | support_pathway |
|---|---|---|---:|---|
| BUSINESS PERMIT - BUSKING PERMIT APPLICATION | BUSKING - CUSTOMER ENQUIRY - ASSISTED | Busking | 2022-11-14 | Assisted |
| BUSINESS PERMIT - BUSKING PERMIT APPLICATION | BUSKING - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Busking | 2022-11-14 | Expert Enquiry |
| BUSINESS PERMIT - BUSKING PERMIT APPLICATION | BUSKING - CUSTOMER ENQUIRY - RESOLVED | Busking | 2022-11-14 | Resolved |
| BUSINESS PERMIT - COMMERCIAL WASTE COLLECTION PERMIT APPLICATION | WASTE CHARGE - COMMERCIAL WASTE - EXPERT ENQUIRY | Ratepayer Waste | 2023-01-27 | Expert Enquiry |
| BUSINESS PERMIT - COMMERCIAL WASTE COLLECTION PERMIT APPLICATION | WASTE CHARGE - COMMERCIAL WASTE - RESOLVED | Ratepayer Waste | 2023-01-27 | Resolved |
| BUSINESS PERMIT - PORTABLE ADVERTISING BOARD PERMIT APPLICATION | PERMIT - HANDBILL/FUNDRAISING/A-BOARD - CUSTOMER ENQUIRY - ASSISTED | Advertising Permit | 2022-12-16 | Assisted |
| BUSINESS PERMIT - PORTABLE ADVERTISING BOARD PERMIT APPLICATION | PERMIT - HANDBILL/FUNDRAISING/A-BOARD - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Advertising Permit | 2022-12-16 | Expert Enquiry |
| BUSINESS PERMIT - PORTABLE ADVERTISING BOARD PERMIT APPLICATION | PERMIT - HANDBILL/FUNDRAISING/A-BOARD - CUSTOMER ENQUIRY - RESOLVED | Advertising Permit | 2022-12-16 | Resolved |
| BUSINESS PERMIT - SEASONAL STREET TRADING PERMIT APPLICATION | MAINTAIN AND INSTALL - ON THE STREET OR OTHER PUBLIC SPACE - STREET TRADING - ASSISTED | Maintain And Install - Infrastructure | 2022-12-16 | Assisted |
| BUSINESS PERMIT - SEASONAL STREET TRADING PERMIT APPLICATION | MAINTAIN AND INSTALL - ON THE STREET OR OTHER PUBLIC SPACE - STREET TRADING - EXPERT ENQUIRY | Maintain And Install - Infrastructure | 2022-12-16 | Expert Enquiry |
| BUSINESS PERMIT - SEASONAL STREET TRADING PERMIT APPLICATION | MAINTAIN AND INSTALL - ON THE STREET OR OTHER PUBLIC SPACE - STREET TRADING - RESOLVED | Maintain And Install - Infrastructure | 2022-12-16 | Resolved |
| BUSINESS PERMIT - SEASONAL STREET TRADING PERMIT APPLICATION | STREET TRADING - CUSTOMER ENQUIRY - ASSISTED | Street Trading | 2022-12-16 | Assisted |
| BUSINESS PERMIT - SEASONAL STREET TRADING PERMIT APPLICATION | STREET TRADING - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Street Trading | 2022-12-16 | Expert Enquiry |
| BUSINESS PERMIT - SEASONAL STREET TRADING PERMIT APPLICATION | STREET TRADING - CUSTOMER ENQUIRY - RESOLVED | Street Trading | 2022-12-16 | Resolved |
| BUSINESS PERMIT - VEHICLE ACCESS PERMIT APPLICATION | PERMIT - VEHICLE ACCESS - CUSTOMER ENQUIRY - ASSISTED | Parking Permit | 2023-01-09 | Assisted |
| BUSINESS PERMIT - VEHICLE ACCESS PERMIT APPLICATION | PERMIT - VEHICLE ACCESS - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Parking Permit | 2023-01-09 | Expert Enquiry |
| BUSINESS PERMIT - VEHICLE ACCESS PERMIT APPLICATION | PERMIT - VEHICLE ACCESS - CUSTOMER ENQUIRY - RESOLVED | Parking Permit | 2023-01-09 | Resolved |
| CONSTRUCTION PERMIT - CONSENT FOR WORKS PERMIT APPLICATION | CONSENT FOR WORKS AND TMP - CUSTOMER ENQUIRY - ASSISTED | Construction | 2023-03-27 | Assisted |
| CONSTRUCTION PERMIT - CONSENT FOR WORKS PERMIT APPLICATION | CONSENT FOR WORKS AND TMP - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Construction | 2023-03-27 | Expert Enquiry |
| CONSTRUCTION PERMIT - CONSENT FOR WORKS PERMIT APPLICATION | CONSENT FOR WORKS AND TMP - CUSTOMER ENQUIRY - RESOLVED | Construction | 2023-03-27 | Resolved |
| CONSTRUCTION PERMIT - CONSTRUCTION MANAGEMENT PLAN | CONSTRUCTION MANAGEMENT - CUSTOMER ENQUIRY - ASSISTED | Construction | 2022-05-10 | Assisted |
| CONSTRUCTION PERMIT - CONSTRUCTION MANAGEMENT PLAN | CONSTRUCTION MANAGEMENT - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Construction | 2022-05-10 | Expert Enquiry |
| CONSTRUCTION PERMIT - CONSTRUCTION MANAGEMENT PLAN | CONSTRUCTION MANAGEMENT - CUSTOMER ENQUIRY - RESOLVED | Construction | 2022-05-10 | Resolved |
| CONSTRUCTION PERMIT - SKIP PERMIT APPLICATION | PERMIT - SKIP BIN - CUSTOMER ENQUIRY - ASSISTED | Skip Bin Permit | 2022-11-14 | Assisted |
| CONSTRUCTION PERMIT - SKIP PERMIT APPLICATION | PERMIT - SKIP BIN - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Skip Bin Permit | 2022-11-14 | Expert Enquiry |
| CONSTRUCTION PERMIT - SKIP PERMIT APPLICATION | PERMIT - SKIP BIN - CUSTOMER ENQUIRY - RESOLVED | Skip Bin Permit | 2022-11-14 | Resolved |
| CONSTRUCTION PERMIT - SPACE OCCUPANCY PERMIT APPLICATION | PERMIT - CONSTRUCTION ZONE - CUSTOMER ENQUIRY - ASSISTED | Construction Permit | 2022-05-03 | Assisted |
| CONSTRUCTION PERMIT - SPACE OCCUPANCY PERMIT APPLICATION | PERMIT - CONSTRUCTION ZONE - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Construction Permit | 2022-05-03 | Expert Enquiry |
| CONSTRUCTION PERMIT - SPACE OCCUPANCY PERMIT APPLICATION | PERMIT - CONSTRUCTION ZONE - CUSTOMER ENQUIRY - RESOLVED | Construction Permit | 2022-05-03 | Resolved |
| PARKING PERMIT - MEDICAL AND HEALTHCARE PARKING PERMIT APPLICATION | PERMIT - DISABLED OR MEDICAL PARKING - CUSTOMER ENQUIRY - ASSISTED | Parking Permit | 2024-08-08 | Assisted |
| PARKING PERMIT - MEDICAL AND HEALTHCARE PARKING PERMIT APPLICATION | PERMIT - DISABLED OR MEDICAL PARKING - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Parking Permit | 2024-08-08 | Expert Enquiry |
| PARKING PERMIT - MEDICAL AND HEALTHCARE PARKING PERMIT APPLICATION | PERMIT - DISABLED OR MEDICAL PARKING - CUSTOMER ENQUIRY - RESOLVED | Parking Permit | 2024-08-08 | Resolved |
| PARKING PERMIT - PARKING PERMIT APPLICATION | PERMIT - RESIDENTIAL PARKING - CUSTOMER ENQUIRY - ASSISTED | Parking Permit | 2025-03-29 | Assisted |
| PARKING PERMIT - PARKING PERMIT APPLICATION | PERMIT - RESIDENTIAL PARKING - CUSTOMER ENQUIRY - EXPERT ENQUIRY | Parking Permit | 2025-03-29 | Expert Enquiry |
| PARKING PERMIT - PARKING PERMIT APPLICATION | PERMIT - RESIDENTIAL PARKING - CUSTOMER ENQUIRY - RESOLVED | Parking Permit | 2025-03-29 | Resolved |

## Recommended SQL pattern

Use the final mapping as a filter table or translate the mapping table into a CTE.

    WITH mapped_support_services AS (
      SELECT DISTINCT
        portal_service_name,
        support_service_name,
        service_group,
        portal_enable_date,
        support_pathway
      FROM portal_service_mapped_to_enquiry_support_service
    ),

    support_csat AS (
      SELECT
        CASE
          WHEN c.Survey_Completion_Date >= DATE('2024-07-01')
           AND c.Survey_Completion_Date <  DATE('2025-07-01')
            THEN 'FY2024/25'
          WHEN c.Survey_Completion_Date >= DATE('2025-07-01')
           AND c.Survey_Completion_Date <  DATE('2026-07-01')
            THEN 'FY2025/26'
        END AS fiscal_year,

        m.portal_service_name,
        m.support_service_name,
        m.service_group,
        m.portal_enable_date,
        m.support_pathway,

        c.Satisfaction_Score_5

      FROM datahub_datamart.customer_intelligence.vwcase c
      INNER JOIN mapped_support_services m
        ON UPPER(TRIM(c.Service_Name)) = UPPER(TRIM(m.support_service_name))

      WHERE c.Survey_Completion_Date >= DATE('2024-07-01')
        AND c.Survey_Completion_Date <  DATE('2026-07-01')
        AND c.Satisfaction_Score_5 IS NOT NULL
    )

    SELECT
      fiscal_year,
      portal_service_name,
      service_group,
      support_pathway,
      COUNT(*) AS valid_csat_responses,
      SUM(CASE WHEN Satisfaction_Score_5 IN (4, 5) THEN 1 ELSE 0 END) AS positive_csat_responses,
      ROUND(
        100.0 * SUM(CASE WHEN Satisfaction_Score_5 IN (4, 5) THEN 1 ELSE 0 END) / COUNT(*),
        1
      ) AS support_csat_percent
    FROM support_csat
    WHERE fiscal_year IS NOT NULL
    GROUP BY
      fiscal_year,
      portal_service_name,
      service_group,
      support_pathway
    ORDER BY
      fiscal_year,
      portal_service_name,
      service_group,
      support_pathway;

## Genie instruction

Use this instruction in Genie:

> Support CSAT must use the final manual mapping from `portal_service_mapped_to_enquiry_support_service.csv`. Do not infer Support CSAT from all Customer Enquiry services, automatic service-name matching, or `Record_Type`. Only include cases where `customer_intelligence.vwcase.Service_Name` matches a mapped `support_service_name`.

## Current interpretation

For the celebration pilot:

- Activity CSAT is validated using the portal-enabled service cohort.
- Headline support demand is validated using `vwsupport.is_after_service_enablement = TRUE`.
- Support CSAT is now scoped using the final manually mapped support service list.
- This allows Support CSAT to be discussed as portal-relevant support experience, rather than all support experience.
- The Support CSAT mapping is narrower than the full `vwservice_enablement` service list and should not be interpreted as complete coverage of all portal-enabled services.
