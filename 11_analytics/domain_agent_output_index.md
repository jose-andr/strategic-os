# Domain Analytical Agent Output Index

## Purpose

This pattern defines how to index reusable analytical outputs created by Domain Analytical Agents.

The index helps Strategic OS find useful analytical evidence, caveats, source rules, metric definitions and data quality notes without duplicating raw data or governed reporting.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

An analytical output index supports the North Star by making decision-relevant evidence easier to find, review and reuse.

## Core Principle

Index the reusable interpretation.

Do not index or store raw data.

The index should point to safe, reviewed analytical artefacts that help with future judgement.

## Recommended Location

General pattern:

`11_analytics/domain_agent_output_index.md`

Domain-specific index:

`11_analytics/[domain]/agent_output_index.md`

Examples:

- `11_analytics/service-account/agent_output_index.md`
- `11_analytics/channel-strategy/agent_output_index.md`
- `11_analytics/customer-demand/agent_output_index.md`
- `11_analytics/support-csat/agent_output_index.md`
- `11_analytics/executive-metrics/agent_output_index.md`
- `11_analytics/data-quality/agent_output_index.md`

## When To Use

Use an output index when an analytics domain has reusable outputs such as:

- source rules
- metric definitions
- metric caveats
- data quality notes
- analytical summaries
- trend summaries
- anomaly summaries
- decision-support evidence
- Genie context
- review prompts
- consistency checks

Do not index every temporary query or exploratory note.

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

## Standard Index Table

Use this table for domain-specific files.

| Date | Output | Type | Source Type | Confidence | Review Status | Location |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |

## Output Types

Use these output types:

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

Confidence should reflect:

- source quality
- metric clarity
- caveat strength
- data quality status
- review status
- decision relevance

## Review Status

Use these review status labels:

- draft
- reviewed
- needs caveat strengthening
- needs source clarification
- needs metric clarification
- needs human review
- safe to store
- safe for decision-support use
- do not use
- archived

## Standard Index Entry

Use this structure when a table row is not enough.

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

## Storage Rules

Store the domain index in:

`11_analytics/[domain]/agent_output_index.md`

Store general indexing guidance in:

`11_analytics/domain_agent_output_index.md`

Do not use the index to store full analytical content.

The index should help locate outputs, not duplicate them.

## Naming Pattern

Use clear file names.

Recommended pattern:

`YYYY-MM-DD_domain_output-type_topic.md`

Examples:

- `2026-07-05_service-account_metric-caveat_duplicate-record-risk.md`
- `2026-07-05_channel-strategy_trend-summary_assisted-support-demand.md`
- `2026-07-05_customer-demand_data-quality-note_missing-category-values.md`
- `2026-07-05_support-csat_decision-support-evidence_survey-response-risk.md`

For standing files, use stable names:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `agent_output_index.md`

## Relationship To Other Domain Files

The output index should point to:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `genie_context.md`
- reviewed analytical summaries
- reviewed consistency checks

The index should not replace those files.

## Decision Brief Use

When an analytical output may support a decision brief, the index should make clear:

- what evidence exists
- what source type applies
- what caveats apply
- what confidence level applies
- whether human review is required
- whether the evidence is suitable for decision-support use

## Human Review Required

Human review is required before an indexed output is used for:

- executive-facing material
- governance reporting
- formal decision briefs
- stakeholder-sensitive communication
- performance comparison
- public-facing claims
- funding or resourcing advice
- claims about organisational performance

## Review Cadence

Review the index:

- monthly for active analytical domains
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

The output index is working when:

- reusable analytical evidence is easy to find
- agents can locate source rules and caveats quickly
- decision briefs use better analytical evidence
- outdated outputs are visible or archived
- raw data is not stored in Strategic OS
- confidence and review status are clear
- quarterly review is easier
- analytical clutter decreases

## Failure Modes

The output index is failing if:

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
