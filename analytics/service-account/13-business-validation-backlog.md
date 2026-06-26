# Business Validation Backlog

This file tracks business rules, assumptions, and interpretation decisions that should be validated with business representatives after the EOFY celebration analysis.

## Purpose

The EOFY celebration analysis needs to move at a practical pace.

Some metric logic is good enough for the celebration slide, but should still be validated before becoming a reusable reporting standard.

This backlog separates:

- decisions accepted for the current celebration analysis
- assumptions that need business confirmation later
- questions that may affect future dashboard or SQL production logic

## Current celebration analysis decision

For the EOFY celebration slide, the following working definition is accepted:

    Activity = application workflow activity

This means Activity is based on portal application workflow records, not permit lifecycle records.

For the current analysis, include the following application workflow statuses in Activity:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment

This supports the slide story:

    More self-service activity

## Activity workflow decision

### Accepted for current celebration analysis

Pending Payment is included in the Activity KPI for the EOFY celebration analysis.

Rationale:

- It represents an application that has progressed through the portal workflow.
- It reflects meaningful customer self-service activity.
- It is part of the application journey rather than the permit lifecycle.
- Excluding it may understate portal activity where customers have completed meaningful steps but payment is still pending.

### Still to validate with business representatives

Confirm whether Pending Payment should remain included in the formal reusable Activity KPI.

Key question:

    Should Pending Payment count as portal self-service activity?

Recommended business framing:

    A customer has progressed an application to the payment stage. Does this represent completed enough self-service activity to count in the Activity KPI?

## Application workflow vs permit workflow

### Accepted for current celebration analysis

The headline Activity KPI should focus on application workflow activity.

Application workflow statuses include:

- Draft
- Submitted
- Further information requested
- In Progress
- Pending Payment
- Withdrawn
- Declined

Permit lifecycle statuses include:

- Issued
- Extended
- Renewed
- Lapsed

For the current celebration analysis, permit lifecycle statuses are not used as the primary basis for Activity.

### Still to validate with business representatives

Confirm whether the formal reporting model should maintain two separate KPI families:

| KPI family | Purpose |
|---|---|
| Application activity | Measures customer self-service activity through the portal |
| Permit lifecycle / outcomes | Measures issued, active, renewed, extended, or lapsed permit states |

Recommended business framing:

    Do we want Activity to measure customer effort and portal use, or final permit outcomes?

## Withdrawn and Declined applications

### Accepted for current celebration analysis

Withdrawn and Declined are not included in the headline Activity KPI unless later confirmed.

Rationale:

- They are application outcomes rather than core activity progression statuses.
- Including them may inflate the activity story with unsuccessful or discontinued journeys.
- They may be more useful as outcome or conversion indicators.

### Still to validate with business representatives

Confirm whether Withdrawn and Declined should be treated as:

1. Activity
2. Application outcomes
3. Exclusions from the headline KPI
4. A separate quality / conversion measure

Recommended business framing:

    If a customer starts and submits an application but it is later withdrawn or declined, should that count as self-service activity, an outcome, or both?

## Draft applications

### Accepted for current celebration analysis

Draft applications are included in Activity.

Rationale:

- Drafts indicate customers are using the portal to start or progress a task.
- Drafts are part of the digital self-service journey.
- Excluding drafts may understate portal usage and early-stage activity.

### Still to validate with business representatives

Confirm whether the formal Activity KPI should include:

- all drafts
- only drafts with meaningful progress
- only drafts that later become submitted
- drafts as a separate supporting metric

Recommended business framing:

    Does starting an application in the portal count as self-service activity, even if the customer has not submitted it yet?

## Null period_start records

### Accepted for current celebration analysis

Records with `period_start = null` are excluded from the YoY Activity calculation because they cannot be assigned to a reporting period.

### Still to validate with business representatives or data owners

Confirm whether there is a fallback date field for application records where `period_start` is null.

Potential fallback fields to investigate:

- created date
- submitted date
- case opened date
- application modified date
- permit created date

Recommended business framing:

    For applications missing period_start, which date best represents when the portal activity occurred?

## Case status interaction

### Accepted for current celebration analysis

The current draft mapping primarily uses `application_status` to classify activity.

`case_status` is retained for profiling and validation, but it does not currently override the application workflow classification.

### Still to validate with business representatives

Confirm whether certain combinations of `application_status` and `case_status` should change inclusion.

Example questions:

- Should `submitted / closed` count as submitted activity?
- Should `draft / closed` remain activity?
- Should `pending payment / approved` count as activity?
- Should `further information requested / closed` count as activity?

Recommended business framing:

    Are there any application status and case status combinations that should be excluded, even if the application status appears to be activity?

## Category exclusions

### Accepted for current celebration analysis

No specific categories are excluded from the draft Activity KPI unless the current SQL logic or source data already excludes them.

### Still to validate with business representatives

Confirm whether any categories should be excluded from headline Activity reporting.

Categories observed in validation include:

- permit
- waste bin
- skip bins
- mobile plant equipment
- legal point of discharge report
- location of works
- exclusion area / drop zone
- central city
- hand tools
- crane
- gantry

Recommended business framing:

    Are all portal application categories valid for the Activity KPI, or should some be reported separately?

## Support numerator

### Accepted for current celebration analysis

For the EOFY celebration analysis, the support numerator is accepted as:

    Self-Service Support =
        distinct support cases from vwsupport
        where is_after_service_enablement = true

The support rate is calculated as:

    Support Rate =
        Self-Service Support / Activity * 100

Where Activity means:

    application workflow Activity

The draft result supports the celebration story because Activity grew faster than support demand.

| Metric | Previous FY | Current FY | Movement |
|---|---:|---:|---:|
| Activity applications | 2,209 | 3,766 | +70.5% |
| Support cases | 10,976 | 15,413 | +40.4% |
| Support per 100 activities | 496.9 | 409.3 | -17.6% |

This means support demand decreased relative to activity.

For the celebration slide, this is good enough to proceed.

### Still to validate for reusable reporting

The exact reusable support numerator should still be validated with business representatives or data owners.

Questions to validate:

1. Should support be counted as distinct `case_id` from `vwsupport`?
2. Should `is_after_service_enablement = true` be the main portal support eligibility rule?
3. Should support be limited to Service Account customers only?
4. Should support be limited to specific service groups or portal service names?
5. Should all support channels be included?
6. Should internal staff support interactions be excluded?
7. Should resolved, expert enquiry, and assisted support types be grouped or separated?

### Still to validate with business representatives or data owners

Confirm the exact Databricks equivalent of the Power BI `[Self-Service Support]` numerator.

Questions to validate:

1. Which support records count as portal-related support?
2. Should support be limited to cases after service enablement?
3. Should support be limited to Service Account customers?
4. Should all channels be included?
5. Should internal staff support interactions be excluded?

## CSAT source mapping

### Accepted for current celebration analysis

Power BI CSAT logic is accepted as the source of truth for the current slide.

Both Activity CSAT and Support CSAT use:

    positive responses / total responses

Where positive responses are satisfaction scores of 4 or 5.

### Still to validate with business representatives or data owners

Confirm the Databricks source for:

- survey completion date
- satisfaction score
- service name
- normalised service name
- support service eligibility
- portal-enabled service eligibility

## Channel segmentation

### Accepted for current celebration analysis

Real-time and async support CSAT are not treated as separate Power BI measures.

They should be produced by filtering or grouping Support CSAT by channel type.

Current classification rule:

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

### Still to validate with business representatives

Confirm whether the channel classification is correct.

Questions to validate:

1. Should Phone, Live Chat, and Face-to-Face all be treated as real-time?
2. Should Email, Web, and other channels be treated as async?
3. Are there blended channels that need special treatment?
4. Is the Databricks channel field equivalent to the Power BI `Support_logic[channel]` field?

## Summary of accepted assumptions for EOFY celebration analysis

| Area | Accepted assumption for current analysis |
|---|---|
| Activity definition | Activity means application workflow activity |
| Permit lifecycle | Permit lifecycle statuses are not the primary Activity KPI |
| Pending Payment | Included in Activity |
| Draft | Included in Activity |
| Submitted | Included in Activity |
| Further information requested | Included in Activity |
| In Progress | Included in Activity |
| Withdrawn | Excluded unless later confirmed |
| Declined | Excluded unless later confirmed |
| Null period_start | Excluded from YoY calculation |
| Support | Use support rate rather than raw support cases |
| CSAT | Use positive responses divided by total valid responses |
| Channel segmentation | Real-time vs async is a filter/grouping rule, not separate Power BI measures |

## Priority validation questions

1. Should Pending Payment remain included in the formal Activity KPI?
2. Should Draft applications always count as Activity?
3. Should Withdrawn and Declined count as activity, outcomes, or exclusions?
4. Should any categories be excluded from headline Activity?
5. What is the fallback date for records where `period_start` is null?
6. What Databricks logic reproduces `[Self-Service Support]`?
7. What Databricks table reproduces `vwcase_survey`?
8. Which Databricks field should be used for support channel segmentation?

## Current decision

For the EOFY celebration analysis, the current application workflow Activity definition is good enough to proceed.

The validation items in this file should be treated as follow-up work for reusable reporting, dashboard refinement, and production-grade Databricks SQL.

## CSAT and support proxy validation

| Validation item | Why it matters | Current working position | Owner / next action |
|---|---|---|---|
| Confirm whether Activity CSAT can be presented as current-state only. | Previous FY has only 18 valid responses, so YoY framing is unstable. | Use 76.5% from 888 current-year responses as a strength metric, not a YoY improvement. | Confirm with CX / branch stakeholder. |
| Confirm RPP proxy period dates. | Proxy interpretation depends on the exact pre-portal, post-portal impact, and current ELT windows. | Dates exist in Power BI logic but need to be documented in repo. | Extract from Power BI or confirm with report owner. |
| Confirm RPP proxy service mapping source. | Proxy depends on selected ask-service names. | Current labels are documented, but source table / mapping ownership should be confirmed. | Confirm whether mapping lives in Power BI, Databricks, or manual table. |
| Confirm whether RPP Support CSAT proxy can be used on the celebration slide. | It is service-specific and not a complete support CSAT standard. | Use as explanatory stabilisation evidence only. | Confirm with stakeholder before final slide. |
| Validate Support CSAT standard for broader Service Account services. | Current proxy only covers RPP support pathway. | Not yet available as a complete standard. | Future work. |
| Validate channel segmentation for support CSAT. | Real-time vs async classification depends on actual channel values and business meaning. | Working rule: Phone, Live Chat, Face-to-Face = In Real-time; all others = Async. | Validate against `customer_intelligence.vwcase.Channel` and `vwsupport.channel`. |
| Confirm legacy-system explanation for missing pre-enable Parking CSAT. | Explains why pre/post CSAT is structurally unavailable. | Working hypothesis: Parking permits may have lived in a legacy system before migration into the current CRM / CSAT model. | Validate with CRM / Parking / data owner. |
