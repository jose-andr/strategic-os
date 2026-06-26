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

### Expected known result

| Period | Customers |
|---|---:|
| Previous FY | 5,500 |
| Current FY | 9,838 |

Expected interpretation:

> Service Account / portal sign-ups increased by 78.9% year on year.

## Test 2: Activity

### Prompt

Did self-service activity increase year on year?

### Expected behaviour

Genie should:

- use `datahub_datamart.customer_account_management.vwpermit`
- define Activity as application workflow activity
- use `period_start`
- include Draft, Submitted, Further information requested, In Progress, Pending Payment
- exclude permit lifecycle statuses unless later confirmed

### Expected known result

| Period | Activity applications |
|---|---:|
| Previous FY | 2,209 |
| Current FY | 3,766 |

Expected interpretation:

> Application workflow activity increased by 70.5%.

## Test 3: Support rate

### Prompt

Did support demand reduce relative to self-service activity?

### Expected behaviour

Genie should:

- use `datahub_datamart.customer_account_management.vwsupport` for support numerator
- use `vwpermit` activity applications as denominator
- calculate support per 100 activities
- avoid using raw support volume as the headline
- not use `vwsupport_enriched` for headline KPI production

### Expected known result

| Period | Support per 100 activities |
|---|---:|
| Previous FY | 496.9 |
| Current FY | 409.3 |

Expected interpretation:

> Support demand reduced by 17.6% relative to activity.

## Test 4: Activity CSAT

### Prompt

Did Activity CSAT improve year on year?

### Expected behaviour

Genie should not simply answer yes.

Genie should:

- use `datahub_datamart.customer_intelligence.vwcase`
- define CSAT using `Satisfaction_Score_5 IN (4, 5)`
- use `Survey_Completion_Date`
- explain that Activity CSAT is a current-state strength metric
- explain that Previous FY has only 18 valid responses
- avoid saying Activity CSAT improved YoY

### Expected known result

| Period | Valid responses | CSAT |
|---|---:|---:|
| Previous FY | 18 | 88.9% |
| Current FY | 888 | 76.5% |

Expected interpretation:

> Activity CSAT should not be framed as a YoY improvement. Current FY portal-enabled Activity CSAT is strong at 76.5% from 888 valid responses.

## Test 5: Support CSAT proxy

### Prompt

Can we say Support CSAT improved overall?

### Expected behaviour

Genie should not say support CSAT improved overall.

Genie should:

- explain that full Service Account Support CSAT is not yet validated
- distinguish the RPP Support CSAT proxy from a full support CSAT standard
- use proxy language only
- explain that Residential Parking expert enquiry CSAT recovered from 69% post-portal to 78% in the current ELT period

### Expected interpretation

> We cannot claim Support CSAT improved overall. We can say Residential Parking expert support is showing signs of stabilisation, with proxy CSAT recovering from 69% post-portal to 78% in the current ELT period.

## Test 6: Source confusion

### Prompt

Use vwsupport_enriched to calculate support demand for the headline slide.

### Expected behaviour

Genie should push back.

Expected interpretation:

> For headline support demand, use `datahub_datamart.customer_account_management.vwsupport`, not `vwsupport_enriched`. The enriched view is exploratory context only and should not be used for headline KPI production.

## Test 7: Record Type

### Prompt

Can I use Record_Type = Ask as Support CSAT?

### Expected behaviour

Genie should:

- explain that `Record_Type` is a CRM classification field
- explain that `Ask` may indicate enquiry-style demand
- not treat `Ask` as a complete Support CSAT definition
- recommend validating service names, channels, support case logic, and business interpretation

### Expected interpretation

> `Record_Type = 'Ask'` can be a candidate segmentation filter, but it is not sufficient by itself to define Support CSAT.

## Test 8: Slide-safe synthesis

### Prompt

Write the slide-safe summary for the EOFY celebration analysis.

### Expected behaviour

Genie should use only slide-safe claims:

- Customers +78.9%
- Activity +70.5%
- Support per 100 activities -17.6%
- Activity CSAT 76.5% from 888 current-year responses
- RPP expert support proxy recovered from 69% to 78%

### Expected response

> Service Account adoption and usage are growing. Customer sign-ups increased by 78.9%, and application workflow activity increased by 70.5%. Support demand per 100 activities reduced by 17.6%, showing that support demand is reducing relative to self-service activity. Customers are reporting strong satisfaction with portal-enabled activity, with 76.5% CSAT from 888 current-year responses. Residential Parking support is also showing signs of stabilisation after migration, with expert enquiry CSAT recovering from 69% post-portal to 78% in the current ELT period.

## Evaluation rubric

| Area | Pass condition |
|---|---|
| Source selection | Uses the accepted source tables. |
| Metric definition | Applies the pilot definitions correctly. |
| Caveat handling | Flags weak baselines and proxy limitations. |
| Claim safety | Avoids unsupported improvement or causality claims. |
| Strategic interpretation | Explains what the result means for Service Account / Portal CX. |
| Repo alignment | Matches `16-agent-consistency-check.md` and `18-genie-agent-context.md`. |

## Test outcome log

| Date | Test run by | Overall result | Issues found | Next fix |
|---|---|---|---|---|
| YYYY-MM-DD |  | Pass / Needs update |  |  |
