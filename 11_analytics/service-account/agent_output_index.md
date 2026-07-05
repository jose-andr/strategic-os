# Service Account Analytical Agent Output Index

## Purpose

This index tracks reusable outputs for the Service Account analytical domain.

It helps Strategic OS locate service account source rules, metric definitions, caveats, data quality notes, Genie context, reviews and decision-support evidence without storing raw data.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

The output index supports better decisions by making reviewed analytical evidence easier to find and reuse.

## Domain

Service Account

## Core Principle

Index the reusable interpretation.

Do not index or store raw data.

## Standard Index

| Date | Output | Type | Source Type | Confidence | Review Status | Location |
| --- | --- | --- | --- | --- | --- | --- |
|  | Service Account Analytical Agent Context | agent context | user-provided context | medium confidence | draft | `11_analytics/service-account/agent_context.md` |
|  | Service Account Source Rules | source rules | user-provided context | low confidence | needs source confirmation | `11_analytics/service-account/source_rules.md` |
|  | Service Account Metric Definitions | metric definitions | unknown source | low confidence | needs source confirmation | `11_analytics/service-account/metric_definitions.md` |
|  | Service Account Metric Caveats | metric caveats | user-provided context | medium confidence | draft | `11_analytics/service-account/metric_caveats.md` |
|  | Service Account Data Quality Notes | data quality note | user-provided context | medium confidence | draft | `11_analytics/service-account/data_quality_notes.md` |
|  | Service Account Genie Context | Genie context | user-provided context | medium confidence | draft | `11_analytics/service-account/genie_context.md` |
|  | Service Account Analytical Agent Review Prompt | review prompt | user-provided context | medium confidence | draft | `11_analytics/service-account/agent_review_prompt.md` |
|  | Service Account Analytical Agent Consistency Check | consistency check | user-provided context | medium confidence | draft | `11_analytics/service-account/agent_consistency_check.md` |

## Output Types

Use these output types:

- agent context
- source rules
- metric definitions
- metric caveats
- data quality note
- Genie context
- analytical summary
- trend summary
- anomaly summary
- decision-support evidence
- consistency check
- review prompt
- temporary working note
- archive note

## Source Types

Use these source type labels:

- governed source
- approved reporting source
- approved analytical source
- contextual signal
- exploratory analysis
- user-provided context
- external benchmark
- unknown source

## Confidence Labels

Use these confidence labels:

- high confidence
- medium confidence
- low confidence
- do not use yet

Current standing files should remain at low or medium confidence until the governed source of truth, metric owner and refresh cadence are confirmed.

## Review Status Labels

Use these review status labels:

- draft
- reviewed
- needs caveat strengthening
- needs source clarification
- needs metric clarification
- needs data quality clarification
- needs human review
- needs source confirmation
- safe to store
- safe for decision-support use
- do not use
- archived

## Standing Files

### Agent Context

Location:

`11_analytics/service-account/agent_context.md`

Use:

Defines the operating context, responsibilities, autonomy level, evidence standard and storage rules for the Service Account Analytical Agent.

Review need:

Review when source rules, metric definitions or autonomy rules change.

### Source Rules

Location:

`11_analytics/service-account/source_rules.md`

Use:

Defines source hierarchy, source type labels, confidence rules, source conflict handling and review triggers.

Review need:

Review when the governed source of truth, approved reporting layer, Databricks tables, dashboards or metric ownership are confirmed or changed.

### Metric Definitions

Location:

`11_analytics/service-account/metric_definitions.md`

Use:

Defines key service account metrics, expected grain, safe use, unsafe use and review triggers.

Review need:

Review when source systems, metric calculations, inclusions, exclusions or reporting definitions are confirmed or changed.

### Metric Caveats

Location:

`11_analytics/service-account/metric_caveats.md`

Use:

Documents caveats that affect service account interpretation.

Review need:

Review when metrics are confirmed, caveats are resolved, or service account evidence is used in decision-facing material.

### Data Quality Notes

Location:

`11_analytics/service-account/data_quality_notes.md`

Use:

Documents reusable data quality issues that affect confidence and interpretation.

Review need:

Review when data quality issues are resolved, superseded or newly identified.

### Genie Context

Location:

`11_analytics/service-account/genie_context.md`

Use:

Provides safe context for Databricks Genie or similar natural-language analytics tools.

Review need:

Review when source hierarchy, metrics, caveats or data quality notes change.

### Agent Review Prompt

Location:

`11_analytics/service-account/agent_review_prompt.md`

Use:

Reviews service account analytical outputs before storage, sharing or decision use.

Review need:

Review after first use against real outputs.

### Agent Consistency Check

Location:

`11_analytics/service-account/agent_consistency_check.md`

Use:

Tests whether the Service Account Analytical Agent produces stable source-aware and caveated outputs over time.

Review need:

Review quarterly or when outputs become inconsistent.

## Analytical Output Entry Template

Use this structure when adding reviewed analytical outputs.

### Output

[Name of output]

### Date

[Date created or reviewed]

### Type

[Output type]

### Source Type

[Source type]

### Confidence

[High / Medium / Low / Do not use yet]

### Review Status

[Status]

### Summary

[Briefly describe what the output is useful for.]

### Caveats

[Key caveats.]

### Decision Relevance

[What decision or judgement this may support.]

### Location

[File path]

### Next Review

[Date or trigger]

## Naming Pattern

For dated analytical outputs, use:

`YYYY-MM-DD_service-account_output-type_topic.md`

Examples:

- `2026-07-05_service-account_metric-caveat_closure-resolution-risk.md`
- `2026-07-05_service-account_data-quality-note_grain-uncertainty.md`
- `2026-07-05_service-account_trend-summary_active-account-pattern.md`
- `2026-07-05_service-account_decision-support-evidence_channel-mix-risk.md`

For standing files, use stable names:

- `agent_context.md`
- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `agent_output_index.md`

## What To Index

Index outputs that are:

- reusable
- reviewed
- decision-relevant
- caveated
- safe to store
- useful for future prompts
- useful for future decision briefs
- useful for quarterly review

Do not index:

- raw data
- customer-level records
- copied dashboard extracts
- raw query outputs
- raw Genie transcripts
- sensitive screenshots
- temporary working notes
- speculative analysis with no reuse value

## Decision Brief Use

When service account analysis may support a decision brief, the index should make clear:

- what evidence exists
- what source type applies
- what caveats apply
- what confidence level applies
- whether human review is required
- whether the evidence is suitable for decision-support use

## Human Review Required

Human review is required before indexed service account outputs are used for:

- executive-facing material
- governance reporting
- formal decision briefs
- stakeholder-sensitive communication
- performance comparison
- customer experience claims
- public-facing claims
- funding or resourcing advice
- claims about organisational performance

## Review Cadence

Review this index:

- monthly while service account analytics is active
- quarterly during Strategic OS assessment
- when source rules change
- when metric definitions change
- when caveats change
- when data quality issues are resolved or superseded
- when outputs are used in major decisions

## Archive Rules

Archive indexed outputs when:

- source has changed
- metric definition has changed
- caveat has been superseded
- data quality issue has been resolved
- output is no longer safe to reuse
- output was exploratory and is no longer useful
- output has been converted into a stronger standing file

Mark archived outputs clearly.

Do not delete decision-relevant historical notes unless they contain sensitive material that should not be retained.

## Review Checklist

Before adding an output to the index, check:

- Is the output reusable?
- Is it safe to store?
- Is the source type labelled?
- Is confidence labelled?
- Are caveats visible?
- Is the review status clear?
- Is the storage location correct?
- Does it avoid raw data?
- Does it avoid customer-level records?
- Does it support better decision-making?

## Success Measures

The service account output index is working when:

- reusable analytical evidence is easy to find
- source rules and caveats are easy to locate
- decision briefs use better analytical evidence
- outdated outputs are visible or archived
- raw data is not stored in Strategic OS
- confidence and review status are clear
- quarterly review is easier
- analytical clutter decreases

## Failure Modes

The service account output index is failing if:

- every temporary query is indexed
- raw data is copied into the index
- review status is unclear
- outdated outputs appear current
- confidence is missing
- caveats are hidden
- users cannot find the actual files
- the index duplicates content instead of pointing to it
- sensitive material is retained unnecessarily

## Minimal Use Rule

Index only what is worth finding again.

The index should reduce analytical clutter, not create another layer of administration.
