# Account Quality Index Genie Prompts

Use these prompts to test whether Genie can support a simple Account Quality Index for the CRM account base.

This is a diagnostic metric, not a replacement for the EOFY celebration headline metrics.

## Purpose

Analyse the overall quality of accounts in the CRM system using simple account-level signals.

The first version should stay deliberately simple:

1. duplicate investigation burden
2. dormant account burden

The index should help answer:

> How healthy is the CRM account base, and where might account quality be creating avoidable effort, duplication, or poor service continuity?

## Scope

Use all CRM accounts as the base population.

Do not confuse this with Service Account / portal sign-ups.

For EOFY celebration reporting:

- Customers = Service Account / portal sign-ups
- All accounts = total CRM account base
- Account Quality Index = diagnostic CRM data quality measure

## Candidate source

Primary source:

`datahub_datamart.customer_account_management.vwaccount`

Possible supporting source for case association:

`datahub_datamart.customer_account_management.vwsupport`

Optional only if validated:

`datahub_datamart.customer_account_management.vwcase`

## Simple Account Quality Index v0

The Account Quality Index should be scored from 0 to 100.

Higher is better.

Use this simple version if required fields are available:

    Account Quality Index =
      100 * (1 - ((duplicate_investigation_rate + dormant_account_rate) / 2))

Where:

    duplicate_investigation_rate =
      accounts with duplicate investigation outcome
      divided by
      all accounts

    dormant_account_rate =
      accounts with no associated cases
      divided by
      all accounts

If duplicate investigation outcome fields are not available, do not invent them.

If case association cannot be validated, do not calculate dormant account rate.

## Interpretation bands

Use these draft bands only for discussion:

- 90 to 100 = strong account quality signal
- 75 to 89 = manageable quality risk
- 50 to 74 = material quality risk
- below 50 = high quality risk requiring investigation

These bands are not enterprise standards.

## Caveats

Dormant accounts are not automatically bad.

An account without associated cases may mean:

- genuinely low or no service interaction
- historical account creation without later use
- incomplete case-account linking
- duplicate or abandoned account creation
- a legitimate customer record that has not needed support

Duplicate investigation metrics depend on the availability and quality of investigation outcome fields.

Do not treat the Account Quality Index as a customer experience outcome by itself.

It is a data quality and service continuity diagnostic.

---

## Prompt 1: Account quality schema validation

Validate whether the connected Databricks views can support a simple Account Quality Index for all CRM accounts.

Use all CRM accounts as the base population.

Do not confuse all CRM accounts with Service Account / portal sign-ups.

Check whether the schema supports:

1. all accounts
2. duplicate investigation accounts
3. duplicate investigation outcomes
4. accounts with associated cases
5. accounts without associated cases

Use these candidate sources:

- `datahub_datamart.customer_account_management.vwaccount`
- `datahub_datamart.customer_account_management.vwsupport`
- `datahub_datamart.customer_account_management.vwcase` only if it is available and its grain is clear

Return a validation matrix with:

1. Metric component
2. Recommended source
3. Required fields
4. Whether fields are available
5. Suggested calculation logic
6. Caveats
7. Whether the component is safe to calculate now

Do not calculate the final index unless the required fields are available.

---

## Prompt 2: Duplicate investigation burden

Using all CRM accounts as the denominator, calculate the relative volume of accounts that have duplicate investigation outcomes.

Only calculate this if there is a validated duplicate investigation field or outcome field.

Return:

1. total CRM accounts
2. accounts investigated for duplication
3. accounts confirmed as duplicate, if outcome is available
4. duplicate investigation rate
5. confirmed duplicate rate, if outcome is available
6. breakdown by duplicate investigation outcome
7. caveats

Use clear business language.

If the required duplicate investigation fields are not available, explain what field or governed mapping is needed.

Do not infer duplicate outcomes from account names, emails, phone numbers, or fuzzy matching unless explicitly asked.

---

## Prompt 3: Dormant account burden

Using all CRM accounts as the denominator, calculate the percentage of accounts with no associated cases.

Define dormant account v0 as:

    an account in `vwaccount`
    with no linked case or support record
    in the validated case/support source

First validate whether `account_id` can reliably link accounts to cases or support records.

Return:

1. total CRM accounts
2. accounts with at least one associated case/support record
3. accounts with no associated case/support record
4. dormant account rate
5. caveats about interpretation
6. recommended next validation step

Do not describe dormant accounts as bad accounts.

Describe them as accounts with no observed linked case/support activity in the available data.

---

## Prompt 4: Account Quality Index v0

Calculate the Account Quality Index v0 only if both component metrics are available:

1. duplicate investigation rate
2. dormant account rate

Use:

    Account Quality Index =
      100 * (1 - ((duplicate_investigation_rate + dormant_account_rate) / 2))

Return:

1. Account Quality Index score
2. duplicate investigation rate
3. dormant account rate
4. interpretation band
5. plain-English interpretation
6. caveats
7. whether the result is production-ready, pilot-only, or not safe to use

If one or both component metrics are unavailable, do not calculate a partial index.

Instead, return the available components and list the missing fields required.

---

## Prompt 5: EOFY celebration with account quality diagnostic

Using the accepted EOFY celebration metrics, create a one-slide executive narrative.

Use these proof points:

1. more customers
2. more self-service activity
3. less support demand relative to activity
4. better Activity CSAT
5. account quality diagnostic, only if validated

Use the accepted Service Account / Portal CX metrics:

- customer sign-ups increased from 9,838 to 15,570
- application workflow activity increased from 2,209 to 3,751
- support per 100 activities reduced from 496.9 to 412.6
- Activity CSAT improved from 76.5% to 80.6%
- Activity CSAT valid responses increased from 889 to 1,721

For the Account Quality Index:

- use it only as a diagnostic CRM account-base metric
- do not blend it into the customer sign-up metric
- do not claim account quality improved unless year-on-year values are available
- do not imply dormant accounts are negative without validation

Return:

1. slide headline
2. 4 headline proof points
3. optional account quality diagnostic note
4. caveats
5. speaker note

---

## Prompt 6: Quality index guardrail test

Can we say the CRM account base is high quality because the Account Quality Index is high?

Expected behaviour:

Genie should push back.

A high Account Quality Index v0 is only a simple diagnostic signal.

It does not prove CRM account quality is high overall unless:

- the duplicate investigation outcome field is validated
- case/account linking is reliable
- dormant account interpretation is business validated
- the index has been tested against known account quality issues
- the metric has an owner and refresh rule

Expected interpretation:

> The Account Quality Index v0 can indicate lower apparent duplication and dormancy risk, but it should not be treated as a complete account quality assessment until the underlying fields, business rules, and interpretation bands are validated.
