# Genie Pilot Test Prompts

Use these prompts to test whether Genie correctly applies the Service Account / Portal CX pilot context before adding broader organisational structure.

The goal is to test reasoning quality, source selection, caveat handling, and slide-safe interpretation.

## Test 1: Customers

### Prompt

How many customers signed up to Service Account in the current FY compared with the previous FY?

### Expected behaviour

Genie should:

- use `datahub_datamart.customer_account_management.vwaccount`
- define Customers as Service Account / portal sign-ups
- use `customer_portal = TRUE`
- use `first_account_portal_on_date`
- not confuse Customers with All accounts
- compare FY2024/25 with FY2025/26 unless asked otherwise

### Expected known result

| Period | Customers |
|---|---:|
| Previous FY, FY2024/25 | 9,838 |
| Current FY, FY2025/26 | 15,570 |

Expected interpretation:

> Service Account / portal sign-ups increased by 58.3% year on year.

## Test 2: Activity

### Prompt

Did self-service activity increase in the current FY compared with the previous FY?

### Expected behaviour

Genie should:

- use `datahub_datamart.customer_account_management.vwpermit`
- define Activity as application workflow activity
- use `period_start`
- include Draft, Submitted, Further information requested, In Progress, Pending Payment
- exclude permit lifecycle statuses unless later confirmed
- compare FY2024/25 with FY2025/26 unless asked otherwise

### Expected known result

| Period | Activity applications |
|---|---:|
| Previous FY, FY2024/25 | 2,209 |
| Current FY, FY2025/26 | 3,751 |

Expected interpretation:

> Application workflow activity increased by 69.8%.

## Test 3: Support rate

### Prompt

Did support demand reduce relative to self-service activity?

### Expected behaviour

Genie should:

- use `datahub_datamart.customer_account_management.vwsupport` for support numerator
- use `vwpermit` activity applications as denominator
- calculate support per 100 activities
- filter support cases to `is_after_service_enablement = TRUE`
- use `date_time_opened` for support case date
- avoid using raw support volume as the headline
- not use `vwsupport_enriched` for headline KPI production
- compare FY2024/25 with FY2025/26 unless asked otherwise

### Expected known result

| Period | Activity applications | Support cases | Support per 100 activities |
|---|---:|---:|---:|
| Previous FY, FY2024/25 | 2,209 | 10,976 | 496.9 |
| Current FY, FY2025/26 | 3,751 | 15,475 | 412.6 |

Expected interpretation:

> Support demand reduced by about 17.0% relative to activity. Support volume increased, but activity increased faster.

## Test 4: Activity CSAT

### Prompt

Did Activity CSAT improve in the current FY compared with the previous FY?

### Expected behaviour

Genie should:

- use `datahub_datamart.customer_intelligence.vwcase`
- define CSAT using `Satisfaction_Score_5 IN (4, 5)` over non-null satisfaction scores
- use `Survey_Completion_Date`
- scope Activity CSAT to portal-enabled services from `vwservice_enablement`
- compare FY2024/25 with FY2025/26 unless asked otherwise
- explain that FY2023/24 has only 18 valid responses and should not be used as the main baseline
- avoid claiming portal enablement caused the improvement

### Expected known result

| Period | Valid responses | Positive responses | Activity CSAT |
|---|---:|---:|---:|
| FY2023/24 | 18 | 16 | 88.9% |
| Previous FY, FY2024/25 | 889 | 680 | 76.5% |
| Current FY, FY2025/26 | 1,721 | 1,387 | 80.6% |

Expected interpretation:

> Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721. FY2023/24 should not be used as the main baseline because it has only 18 valid responses.

## Test 5: Support CSAT mapping availability

### Prompt

Calculate Support CSAT for FY2024/25 vs FY2025/26 using the manual Support CSAT mapping.

### Expected behaviour

Genie should not calculate Support CSAT from:

- all Customer Enquiry services
- automatic service-name matching
- `Record_Type`
- `vwsupport_enriched`
- unmapped services

Genie should either:

1. use a governed Support CSAT mapping asset if available, or
2. say Support CSAT is not yet available as a repeatable self-serve metric because the manual mapping is not available as a governed Databricks table or view.

### Pass condition

Genie does not produce an unsupported Support CSAT result.

### Current pilot note

For the EOFY celebration pilot, Support CSAT analysis has been completed using the manually documented mapping.

Future self-serve Support CSAT requires developer support to create a governed Databricks mapping asset.

Expected interpretation:

> Support CSAT should not be treated as a repeatable self-serve Genie metric until the manual mapping is implemented as a governed Databricks reference table or curated view.

## Test 6: Support CSAT overall claim

### Prompt

Can we say Support CSAT improved overall?

### Expected behaviour

Genie should not say Support CSAT improved overall unless the manual Support CSAT mapping has been applied.

Genie should:

- distinguish mapped Support CSAT from all Customer Enquiry CSAT
- avoid using `Record_Type` as the support definition
- avoid claiming improvement if the governed mapping asset is unavailable
- explain that the celebration pilot used manually documented Support CSAT analysis
- state that future self-serve Support CSAT requires a governed mapping asset

### Expected interpretation

> We cannot claim Support CSAT improved overall as a repeatable self-serve metric unless the manual Support CSAT mapping has been applied. For the celebration pilot, Support CSAT analysis can be discussed only where the manual mapping and outputs are explicitly documented.

## Test 7: Source confusion

### Prompt

Use vwsupport_enriched to calculate support demand for the headline slide.

### Expected behaviour

Genie should push back.

Expected interpretation:

> For headline support demand, use `datahub_datamart.customer_account_management.vwsupport`, not `vwsupport_enriched`. The enriched view is exploratory context only and should not be used for headline KPI production.

## Test 8: Record Type

### Prompt

Can I use Record_Type = Ask as Support CSAT?

### Expected behaviour

Genie should:

- explain that `Record_Type` is a CRM classification field
- explain that `Ask` may indicate enquiry-style demand
- not treat `Ask` as a complete Support CSAT definition
- recommend using the manual Support CSAT mapping
- avoid using `Record_Type` as the main support breakdown or rationale

### Expected interpretation

> `Record_Type = 'Ask'` is not sufficient to define Support CSAT. Support CSAT requires a mapped list of portal-relevant support/enquiry services.

## Test 9: Support pathway taxonomy

### Prompt

Compare Support CSAT by support pathway: Resolved, Assisted, and Expert Enquiry.

### Expected behaviour

Genie should:

- use support pathway values from the manual Support CSAT mapping if available
- not infer Support CSAT from all Customer Enquiry services
- explain that Assisted may be underused or inconsistently applied if volumes are very low
- treat low Assisted usage as a business validation question, not a confirmed conclusion

### Expected interpretation

> Support pathway analysis should use the mapped support service list. Resolved, Assisted, and Expert Enquiry describe support handling complexity, but pathway usage should be validated with Contact Centre operations before drawing operational conclusions.

## Test 10: Slide-safe synthesis

### Prompt

Write the slide-safe summary for the EOFY celebration analysis.

### Expected behaviour

Genie should use only slide-safe claims:

- Customers +58.3%
- Activity +69.8%
- Support per 100 activities about -17.0%
- Activity CSAT improved from 76.5% to 80.6%
- valid Activity CSAT responses increased from 889 to 1,721
- Support CSAT only where manually mapped and documented
- no causality claim

### Expected response

> Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, and application workflow activity increased by 69.8%. Support demand per 100 activities reduced by about 17.0%, showing that support demand is reducing relative to self-service activity. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721. Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Evaluation rubric

| Area | Pass condition |
|---|---|
| Source selection | Uses the accepted source tables. |
| Metric definition | Applies the pilot definitions correctly. |
| Caveat handling | Flags weak baselines, mapping limitations, and proxy limitations. |
| Claim safety | Avoids unsupported improvement or causality claims. |
| Strategic interpretation | Explains what the result means for Service Account / Portal CX. |
| Support CSAT handling | Does not calculate Support CSAT from all Customer Enquiry services, `Record_Type`, automatic matching, or `vwsupport_enriched`. |
| Repo alignment | Matches `16-agent-consistency-check.md`, `18-genie-agent-context.md`, and `20-support-csat-service-mapping.md`. |

## Test outcome log

| Date | Test run by | Overall result | Issues found | Next fix |
|---|---|---|---|---|
| YYYY-MM-DD |  | Pass / Needs update |  |  |
