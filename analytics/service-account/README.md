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

## Current EOFY celebration pilot status

The current Service Account / Portal CX pilot supports a one-slide EOFY celebration story.

### Validated / accepted headline proof points

| Story point | Metric | Result | Status |
|---|---|---:|---|
| More customers | Service Account / portal sign-ups | +78.9% | Validated |
| More self-service activity | Activity applications | +70.5% | Draft accepted |
| Less support demand relative to activity | Support per 100 activities | -17.6% | Draft accepted |
| Strong activity CSAT | Portal-enabled Activity CSAT | 76.5% from 888 current-year responses | Accepted with caveat |
| Support stabilisation | RPP Support CSAT proxy | Residential Parking expert enquiry recovered from 69% to 78% | Proxy accepted with caveat |

### Slide-safe interpretation

Service Account adoption and usage are growing. Customer sign-ups increased by 78.9%, and application workflow activity increased by 70.5%. Support demand per 100 activities reduced by 17.6%, showing that support demand is reducing relative to self-service activity.

Customers are reporting strong satisfaction with portal-enabled activity, with 76.5% CSAT from 888 current-year responses. Residential Parking support is also showing signs of stabilisation after migration, with expert enquiry CSAT recovering from 69% post-portal to 78% in the current ELT period.

### Important caveats

- Activity CSAT should be treated as a current-state strength metric, not a YoY improvement claim.
- RPP Support CSAT is a proxy based on selected enquiry/support services, not a complete Service Account support CSAT standard.
- Pre/post CSAT analysis is not viable for the full portal service cohort because most services do not have a usable pre-enable CSAT base in `customer_intelligence.vwcase`.
- Support should be shown as a rate relative to activity, not as raw support volume.
- No raw organisational data or customer-level data should be stored in this repository.

## Agent consistency review

Before treating any Service Account / Portal CX artefact as ready for use, run an agent consistency review.

Use:

`17-agent-review-prompt.md`

The review is governed by:

`16-agent-consistency-check.md`

The agent should check for:

- metric drift
- source confusion
- CSAT overclaiming
- inconsistent slide language
- incorrect use of `Record_Type`
- incorrect use of `vwsupport_enriched`
- confusion between Activity CSAT and RPP Support CSAT proxy

The agent should not rewrite files unless explicitly asked.

Expected output:

| Area | Status | Issue found | Recommended fix |
|---|---|---|---|
| Customers | Pass / Needs update |  |  |
| Activity | Pass / Needs update |  |  |
| Support | Pass / Needs update |  |  |
| CSAT | Pass / Needs update |  |  |
| Record Type | Pass / Needs update |  |  |
| RPP proxy | Pass / Needs update |  |  |
| Slide claims | Pass / Needs update |  |  |
| Source usage | Pass / Needs update |  |  |

## Genie pilot testing

Before adding broader organisational structure to the Genie context, test the current Service Account / Portal CX pilot context.

Use:

`19-genie-pilot-test-prompts.md`

The pilot tests whether Genie can reliably:

- apply accepted metric definitions
- select the correct Databricks source tables
- distinguish headline, diagnostic, and proxy metrics
- avoid CSAT overclaiming
- avoid source confusion
- explain caveats clearly
- produce slide-safe synthesis

The Genie context file is:

`18-genie-agent-context.md`

Do not add broad organisational structure until the pilot tests show that Genie can answer the core Service Account / Portal CX questions correctly.

Organisational structure should be added later only as an enrichment layer for questions about service ownership, branch accountability, escalation pathways, operating model implications, or prioritisation.
