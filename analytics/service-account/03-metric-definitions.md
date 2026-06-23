# Metric Definitions

This file documents the working metric definitions for the Service Account EOFY celebration analysis.

These definitions are provisional until validated against the curated Databricks schema.

## Financial year

City of Melbourne financial year runs from July to June.

For SQL analysis, financial year is calculated as:

```sql
CASE
  WHEN month(date_field) >= 7 THEN year(date_field) + 1
  ELSE year(date_field)
END AS financial_year
