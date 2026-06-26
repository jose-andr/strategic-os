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
4. Strong activity CSAT
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
| CSAT | Must distinguish direct Activity CSAT from proxy Support CSAT. |

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

The slide story should avoid overstating causality or improvement where the baseline is weak.

### Reusable pattern

Use a small, outcome-led analytics use case before expanding into broader AI-accelerated analytics.

### Decision or recommendation

Continue using the one-slide celebration analysis as the pilot use case.

### Next improvement

Convert accepted pilot logic into reusable SQL templates and validation checklists.

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

Direct Activity CSAT is available for portal-relevant `Apply` services.

### What did not work

A simple pre/post enablement CSAT comparison did not work for the pilot.

Most portal-enabled services have no usable pre-enable CSAT base in `customer_intelligence.vwcase`.

### Metric issues found

The portal service-name cohort has a strong current-year Activity CSAT base, but weak prior-year and pre-enable response data.

Key findings:

| Finding | Implication |
|---|---|
| Current FY Activity CSAT has 888 valid responses. | Usable as a current-state strength metric. |
| Previous FY Activity CSAT has only 18 valid responses. | Do not frame as a YoY improvement. |
| Most portal-enabled services have no usable pre-enable CSAT base. | Do not use pre/post enablement CSAT as a headline impact measure. |
| Parking dominates current Activity CSAT response volume. | Interpret results in the context of Residential Parking migration. |
| RPP Support CSAT can be approximated using selected enquiry/support services. | Use as explanatory evidence of support-pathway stabilisation. |

### Schema issues found

`customer_intelligence.vwcase` does not include `is_after_enablement`.

For CSAT analysis, portal relevance must be derived by joining to:

`datahub_datamart.customer_account_management.vwservice_enablement`

using normalised service names.

### Genie / AI issues found

The assistant initially over-relied on a post-enable filter and assumed support-style CSAT could be derived from `Record_Type = 'Ask'`.

The improved framing separates:

- service cohort comparison
- pre/post enablement diagnostics
- RPP support proxy analysis

### Interpretation issues found

`Record_Type` is a CRM classification field, not a metric definition.

Do not assume:

`Ask = Support CSAT`

without validating service names, channels, support case logic, and business interpretation.

### Reusable pattern

Separate three CSAT questions:

| Question | Best current method |
|---|---|
| How satisfied are customers with portal-enabled application activity now? | Direct Activity CSAT from `customer_intelligence.vwcase`. |
| Did CSAT improve after portal enablement? | Only where a usable pre-enable baseline exists. Not viable for the current pilot. |
| Is support experience stabilising after migration? | RPP Support CSAT proxy using selected enquiry/support services. |

### Decision or recommendation

For the celebration slide, use:

> Portal-enabled activity CSAT is strong at 76.5% from 888 current-year responses.

For support, use proxy language:

> Residential Parking expert support is showing signs of stabilisation, with proxy CSAT recovering from 69% post-portal to 78% in the current ELT period.

### Next improvement

Confirm RPP proxy period dates and maintain the RPP proxy service mapping as a reusable asset.
