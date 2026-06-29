# Service Account Analytics

This folder documents reusable analytics patterns for the Service Account / Portal CX dashboard, beginning with an EOFY branch celebration use case.

## Current use case

Create a one-slide EOFY celebration analysis using curated Databricks schemas:

`datahub_datamart.customer_account_management`

`datahub_datamart.customer_intelligence`

Use the silver-layer CRM case view only as a descriptor source:

`datahub_refined.customer.vwcase`

## Target story

The current analysis supports this celebration frame:

- More customers
- More self-service activity
- Less support demand relative to activity
- Better Activity CSAT
- Support CSAT only where manually mapped and documented

## Primary outcome

A concise, executive-ready one-slide story showing how Service Account / Portal CX performed in FY2025/26 compared with FY2024/25.

## Reusable outcome

A documented pattern for turning curated datamart schemas into AI-assisted analytics outputs that can later feed the Strategic OS.

## Data governance principle

Organisational data remains in Databricks, Power BI, Salesforce, and approved organisational systems.

This repository stores only:

- reusable prompts
- SQL templates
- metric definitions
- assumptions
- caveats
- non-sensitive synthesis
- lessons learned

Do not store:

- raw organisational data
- customer-level records
- survey comments
- case URLs
- personal information
- sensitive operational extracts

## Source system principles

| Area | Source |
|---|---|
| Customers | `datahub_datamart.customer_account_management.vwaccount` |
| Activity | `datahub_datamart.customer_account_management.vwpermit` |
| Support demand | `datahub_datamart.customer_account_management.vwsupport` |
| Portal service enablement | `datahub_datamart.customer_account_management.vwservice_enablement` |
| CSAT | `datahub_datamart.customer_intelligence.vwcase` |
| CRM case descriptors | `datahub_refined.customer.vwcase` |
| Support CSAT mapping | Manual mapping documented in `20-support-csat-service-mapping.md` |

Do not use:

| Source | Decision |
|---|---|
| `customer_account_management.vwsupport_enriched` | Do not use for headline KPI production or CSAT calculation. Optional exploratory context only. |
| `customer_intelligence.vwsurvey_feedback` | Do not use unless later response-level survey validation is required. |
| `vwcase_survey` | Do not use for this pilot. |
| `Record_Type` | Do not use as a Support CSAT definition. CRM metadata only. |

## Key documentation files

| File | Purpose |
|---|---|
| `03-metric-definitions.md` | Defines pilot metrics, source rules, caveats, and validated results. |
| `04-analysis-plan.md` | Documents the analysis sequence and current validation path. |
| `06-insight-template.md` | Provides a reusable structure for turning results into an insight narrative. |
| `07-slide-storyline.md` | Defines the one-slide celebration story and slide-safe wording. |
| `08-lessons-learned.md` | Captures reusable lessons from the pilot. |
| `09-schema-validation-summary.md` | Summarises confirmed schema validation and outstanding mapping questions. |
| `10-glossary.md` | Defines shared language for slide terms and internal metric logic. |
| `11-powerbi-measures.md` | Captures the Power BI measure logic used as the business source of truth. |
| `12-databricks-mapping-backlog.md` | Tracks unresolved Databricks mapping gaps. |
| `13-business-validation-backlog.md` | Tracks assumptions and business rules to validate after the celebration analysis. |
| `14-capability-milestones.md` | Tracks service, channel, platform, migration, and operating model milestones. |
| `15-rpp-support-csat-proxy.md` | Documents the Residential Parking Permit support CSAT proxy. |
| `16-agent-consistency-check.md` | Governing checklist for reviewing repo consistency. |
| `17-agent-review-prompt.md` | Prompt for asking an AI agent to review the artefacts. |
| `18-genie-agent-context.md` | Context rules for configuring or briefing Genie. |
| `19-genie-pilot-test-prompts.md` | Test prompts for validating Genie behaviour. |
| `20-support-csat-service-mapping.md` | Manual Support CSAT mapping and productionisation guidance. |
| `sql/README.md` | SQL file index and SQL-specific usage notes. |

## Current EOFY celebration pilot status

The current Service Account / Portal CX pilot supports a one-slide EOFY celebration story.

### Validated / accepted headline proof points

| Story point | Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement | Status |
|---|---|---:|---:|---:|---|
| More customers | Service Account / portal sign-ups | 9,838 | 15,570 | +58.3% | Validated |
| More self-service activity | Application workflow Activity | 2,209 | 3,751 | +69.8% | Accepted |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 412.6 | about -17.0% | Accepted |
| Better Activity CSAT | Portal-enabled Activity CSAT | 76.5% | 80.6% | +4.1 pp | Accepted |
| Stronger Activity CSAT response base | Valid responses | 889 | 1,721 | +832 responses | Accepted |
| Support CSAT | Mapped portal-relevant support pathways | Manual mapping only | Manual mapping only | Do not claim unless mapping applied | Pilot only |

### Slide-safe interpretation

Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Important caveats

- Customers means Service Account / portal sign-ups, not all CRM accounts.
- Activity means application workflow activity, not permit lifecycle activity.
- Support should be shown as a rate relative to Activity, not as raw support volume.
- Support demand uses `vwsupport`, not `vwsupport_enriched`.
- Activity CSAT uses `customer_intelligence.vwcase` scoped to portal-enabled services.
- FY2023/24 Activity CSAT has only 18 valid responses and should not be used as the main baseline.
- Do not claim portal enablement caused CSAT improvement unless causality is supported.
- Support CSAT requires the manually documented support service mapping.
- Support CSAT is not yet a repeatable self-serve Genie metric.
- RPP Support CSAT is a proxy, not complete Service Account Support CSAT.
- Pre/post CSAT analysis is not viable for the full portal service cohort because most services do not have a usable pre-enable CSAT base in `customer_intelligence.vwcase`.

## Support CSAT productionisation

Support CSAT cannot be reliably calculated from schema inference alone.

Do not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

For the celebration pilot, use only the manual mapping documented in:

`20-support-csat-service-mapping.md`

Future self-serve Support CSAT requires a governed Databricks mapping asset, such as:

`datahub_datamart.customer_account_management.support_csat_service_mapping`

or

`datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

Until this exists, Support CSAT is a documented pilot metric only.

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
- confusion between Activity CSAT, Support CSAT, and RPP Support CSAT proxy
- unsupported claims about causality
- missing caveats around Support CSAT mapping

The agent should not rewrite files unless explicitly asked.

Expected output:

| Area | Status | Issue found | Recommended fix |
|---|---|---|---|
| Customers | Pass / Needs update |  |  |
| Activity | Pass / Needs update |  |  |
| Support demand | Pass / Needs update |  |  |
| Activity CSAT | Pass / Needs update |  |  |
| Support CSAT | Pass / Needs update |  |  |
| Support CSAT productionisation | Pass / Needs update |  |  |
| Record Type | Pass / Needs update |  |  |
| Support pathway taxonomy | Pass / Needs update |  |  |
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
- refuse or caveat Support CSAT when governed mapping is unavailable

The Genie context file is:

`18-genie-agent-context.md`

Do not add broad organisational structure until the pilot tests show that Genie can answer the core Service Account / Portal CX questions correctly.

Organisational structure should be added later only as an enrichment layer for questions about service ownership, branch accountability, escalation pathways, operating model implications, or prioritisation.

## Current decision

The pilot is strong enough to support the EOFY celebration slide.

The reusable reporting standard still needs:

- formal Activity KPI validation
- support numerator validation beyond the pilot rule
- governed Support CSAT mapping
- ownership and update process for Support CSAT mapping
- channel segmentation validation
- production-grade Databricks SQL / curated views where required
