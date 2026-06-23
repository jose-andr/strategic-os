# Service Account Analytics

This folder documents reusable analytics patterns for the Service Account Dashboard, beginning with an EOFY branch celebration use case.

## Current use case

Create a one-slide EOFY celebration analysis using the curated Databricks schema:

`datahub_datamart.customer_account_management`

## Target story

The first analysis will test whether the schema can support the following celebration frame:

- More customers
- More self-service activity
- Less support demand relative to activity
- Better activity CSAT
- Better support CSAT

## Primary outcome

A concise, executive-ready one-slide story showing how Service Account performed this financial year compared with the previous financial year.

## Reusable outcome

A documented pattern for turning curated datamart schemas into AI-assisted analytics outputs that can later feed the Strategic OS.

## Data governance principle

Organisational data remains in Databricks, Power BI and approved organisational systems.

This repository stores only:

- reusable prompts
- SQL templates
- metric definitions
- assumptions
- caveats
- non-sensitive synthesis
- lessons learned
