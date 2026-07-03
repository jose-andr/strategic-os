# GA4 Portal Entry Data

This folder stores approved, non-sensitive GA4 CSV exports used as contextual supporting evidence for the Service Account / Portal CX EOFY celebration analysis.

GA4 data in this folder is not a governed Databricks source and should not replace headline metrics for Customers, Activity, Support demand, Activity CSAT, or mapped Support CSAT.

## Folder contents

| File | Purpose |
|---|---|
| `README.md` | Explains the folder purpose, storage rules, naming convention, and interpretation rule. |
| `export-index.md` | Tracks refreshed GA4 CSV exports and their approval status. |
| `metadata-template.md` | Template for documenting each GA4 export. |
| `data-dictionary.md` | Defines expected fields for approved GA4 portal-entry exports. |

## Purpose

Use refreshed GA4 exports to understand how customers enter selected portal login and registration journeys, including:

- device mix
- entry page pattern
- weekday pattern
- hour-of-day pattern
- login vs sign-up destination split
- source channel, where available
- business-hours share, where available

## Data rules

Only store aggregated, non-sensitive exports.

Do not store:

- user identifiers
- client IDs
- session IDs
- IP addresses
- full URLs containing query strings or tokens
- personal information
- raw event-level exports
- customer-level records
- unapproved operational extracts

## File naming convention

Use this pattern:

ga4_portal_entry_<analysis-area>_<start-date>_<end-date>_exported-<export-date>.csv

Example:

ga4_portal_entry_device_mix_2025-07-01_2026-06-30_exported-2026-07-03.csv

## Required metadata

Each export should have a matching metadata file.

Use this pattern:

<csv-file-name>.metadata.md

Example:

ga4_portal_entry_device_mix_2025-07-01_2026-06-30_exported-2026-07-03.csv.metadata.md

## Metadata template

Use:

`metadata-template.md`

## Export index

Register each export in:

`export-index.md`

Only use GA4 export values in the EOFY celebration slide or supporting report when:

- the CSV is listed in the export index
- the matching metadata file is completed
- the reporting window is confirmed
- the export is approved for use
- caveats are documented

## Data dictionary

Use:

`data-dictionary.md`

to document expected fields and derived fields.

## Interpretation rule

GA4 portal-entry data should be treated as selected-link behaviour only.

Do not claim it represents total portal usage unless coverage has been validated.

Do not reconcile GA4 sign-up clicks with Service Account sign-ups unless tracking coverage and attribution are validated.
