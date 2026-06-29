# GA4 Portal Entry Data

This folder stores approved, non-sensitive GA4 CSV exports used as contextual supporting evidence for the Service Account / Portal CX EOFY celebration analysis.

GA4 data in this folder is not a governed Databricks source and should not replace headline metrics for Customers, Activity, Support demand, Activity CSAT, or mapped Support CSAT.

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

```text
ga4_portal_entry_<analysis_area>_<start-date>_<end-date>_exported-<export-date>.csv
