# RPP Support CSAT Proxy

This file documents the Residential Parking Permit support CSAT proxy used for pre/post impact and current-period stabilisation analysis.

## Purpose

Direct portal-enabled Activity CSAT does not provide a reliable pre-portal baseline for many portal-enabled services.

For Residential Parking Permits, a proxy has been developed using CRM enquiry/support services related to the RPP support pathway.

This proxy helps answer:

> Did satisfaction with Residential Parking Permit support change after portal migration, and is it stabilising in the current ELT period?

## What this proxy is

The RPP Support CSAT proxy is:

- a support-pathway analysis
- based on selected enquiry/support service names
- useful for pre/post migration interpretation
- useful for current-period stabilisation evidence

## What this proxy is not

The RPP Support CSAT proxy is not:

- a direct portal transaction CSAT metric
- a replacement for Activity CSAT
- a full support CSAT standard for all Service Account services
- a customer-level extract

## Proxy service mapping

Current proxy service labels:

| Service label | Support pathway |
|---|---|
| Residential parking enquiry - expert | Residential Parking Permit support |
| Residential parking enquiry - resolved | Residential Parking Permit support |
| Disabled or medical parking enquiry - expert | Disabled or Medical Parking Permit support |
| Disabled or medical parking enquiry - resolved | Disabled or Medical Parking Permit support |

## Proxy periods

| Period | Purpose |
|---|---|
| Pre-portal baseline | Establishes support experience before the relevant portal migration / impact period. |
| Post-portal impact | Captures early support experience after migration. |
| Current ELT period | Shows whether the support pathway is stabilising in the current reporting period. |

Exact period dates should be documented before final SQL production.

## Power BI reference measure

    RPP Proxy Support Cases =
    VAR StartDate =
        [RPP Analysis Start Date]
    VAR EndDate =
        [RPP Analysis End Date]
    VAR SelectedAskServices =
        VALUES ( 'RPP Proxy Support Service'[Ask Service Name Norm] )
    RETURN
    CALCULATE (
        DISTINCTCOUNT ( Support_logic[case_number] ),
        FILTER (
            Support_logic,
            Support_logic[case_created_date] >= StartDate
                && Support_logic[case_created_date] < EndDate
        ),
        TREATAS (
            SelectedAskServices,
            Support_logic[Ask Service Name Norm]
        )
    )

## Current interpretation

The proxy analysis indicates that the early post-portal CSAT decline was concentrated in Residential Parking support, particularly expert or escalated enquiries.

In the current ELT period, Residential parking enquiry - expert recovered from 69% in the post-portal impact period to 78%.

This suggests service stabilisation:

> The most complex RPP support pathway is improving, although overall permit-support CSAT remains below the pre-portal baseline.

## Current proxy result notes

| Service label | Period | Proxy support cases | Survey responses | Low CSAT responses | Proxy support CSAT |
|---|---|---:|---:|---:|---:|
| Residential parking enquiry - expert | Pre-portal baseline | 3,159 | 212 | 42 | 74% |
| Residential parking enquiry - expert | Post-portal impact | 3,032 | 206 | 51 | 69% |
| Residential parking enquiry - expert | Current ELT period | 452 | 18 | 3 | 78% |
| Residential parking enquiry - resolved | Pre-portal baseline | 8,982 | 724 | 54 | 90% |
| Residential parking enquiry - resolved | Post-portal impact | 4,982 | 308 | 54 | 77% |
| Residential parking enquiry - resolved | Current ELT period | 712 | 37 | 6 | 78% |
| Disabled or medical parking enquiry - expert | Pre-portal baseline | 166 | 21 | 3 | 86% |
| Disabled or medical parking enquiry - expert | Post-portal impact | 267 | 36 | 3 | 89% |
| Disabled or medical parking enquiry - expert | Current ELT period | 62 | 3 | 1 | 67% |
| Disabled or medical parking enquiry - resolved | Pre-portal baseline | 1,199 | 82 | 6 | 91% |
| Disabled or medical parking enquiry - resolved | Post-portal impact | 1,043 | 81 | 6 | 85% |
| Disabled or medical parking enquiry - resolved | Current ELT period | 161 | 7 | 1 | 86% |

## Caveats

- This is a proxy, not a direct portal transaction CSAT measure.
- The proxy depends on the selected RPP ask-service mapping.
- Current ELT period response counts are small for some service labels.
- The proxy should be used for explanatory analysis and support-pathway stabilisation.
- It should not be used as the sole headline CSAT metric without caveats.

## Repository guidance

Store only:

- service mapping logic
- period definitions
- aggregate results
- assumptions
- caveats
- non-sensitive synthesis

Do not store:

- customer-level records
- raw survey comments
- case-level URLs
- personally identifiable information
