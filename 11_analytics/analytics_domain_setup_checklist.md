# Analytics Domain Setup Checklist

## Purpose

This checklist helps set up a new Strategic OS analytics domain safely and consistently.

It ensures each analytics domain has the minimum context needed for source-aware, caveated and decision-relevant analytical support.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

An analytics domain should improve decision quality without becoming a shadow data warehouse or unofficial reporting system.

## When To Use

Use this checklist when creating a new folder under:

`11_analytics/[domain]/`

Use it for domains such as:

- `service-account`
- `channel-strategy`
- `customer-demand`
- `support-csat`
- `executive-metrics`
- `data-quality`

Do not create a full analytics domain for one-off analysis.

## Setup Principle

Start with the smallest useful domain.

Create files only when they support repeated interpretation, caveats, review, decision support or safe reuse.

## Minimum Useful Domain

A minimum analytics domain should usually include:

- `agent_context.md`
- `source_rules.md`
- `metric_caveats.md`
- `agent_review_prompt.md`

Add other files only when useful.

## Recommended Mature Domain Structure

A mature analytics domain may include:

- `agent_context.md`
- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `agent_output_index.md`
- `archive/`

Do not create empty folders or files without a clear purpose.

## Step 1: Confirm Domain Need

Before creating a new analytics domain, check:

| Check | Result | Notes |
| --- | --- | --- |
| Domain has recurring analytical questions | Yes / No |  |
| Domain has decision relevance | Yes / No |  |
| Domain has source or metric caveats | Yes / No |  |
| Domain may support future decision briefs | Yes / No |  |
| Domain needs reusable interpretation guidance | Yes / No |  |
| Domain is not just a one-off analysis | Yes / No |  |

Create the domain only if there is a repeated need.

## Step 2: Name The Domain

Use short, lowercase, hyphenated names.

Examples:

- `service-account`
- `channel-strategy`
- `customer-demand`
- `support-csat`
- `executive-metrics`
- `data-quality`

Avoid names that are:

- too broad
- too vague
- tied to a temporary question
- likely to expose sensitive information
- inconsistent with existing folder naming

## Step 3: Create Agent Context

Create:

`11_analytics/[domain]/agent_context.md`

The file should define:

- domain purpose
- agent role
- default autonomy level
- main questions the agent supports
- primary responsibilities
- out-of-scope activities
- source hierarchy
- evidence standard
- confidence labels
- human review triggers
- storage rules

Use `11_analytics/domain_agent_pattern.md` as the general reference.

## Step 4: Create Source Rules

Create:

`11_analytics/[domain]/source_rules.md`

The file should define:

- source of truth, if known
- approved reporting sources
- approved analytical sources
- contextual sources
- sources not to use
- source hierarchy
- source conflict handling
- confidence rules
- human review triggers
- storage rules

If the source of truth is not confirmed, state that clearly.

Do not invent source authority.

## Step 5: Create Metric Definitions

Create this only if the domain uses repeated metrics:

`11_analytics/[domain]/metric_definitions.md`

The file should define:

- metric name
- plain-English definition
- technical definition, if needed
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
- human review triggers

Do not recreate a full organisational data dictionary.

Define the metrics that affect interpretation and decisions.

## Step 6: Create Metric Caveats

Create:

`11_analytics/[domain]/metric_caveats.md`

The file should document:

- metric caveats
- why each caveat matters
- safe interpretation
- unsafe interpretation
- severity
- confidence
- human review triggers

Prioritise caveats that affect decision quality, trust, communication or reuse.

## Step 7: Create Data Quality Notes

Create this when known data quality issues affect interpretation:

`11_analytics/[domain]/data_quality_notes.md`

The file should capture:

- issue summary
- affected source
- affected metric
- severity
- confidence impact
- safe interpretation
- unsafe interpretation
- workaround
- status
- review date

Capture the issue, not the raw data.

## Step 8: Create Genie Context

Create this only if Databricks Genie or a similar natural-language analytics tool is used:

`11_analytics/[domain]/genie_context.md`

The file should define:

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

Do not store raw Genie transcripts or query results.

## Step 9: Create Review Prompt

Create:

`11_analytics/[domain]/agent_review_prompt.md`

The prompt should review analytical outputs for:

- source clarity
- source type
- metric definition
- grain
- timeframe
- caveats
- data quality issues
- confidence
- interpretation quality
- decision relevance
- privacy and storage safety
- human review needs

## Step 10: Create Consistency Check

Create this when the domain will be reused or has governance risk:

`11_analytics/[domain]/agent_consistency_check.md`

The checklist should test whether the agent:

- uses the same source logic
- applies the same metric definitions
- remembers caveats
- lowers confidence when needed
- avoids overclaiming
- identifies human review triggers
- avoids storing raw data

## Step 11: Create Output Index

Create this when the domain has reusable outputs:

`11_analytics/[domain]/agent_output_index.md`

The index should track:

- standing files
- reusable analytical summaries
- decision-support evidence
- caveats
- source conflict notes
- data quality notes
- review status
- confidence
- storage location

Do not index every temporary query.

## Domain Setup Review

Before considering a domain ready, check:

| Check | Result | Notes |
| --- | --- | --- |
| Domain purpose is clear | Pass / Partial / Fail |  |
| Source hierarchy is defined | Pass / Partial / Fail |  |
| Source uncertainty is visible | Pass / Partial / Fail |  |
| Key metrics are defined or marked to confirm | Pass / Partial / Fail |  |
| Caveats are documented | Pass / Partial / Fail |  |
| Data quality issues are documented where relevant | Pass / Partial / Fail |  |
| Human review triggers are clear | Pass / Partial / Fail |  |
| Storage rules exclude raw data | Pass / Partial / Fail |  |
| Agent outputs support decisions, not official reporting | Pass / Partial / Fail |  |
| Domain is small enough to maintain | Pass / Partial / Fail |  |

## Readiness Status

Choose one:

- not ready
- draft domain
- usable with caveats
- ready for controlled use
- ready for repeated decision-support use
- needs redesign

## Human Review Required

Human review is required before a new analytics domain is used for:

- executive-facing outputs
- governance
- formal decision briefs
- stakeholder-sensitive communication
- performance claims
- customer experience claims
- public-facing claims
- funding or resourcing advice
- official reporting interpretation

## Storage Rules

Store domain setup files in:

`11_analytics/[domain]/`

Do not store:

- raw datasets
- customer-level records
- copied dashboard extracts
- raw SQL outputs
- raw Genie transcripts
- restricted screenshots
- sensitive source exports
- private stakeholder commentary

## Relationship To General Analytics Files

Use this checklist with:

- `domain_agent_pattern.md`
- `domain_agent_source_rules.md`
- `domain_agent_metric_definitions.md`
- `domain_agent_metric_caveats.md`
- `domain_agent_data_quality_notes.md`
- `domain_agent_genie_context.md`
- `domain_agent_review_prompt.md`
- `domain_agent_consistency_check.md`
- `domain_agent_output_index.md`
- `analytical_storage_rules.md`
- `analytical_output_review_checklist.md`
- `analytical_agent_human_review_triggers.md`
- `analytical_agent_prompt_pattern.md`

## Success Measures

Analytics domain setup is working when:

- analytical interpretation is more consistent
- source uncertainty is visible
- caveats are reused
- data quality risks are not forgotten
- decision briefs use better evidence
- agents avoid official reporting claims
- raw data stays out of Strategic OS
- human review happens before high-risk use
- the domain remains useful and maintainable

## Failure Modes

Analytics domain setup is failing if:

- domains are created for one-off questions
- files are created but never used
- source authority is invented
- caveats are missing
- metric definitions drift
- raw data is stored
- Genie outputs are treated as truth
- output indexes become cluttered
- review becomes process-heavy without improving judgement

## Minimal Use Rule

Create the smallest useful analytics domain.

Add structure only when repeated use justifies it.

Keep Strategic OS focused on interpretation, caveats, review and decision support.
