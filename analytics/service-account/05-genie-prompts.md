# Genie Prompts

This file stores reusable prompts for testing the Service Account analytics workflow in Databricks Genie.

## Prompt 1: Schema validation

You are helping validate whether the curated `customer_account_management` schema can support an EOFY one-slide celebration analysis for Service Account.

The target story is:

- More customers
- More self-service activity
- Less support demand relative to activity
- Better activity CSAT
- Better support CSAT

Using only the tables in `datahub_datamart.customer_account_management`:

- `vwaccount`
- `vwcase`
- `vwpermit`
- `vwservice_enablement`
- `vwsupport`
- `vwsupport_enriched`

Return a validation matrix with:

1. Metric name
2. Recommended table
3. Required fields
4. Whether the schema supports the metric
5. Caveats or definition questions
6. Suggested SQL logic for year-on-year financial year comparison

Use July to June financial years.

Do not generate the final celebration story yet.

## Prompt 2: Analysis plan

Using the validated fields from the `customer_account_management` schema, create an analysis plan for the EOFY Service Account celebration summary.

Focus only on:

1. Customer growth
2. Self-service activity growth
3. Support demand relative to activity
4. Activity CSAT
5. Support CSAT
6. Top permit or service categories contributing to change

Return:

1. Business interpretation of each metric
2. Required table
3. Required fields
4. Calculation logic
5. Filters
6. Caveats
7. Suggested executive interpretation

Do not generate the final celebration story yet.

## Prompt 3: Celebration narrative

Using the validated YoY results, create a one-slide EOFY celebration narrative for Service Account.

Use this structure:

1. Headline
2. More customers
3. More self-service activity
4. Less support demand
5. Better activity CSAT
6. Better support CSAT
7. Why it matters
8. Caveats

Use executive-ready language.

Do not include raw customer-level data.
