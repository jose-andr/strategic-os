# Agent File Naming

## Purpose

This file defines naming conventions for saved Strategic OS agent outputs.

The goal is to keep agent-generated material easy to find, review, compare and reuse over time.

Agent outputs should be named consistently so they remain useful beyond the moment they were created.

## Core Principle

File names should make the output understandable without opening the file.

A good file name should show:

- date
- agent
- output type
- topic or decision area
- version, if needed

## Standard Naming Pattern

Use this pattern for saved agent outputs:

`YYYY-MM-DD_agent-name_output-type_topic.md`

Example:

`2026-07-03_sensemaking-agent_decision-brief_channel-strategy.md`

## Naming Rules

Use:

- lowercase
- hyphens instead of spaces
- clear topic names
- short but meaningful descriptions
- ISO date format: `YYYY-MM-DD`

Avoid:

- vague names
- long sentences
- special characters
- version clutter where not needed
- confidential project names where a safer summary will do

## Agent Name Slugs

Use these standard agent name slugs:

| Agent | Slug |
| --- | --- |
| Sensemaking Agent | `sensemaking-agent` |
| Stakeholder Journey Agent | `stakeholder-agent` |
| Shipping Coach | `shipping-coach` |
| Career Architect | `career-architect` |
| Chief of Staff Agent | `chief-of-staff` |

## Output Type Slugs

Use these standard output type slugs:

| Output Type | Slug |
| --- | --- |
| Daily Briefing | `daily-briefing` |
| Decision Brief | `decision-brief` |
| Stakeholder Alignment Assessment | `stakeholder-alignment` |
| Shipping Recommendation | `shipping-recommendation` |
| Opportunity Review | `opportunity-review` |
| Career Guidance | `career-guidance` |
| Promotion Readiness Assessment | `promotion-readiness` |
| Sensemaking Summary | `sensemaking-summary` |
| Meeting Preparation Note | `meeting-prep` |
| Follow-Up Summary | `follow-up-summary` |
| Risk Review | `risk-review` |
| Lesson Learned | `lesson-learned` |

## Topic Naming

The topic should describe the subject of the output.

Good examples:

- `channel-strategy`
- `service-account-review`
- `stakeholder-alignment`
- `career-positioning`
- `operating-cadence`
- `decision-quality`

Poor examples:

- `notes`
- `stuff`
- `draft`
- `misc`
- `important`
- `final`

## Versioning

Only add a version number when multiple saved versions are genuinely useful.

Use:

- `v1`
- `v2`
- `v3`

Pattern:

`YYYY-MM-DD_agent-name_output-type_topic_v1.md`

Example:

`2026-07-03_sensemaking-agent_decision-brief_channel-strategy_v1.md`

Do not use:

- `final`
- `final-final`
- `latest`
- `new`
- `updated`

## Drafts

If a file is clearly temporary, add `draft`.

Pattern:

`YYYY-MM-DD_agent-name_output-type_topic_draft.md`

Example:

`2026-07-03_chief-of-staff_daily-briefing_weekly-priorities_draft.md`

Delete or replace draft files when they are no longer useful.

## Storage Location Guidance

Agent outputs should be stored where they will be reused.

| Output | Recommended Location |
| --- | --- |
| Daily briefing | `00_inbox/` or relevant project folder |
| Decision brief | `03_decision_briefs/` |
| Stakeholder alignment assessment | `06_stakeholder_patterns/` or relevant project folder |
| Shipping recommendation | `08_projects/` or `05_lessons_learned/` |
| Opportunity review | `02_strategic_opportunities/` |
| Career guidance | `01_career/` |
| Promotion readiness assessment | `01_career/` |
| Reusable prompt | `10_templates/` |
| Reusable framework insight | `04_frameworks/` |
| Lesson learned | `05_lessons_learned/` |

## Privacy-Safe Naming

Do not put sensitive information in file names.

Avoid naming files after:

- individual customers
- confidential stakeholders
- sensitive internal issues
- governed datasets
- unresolved employee matters
- private organisational records

Use safer abstractions.

Instead of:

`2026-07-03_stakeholder-agent_stakeholder-alignment_jane-smith-conflict.md`

Use:

`2026-07-03_stakeholder-agent_stakeholder-alignment_senior-sponsor-risk.md`

## Examples

### Daily Briefing

`2026-07-03_chief-of-staff_daily-briefing_operating-priorities.md`

### Decision Brief

`2026-07-03_sensemaking-agent_decision-brief_channel-mix-priorities.md`

### Stakeholder Alignment Assessment

`2026-07-03_stakeholder-agent_stakeholder-alignment_channel-strategy.md`

### Shipping Recommendation

`2026-07-03_shipping-coach_shipping-recommendation_operating-cadence.md`

### Career Opportunity Review

`2026-07-03_career-architect_opportunity-review_business-design-positioning.md`

## Review Checklist

Before saving an agent output, check:

- Is this worth saving?
- Is the file name clear?
- Is the date correct?
- Is the agent name correct?
- Is the output type clear?
- Is the topic specific enough?
- Is the name privacy-safe?
- Is the file stored in the right folder?
- Is this reusable beyond the immediate moment?

## Failure Modes

File naming is failing if:

- outputs cannot be found later
- names are too vague
- drafts accumulate
- sensitive context appears in file names
- similar files use inconsistent names
- files are saved in the wrong folder
- version numbers obscure rather than clarify

## Maintenance

Review naming consistency during quarterly repository hygiene review.

Rename files when needed to improve clarity, safety or reuse.
