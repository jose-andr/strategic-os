# Lessons Learned

This file captures reusable learnings from the Service Account EOFY celebration analysis.

Use this file to preserve patterns, decisions, and cautions that will help future Strategic OS / analytics work.

Do not store:

- raw organisational data
- customer-level information
- case-level records
- survey comments
- Salesforce URLs
- personally identifiable information

## Lesson entry template

### Date

[YYYY-MM-DD]

### Theme

[Metric definition / schema validation / SQL pattern / CSAT interpretation / Genie prompt / slide storytelling / stakeholder validation]

### What we tested

[Describe the schema, query, metric, prompt, analysis step, or story decision tested.]

### What worked

-

### What did not work

-

### Metric issues found

-

### Schema issues found

-

### Genie / AI issues found

-

### Interpretation issues found

-

### Reusable pattern

-

### Decision or recommendation

-

### Next improvement

-

---

## Lesson 1: Start with a small outcome-led analytics use case

### Date

[YYYY-MM-DD]

### Theme

Analytics scoping

### What we tested

Whether the curated `customer_account_management` schema could support a one-slide EOFY celebration analysis for Service Account / Portal CX.

### What worked

Using a small, outcome-led use case helped keep the analysis focused.

The celebration frame made the analytical task concrete:

1. More customers
2. More self-service activity
3. Less support demand relative to activity
4. Strong or improving Activity CSAT
5. Support stabilisation

### What did not work

Starting from broad schema exploration alone would have created too many possible paths.

The analysis needed a clear slide story to decide which validation questions mattered first.

### Metric issues found

Some terms that sound simple on a slide need precise internal definitions.

Examples:

| Slide term | Required internal precision |
|---|---|
| Customers | Service Account / portal sign-ups, not all CRM accounts. |
| Activity | Application workflow activity, not permit lifecycle activity. |
| Support | Support demand relative to activity, not raw support volume. |
| Activity CSAT | Satisfaction for portal-enabled application activity. |
| Support CSAT | Satisfaction for mapped enquiry/support pathways only. |

### Schema issues found

The curated schema can support the pilot, but some logic still exists in Power BI-derived layers rather than native Databricks views.

Example:

`vwpermit_statused` appears to be Power BI-created logic rather than a native Databricks view.

### Genie / AI issues found

AI assistance is most useful when constrained by:

- a specific outcome
- known source tables
- accepted metric definitions
- explicit caveats
- copy-pasteable SQL templates

### Interpretation issues found

The slide story should avoid overstating causality or improvement where the baseline is weak or the metric is not productionised.

### Reusable pattern

Use a small, outcome-led analytics use case before expanding into broader AI-accelerated analytics.

### Decision or recommendation

Continue using the one-slide celebration analysis as the pilot use case.

### Next improvement

Convert accepted pilot logic into reusable SQL templates, validation checklists, and governed data assets where required.

---

## Lesson 2: CSAT source and comparison learning

### Date

[YYYY-MM-DD]

### Theme

CSAT interpretation

### What we tested

Whether CSAT for Service Account / Portal CX could be calculated from Databricks using:

`datahub_datamart.customer_intelligence.vwcase`

We also tested whether portal enablement dates could support a pre/post CSAT comparison.

### What worked

`customer_intelligence.vwcase` is the best pilot source for CSAT because it contains the required case, service, channel, and survey satisfaction fields.

Required fields include:

| Concept | Field |
|---|---|
| Survey completion date | `Survey_Completion_Date` |
| Satisfaction score | `Satisfaction_Score_5` |
| Service name | `Service_Name` |
| Service group | `Service_Group` |
| Channel | `Channel` |
| Case reference | `Case_Number` |
| Record type | `Record_Type` |

Direct Activity CSAT is available for portal-relevant application services.

### What did not work

A simple pre/post enablement CSAT comparison did not work for the pilot.

Most portal-enabled services have no usable pre-enable CSAT base in `customer_intelligence.vwcase`.

### Metric issues found

The portal service-name cohort has a usable current and previous year Activity CSAT base for the celebration comparison, but weak earlier pre-enable response data.

Key findings:

| Finding | Implication |
|---|---|
| FY2024/25 Activity CSAT has 889 valid responses. | Usable as the previous year comparison base. |
| FY2025/26 Activity CSAT has 1,721 valid responses. | Usable as the current year comparison base. |
| Activity CSAT improved from 76.5% to 80.6%. | Can be used as a celebration proof point, with no causality claim. |
| FY2023/24 Activity CSAT has only 18 valid responses. | Do not use as the main baseline. |
| Most portal-enabled services have no usable pre-enable CSAT base. | Do not use pre/post enablement CSAT as a headline impact measure. |
| Parking contributes strongly to current Activity CSAT response volume. | Interpret results in the context of Residential Parking migration. |

### Schema issues found

`customer_intelligence.vwcase` does not include `is_after_enablement`.

For Activity CSAT analysis, portal relevance must be derived by matching:

`customer_intelligence.vwcase.Service_Name`

to the portal-enabled service cohort in:

`datahub_datamart.customer_account_management.vwservice_enablement`

### Genie / AI issues found

The assistant initially over-relied on a post-enable filter and assumed support-style CSAT could be derived from `Record_Type = 'Ask'`.

The improved framing separates:

- Activity CSAT for portal-enabled application services
- pre/post enablement diagnostics
- Support CSAT for manually mapped support/enquiry services

### Interpretation issues found

`Record_Type` is a CRM classification field, not a metric definition.

Do not assume:

`Ask = Support CSAT`

without validating service names, channels, support case logic, and business interpretation.

### Reusable pattern

Separate three CSAT questions:

| Question | Best current method |
|---|---|
| How satisfied are customers with portal-enabled application activity? | Direct Activity CSAT from `customer_intelligence.vwcase`, scoped to portal-enabled services. |
| Did CSAT improve after portal enablement? | Only where a usable pre-enable baseline exists. Not viable as a headline for the current pilot. |
| How satisfied are customers with portal-relevant support pathways? | Support CSAT using the manually mapped support/enquiry service list. |

### Decision or recommendation

For the celebration slide, use:

> Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Do not claim that portal enablement caused the improvement unless causality is supported.

### Next improvement

Maintain separate definitions for Activity CSAT and Support CSAT, and avoid collapsing them into a single generic CSAT metric.

---

## Lesson 3: Support CSAT needs a governed mapping asset

### Date

[YYYY-MM-DD]

### Theme

Support CSAT / data productisation / Genie reliability

### What we tested

Whether Support CSAT could be calculated as a repeatable Genie metric using:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- a manually curated mapping in a personal Databricks workspace markdown file
- a saved SQL file in a personal Databricks workspace

### What worked

The analysis confirmed that Support CSAT requires a curated mapping between portal-enabled services and related enquiry/support services.

The final pilot mapping was documented in:

`analytics/service-account/20-support-csat-service-mapping.md`

The working Databricks workspace mapping file was:

`/Users/jose.andrade@melbourne.vic.gov.au/support-csat-service-mapping.md`

The mapping allowed Support CSAT to be scoped to portal-relevant support experience rather than all support experience.

### What did not work

Automatic service-name matching did not produce reliable Support CSAT scope.

Personal Databricks workspace markdown and SQL files were not reliable as reusable Genie-accessible mapping assets.

Genie could recognise that Support CSAT required a manual mapping, but could not consistently access or apply the personal workspace file as an executable filter.

### Metric issues found

Support CSAT is not the same as all Customer Enquiry CSAT.

Support CSAT should only include enquiry/support services that are explicitly mapped to portal-enabled services.

The current mapping is final for the celebration pilot, but it is narrower than the full `vwservice_enablement` service list and should not be interpreted as complete coverage of all portal-enabled services.

### Schema issues found

The required Support CSAT mapping does not yet exist as a governed Databricks table or curated view.

Candidate governed asset names:

`datahub_datamart.customer_account_management.support_csat_service_mapping`

or

`datahub_datamart.customer_account_management.vwsupport_csat_service_mapping`

### Genie / AI issues found

Genie needs the mapping to exist as an accessible governed data asset, not as a personal workspace file, for reliable self-serve analysis.

Without a governed mapping asset, Genie may either:

- refuse to calculate Support CSAT because the mapping is unavailable
- fall back to broad Customer Enquiry logic
- over-map unrelated support services
- under-map valid portal-relevant support pathways

### Interpretation issues found

Support CSAT should not be claimed as an overall improved metric unless the manual mapping has been applied.

Support pathway analysis should use the mapped `support_pathway` values:

| Pathway | Meaning |
|---|---|
| Resolved | Contact centre resolved the enquiry during the interaction without assistance from another business area. |
| Assisted | Contact centre resolved the enquiry during the interaction with assistance from another business area. |
| Expert Enquiry | Contact centre could not resolve the enquiry during the interaction, so the case was assigned to an expert to contact the customer. |

The Assisted pathway appears to have low usage in some analysis outputs. This may reflect operational classification behaviour and should be treated as a business validation question, not a confirmed data conclusion.

### Reusable pattern

For support-related experience metrics, separate:

| Layer | Purpose |
|---|---|
| Portal-enabled service cohort | Defines which services are in the Service Account / Portal CX scope. |
| Support case logic | Defines support demand and support rate. |
| Support CSAT mapping | Defines which enquiry/support services are included in Support CSAT. |
| Support pathway taxonomy | Explains Resolved, Assisted, and Expert Enquiry. |
| Governed data asset | Makes the mapping reusable for Genie and future analysts. |

### Decision or recommendation

For the EOFY celebration pilot, Support CSAT can be used only where the manual mapping and analysis output are explicitly documented.

Support CSAT should not be treated as a repeatable self-serve Genie metric until the mapping is implemented as a governed Databricks reference table or curated view.

### Next improvement

Engage data / platform developers to productionise the Support CSAT mapping as a governed asset.

Target outcome:

- a governed table or view containing the final mapped support services
- clear ownership and change control
- update process when new services are portal-enabled
- Genie Space connected to the governed mapping asset
