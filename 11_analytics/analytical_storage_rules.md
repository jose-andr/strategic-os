# Analytical Storage Rules

## Purpose

This framework defines what analytical material can be stored in Strategic OS, where it should be stored and what should be excluded.

It protects Strategic OS from becoming a shadow data warehouse, reporting system or repository for sensitive source extracts.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Analytical storage should make decision-relevant interpretation easier to find without increasing data, privacy or governance risk.

## Core Principle

Store interpretation, caveats and decision-support evidence.

Do not store raw data.

Strategic OS should keep:

- source rules
- metric definitions
- metric caveats
- data quality notes
- reviewed analytical summaries
- decision-support evidence
- review prompts
- consistency checks
- safe context for analytical agents

Strategic OS should not keep:

- raw datasets
- customer-level records
- copied governed reporting extracts
- restricted screenshots
- raw query outputs
- raw Genie transcripts
- sensitive operational records
- confidential source exports

## Recommended Storage Locations

| Material | Recommended Location |
| --- | --- |
| General analytics patterns | `11_analytics/` |
| Domain-specific analytics files | `11_analytics/[domain]/` |
| Service account analytics | `11_analytics/service-account/` |
| Project-specific analytics | `08_projects/[project-name]/analytics/` |
| Decision-ready synthesis | Relevant decision brief or project folder |
| Reusable caveats | `11_analytics/[domain]/metric_caveats.md` |
| Reusable source rules | `11_analytics/[domain]/source_rules.md` |
| Reusable data quality issues | `11_analytics/[domain]/data_quality_notes.md` |
| Agent prompt context | `11_analytics/[domain]/agent_context.md` |
| Genie context | `11_analytics/[domain]/genie_context.md` |
| Output index | `11_analytics/[domain]/agent_output_index.md` |

## What Can Be Stored

Store analytical material when it is:

- reusable
- caveated
- decision-relevant
- safe to retain
- free of raw data
- free of customer-level records
- clear about source type
- clear about confidence
- reviewed where needed
- useful for future decision-making

Examples:

- source hierarchy notes
- metric caveat registers
- metric definition summaries
- data quality interpretation notes
- analytical summary templates
- reviewed trend summaries
- reviewed anomaly summaries
- source conflict notes
- decision-support evidence notes
- agent review prompts
- consistency checks

## What Must Not Be Stored

Do not store:

- raw datasets
- raw Databricks outputs
- raw SQL query results
- raw Genie transcripts
- customer-level rows
- personally identifiable information
- copied dashboard tables
- restricted screenshots
- confidential source extracts
- private stakeholder commentary
- sensitive operational logs
- credentials, tokens or access details
- unpublished official reporting material
- material that belongs in governed systems

## Store With Caution

Some material may be stored only after review and abstraction.

| Material | Storage Rule |
| --- | --- |
| Executive-facing analytical interpretation | Store only after human review |
| Governance-facing analysis | Store only with caveats and review status |
| Stakeholder-sensitive analysis | Abstract before storage |
| Performance-related analysis | Avoid naming individuals or teams unless approved |
| Source conflict notes | Store if conflict affects interpretation or reuse |
| Data quality issues | Store issue and interpretation risk, not raw examples |
| Genie-supported outputs | Store reviewed summary, not transcript |
| Databricks query findings | Store caveated interpretation, not raw output |

## Storage Decision

Use one of these decisions:

- store
- store with caveats
- store after human review
- store only as abstracted note
- temporary working note only
- do not store
- archive
- delete from Strategic OS

## Storage Review Questions

Before storing analytical material, ask:

- Is this useful beyond the current moment?
- Does it support a decision, caveat, source rule or future interpretation?
- Is the source type labelled?
- Is confidence labelled?
- Are caveats visible?
- Are data quality issues visible?
- Is human review required?
- Does it include raw data?
- Does it include customer-level records?
- Could it be mistaken for official reporting?
- Could it create privacy, governance or reputational risk?
- Is Strategic OS the right place for it?

## Standard Storage Statement

Use this pattern:

This output should be stored in [location] as [file type] because [reuse value]. It is based on [source type] with [confidence level] confidence. It should be stored with [caveats/review status]. Raw data and sensitive source material have been excluded.

## File Naming Pattern

For dated analytical outputs, use:

`YYYY-MM-DD_domain_output-type_topic.md`

Examples:

- `2026-07-05_service-account_analytical-summary_active-account-pattern.md`
- `2026-07-05_service-account_metric-caveat_closure-resolution-risk.md`
- `2026-07-05_service-account_data-quality-note_refresh-cadence-uncertainty.md`
- `2026-07-05_service-account_source-conflict_active-account-count.md`

For standing domain files, use stable names:

- `agent_context.md`
- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `genie_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `agent_output_index.md`

## Output Index Rule

Update the domain output index when a stored output is:

- reusable
- reviewed
- decision-relevant
- likely to be needed again
- part of the domain’s standing analytical context

Do not index:

- temporary query notes
- exploratory drafts
- raw data
- unreviewed sensitive outputs
- material with no reuse value

## Archive Rules

Archive analytical material when:

- source has changed
- metric definition has changed
- caveat has been superseded
- data quality issue has been resolved
- output is no longer safe to reuse
- output has been replaced by a stronger standing file
- analysis was exploratory and is no longer useful

Mark archived material clearly.

Do not leave outdated analytical outputs looking current.

## Deletion Rules

Delete or remove analytical material from Strategic OS when it contains:

- raw data
- customer-level records
- sensitive source extracts
- restricted screenshots
- private stakeholder material
- material that should remain only in governed systems
- unsupported claims that cannot be safely caveated
- information that creates unnecessary privacy or governance risk

## Human Review Required

Human review is required before storing analytical material when:

- source type is unclear
- source of truth is unclear
- output may be used in decision-making
- output may be executive-facing
- output may be governance-facing
- output may support performance claims
- output may affect stakeholder communication
- caveats materially affect interpretation
- data quality issues lower confidence
- storage location is uncertain
- abstraction may be required

## Relationship To Other Files

Use this framework with:

- `analytical_output_review_checklist.md`
- `analytical_agent_human_review_triggers.md`
- `domain_agent_output_index.md`
- `domain_agent_pattern.md`
- `privacy_governance_retention.md`
- `agent_file_naming.md`
- `agent_output_map.md`

## Review Checklist

Before storing analytical material, confirm:

- Storage purpose is clear
- Reuse value is clear
- Source type is labelled
- Confidence is labelled
- Caveats are included
- Data quality issues are considered
- Human review status is clear
- Raw data is excluded
- Customer-level records are excluded
- Sensitive extracts are excluded
- File path is appropriate
- Naming pattern is followed
- Output index update is considered

## Success Measures

Analytical storage rules are working when:

- useful analytical evidence is easy to find
- Strategic OS does not store raw data
- source rules and caveats are reusable
- decision briefs use better evidence
- sensitive material remains in governed systems
- outdated outputs are archived or marked clearly
- analytical clutter decreases
- confidence and review status are visible

## Failure Modes

Analytical storage rules are failing if:

- raw data is stored in Strategic OS
- customer-level records are retained
- copied dashboard outputs appear in repo files
- raw Genie transcripts are stored
- outdated analysis looks current
- temporary query notes are over-indexed
- sensitive material is not abstracted
- storage decisions are made without review
- Strategic OS becomes a shadow reporting system

## Minimal Use Rule

Store only what helps future judgement.

Keep governed data in governed systems.

Keep Strategic OS focused on interpretation, caveats, review status and decision support.
