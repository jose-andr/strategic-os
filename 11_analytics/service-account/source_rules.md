# Service Account Source Rules

## Purpose

This file defines source rules for the Service Account analytical domain.

It helps the Service Account Analytical Agent decide which sources to use, how to describe evidence quality and when to defer to governed reporting or human review.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Source rules support better decisions by making service account analysis more reliable, traceable and caveated.

## Core Principle

Use the right source for the right claim.

Do not treat service account data, dashboard views, exploratory analysis and user-provided context as equally authoritative.

## Domain

Service Account

## Source Of Truth

Primary source of truth:

[Add governed source when confirmed.]

Until the governed source is confirmed, service account outputs should be treated as:

- contextual
- exploratory
- requiring human review before decision use

## Approved Reporting Sources

Add approved dashboards or reporting views here once confirmed.

| Source | Purpose | Status | Notes |
| --- | --- | --- | --- |
|  |  | Confirmed / Needs review |  |

## Approved Analytical Sources

Add approved Databricks tables, views, queries or analytical sources here once confirmed.

| Source | Purpose | Status | Notes |
| --- | --- | --- | --- |
|  |  | Confirmed / Needs review |  |

## Contextual Sources

Contextual sources may support interpretation, but they should not be treated as source-of-truth evidence.

Examples may include:

- user-provided notes
- project working notes
- workshop outputs
- operational observations
- stakeholder comments
- exploratory query summaries
- service design artefacts
- decision brief context

Contextual sources can help form hypotheses.

They cannot support formal performance claims without governed evidence.

## Sources Not To Use

Do not use:

- unknown tables
- screenshots without source context
- copied dashboard values without review
- raw data exports
- customer-level records
- private stakeholder commentary
- unsupported summaries
- deprecated dashboards
- exploratory outputs as official reporting
- unofficial extracts shared without governance context

## Source Hierarchy

Use this hierarchy for service account analysis.

| Priority | Source Category | Use |
| --- | --- | --- |
| 1 | Confirmed governed source of truth | Formal metric claims and decision support |
| 2 | Approved reporting layer | Standard trend or performance interpretation |
| 3 | Approved analytical query or view | Reviewed analytical investigation |
| 4 | Service account source rules | Source interpretation and hierarchy |
| 5 | Service account metric definitions | Metric meaning and boundaries |
| 6 | Service account metric caveats | Interpretation limits |
| 7 | Service account data quality notes | Known reliability issues |
| 8 | Contextual operational signal | Sensemaking and hypothesis generation |
| 9 | User-provided context | Framing and decision relevance |
| 10 | Exploratory analysis | Early investigation only |

## Source Type Labels

Every service account analytical output should label the source type.

Use one of:

- governed source
- approved reporting source
- approved analytical source
- contextual signal
- exploratory analysis
- user-provided context
- external benchmark
- unknown source

If source type is unknown, do not use the output for decision support without review.

## Handling Source Conflict

When sources disagree:

1. name the conflicting sources
2. identify the source type for each source
3. apply the source hierarchy
4. avoid blending figures without explanation
5. lower confidence
6. explain the uncertainty
7. recommend human review
8. defer to governed source for formal claims

Do not choose the source that best supports a preferred interpretation.

## Governed Claims

Use governed claims only when:

- the governed source is confirmed
- metric definition is clear
- caveats are visible
- data quality issues are considered
- intended use is appropriate
- human review occurs where required

A governed claim should include:

- source
- metric definition
- timeframe
- caveats
- confidence
- human review status

## Contextual Claims

Use contextual claims when evidence helps interpret a pattern but is not authoritative.

Contextual claims should use cautious language.

Use:

- may indicate
- suggests
- could reflect
- is consistent with
- should be checked against governed data

Avoid:

- proves
- confirms
- definitively shows
- the cause is
- no caveats apply

## Exploratory Claims

Use exploratory claims when analysis is early, incomplete or one-off.

Exploratory claims must include:

- source or query basis, where safe
- timeframe
- scope
- caveats
- confidence
- what cannot be concluded
- whether review is required

Exploratory analysis should not be treated as official reporting.

## Confidence Rules

Use confidence labels.

| Confidence | Use When |
| --- | --- |
| High confidence | Governed source, clear metric, known caveats and suitable use |
| Medium confidence | Approved source with some caveats or partial scope |
| Low confidence | Exploratory, incomplete, contextual or unclear source |
| Do not use yet | Source unknown, metric unclear, caveats missing or sensitive data risk |

Lower confidence when:

- source is unclear
- metric definition is unclear
- caveats are missing
- data quality issues exist
- source conflict exists
- timeframe is unclear
- the analysis is exploratory
- the output may be sensitive

## Required Source Statement

Use this structure in service account analytical outputs.

### Source

[Name source or reporting layer]

### Source Type

[Governed source / Approved reporting source / Approved analytical source / Contextual signal / Exploratory analysis / User-provided context / External benchmark / Unknown source]

### Metric Definition

[Define metric]

### Timeframe

[State timeframe]

### Caveats

[State caveats]

### Confidence

[High / Medium / Low / Do not use yet]

### Human Review

[State whether review is required]

## Metric Owner Or Steward

Metric owner or steward:

[Add once confirmed.]

Until ownership is confirmed, outputs using service account metrics should flag ownership uncertainty where relevant.

## Refresh Cadence

Refresh cadence:

[Add once confirmed.]

Until refresh cadence is confirmed, outputs should avoid claims about currentness beyond the known timeframe.

## Human Review Triggers

Human review is required when:

- source of truth is not confirmed
- source type is unclear
- source conflict exists
- metric definition is unclear
- caveats materially affect interpretation
- data quality issues affect confidence
- output may be used in a decision brief
- output may be executive-facing
- output may be used in governance
- output may support performance claims
- output may affect stakeholder communication
- output compares teams, people or services
- output may be public-facing
- output could be mistaken for official reporting

## Storage Rules

Store reusable service account source guidance in:

`11_analytics/service-account/source_rules.md`

Do not store:

- raw datasets
- customer-level rows
- copied dashboard values
- restricted screenshots
- raw Genie transcripts
- sensitive source exports
- unsupported extracts

## Review Checklist

Before using a source in service account analysis, check:

- Is the source named?
- Is the source type labelled?
- Is the source approved for this use?
- Is the source of truth confirmed?
- Is the metric definition clear?
- Is the timeframe clear?
- Are caveats visible?
- Are data quality notes relevant?
- Is confidence proportionate?
- Is human review required?
- Is the output safe to store?

## Success Measures

Source rules are working when:

- source hierarchy is clear
- analytical outputs name their sources
- caveats appear consistently
- confidence reflects source strength
- exploratory outputs stay exploratory
- governed data remains in governed systems
- decision-support evidence is more reliable
- human review happens before formal use

## Failure Modes

Source rules are failing if:

- sources are unnamed
- source hierarchy is ignored
- exploratory analysis is treated as governed
- caveats are omitted
- confidence is too high
- source conflict is hidden
- raw data is copied into Strategic OS
- outputs are used in decisions without review
- official reporting boundaries are blurred

## Minimal Use Rule

Name the source.

Label the source type.

State the caveat.

Lower confidence when uncertain.

Escalate when source quality affects a decision.
