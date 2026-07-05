# Analytics Quality Review

## Purpose

This checklist reviews the quality, safety and usefulness of Strategic OS analytics architecture.

It helps confirm that analytics domains, templates and agent patterns support better decisions without creating reporting, privacy or governance risk.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Analytics quality review ensures analytical evidence improves judgement rather than creating false certainty.

## When To Use

Use this checklist:

- after setting up a new analytics domain
- after creating or updating analytical templates
- during quarterly Strategic OS review
- before using analytical evidence in decision briefs
- before relying on Genie or Databricks-supported outputs
- when analytical outputs appear inconsistent
- when source, metric or caveat rules change

## Review Scope

This review may cover:

- general analytics patterns in `11_analytics/`
- domain-specific folders in `11_analytics/[domain]/`
- Service Account analytical agent files
- analytical templates
- source rules
- metric definitions
- metric caveats
- data quality notes
- Genie context
- review prompts
- consistency checks
- output indexes
- storage rules

## Core Principle

Good analytical architecture should make uncertainty visible.

It should not hide source weakness, caveats, data quality issues or human review needs behind polished outputs.

## Quality Review Details

### Review Date

[Date]

### Reviewer

[Person or agent]

### Review Type

Choose one:

- new domain review
- quarterly analytics review
- template review
- source rules review
- Genie context review
- decision-support evidence review
- storage safety review
- full analytics architecture review

### Domains Reviewed

- [Domain]
- [Domain]

### Files Reviewed

- [File]
- [File]

## 1. Source Quality

| Check | Result | Notes |
| --- | --- | --- |
| Source-of-truth rules are clear | Pass / Partial / Fail |  |
| Source type labels are used consistently | Pass / Partial / Fail |  |
| Source hierarchy is defined | Pass / Partial / Fail |  |
| Source conflicts have a handling pattern | Pass / Partial / Fail |  |
| Unknown sources are marked uncertain | Pass / Partial / Fail |  |
| Exploratory analysis is not treated as governed truth | Pass / Partial / Fail |  |
| Official reporting boundaries are protected | Pass / Partial / Fail |  |

## 2. Metric Quality

| Check | Result | Notes |
| --- | --- | --- |
| Key metrics are defined before interpretation | Pass / Partial / Fail |  |
| Plain-English definitions are included | Pass / Partial / Fail |  |
| Metric grain is visible | Pass / Partial / Fail |  |
| Timeframes are visible | Pass / Partial / Fail |  |
| Inclusions and exclusions are clear where needed | Pass / Partial / Fail |  |
| Related metrics are not confused | Pass / Partial / Fail |  |
| Metric definition uncertainty is marked clearly | Pass / Partial / Fail |  |

## 3. Caveat Quality

| Check | Result | Notes |
| --- | --- | --- |
| Caveats are specific | Pass / Partial / Fail |  |
| Caveats explain why they matter | Pass / Partial / Fail |  |
| Safe and unsafe uses are defined | Pass / Partial / Fail |  |
| Caveat severity is used where helpful | Pass / Partial / Fail |  |
| Caveats are not buried after strong claims | Pass / Partial / Fail |  |
| Caveats connect to human review triggers | Pass / Partial / Fail |  |
| Caveats are reusable across outputs | Pass / Partial / Fail |  |

## 4. Data Quality

| Check | Result | Notes |
| --- | --- | --- |
| Known data quality issues are captured | Pass / Partial / Fail |  |
| Data quality notes avoid raw data | Pass / Partial / Fail |  |
| Severity is labelled | Pass / Partial / Fail |  |
| Confidence impact is explained | Pass / Partial / Fail |  |
| Safe and unsafe interpretations are clear | Pass / Partial / Fail |  |
| Open issues have review triggers | Pass / Partial / Fail |  |
| Resolved or superseded issues are marked | Pass / Partial / Fail |  |

## 5. Interpretation Quality

| Check | Result | Notes |
| --- | --- | --- |
| Observations are separated from interpretation | Pass / Partial / Fail |  |
| Assumptions are labelled | Pass / Partial / Fail |  |
| Alternative explanations are considered | Pass / Partial / Fail |  |
| What cannot be concluded is stated | Pass / Partial / Fail |  |
| Causal claims are avoided unless supported | Pass / Partial / Fail |  |
| Confidence is proportionate to evidence | Pass / Partial / Fail |  |
| Outputs remain decision-relevant | Pass / Partial / Fail |  |

## 6. Human Review Quality

| Check | Result | Notes |
| --- | --- | --- |
| Human review triggers are explicit | Pass / Partial / Fail |  |
| Executive-facing use requires review | Pass / Partial / Fail |  |
| Governance-facing use requires review | Pass / Partial / Fail |  |
| Stakeholder-sensitive use requires review | Pass / Partial / Fail |  |
| Performance claims require review | Pass / Partial / Fail |  |
| Customer experience claims require review | Pass / Partial / Fail |  |
| Low-confidence outputs are not approved too easily | Pass / Partial / Fail |  |

## 7. Storage Quality

| Check | Result | Notes |
| --- | --- | --- |
| Storage rules exclude raw data | Pass / Partial / Fail |  |
| Customer-level records are excluded | Pass / Partial / Fail |  |
| Raw Genie transcripts are excluded | Pass / Partial / Fail |  |
| Copied dashboard extracts are excluded | Pass / Partial / Fail |  |
| Storage locations are clear | Pass / Partial / Fail |  |
| Output indexes are useful, not cluttered | Pass / Partial / Fail |  |
| Archive or superseded status is visible | Pass / Partial / Fail |  |

## 8. Agent Quality

| Check | Result | Notes |
| --- | --- | --- |
| Agent autonomy level is clear | Pass / Partial / Fail |  |
| Agent does not act as source of truth | Pass / Partial / Fail |  |
| Agent output pattern includes source, caveat and confidence | Pass / Partial / Fail |  |
| Agent review prompt is usable | Pass / Partial / Fail |  |
| Consistency check tests real risks | Pass / Partial / Fail |  |
| Agent routing to Sensemaking, Stakeholder or Chief of Staff is clear | Pass / Partial / Fail |  |
| Agent avoids official reporting claims | Pass / Partial / Fail |  |

## 9. Genie And Natural-Language Analytics Quality

| Check | Result | Notes |
| --- | --- | --- |
| Genie context is domain-specific | Pass / Partial / Fail |  |
| Approved terms are defined | Pass / Partial / Fail |  |
| Prohibited interpretations are listed | Pass / Partial / Fail |  |
| Genie is not treated as source of truth | Pass / Partial / Fail |  |
| Raw Genie outputs are not stored | Pass / Partial / Fail |  |
| Source hierarchy is applied to Genie outputs | Pass / Partial / Fail |  |
| Human review triggers are clear | Pass / Partial / Fail |  |

## 10. Decision-Support Quality

| Check | Result | Notes |
| --- | --- | --- |
| Analytical outputs connect to decisions or judgements | Pass / Partial / Fail |  |
| Evidence does not become the decision | Pass / Partial / Fail |  |
| Recommendations stay within evidence limits | Pass / Partial / Fail |  |
| Decision brief routing is clear | Pass / Partial / Fail |  |
| Stakeholder-sensitive implications are routed appropriately | Pass / Partial / Fail |  |
| Analytical evidence improves strategic judgement | Pass / Partial / Fail |  |
| Outputs avoid creating false certainty | Pass / Partial / Fail |  |

## Overall Quality Rating

Choose one:

- strong
- usable with minor improvements
- usable with caveats
- needs targeted improvement
- not safe for decision-support use yet
- redesign required

## Key Findings

### What Is Working

- Finding 1:
- Finding 2:
- Finding 3:

### What Needs Improvement

- Improvement 1:
- Improvement 2:
- Improvement 3:

### Risks

- Risk 1:
- Risk 2:
- Risk 3:

## Required Actions

| Action | File Or Domain | Priority | Owner |
| --- | --- | --- | --- |
|  |  | High / Medium / Low |  |

## Human Review Required

Human review required?

- yes
- no

Reason:

## Final Review Decision

Choose one:

- no change required
- update source rules
- update metric definitions
- update metric caveats
- update data quality notes
- update Genie context
- update review prompts
- run consistency check
- archive outdated outputs
- pause analytical use until source clarified
- redesign analytics domain

## Storage Recommendation

Store this review?

- yes
- no
- only if decision-relevant

Recommended location:

`11_analytics/[domain]/`

Suggested file name:

`YYYY-MM-DD_domain_analytics-quality-review_topic.md`

## Review Checklist

Before closing the quality review, confirm:

- Review scope is clear
- Sources were checked
- Metrics were checked
- Caveats were checked
- Data quality notes were checked
- Human review triggers were checked
- Storage safety was checked
- Agent behaviour was checked
- Decision-support value was checked
- Required actions are clear

## Failure Modes

Analytics quality review is failing if:

- it only checks file existence
- it ignores decision usefulness
- it approves outputs without caveats
- it misses source uncertainty
- it ignores data quality issues
- it allows raw data storage
- it creates process burden without improving judgement
- it treats analytical architecture as complete when real use shows gaps

## Minimal Use Rule

Review enough to protect decision quality.

Do not create quality review overhead for inactive or low-risk analytics domains.

Focus effort where analysis affects decisions, stakeholders, governance or trust.
