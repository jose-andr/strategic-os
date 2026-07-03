# Agent Review Prompt

Use this prompt when asking an AI agent to review the Service Account / Portal CX repository for consistency.

## Prompt

You are acting as a Business Design, Service Design, Strategy, and AI Systems Architect.

Review the Service Account / Portal CX analytics files for consistency, metric drift, source confusion, and overclaiming.

Use this checklist as the governing standard:

`analytics/service-account/16-agent-consistency-check.md`

Review these files as a minimum:

- `analytics/service-account/03-metric-definitions.md`
- `analytics/service-account/04-analysis-plan.md`
- `analytics/service-account/06-insight-template.md`
- `analytics/service-account/07-slide-storyline.md`
- `analytics/service-account/08-lessons-learned.md`
- `analytics/service-account/09-schema-validation-summary.md`
- `analytics/service-account/10-glossary.md`
- `analytics/service-account/13-business-validation-backlog.md`
- `analytics/service-account/14-capability-milestones.md`
- `analytics/service-account/15-rpp-support-csat-proxy.md`
- `analytics/service-account/19-genie-pilot-test-prompts.md`
- `analytics/service-account/20-support-csat-service-mapping.md`
- `analytics/service-account/sql/README.md`

Check specifically for inconsistencies in:

- Customers
- Activity
- Support demand
- Activity CSAT
- Support CSAT
- Support CSAT productionisation
- CRM Record Type interpretation
- Support pathway taxonomy
- RPP Support CSAT proxy
- slide-safe claims
- source usage

Support CSAT review rule:

Support CSAT must not be calculated from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped support services

Support CSAT is valid only where the manually documented Support CSAT mapping has been applied.

If no governed mapping asset is available, state that Support CSAT is not yet a repeatable self-serve Genie metric.

For the celebration pilot, Support CSAT can only be discussed where the manual mapping and outputs are explicitly documented.

Do not rewrite files unless asked.

Return the result in this format:

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

- Overall status:
- Highest-risk inconsistency:
- Files requiring edits:
- Recommended next action:
## GA4 portal-entry review instruction

Check whether GA4 portal-entry behaviour is described consistently across the Service Account / Portal CX artefacts.

GA4 should be treated as contextual digital behaviour evidence only.

Review for the following:

- current GA4 values are described as old and not final EOFY evidence
- GA4 CSV export refresh is required before slide or report use
- refreshed reporting window must be confirmed
- selected portal login and registration links must be validated
- GA4 portal-entry values are not described as total portal usage
- GA4 sign-up clicks are not treated as completed Service Account sign-ups
- GA4 does not replace Databricks headline metrics for Customers, Activity, Support demand, Activity CSAT, or mapped Support CSAT
- any GA4 slide wording is clearly caveated as selected portal-entry behaviour

Expected review response:

| Area | Status | Issue found | Recommended fix |
|---|---|---|---|
| GA4 status | Pass / Needs update |  |  |
| GA4 refresh requirement | Pass / Needs update |  |  |
| GA4 coverage caveat | Pass / Needs update |  |  |
| GA4 sign-up caveat | Pass / Needs update |  |  |
| GA4 relationship to Databricks metrics | Pass / Needs update |  |  |
| GA4 slide wording | Pass / Needs update |  |  |
