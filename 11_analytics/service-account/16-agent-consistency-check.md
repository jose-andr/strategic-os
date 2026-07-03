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
- Support CSAT mapping notes

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
| `19-genie-pilot-test-prompts.md` | Genie test prompts and expected behaviour |
| `20-support-csat-service-mapping.md` | Manual Support CSAT mapping and implementation notes |
| `sql/README.md` | SQL inventory and usage guidance |

## Consistency rules

### 1. Customers

Accepted wording:

- Customers = Service Account / portal sign-ups
- Customers does not mean all CRM accounts
- All accounts is context only
- Customer sign-ups use `vwaccount.account_id`
- Customer sign-ups filter `customer_portal = TRUE`
- Customer sign-ups use `first_account_portal_on_date`

Flag wording that implies:

- Customers = all CRM accounts
- customer base = all accounts, unless explicitly used as context
- customer growth can be calculated from account creation date alone

### 2. Activity

Accepted wording:

- Activity = application workflow activity through the portal
- Activity is not permit lifecycle activity
- Activity uses `vwpermit`
- Activity date = `period_start`
- Activity counts distinct `application_id`
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

### 3. Support demand

Accepted wording:

- Support should be shown as a rate relative to Activity
- Preferred headline KPI = support per 100 activities
- Support numerator source = `datahub_datamart.customer_account_management.vwsupport`
- Support cases = distinct `case_id`
- Support cases filter `is_after_service_enablement = TRUE`
- Support date = `date_time_opened`
- Do not use `vwsupport_enriched` for headline support KPI production

Flag wording that:

- uses raw support volume as the main support headline
- uses `vwsupport_enriched` as a headline source
- treats support increase as negative without considering activity growth
- calculates support demand without filtering to portal-enabled support logic

### 4. CSAT

Accepted wording:

- CSAT source = `datahub_datamart.customer_intelligence.vwcase`
- CSAT date = `Survey_Completion_Date`
- CSAT score = `Satisfaction_Score_5`
- Positive CSAT = `Satisfaction_Score_5` in 4 or 5
- Valid CSAT response = non-null `Satisfaction_Score_5`
- Activity CSAT and Support CSAT are separate metrics
- Activity CSAT = satisfaction for portal-enabled application activity
- Support CSAT = satisfaction for manually mapped enquiry/support pathways only

Flag wording that says:

- generic CSAT without specifying Activity CSAT or Support CSAT
- `vwcase_survey` is the pilot CSAT source
- `vwsurvey_feedback` is required for pilot CSAT
- pre/post enablement CSAT is viable for the full portal service cohort
- Support CSAT can be calculated from all Customer Enquiry services

### 5. Activity CSAT

Accepted wording:

- Activity CSAT uses `customer_intelligence.vwcase`
- Activity CSAT is scoped to portal-enabled services from `vwservice_enablement`
- Activity CSAT compares FY2024/25 with FY2025/26 for the celebration pilot
- FY2023/24 has only 18 valid responses and should not be used as the main baseline
- Activity CSAT improved from 76.5% to 80.6%
- Valid Activity CSAT responses increased from 889 to 1,721
- Do not claim portal enablement caused the improvement unless causality is supported

Flag wording that:

- uses FY2023/24 as the main Activity CSAT baseline
- claims portal enablement caused Activity CSAT improvement
- frames pre/post enablement CSAT as proven impact across all services

### 6. Support CSAT

Accepted wording:

- Support CSAT must use the manually mapped support service list
- Support CSAT should only include mapped `support_service_name` values
- Manual mapping is documented in `20-support-csat-service-mapping.md`
- Working Databricks workspace mapping file is `/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`
- For the celebration pilot, Support CSAT can be used only where the manual mapping and outputs are explicitly documented
- Support CSAT is not yet a repeatable self-serve Genie metric
- Future self-serve Support CSAT requires a governed Databricks mapping asset

Flag wording that:

- calculates Support CSAT from all Customer Enquiry services
- calculates Support CSAT from automatic service-name matching
- calculates Support CSAT from `Record_Type`
- calculates Support CSAT from `vwsupport_enriched`
- claims Support CSAT improved overall without applying the manual mapping
- implies the manual mapping covers every service in `vwservice_enablement`

### 7. Support CSAT productionisation

Accepted wording:

- The celebration pilot analysis is complete using the manually documented Support CSAT mapping
- The mapping is not yet implemented as a governed Databricks table or curated view
- Genie cannot reliably use a personal workspace markdown or SQL file as a reusable executable filter
- A governed mapping asset is required for future self-serve analysis

Candidate governed asset names:

- `datahub_datamart.customer_account_management.support_csat_service_mapping`
- `datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

Flag wording that:

- says Genie can reliably use the personal workspace markdown as production context
- says Support CSAT is fully productionised
- treats the manual markdown file as a governed data asset

### 8. Record Type

Accepted wording:

- `Record_Type` is a CRM classification field
- `Apply` may help identify application-style CSAT records
- `Ask` may indicate enquiry-style demand
- `Record_Type` is not a metric definition
- `Record_Type` should not be used as the main Support CSAT breakdown or rationale

Flag wording that treats:

- `Ask` as complete Support CSAT
- `Apply` as the full Activity KPI
- `Record_Type` as a metric definition rather than a segmentation field

### 9. Support pathway taxonomy

Accepted wording:

- Resolved = contact centre resolved without help from another area
- Assisted = contact centre resolved with help from another area
- Expert Enquiry = assigned to expert because it could not be resolved during the interaction
- Support pathway should come from the mapped `support_pathway` values where available
- Low Assisted usage should be treated as a business validation question, not a confirmed conclusion

Flag wording that:

- infers support pathway from broad service-name matching without the mapping
- treats low Assisted usage as proven agent behaviour without validation
- uses `Record_Type` instead of Resolved / Assisted / Expert Enquiry for support pathway analysis

### 10. RPP Support CSAT proxy

Accepted wording:

- RPP Support CSAT proxy supports support-pathway stabilisation analysis
- It is based on selected enquiry/support services
- It is not a direct portal transaction CSAT metric
- It is not a complete Service Account support CSAT standard
- It can be used as pathway-specific evidence if caveated

Flag wording that presents the proxy as:

- full Support CSAT
- direct portal CSAT
- whole-of-Service-Account support performance
- proof that all support experience improved

### 11. Slide-safe claims

Accepted slide-safe claims for the current celebration comparison:

- Customer sign-ups increased from 9,838 to 15,570, up 58.3%
- Application workflow activity increased from 2,209 to 3,751, up 69.8%
- Support demand per 100 activities reduced from 496.9 to 412.6, about 17.0% lower
- Activity CSAT improved from 76.5% to 80.6%
- Valid Activity CSAT responses increased from 889 to 1,721
- Support CSAT should only be discussed where the manual support service mapping has been applied and documented

Flag claims that say:

- customer sign-ups increased by 78.9%
- activity increased by 70.5%
- support per 100 activities reduced by 17.6%
- Activity CSAT is only a current-state strength metric and cannot be compared FY2024/25 to FY2025/26
- Support CSAT improved overall without mapped Support CSAT evidence
- portal enablement caused CSAT improvement
- pre/post CSAT proves portal impact across all services

## Output format

When the agent completes the check, return:

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

## GA4 portal-entry consistency checks

Use these checks only for documentation and slide-support review.

GA4 is not part of the governed Databricks headline metric set.

| Check | Pass condition |
|---|---|
| GA4 status | Documentation states that current GA4 values are old and should not be used as final EOFY evidence. |
| GA4 role | GA4 is described as contextual digital behaviour evidence only. |
| Headline metrics | GA4 does not replace Customers, Activity, Support demand, Activity CSAT, or mapped Support CSAT. |
| Coverage caveat | GA4 portal-entry values are not described as total portal usage. |
| Sign-up caveat | GA4 sign-up clicks are not treated as completed Service Account sign-ups. |
| Refresh requirement | Documentation requires refreshed GA4 CSV exports and confirmed reporting window before use. |
| Reconciliation | Documentation does not reconcile GA4 with Databricks sign-ups unless tracking coverage and attribution are validated. |
| Slide wording | Any GA4 slide wording is caveated as selected portal login and registration journey behaviour. |

### Required reviewer response

If GA4 is mentioned in a slide, report, or README, the agent should confirm:

> GA4 is being used as contextual supporting evidence only, not as a headline KPI or total portal usage measure.
