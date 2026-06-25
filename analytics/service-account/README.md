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

## Current validation status

The EOFY celebration slide logic has been captured from Power BI and is being translated into Databricks SQL.

### Key documentation files

| File | Purpose |
|---|---|
| `11-powerbi-measures.md` | Captures the Power BI measure logic used as the business source of truth |
| `12-databricks-mapping-backlog.md` | Tracks unresolved Databricks mapping gaps |
| `09-schema-validation-summary.md` | Summarises confirmed schema validation and outstanding mapping questions |
| `13-business-validation-backlog.md` | Tracks assumptions and business rules to validate after the celebration analysis |

### Current metric status

| Celebration metric | Status |
|---|---|
| Customers | Power BI logic captured; Databricks base fields confirmed |
| Activity | Power BI logic captured; Databricks status mapping pending |
| Support | Support rate logic captured; support numerator mapping pending |
| Activity CSAT | Power BI logic captured; Databricks survey source mapping pending |
| Support CSAT | Power BI logic captured; Databricks survey and support eligibility mapping pending |

### Current SQL validation files

| File | Purpose |
|---|---|
| `sql/07_activity_status_validation.sql` | Profiles permit status combinations to recreate Activity inclusion logic |
| `sql/08_support_logic_validation.sql` | Profiles support records to map the Self-Service Support numerator |
| `sql/09_csat_source_validation.sql` | Inspects likely CSAT / survey source fields |

### Current principle

Power BI measures are the business logic source of truth.

Databricks SQL outputs should be treated as provisional until the mapping backlog is resolved.
