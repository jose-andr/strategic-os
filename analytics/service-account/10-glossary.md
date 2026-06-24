# Service Account / Portal CX Glossary

This glossary documents the working language for the Service Account EOFY celebration analysis.

It is adapted from the broader Portal CX Dashboard glossary and refined for the one-slide celebration use case.

## Dashboard context

The Service Account celebration analysis is part of the broader Portal CX Dashboard analytics domain.

The broader dashboard helps understand customer experience across:

- portal adoption
- portal accounts
- portal transactions and activity
- support demand
- feedback
- web behaviour
- comparison across reporting periods
- data quality and definitions

## Celebration slide language

| Slide term | Working meaning |
|---|---|
| Customers | Service Account / portal sign-ups |
| Activity | Portal transactions or digital self-service activity |
| Support | Portal support demand |
| CSAT on Activity | Customer satisfaction related to portal-enabled activity |
| CSAT on Support | Customer satisfaction related to support provided by CX |
| All accounts | Total CRM account base, used as a context metric only |

## Customers

### Slide label

Customers

### Internal definition

Customers means Service Account sign-ups.

This is a subset of all CRM accounts.

### Confirmed Power BI logic

The Power BI measure `Account Sign-Ups` counts distinct `vwaccount[account_id]` where:

- `vwaccount[customer_portal] = TRUE()`
- `vwaccount[first_account_portal_on_date]` is within the selected reporting window

### Important distinction

`Customers` on the celebration slide is not the same as `All Accounts`.

`All Accounts` means all CRM accounts and should be used only as a context metric.

## All accounts

### Slide label

All accounts

### Internal definition

Total distinct CRM accounts.

### Confirmed Power BI logic

The Power BI measure `All Accounts` counts distinct `vwaccount[account_id]` and removes date filters.

### Use in celebration analysis

Use as supporting context only.

Example:

Service Account sign-ups represent approximately 5% of all CRM accounts to date.

## Portal account

An account that has been onboarded or enabled for portal use.

For the celebration analysis, this is represented by the customer portal / Service Account sign-up logic.

## New onboarded account

An account newly onboarded during the selected reporting period.

For this analysis, this likely aligns to `first_account_portal_on_date` within the selected reporting window.

## Existing onboarded account

An account that was already onboarded before the selected reporting period.

This may be used to split the Customers tile into:

- New accounts
- Existing accounts onboarded

## Portal transaction / activity

A customer application, permit, or related activity completed or progressed through the portal, subject to eligibility rules.

For the celebration analysis, this supports the Activity tile.

## Digital self-service activity

Digital activity completed or progressed by customers through the portal.

The exact inclusion rule needs to be validated against the Power BI measures and the Databricks tables.

Likely source tables:

- `vwpermit`
- `vwservice_enablement`

## Service group

High-level grouping used to explain what is driving activity.

Examples from the celebration slide include:

- Parking permits
- Construction permits
- Business permits
- Community permits

## Support case

A customer support interaction or case related to portal usage.

For the celebration analysis, support demand should be measured relative to activity using support cases per 100 transactions.

## Portal support

Support case considered relevant to portal activity based on service, theme, enablement, or account linkage.

The exact eligibility rule needs to be validated against Power BI measures.

Likely source tables:

- `vwsupport`
- `vwsupport_enriched`

## Channel type

Grouping of support channels into real-time or asynchronous support.

### Real-time support

Real-time or near-real-time support, such as phone, chat, or counter.

### Async support

Non-real-time support, such as email or web form.

## CSAT

Customer Satisfaction score.

For the celebration analysis, CSAT appears in two forms:

- CSAT on Activity
- CSAT on Support

The exact source and positive-response logic need to be confirmed from the Power BI measures and feedback tables.

## Portal eligibility

The rule deciding whether an account, service, application, support case, or feedback record belongs in portal reporting.

This is one of the most important rules to validate before finalising the EOFY analysis.

## Date logic

The agreed decision about which date field controls selected-period reporting.

For Customers / Service Account sign-ups, the confirmed date field is:

`vwaccount[first_account_portal_on_date]`

Other metrics still need their date logic validated.

## Source of truth

The authoritative field, table, or Power BI measure used for a metric definition.

For this work, existing Power BI measures should be treated as the first source of truth for business logic, then translated into reusable SQL templates where appropriate.

## Data quality warning

A note highlighting missing mappings, low response counts, incomplete data, or known limitations.

Any EOFY celebration analysis should keep data quality warnings outside the slide but available in the supporting notes.
