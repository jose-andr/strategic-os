# Databricks And Genie Architecture

## Purpose

This framework defines how Strategic OS should use Databricks, Genie and related analytical tooling.

It protects the boundary between governed data platforms and Strategic OS decision-support artefacts.

Databricks and Genie may support analytical interpretation, but Strategic OS should not become a data warehouse, official reporting layer or unmanaged copy of governed data.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Databricks and Genie support this by helping turn governed analytical context into clearer, caveated and decision-relevant evidence.

## Core Principle

Databricks is a governed analytical environment.

Genie is a natural-language analytical interface.

Strategic OS is a decision-support and interpretation layer.

Do not confuse these roles.

## Role Of Databricks

Databricks may be used to:

- access governed analytical sources
- run approved queries
- support data exploration
- validate source logic
- inspect metric behaviour
- investigate trends or anomalies
- support data quality review
- prepare evidence for interpretation

Databricks should remain the place where governed data lives.

Strategic OS should not copy raw Databricks outputs into repo files.

## Role Of Genie

Genie may be used to:

- ask natural-language analytical questions
- explore approved metrics
- support non-technical interrogation
- generate first-pass analytical responses
- help identify possible patterns
- support caveated summaries
- help users ask better data questions

Genie should not be treated as the source of truth.

A Genie answer must be interpreted through source rules, metric definitions, caveats and human review.

## Role Of Strategic OS

Strategic OS may store:

- source rules
- metric definitions
- metric caveats
- data quality notes
- reviewed analytical summaries
- decision-support evidence
- Genie context
- review prompts
- consistency checks
- storage rules

Strategic OS must not store:

- raw datasets
- customer-level records
- raw SQL outputs
- raw Genie transcripts
- copied dashboard extracts
- restricted screenshots
- confidential data exports
- credentials or access details

## Architecture Layers

| Layer | Role | Stored In |
| --- | --- | --- |
| Governed data | Authoritative source data | Databricks or official data platform |
| Reporting layer | Approved dashboards and reporting views | Power BI or approved reporting tool |
| Natural-language interface | Question and answer interface over approved data | Genie or similar tool |
| Analytical interpretation | Caveated summaries and evidence notes | Strategic OS |
| Strategic synthesis | Decisions, trade-offs and recommendations | Strategic OS decision briefs |
| Human accountability | Approval, judgement and governance | Human owner |

## Source-Of-Truth Boundary

Source of truth remains in governed systems.

Strategic OS can reference source names, source types and interpretation rules.

Strategic OS should not duplicate governed data.

Use Strategic OS to answer:

- What source should be used?
- What does the metric mean?
- What caveats apply?
- What confidence level is appropriate?
- What decision could this support?
- What human review is required?

Do not use Strategic OS to answer by storing:

- complete source tables
- raw query outputs
- customer records
- official dashboard values copied without context
- private or restricted extracts

## Standard Workflow

Use this workflow for Databricks or Genie-supported analysis.

### 1. Ask The Analytical Question

Define:

- domain
- decision or judgement being supported
- metric or signal needed
- timeframe
- likely source
- intended use

### 2. Retrieve Or Explore In Databricks Or Genie

Use approved sources only.

Do not bypass governance or source permissions.

### 3. Apply Domain Context

Check:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `genie_context.md`

### 4. Convert To Interpretation

Use a Strategic OS analytical template such as:

- `analytical_summary_template.md`
- `analytical_trend_summary.md`
- `analytical_anomaly_summary.md`
- `analytical_source_conflict_note.md`
- `analytical_decision_support_evidence.md`

### 5. Review

Apply:

- `analytical_output_review_checklist.md`
- `analytical_agent_human_review_triggers.md`

### 6. Store Only If Useful And Safe

Store reusable interpretation in:

`11_analytics/[domain]/`

Do not store raw outputs.

### 7. Route To Strategic Synthesis

If the analysis may support a decision, route to:

- Sensemaking Agent for decision brief synthesis
- Stakeholder Journey Agent for stakeholder-sensitive interpretation
- Chief of Staff Agent for follow-up tracking or operating cadence

## Genie Context Files

Each domain using Genie should have:

`11_analytics/[domain]/genie_context.md`

This file should define:

- domain purpose
- approved terms
- approved metrics
- source hierarchy
- common questions
- caveats
- data quality notes
- safe response pattern
- prohibited interpretations
- human review triggers
- storage rules

Do not create Genie context for domains that do not use natural-language analytics.

## Databricks Query Handling

Strategic OS may document the interpretation of a query.

Strategic OS should not store the raw query result.

A safe query interpretation should include:

- analytical question
- source
- source type
- metric definition
- timeframe
- grain
- observation
- caveats
- data quality notes
- confidence
- what cannot be concluded
- human review requirement
- storage recommendation

## SQL And Query Logic

If SQL or query logic needs to be retained, store only when it is safe and useful.

Possible location:

`11_analytics/[domain]/sql/`

Only store query logic when:

- it does not expose sensitive data
- it does not include credentials
- it does not include customer-level outputs
- it is reusable
- it helps explain metric logic
- it has been reviewed

Do not store:

- query results
- restricted table extracts
- credentials
- access tokens
- customer-level examples
- sensitive joins or source details that should remain restricted

## Source Rules

Every Databricks or Genie-supported domain should define source rules.

Use:

`11_analytics/[domain]/source_rules.md`

Source rules should clarify:

- governed source of truth
- approved reporting layer
- approved analytical sources
- contextual sources
- sources not to use
- source hierarchy
- source conflict handling
- confidence rules
- human review triggers

If the source of truth is not confirmed, state that clearly.

## Metric Definitions

Every repeated metric should be defined before interpretation.

Use:

`11_analytics/[domain]/metric_definitions.md`

A metric definition should include:

- plain-English definition
- technical definition where needed
- source
- source type
- grain
- timeframe
- refresh cadence
- inclusions
- exclusions
- caveats
- safe use
- unsafe use

## Caveats And Data Quality

Databricks and Genie outputs should always be checked against:

- `metric_caveats.md`
- `data_quality_notes.md`

Caveats explain limits of interpretation.

Data quality notes explain reliability issues.

Both should affect confidence.

## Confidence Rules

Use these confidence labels:

- high confidence
- medium confidence
- low confidence
- do not use yet

Lower confidence when:

- source is unclear
- source type is unknown
- metric definition is unclear
- grain is unclear
- timeframe is unclear
- caveats are missing
- data quality issues exist
- source conflict exists
- output is exploratory
- human review has not occurred

## Human Review Required

Human review is required before Databricks or Genie-supported outputs are:

- used in decision briefs
- used in executive-facing material
- used in governance
- used for performance claims
- used for customer experience claims
- used in stakeholder-sensitive communication
- used to compare teams, individuals or services
- used in public-facing claims
- used for funding or resourcing advice
- stored as reusable decision-support evidence
- treated as official reporting interpretation

## Prohibited Uses

Do not use Databricks or Genie through Strategic OS to:

- bypass official reporting governance
- create unofficial performance claims
- copy raw governed data into GitHub
- store customer-level records
- store raw Genie transcripts
- treat exploratory answers as official reporting
- infer cause without evidence
- compare teams or individuals without review
- make decisions automatically
- send stakeholder communication without approval
- hide source uncertainty
- omit caveats

## Safe Language

Use careful language:

- appears to show
- may indicate
- suggests
- could reflect
- is consistent with
- should be checked against the governed source
- requires human review before formal use

Avoid:

- proves
- confirms
- definitively shows
- no caveats apply
- this is official reporting
- this should be acted on immediately
- the cause is

## Storage Rules

Store reusable interpretation in:

`11_analytics/[domain]/`

Store project-specific analytical interpretation in:

`08_projects/[project-name]/analytics/`

Do not store raw data.

Use `analytical_storage_rules.md` before storing analytical outputs.

## Review Checklist

Before using Databricks or Genie-supported analysis, check:

- Is the source named?
- Is the source type labelled?
- Is the source of truth confirmed?
- Is the metric defined?
- Is the grain clear?
- Is the timeframe clear?
- Are caveats included?
- Are data quality notes considered?
- Is confidence proportionate?
- Is human review required?
- Is raw data excluded?
- Is Strategic OS the right storage location?
- Could this be mistaken for official reporting?

## Success Measures

Databricks and Genie architecture is working when:

- governed data remains in governed systems
- Genie outputs are caveated and reviewed
- source hierarchy is respected
- metric definitions remain consistent
- analytical summaries support better decisions
- raw data is not copied into Strategic OS
- confidence is proportionate
- human review happens before high-risk use
- decision briefs use stronger analytical evidence
- users understand what analysis can and cannot prove

## Failure Modes

Databricks and Genie architecture is failing if:

- Genie is treated as the source of truth
- raw query results are stored in Strategic OS
- caveats disappear
- source conflicts are hidden
- exploratory outputs become official claims
- confidence is too high
- dashboard or source boundaries are bypassed
- stakeholder-sensitive claims are made without review
- Strategic OS becomes a shadow reporting system
- decisions are made from data without interpretation or judgement

## Minimal Use Rule

Use Databricks and Genie to strengthen analytical judgement.

Keep governed data in governed systems.

Keep Strategic OS focused on source rules, caveats, interpretation, review and decision support.
