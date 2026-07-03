# Capability Milestones

This register captures major service, channel, platform, and operating model milestones that may affect Service Account / Portal CX analysis.

Use this file to record known capability changes that could explain movements in:

- customer sign-ups
- application workflow activity
- support demand
- CSAT
- channel mix
- response volumes
- service adoption

Agents should update this register when analysis identifies a new capability, platform change, migration, channel launch, service release, or operating model change that could materially affect interpretation.

## Milestone table

| Sort | Milestone | Milestone Date | Description | Analysis relevance |
|---:|---|---|---|---|
| 0 | Salesforce CRM | 2017-01-01 | Salesforce introduced. | Establishes the CRM case/account baseline for long-run trend interpretation. |
| 1 | Services Account Launched (R1–2) | 2022-05-01 | First Business and Construction customers migrated, and 25 permits made available over the course of 1.5 years. | Marks the initial Service Account / portal capability launch. Important when interpreting early portal activity and limited prior-year CSAT base. |
| 2 | Genesys Go-Live | 2024-06-01 | Genesys introduced. | May affect support channel mix, contact handling, support volumes, and channel attribution. |
| 3 | MVGA Website Go-Live | 2024-07-01 | Corporate website redesigned and platform upgraded. | May affect digital entry points, self-service discovery, redirection, and support demand. |
| 4 | Digital Assistant Go-Live | 2024-10-01 | Digital Assistant made available on selected pages in the corporate website MVGA. | May affect support deflection, channel mix, customer guidance, and support CSAT by channel. |
| 5 | Service Account Experience Upgrade | 2024-11-01 | Business and Construction customer permit transactions stabilise at 16,500. | May affect activity volumes, support demand relative to activity, and customer experience quality. |
| 6 | Service Account Final Upgrade (Release 3) | 2025-04-01 | Residential parking customers migrated, with the addition of 4 permit types; transactions jumped to 29,600. | Major structural change. Likely affects current FY activity, support demand, CSAT response volume, and comparability with previous FY. |

## Update rule

When an agent identifies a new milestone that may affect analysis, add it to the table with:

- milestone name
- milestone date
- short description
- analysis relevance
- sort order

Do not store raw customer data or customer-level examples in this file.

## Interpretation notes

Milestones should be considered before making YoY claims.

A metric movement may reflect a capability change rather than a pure performance change. For example, a major service migration can increase customer sign-ups, activity, support demand, and survey response volume at the same time.

Use this register as context for slide caveats and executive interpretation.

## GA4 portal-entry analytics milestone

GA4 portal-entry behaviour can support the EOFY celebration story as contextual digital behaviour evidence, but it is not yet ready for final slide use.

### Current status

The existing GA4 Power BI visual was created from older CSV exports.

Do not use current GA4 values as final EOFY evidence.

### Milestone required

Refresh and validate GA4 portal-entry analytics before using GA4 values in the slide or supporting report.

| Milestone | Status | Notes |
|---|---|---|
| Refreshed GA4 CSV export completed | Pending | Required before any GA4 values are used. |
| Reporting window confirmed | Pending | Start and end dates must be documented. |
| Selected portal login and registration links confirmed | Pending | Link coverage must be clear. |
| Portal-entry event meaning confirmed | Pending | Confirm what counts as an entry. |
| Login vs sign-up destination tracking validated | Pending | Do not treat sign-up clicks as completed sign-ups. |
| Device, entry page, weekday, and hourly patterns refreshed | Pending | Required for slide or report use. |
| Source channel and business-hours fields refreshed, where available | Pending | Optional contextual enrichment. |
| Caveat wording confirmed | Pending | Must state GA4 is selected-link behaviour, not total portal usage. |

### Decision rule

GA4 can be used only as contextual supporting evidence.

It should not replace Databricks headline metrics for Customers, Activity, Support demand, Activity CSAT, or mapped Support CSAT.
