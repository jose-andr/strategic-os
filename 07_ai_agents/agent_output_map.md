# Agent Output Map

## Purpose

This file maps Strategic OS agents to their expected outputs, templates, storage locations and review points.

Use this file to decide:

* which agent should support a task
* what kind of artefact should be produced
* which template should be used
* where the output should be stored
* what human review is required before the output is used
* whether the output should be stored, refined, parked or discarded

Agents support the Strategic OS North Star:

> Increase strategic opportunities by helping leaders make better strategic decisions.

## Output Principles

Agent outputs should:

* support better strategic decisions
* make evidence, assumptions, interpretation, recommendation and action distinct
* be stored in the folder that matches their purpose
* use templates where a template exists
* avoid creating unnecessary new file types
* avoid storing raw organisational source data
* avoid storing temporary task noise
* identify human review points clearly
* create reusable knowledge where appropriate
* stay within the agent’s autonomy level

## Summary Map

| Agent                     | Primary Output                                    | Primary Template                                                                      | Primary Storage                                        |
| ------------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| Sensemaking Agent         | Decision brief                                    | `10_templates/decision_brief.md`                                                      | `03_decision_briefs/`                                  |
| Stakeholder Journey Agent | Stakeholder alignment assessment                  | `10_templates/stakeholder_alignment_assessment.md`                                    | `06_stakeholder_patterns/` or `08_projects/`           |
| Shipping Coach            | Shipping recommendation                           | `10_templates/shipping_recommendation.md`                                             | `08_projects/` or `05_lessons_learned/`                |
| Career Architect          | Career guidance or promotion readiness assessment | `10_templates/career_guidance.md` or `10_templates/promotion_readiness_assessment.md` | `01_career/`                                           |
| Chief of Staff Agent      | Daily briefing                                    | `10_templates/daily_briefing.md`                                                      | temporary working notes, `00_inbox/` or `08_projects/` |
| Domain Analytical Agent   | Analytical summary or metric caveat note          | domain-specific local templates or prompts                                            | `11_analytics/[domain]/`                               |

## Sensemaking Agent Outputs

### Primary Outputs

* decision brief
* sensemaking summary
* problem framing
* issue diagnosis
* recommendation options
* ambiguity map
* evidence and assumption summary
* strategic opportunity framing

### Templates

Use:

* `10_templates/decision_brief.md`
* `10_templates/opportunity_review.md`
* `10_templates/lesson_learned.md`

### Storage

Store outputs in:

* `03_decision_briefs/` for decision-ready material
* `02_strategic_opportunities/` for opportunities
* `04_frameworks/` for reusable thinking models
* `05_lessons_learned/` for reusable learning
* `08_projects/` for project-specific sensemaking
* `00_inbox/` for unresolved or unprocessed material

### Review Point

Human review is required before the output is used to support a decision, shared with stakeholders, stored as durable evidence or converted into a recommendation.

## Stakeholder Journey Agent Outputs

### Primary Outputs

* stakeholder alignment assessment
* stakeholder journey map
* engagement sequencing recommendation
* influence and resistance map
* communication framing options
* stakeholder risk summary
* stakeholder opportunity summary
* alignment gap analysis

### Templates

Use:

* `10_templates/stakeholder_alignment_assessment.md`
* `10_templates/decision_brief.md`
* `10_templates/opportunity_review.md`

### Storage

Store outputs in:

* `06_stakeholder_patterns/` for reusable stakeholder patterns
* `08_projects/` for project-specific stakeholder work
* `03_decision_briefs/` when stakeholder analysis supports a decision
* `02_strategic_opportunities/` when stakeholder movement creates or shapes an opportunity
* `05_lessons_learned/` when the output captures reusable engagement learning
* `00_inbox/` for unresolved or unprocessed material

### Review Point

Human review is required before stakeholder assumptions are stored, engagement plans are acted on, communication is sent or sensitive stakeholder commentary is retained.

## Shipping Coach Outputs

### Primary Outputs

* shipping recommendation
* smallest useful next step
* action plan
* blocker diagnosis
* decision-to-ship assessment
* draft-to-output conversion
* experiment or test recommendation
* stop, pause or continue recommendation

### Templates

Use:

* `10_templates/shipping_recommendation.md`
* `10_templates/decision_brief.md`
* `10_templates/opportunity_review.md`
* `10_templates/lesson_learned.md`

### Storage

Store outputs in:

* `08_projects/` for active project work
* `03_decision_briefs/` when a shipping decision needs formal framing
* `02_strategic_opportunities/` when the next step relates to opportunity shaping
* `05_lessons_learned/` when the output captures reusable learning
* `00_inbox/` for unresolved or unprocessed material

### Review Point

Human review is required before work is shared, published, stopped, paused, redirected or used in a way that affects stakeholders, commitments, governance or reputation.

## Career Architect Outputs

### Primary Outputs

* career guidance
* promotion readiness assessment
* achievement summary
* career evidence record
* role application framing
* development conversation preparation
* capability gap analysis
* opportunity-to-evidence mapping
* career narrative

### Templates

Use:

* `10_templates/career_guidance.md`
* `10_templates/promotion_readiness_assessment.md`
* `10_templates/opportunity_review.md`
* `10_templates/lesson_learned.md`

### Storage

Store outputs in:

* `01_career/`
* `01_career/achievements/`
* `01_career/feedback/`
* `01_career/opportunities/`
* `01_career/promotion_readiness/`
* `02_strategic_opportunities/` when career growth connects to a strategic opportunity
* `05_lessons_learned/` when the output captures reusable learning
* `00_inbox/` for unresolved or unprocessed material

### Review Point

Human review is required before career evidence is used in an application, promotion material, performance review, development conversation or stored with sensitive details.

## Chief of Staff Agent Outputs

### Primary Outputs

* daily briefing
* weekly operating review
* admin task list
* follow-up tracker
* calendar and capacity risk summary
* decision-required list
* focus protection recommendation
* missed commitment summary

### Templates

Use:

* `10_templates/daily_briefing.md`
* `10_templates/weekly_operating_review.md`
* `10_templates/admin_task_list.md`
* `10_templates/follow_up_tracker.md`

### Storage

Most Chief of Staff outputs are temporary working artefacts.

Store only when the output creates durable value, decision context, follow-up obligation, project continuity, reusable learning or career evidence.

Store outputs in:

* temporary working notes for daily coordination material that does not need to be preserved
* `00_inbox/` for unresolved items that need later triage
* `08_projects/` when actions relate to a project
* `03_decision_briefs/` when an item becomes decision-ready
* `02_strategic_opportunities/` when an item becomes a strategic opportunity
* `05_lessons_learned/` when the output captures reusable operating learning
* `06_stakeholder_patterns/` when the output captures reusable stakeholder pattern evidence
* `01_career/` when the output creates career evidence

Do not store ephemeral daily operating notes unless they create reusable value, decision context, evidence or a follow-up obligation.

### Review Point

Human review is required before the agent changes commitments, sends communication, escalates issues, changes priorities that affect others, stores sensitive material or makes recommendations with reputational, governance, financial, career or stakeholder consequences.

## Domain Analytical Agent Outputs

Domain Analytical Agents support governed analytical work inside `11_analytics/` or project-specific analytics folders.

They are not forced into one generic personal-agent output pattern.

### Primary Outputs

* analytical summary
* metric caveat note
* source rules
* agent context
* agent review prompt
* agent consistency check
* Genie context
* data quality note
* anomaly summary
* trend summary
* decision-support evidence summary
* governed metric interpretation
* contextual signal interpretation

### Local Domain Files

Use local files where relevant:

* `README.md`
* `source_rules.md`
* `metric_definitions.md`
* `metric_caveats.md`
* `genie_context.md`
* `agent_context.md`
* `agent_review_prompt.md`
* `agent_consistency_check.md`
* `sql/`
* `archive/`

### Storage

Store outputs in:

* `11_analytics/[domain]/`
* `08_projects/[project-name]/` when analytical work is project-specific
* `03_decision_briefs/` only when analysis has been reviewed and converted into decision-ready advice
* `04_frameworks/` only when the pattern is reusable beyond one analytics domain

### Current Pilot Domain

The first mature pattern is:

* `11_analytics/service-account/`

Service Account-specific rules should remain inside that domain folder.

The general agent framework should reference the pattern without copying all Service Account-specific detail into `07_ai_agents/`.

### Future Domains

Potential future analytical domains include:

* `11_analytics/channel-strategy/`
* `11_analytics/customer-demand/`
* `11_analytics/support-csat/`
* `11_analytics/executive-metrics/`
* `11_analytics/data-quality/`

Create these only when there is a real analytical domain that needs its own source rules, caveats, prompts or review checks.

### Review Point

Human review is required before analytical outputs are treated as definitive, used in governance, shared as official reporting, converted into a recommendation or used to make claims about organisational performance.

## Output-To-Folder Map

| Output Type                           | Store In                      | Notes                                                 |
| ------------------------------------- | ----------------------------- | ----------------------------------------------------- |
| Raw note                              | `00_inbox/`                   | Triage before turning into durable knowledge          |
| Decision brief                        | `03_decision_briefs/`         | Use decision brief template                           |
| Strategic opportunity                 | `02_strategic_opportunities/` | Add to opportunity index where useful                 |
| Reusable framework                    | `04_frameworks/`              | Only store if reusable beyond one project             |
| Lesson learned                        | `05_lessons_learned/`         | Capture what should be reused                         |
| Stakeholder pattern                   | `06_stakeholder_patterns/`    | Avoid sensitive personal commentary                   |
| Agent specification or operating rule | `07_ai_agents/`               | General agent rules and personal or operating agents  |
| Project artefact                      | `08_projects/`                | Store inside project folder                           |
| Thought leadership draft              | `09_thought_leadership/`      | Use only for reusable external-facing thinking        |
| Template                              | `10_templates/`               | Reusable output structure                             |
| Analytics domain file                 | `11_analytics/[domain]/`      | Use for governed analytics guidance and domain agents |
| Temporary working note                | Do not store by default       | Store only if it creates durable value                |

## Output Review Rules

Before storing an output, check:

* Does it have a clear purpose?
* Is it in the correct folder?
* Is it durable enough to keep?
* Is it free of chat-process notes?
* Are assumptions marked?
* Is evidence separated from interpretation?
* Are recommendations separated from actions?
* Are privacy, governance and sensitivity risks handled?
* Is human review required before use?
* Does the output support the Strategic OS North Star?

## When Not To Create A New Output

Do not create a new file when:

* the material is only a temporary working note
* the content duplicates an existing template or framework
* the output would be better added to an index
* the content contains raw organisational source data
* the content contains sensitive stakeholder commentary
* the file would create maintenance burden without reusable value
* the work should be shipped, stopped or archived instead

## Minimum Useful Output

A minimum useful agent output should include:

* purpose
* context
* evidence or input used
* interpretation
* recommendation or next step
* assumptions
* risks or caveats
* review point
* suggested storage location

## Quarterly Review

Review this output map quarterly as part of the Strategic OS QA assessment.

Check:

* Are agents producing the right outputs?
* Are outputs being stored in the right folders?
* Are templates still useful?
* Are temporary working notes being discarded rather than preserved unnecessarily?
* Are analytical domain outputs properly separated from general agent outputs?
* Are Databricks / Genie caveats visible?
* Are any outputs creating unnecessary repository clutter?
* Are outputs helping create strategic opportunities and better decisions?
