# Agent File Naming

## Purpose

This file defines naming conventions for saved Strategic OS agent outputs.

The goal is to keep agent-generated material easy to find, review, compare and reuse over time.

Agent outputs should be named consistently so they remain useful beyond the moment they were created.

## Core Principle

File names should make the output understandable without opening the file.

A good file name should show:

* date
* agent
* output type
* topic or decision area
* version, if needed

## Standard Naming Pattern

Use this pattern for saved agent outputs:

`YYYY-MM-DD_agent-name_output-type_topic.md`

Example:

`2026-07-03_sensemaking-agent_decision-brief_channel-strategy.md`

## Naming Rules

Use:

* lowercase
* hyphens instead of spaces
* clear topic names
* short but meaningful descriptions
* ISO date format: `YYYY-MM-DD`
* privacy-safe abstractions for sensitive topics

Avoid:

* vague names
* long sentences
* special characters
* version clutter where not needed
* confidential project names where a safer summary will do
* customer names
* sensitive stakeholder names
* governed dataset names where a broader analytical topic is safer

## Agent Name Slugs

Use these standard agent name slugs:

| Agent                     | Slug                      |
| ------------------------- | ------------------------- |
| Sensemaking Agent         | `sensemaking-agent`       |
| Stakeholder Journey Agent | `stakeholder-agent`       |
| Shipping Coach            | `shipping-coach`          |
| Career Architect          | `career-architect`        |
| Chief of Staff Agent      | `chief-of-staff`          |
| Domain Analytical Agent   | `domain-analytical-agent` |

For named domain analytical agents, use a domain-specific slug.

Examples:

| Agent                             | Slug                          |
| --------------------------------- | ----------------------------- |
| Service Account Analytics Agent   | `service-account-analytics`   |
| Channel Strategy Analytics Agent  | `channel-strategy-analytics`  |
| Customer Demand Analytics Agent   | `customer-demand-analytics`   |
| Support CSAT Analytics Agent      | `support-csat-analytics`      |
| Executive Metrics Analytics Agent | `executive-metrics-analytics` |
| Data Quality Analytics Agent      | `data-quality-analytics`      |

Use the generic `domain-analytical-agent` slug only when a more specific domain slug has not been defined.

## Output Type Slugs

Use these standard output type slugs:

| Output Type                       | Slug                        |
| --------------------------------- | --------------------------- |
| Daily Briefing                    | `daily-briefing`            |
| Weekly Operating Review           | `weekly-operating-review`   |
| Admin Task List                   | `admin-task-list`           |
| Follow-Up Tracker                 | `follow-up-tracker`         |
| Decision Brief                    | `decision-brief`            |
| Stakeholder Alignment Assessment  | `stakeholder-alignment`     |
| Shipping Recommendation           | `shipping-recommendation`   |
| Opportunity Review                | `opportunity-review`        |
| Career Guidance                   | `career-guidance`           |
| Promotion Readiness Assessment    | `promotion-readiness`       |
| Sensemaking Summary               | `sensemaking-summary`       |
| Meeting Preparation Note          | `meeting-prep`              |
| Follow-Up Summary                 | `follow-up-summary`         |
| Risk Review                       | `risk-review`               |
| Lesson Learned                    | `lesson-learned`            |
| Analytical Summary                | `analytical-summary`        |
| Metric Caveat Note                | `metric-caveat`             |
| Source Rules                      | `source-rules`              |
| Agent Context                     | `agent-context`             |
| Agent Review Prompt               | `agent-review-prompt`       |
| Agent Consistency Check           | `agent-consistency-check`   |
| Genie Context                     | `genie-context`             |
| Data Quality Note                 | `data-quality-note`         |
| Trend Summary                     | `trend-summary`             |
| Anomaly Summary                   | `anomaly-summary`           |
| Decision-Support Evidence Summary | `decision-support-evidence` |

## Topic Naming

The topic should describe the subject of the output.

Good examples:

* `channel-strategy`
* `service-account-review`
* `stakeholder-alignment`
* `career-positioning`
* `operating-cadence`
* `decision-quality`
* `customer-demand`
* `support-csat`
* `executive-metrics`
* `data-quality`
* `channel-mix-priorities`

Poor examples:

* `notes`
* `stuff`
* `draft`
* `misc`
* `important`
* `final`
* `new`
* `latest`
* `meeting`
* `data`

## Versioning

Only add a version number when multiple saved versions are genuinely useful.

Use:

* `v1`
* `v2`
* `v3`

Pattern:

`YYYY-MM-DD_agent-name_output-type_topic_v1.md`

Example:

`2026-07-03_sensemaking-agent_decision-brief_channel-strategy_v1.md`

Do not use:

* `final`
* `final-final`
* `latest`
* `new`
* `updated`

## Drafts

If a file is clearly temporary but worth saving for now, add `draft`.

Pattern:

`YYYY-MM-DD_agent-name_output-type_topic_draft.md`

Example:

`2026-07-03_chief-of-staff_daily-briefing_weekly-priorities_draft.md`

Delete or replace draft files when they are no longer useful.

Do not save drafts that have no reuse value.

## Storage Location Guidance

Agent outputs should be stored where they will be reused.

| Output                           | Recommended Location                                            |
| -------------------------------- | --------------------------------------------------------------- |
| Daily briefing                   | temporary working notes, `00_inbox/` or relevant project folder |
| Weekly operating review          | `08_projects/`, `00_inbox/` or temporary working notes          |
| Admin task list                  | temporary working notes or relevant project folder              |
| Follow-up tracker                | temporary working notes or relevant project folder              |
| Decision brief                   | `03_decision_briefs/`                                           |
| Stakeholder alignment assessment | `06_stakeholder_patterns/` or relevant project folder           |
| Shipping recommendation          | `08_projects/` or `05_lessons_learned/`                         |
| Opportunity review               | `02_strategic_opportunities/`                                   |
| Career guidance                  | `01_career/`                                                    |
| Promotion readiness assessment   | `01_career/`                                                    |
| Reusable prompt                  | `10_templates/` or relevant agent folder                        |
| Reusable framework insight       | `04_frameworks/`                                                |
| Lesson learned                   | `05_lessons_learned/`                                           |
| Analytical summary               | `11_analytics/[domain]/`                                        |
| Metric caveat note               | `11_analytics/[domain]/`                                        |
| Source rules                     | `11_analytics/[domain]/`                                        |
| Genie context                    | `11_analytics/[domain]/`                                        |
| Agent review prompt              | `11_analytics/[domain]/` or relevant agent folder               |
| Agent consistency check          | `11_analytics/[domain]/` or relevant agent folder               |
| Data quality note                | `11_analytics/[domain]/`                                        |

Most Chief of Staff outputs should remain temporary unless they create durable value, decision context, project continuity, reusable learning, stakeholder pattern evidence or career evidence.

Domain analytical files should usually remain inside their domain folder, such as:

`11_analytics/service-account/`

Do not move domain-specific analytical source rules or caveats into the general `07_ai_agents/` folder unless the pattern is reusable across domains.

## Privacy-Safe Naming

Do not put sensitive information in file names.

Avoid naming files after:

* individual customers
* confidential stakeholders
* sensitive internal issues
* governed datasets
* unresolved employee matters
* private organisational records
* confidential system extracts
* identifiable complaints or cases

Use safer abstractions.

Instead of:

`2026-07-03_stakeholder-agent_stakeholder-alignment_jane-smith-conflict.md`

Use:

`2026-07-03_stakeholder-agent_stakeholder-alignment_senior-sponsor-risk.md`

Instead of:

`2026-07-03_domain-analytical-agent_analytical-summary_customer-case-12345.md`

Use:

`2026-07-03_service-account-analytics_analytical-summary_service-account-pattern.md`

Instead of:

`2026-07-03_chief-of-staff_follow-up-tracker_sensitive-manager-issue.md`

Use:

`2026-07-03_chief-of-staff_follow-up-tracker_stakeholder-follow-up-risk.md`

## Examples

### Daily Briefing

`2026-07-03_chief-of-staff_daily-briefing_operating-priorities.md`

### Weekly Operating Review

`2026-07-05_chief-of-staff_weekly-operating-review_operating-cadence.md`

### Admin Task List

`2026-07-05_chief-of-staff_admin-task-list_repository-cleanup.md`

### Follow-Up Tracker

`2026-07-05_chief-of-staff_follow-up-tracker_channel-strategy-open-loops.md`

### Decision Brief

`2026-07-03_sensemaking-agent_decision-brief_channel-mix-priorities.md`

### Stakeholder Alignment Assessment

`2026-07-03_stakeholder-agent_stakeholder-alignment_channel-strategy.md`

### Shipping Recommendation

`2026-07-03_shipping-coach_shipping-recommendation_operating-cadence.md`

### Career Opportunity Review

`2026-07-03_career-architect_opportunity-review_business-design-positioning.md`

### Metric Caveat Note

`2026-07-05_service-account-analytics_metric-caveat_service-account-reporting.md`

### Genie Context

`2026-07-05_service-account-analytics_genie-context_service-account-analysis.md`

### Data Quality Note

`2026-07-05_data-quality-analytics_data-quality-note_customer-demand-signals.md`

## Index Alignment

When an output is indexed, the file name should match the index entry.

Use the index pattern in:

`07_ai_agents/agent_output_index_pattern.md`

Check that:

* the date matches
* the agent slug matches
* the output type matches
* the topic is clear
* the status is current
* sensitive context is abstracted

## Review Checklist

Before saving an agent output, check:

* Is this worth saving?
* Is the file name clear?
* Is the date correct?
* Is the agent name correct?
* Is the output type clear?
* Is the topic specific enough?
* Is the name privacy-safe?
* Is the file stored in the right folder?
* Is this reusable beyond the immediate moment?
* Is this a temporary Chief of Staff artefact that should be discarded instead?
* Is this an analytical output that belongs in `11_analytics/[domain]/`?
* Does the file name avoid raw organisational, customer or stakeholder identifiers?

## Failure Modes

File naming is failing if:

* outputs cannot be found later
* names are too vague
* drafts accumulate
* sensitive context appears in file names
* similar files use inconsistent names
* files are saved in the wrong folder
* version numbers obscure rather than clarify
* temporary Chief of Staff outputs are preserved without reuse value
* analytical caveats are separated from the domain files they support
* domain analytical files are stored in the general agent folder without a reusable reason

## Maintenance

Review naming consistency during quarterly repository hygiene review.

Rename files when needed to improve clarity, safety or reuse.

Remove or archive files when the name reveals that the output is temporary, superseded or no longer useful.
