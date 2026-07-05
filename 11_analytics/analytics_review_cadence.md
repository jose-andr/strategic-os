# Analytics Review Cadence

## Purpose

This framework defines how Strategic OS analytics domains should be reviewed over time.

It helps keep source rules, metric definitions, caveats, data quality notes, Genie context and analytical outputs current, safe and useful.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Analytics review cadence supports better decisions by making sure analytical evidence remains trustworthy, caveated and proportionate.

## Core Principle

Analytical context decays unless reviewed.

Sources change.

Metrics drift.

Caveats become outdated.

Data quality issues get resolved or replaced.

Genie context can become stale.

Review cadence prevents old analytical guidance from being reused as if it is still current.

## What Needs Review

Analytics review should cover:

- domain purpose
- source rules
- source of truth status
- metric definitions
- metric caveats
- data quality notes
- Genie context
- agent review prompts
- consistency checks
- output indexes
- archived or superseded outputs
- human review triggers
- storage safety

## Review Levels

Use three review levels.

| Level | Frequency | Purpose |
| --- | --- | --- |
| Light review | Monthly for active domains | Check obvious changes, open issues and reuse risks |
| Standard review | Quarterly | Review domain reliability, caveats, outputs and storage |
| Triggered review | As needed | Review after source, metric, dashboard, system or governance changes |

## Monthly Review

Use monthly review for active analytics domains.

Check:

- Are any source rules outdated?
- Are any metric definitions unclear or changed?
- Are any caveats missing from recent outputs?
- Are any data quality notes still open?
- Are any high-severity issues unresolved?
- Are recent outputs indexed appropriately?
- Are temporary notes being over-stored?
- Are any outputs being used without human review?
- Are there repeated questions that need better domain context?

Recommended output:

- update existing domain files only where needed
- add a short note to `agent_output_index.md` if the review produces reusable insight
- archive outputs that are no longer safe to reuse

## Quarterly Review

Use quarterly review for domains that support decisions.

Check:

### Source Rules

- Is the source of truth still correct?
- Are approved reporting sources still current?
- Are approved analytical sources still current?
- Are source conflicts resolved or still active?
- Are deprecated sources clearly excluded?

### Metric Definitions

- Are key metrics still defined correctly?
- Has the grain changed?
- Have inclusions or exclusions changed?
- Has calculation logic changed?
- Are similar metrics still being confused?

### Metric Caveats

- Are caveats still current?
- Are high-severity caveats still active?
- Are any caveats now resolved or superseded?
- Are agents applying caveats consistently?

### Data Quality Notes

- Are open issues still open?
- Have resolved issues been marked resolved?
- Do any issues need to move into source rules or caveats?
- Are high or blocking issues triggering review?

### Genie Context

- Does Genie context reflect current source rules?
- Are approved terms still correct?
- Are prohibited interpretations still relevant?
- Are common questions still useful?
- Is raw or sensitive data excluded?

### Agent Reliability

- Has the agent passed a consistency check?
- Does it define metrics before interpreting?
- Does it lower confidence when appropriate?
- Does it flag human review triggers?
- Does it avoid official reporting claims?

### Storage And Index

- Is the output index useful?
- Are outdated outputs marked archived or superseded?
- Are temporary outputs being removed or ignored?
- Is Strategic OS avoiding raw data storage?
- Are file names clear and consistent?

## Triggered Review

Run a triggered review when any of these occur:

- source system changes
- dashboard changes
- metric definition changes
- Databricks table or view changes
- Genie context changes
- reporting cadence changes
- data quality issue is discovered
- source conflict appears
- caveat materially affects a decision
- output is used in executive-facing material
- output is used in governance
- domain starts supporting a new type of decision
- repeated agent outputs become inconsistent

## Review Status Labels

Use these status labels:

- current
- draft
- needs source clarification
- needs metric clarification
- needs caveat strengthening
- needs data quality review
- needs human review
- safe for controlled use
- safe for decision-support use
- superseded
- archived
- do not use

## Domain Review Template

Use this structure for a review note when needed.

### Review Date

[Date]

### Domain

[Analytics domain]

### Review Type

Monthly / Quarterly / Triggered

### Reviewer

[Person or agent]

### Overall Status

[Status label]

### Summary

[Short summary of review findings.]

### Source Rules Review

Findings:

Changes required:

### Metric Definitions Review

Findings:

Changes required:

### Metric Caveats Review

Findings:

Changes required:

### Data Quality Review

Findings:

Changes required:

### Genie Context Review

Findings:

Changes required:

### Agent Reliability Review

Findings:

Changes required:

### Storage And Index Review

Findings:

Changes required:

### Human Review Triggers

Review required?

Reason:

### Required Actions

| Action | File | Priority | Owner |
| --- | --- | --- | --- |
|  |  | High / Medium / Low |  |

### Final Review Decision

Choose one:

- no change required
- update domain files
- run consistency check
- require human review before further use
- archive outdated outputs
- pause domain use until source clarified
- redesign domain

## Review Outputs

Only create a review output when the review produces reusable value.

Useful review outputs include:

- updated source rule
- updated metric caveat
- updated data quality note
- consistency check result
- source conflict note
- domain readiness assessment
- output index update

Do not create review notes that simply say nothing changed unless the domain is high risk or decision-critical.

## Human Review Required

Human review is required when review identifies:

- source of truth uncertainty
- metric definition uncertainty
- high or blocking data quality issue
- source conflict affecting decisions
- caveat that materially changes interpretation
- stale outputs used in decisions
- executive-facing or governance-facing analytical material
- stakeholder-sensitive analytical claims
- storage of sensitive material
- evidence that may be mistaken for official reporting

## Storage Rules

Store domain review outputs in:

`11_analytics/[domain]/`

Use dated files only when the review is worth retaining.

Suggested file name:

`YYYY-MM-DD_domain_review-cadence-note_topic.md`

Example:

`2026-07-05_service-account_review-cadence-note_quarterly-source-check.md`

Do not store:

- raw data
- customer-level records
- copied dashboards
- raw Genie transcripts
- sensitive source extracts
- temporary review scratch notes

## Relationship To Other Files

Use this framework with:

- `analytics_domain_setup_checklist.md`
- `analytical_output_review_checklist.md`
- `analytical_agent_human_review_triggers.md`
- `analytical_storage_rules.md`
- `domain_agent_consistency_check.md`
- `domain_agent_output_index.md`
- `agent_output_index.md`

## Review Checklist

Before closing an analytics review, confirm:

- Source rules are current or marked uncertain
- Metric definitions are current or marked uncertain
- Caveats are current or marked uncertain
- Data quality issues are current or marked uncertain
- Genie context aligns with current rules
- Output index is useful
- Outdated outputs are archived or marked
- Human review triggers are visible
- Raw data is not stored
- Domain remains useful and maintainable

## Success Measures

Analytics review cadence is working when:

- stale analytical guidance is identified early
- source changes are reflected in domain files
- caveats remain visible
- data quality issues do not disappear
- agents produce more consistent outputs
- decision briefs use current evidence
- outdated outputs are archived
- Strategic OS avoids becoming a shadow reporting system

## Failure Modes

Analytics review cadence is failing if:

- domains are never reviewed
- old caveats remain active after being resolved
- source changes are missed
- metric definitions drift silently
- stale Genie context shapes new answers
- output indexes become cluttered
- human review triggers are ignored
- review notes create admin burden without improving decisions

## Minimal Use Rule

Review active analytical domains enough to keep them safe.

Do not create review bureaucracy for inactive or low-risk domains.

Focus review effort where analytical outputs influence decisions, stakeholders, governance or trust.
