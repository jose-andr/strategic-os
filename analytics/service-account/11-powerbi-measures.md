# Power BI Measures

This file documents the existing Power BI measures used as the first source of truth for the Service Account EOFY celebration analysis.

The purpose is to understand the business logic before translating it into reusable Databricks SQL.

## Source of truth approach

Existing Power BI measures are treated as the first source of truth for:

- metric definitions
- eligibility rules
- date-window logic
- inclusion and exclusion rules
- customer portal logic
- support and CSAT logic

Databricks SQL will translate this logic after the fields and rules are confirmed.

## Measures captured

| Celebration metric | Power BI measure | Status |
|---|---|---|
| Customers | `Account Sign-Ups` | Captured |
| All accounts | `All Accounts` | Captured |
| Activity | To capture | Pending |
| Support per 100 transactions | To capture | Pending |
| Activity CSAT | To capture | Pending |
| Support CSAT | To capture | Pending |

## `Account Sign-Ups`

### Business meaning

Service Account sign-ups.

This is the metric used for the celebration slide label:

`Customers`

### DAX logic summary

- Counts distinct `vwaccount[account_id]`
- Filters to `vwaccount[customer_portal] = TRUE()`
- Uses `vwaccount[first_account_portal_on_date]`
- Applies the selected reporting window using `[Window Start]` and `[Window End]`

### Source fields

| Field | Use |
|---|---|
| `vwaccount[account_id]` | Account identifier |
| `vwaccount[customer_portal]` | Customer portal / Service Account inclusion filter |
| `vwaccount[first_account_portal_on_date]` | Service Account sign-up date |

### Definition decision

For this analysis:

`Customers = Service Account sign-ups`

Customers does not mean all CRM accounts.

## `All Accounts`

### Business meaning

Total CRM accounts.

This is a context metric only.

### DAX

```DAX
All Accounts =
CALCULATE (
    DISTINCTCOUNT ( vwaccount[account_id] ),
    REMOVEFILTERS ( 'Date Basis' ),
    REMOVEFILTERS ( 'Calendar Year' ),
    REMOVEFILTERS ( 'Calendar Month' ),
    REMOVEFILTERS ( 'Fiscal Year' ),
    REMOVEFILTERS ( 'Financial Quarter' )
)
