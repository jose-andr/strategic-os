# Agent Consistency Check

This file defines the consistency check an AI agent should run before any Service Account / Portal CX artefact is treated as ready for use.

The purpose is to prevent metric drift, source confusion, and overclaiming in the EOFY celebration analysis.

## Agent role

Act as a Business Design, Service Design, Strategy, and AI Systems Architect.

Review the Service Account repository for consistency across:

- metric definitions
- glossary language
- SQL files
- analysis plan
- insight template
- slide storyline
- schema validation notes
- business validation backlog
- lessons learned

## Files to check

Review these files as a minimum:

| File | Purpose |
|---|---|
| `03-metric-definitions.md` | Metric definitions and current results |
| `04-analysis-plan.md` | Analysis workflow and validation path |
| `06-insight-template.md` | Slide-ready synthesis template |
| `07-slide-storyline.md` | Celebration slide storyline |
| `08-lessons-learned.md` | Reusable learnings and cautions |
| `09-schema-validation-summary.md` | Validated source and schema decisions |
| `10-glossary.md` | Canonical language and field meanings |
| `13-business-validation-backlog.md` | Remaining validation questions |
| `14-capability-milestones.md` | Capability changes affecting interpretation |
| `15-rpp-support-csat-proxy.md` | RPP proxy method and caveats |
| `sql/README.md` | SQL inventory and usage guidance |

## Consistency rules

### 1. Customers

Accepted wording:

- Customers = Service Account / portal sign-ups
- Customers does not mean all CRM accounts
- All accounts is context only

Flag wording that implies:

- Customers = all CRM accounts
- customer base = all accounts, unless explicitly used as context

### 2. Activity

Accepted wording:

- Activity = application workflow activity through the portal
- Activity is not permit lifecycle activity
- Activity uses accepted workflow statuses:
  - Draft
  - Submitted
  - Further information requested
  - In Progress
  - Pending Payment

Flag wording that treats these as Activity without validation:

- Issued
- Extended
- Renewed
- Lapsed
- Withdrawn
- Declined

### 3. Support

Accepted wording:

- Support should be shown as a rate relative to Activity
- Preferred headline KPI = support per 100 activities
- Support numerator source = `datahub_datamart.customer_account_management.vwsupport`
- Do not use `vwsupport_enriched` for headline support KPI production

Flag wording that:

- uses raw support volume as the main support headline
- uses `vwsupport_enriched` as a headline source
- treats support increase as negative without considering activity growth

### 4. CSAT

Accepted wording:

- CSAT source = `datahub_datamart.customer_intelligence.vwcase`
- Canonical CRM case field descriptors = `datahub_refined.customer.vwcase`
- Activity CSAT = current-state strength metric
- Activity CSAT should not be framed as YoY improvement
- RPP Support CSAT = proxy, not full support CSAT standard

Flag wording that says:

- Activity CSAT improved YoY
- Support CSAT improved overall
- Ask = Support CSAT
- `vwcase_survey` is the pilot CSAT source
- `vwsurvey_feedback` is required for pilot CSAT
- pre/post enablement CSAT is viable for the full portal service cohort

### 5. Record Type

Accepted wording:

- `Record_Type` is a CRM classification field
- `Apply` is closest fit for portal-enabled application Activity CSAT
- `Ask` may indicate enquiry-style support, but requires validation before being used as Support CSAT

Flag wording that treats:

- `Ask` as complete Support CSAT
- `Apply` as the full Activity KPI
- `Record_Type` as a metric definition rather than a segmentation field

### 6. RPP Support CSAT proxy

Accepted wording:

- RPP Support CSAT proxy supports support-pathway stabilisation analysis
- It is based on selected enquiry/support services
- It is not a direct portal transaction CSAT metric
- It is not a complete Service Account support CSAT standard

Flag wording that presents the proxy as:

- full support CSAT
- direct portal CSAT
- whole-of-Service-Account support performance

### 7. Slide-safe claims

Accepted slide-safe claims:

- Customer sign-ups increased by 78.9%
- Application workflow activity increased by 70.5%
- Support demand per 100 activities reduced by 17.6%
- Portal-enabled Activity CSAT is strong at 76.5% from 888 current-year responses
- Residential Parking expert support is showing signs of stabilisation, with proxy CSAT recovering from 69% post-portal to 78% in the current ELT period

Flag claims that say:

- Activity CSAT improved year on year
- Support CSAT improved overall
- portal enablement caused CSAT improvement
- pre/post CSAT proves portal impact across all services

## Output format

When the agent completes the check, return:

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

Then provide:

## Summary

- Overall status: Pass / Needs update
- Highest-risk inconsistency:
- Files requiring edits:
- Recommended next action:

## Agent instruction

Do not rewrite files unless asked.

First identify inconsistencies and recommend fixes.

If asked to update files, provide copy-pasteable markdown only.
