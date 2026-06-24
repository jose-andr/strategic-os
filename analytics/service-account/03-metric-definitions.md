# Metric Definitions

This file documents the working metric definitions for the Service Account EOFY celebration analysis.

These definitions are provisional until validated against the curated Databricks schema.

## Financial year

City of Melbourne financial year runs from July to June.

For SQL analysis, financial year is calculated using this logic:

CASE
  WHEN month(date_field) >= 7 THEN year(date_field) + 1
  ELSE year(date_field)
END AS financial_year

Example:

| Date | Financial year label |
|---|---|
| 2024-07-01 | FY2025 |
| 2025-06-30 | FY2025 |
| 2025-07-01 | FY2026 |

## Glossary alignment

This file should be read alongside:

`10-glossary.md`

For this EOFY celebration analysis, the slide language is intentionally simple:

| Slide term | Internal definition |
|---|---|
| Customers | Service Account / portal sign-ups |
| Activity | Portal transactions or digital self-service activity |
| Support | Portal support demand |
| CSAT on Activity | Customer satisfaction related to portal-enabled activity |
| CSAT on Support | Customer satisfaction related to support interactions |
| All accounts | Total CRM account base, used as context only |

Existing Power BI measures should be treated as the first source of truth for business logic, then translated into reusable SQL templates where appropriate.
## Celebration metric frame

The one-slide EOFY celebration analysis will use this frame:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Better activity CSAT
5. Better support CSAT

## 1. New service accounts

### Business question

Did customer adoption of Service Account grow year on year?

### Working definition

Count of distinct customer accounts created during the financial year.

### Likely table

`vwaccount`

### Required fields

- account identifier
- account created date
- Service Account or portal-enabled indicator, if available

### Status

To validate.

## 2. Active service accounts

### Business question

How many accounts were active or available in the Service Account / CRM ecosystem?

### Working definition

Count of distinct active accounts during the reporting period.

### Likely table

`vwaccount`

### Required fields

- account identifier
- account status
- active/onboarded indicator
- relevant date field

### Status

To validate.

## 3. Self-service activity

### Business question

Did customers complete more Service Account enabled transactions year on year?

### Working definition

Count of completed customer self-service transactions during the financial year.

### Likely tables

- `vwpermit`
- `vwservice_enablement`

### Required fields

- transaction or activity identifier
- submitted/completed date
- activity type or service category
- completion/status field

### Status

To validate.

## 4. Activity by category

### Business question

Which permit or service categories contributed most to activity growth?

### Working definition

Self-service activity grouped by service or permit category.

### Likely tables

- `vwpermit`
- `vwservice_enablement`

### Required fields

- activity identifier
- activity date
- permit category or service category
- status

### Status

To validate.

## 5. Support cases

### Business question

How much support demand was created by customers using Service Account?

### Working definition

Count of support cases or interactions related to Service Account during the financial year.

### Likely tables

- `vwsupport`
- `vwsupport_enriched`

### Required fields

- support case identifier
- support created date
- support type or channel
- Service Account related flag, if available

### Status

To validate.

## 6. Support per 100 transactions

### Business question

Did support demand reduce relative to self-service activity?

### Working definition

Support cases divided by self-service transactions, multiplied by 100.

Formula:

support cases / self-service transactions * 100

### Likely tables

- `vwsupport_enriched`
- `vwpermit`
- `vwservice_enablement`

### Required fields

- support case count
- self-service transaction count
- aligned financial year period

### Status

To validate.

## 7. Activity CSAT

### Business question

Did satisfaction with Service Account enabled activity improve year on year?

### Working definition

Percentage of positive CSAT responses related to portal-enabled activity.

### Likely table

To confirm.

### Required fields

- CSAT response identifier
- response date
- CSAT score or positive flag
- activity/support context

### Status

To validate.

## 8. Support CSAT

### Business question

Did satisfaction with Service Account support improve year on year?

### Working definition

Percentage of positive CSAT responses related to support provided by the CX branch.

### Likely table

`vwsupport_enriched`

### Required fields

- CSAT response identifier
- response date
- CSAT score or positive flag
- support channel
- support context

### Status

To validate.

## Current caveats

- Field names are not yet validated.
- Table grain is not yet confirmed.
- CSAT source table is not yet confirmed.
- Service Account inclusion logic is not yet confirmed.
- Activity completion logic is not yet confirmed.
