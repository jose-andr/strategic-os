# Databricks Mapping Backlog

This file tracks the remaining mapping and validation work needed to reproduce the Power BI EOFY celebration metrics in Databricks SQL.

## Purpose

The Power BI measures captured in `11-powerbi-measures.md` are the current source of truth for business logic.

This backlog identifies what still needs to be confirmed in Databricks before the SQL outputs can be treated as final.

## Mapping backlog

| Priority | Metric area | Mapping question | Current status | Next validation file |
|---|---|---|---|---|
| 1 | Activity | Can `vwpermit_statused[include_in_activity_kpi]` be recreated from `vwpermit` status fields and mapping rules? | Pending validation | `sql/07_activity_status_validation.sql` |
| 2 | Support | What Databricks logic reproduces `[Self-Service Support]`? | Pending validation | `sql/08_support_logic_validation.sql` |
| 3 | Activity CSAT | Which Databricks table contains survey responses equivalent to `vwcase_survey`? | Pending validation | `sql/09_csat_source_validation.sql` |
| 4 | Support CSAT | Which fields reproduce `Support_logic` support eligibility? | Pending validation | `sql/08_support_logic_validation.sql` and `sql/09_csat_source_validation.sql` |
| 5 | Channel segmentation | Which Databricks field contains support channel values for real-time vs async segmentation? | Pending validation | `sql/08_support_logic_validation.sql` and `sql/09_csat_source_validation.sql` |

## Confirmed business logic

### Customers

Customers means Service Account sign-ups.

    Customers =
        DISTINCTCOUNT(vwaccount.account_id)
        where customer_portal = true
        and first_account_portal_on_date is within the reporting window

### All accounts

All accounts means total CRM accounts.

    All accounts =
        DISTINCTCOUNT(vwaccount.account_id)
        with reporting date filters removed

### Activity

Activity means Digital Self-Service Activity.

    Activity =
        DISTINCTCOUNT(vwpermit.application_id)
        where include_in_activity_kpi = 1

The `include_in_activity_kpi` flag currently comes from Power BI-created `vwpermit_statused` logic.

### Support

Support means support demand relative to activity.

    Support =
        Self-Service Support Rate

    Self-Service Support Rate =
        Self-Service Support / Self-Service Activity * 100

The `[Self-Service Support]` numerator still needs to be mapped in Databricks.

### Activity CSAT

Activity CSAT means:

    CSAT on Self-Service Activity

This is calculated as:

    positive responses / total responses

Where positive responses are satisfaction scores of 4 or 5.

### Support CSAT

Support CSAT means:

    CSAT on Self-Service Support

This is calculated as:

    positive responses / total responses

Where positive responses are satisfaction scores of 4 or 5.

### Support CSAT by channel type

Real-time and async support CSAT are not separate Power BI measures.

They should be calculated by filtering or grouping Support CSAT by channel type.

    CASE
        WHEN channel IN ('Phone', 'Live Chat', 'Face-to-Face')
            THEN 'In Real-time'
        ELSE 'Async'
    END AS channel_type

## Validation notes

Do not treat the Databricks SQL outputs as final until the mapping backlog is resolved.

Any interim analysis should clearly label unresolved measures as provisional.
