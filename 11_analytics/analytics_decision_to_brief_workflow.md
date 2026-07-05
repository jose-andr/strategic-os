# Analytics Decision To Brief Workflow

## Purpose

This workflow explains how analytical outputs move from data interpretation into Strategic OS decision briefs.

It prevents raw analysis from becoming a recommendation too early and makes sure source, metric, caveat, confidence and human review conditions are clear before evidence is used in decisions.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Analytics should strengthen decision briefs by improving evidence quality, not by creating false certainty.

## Core Principle

Analysis is not the decision.

Analytical evidence may inform a decision brief only when it is:

- source-aware
- metric-defined
- caveated
- confidence-labelled
- reviewed where needed
- proportionate to the decision
- safe to store or reference

## When To Use

Use this workflow when analytical material may support:

- decision brief
- opportunity review
- service review
- operating model recommendation
- channel strategy recommendation
- prioritisation decision
- investment or resourcing judgement
- stakeholder-sensitive advice
- executive-facing recommendation

Do not use this workflow for temporary analytical exploration that will not influence a decision.

## Workflow Overview

1. Capture analytical question
2. Identify decision relevance
3. Check source and source type
4. Define metric or signal
5. Apply caveats and data quality notes
6. Label confidence
7. Convert to decision-support evidence
8. Review human-review triggers
9. Route to Sensemaking Agent
10. Create or update decision brief

## Step 1: Capture Analytical Question

Define the question clearly.

### Analytical Question

[What question is the analysis answering?]

### Domain

[Analytics domain]

Example:

`service-account`

### Context

[Why the question matters.]

### Intended Use

Choose one:

- decision brief
- opportunity review
- stakeholder discussion
- executive advice
- governance preparation
- service review
- operating cadence
- further investigation
- unknown

If intended use is unknown, do not convert the analysis into decision evidence yet.

## Step 2: Identify Decision Relevance

Ask:

- What decision could this support?
- What judgement could this improve?
- What trade-off could this clarify?
- What risk could this surface?
- What stakeholder question could this answer?

If no decision relevance exists, store only if the output has reusable caveat, source or data quality value.

## Step 3: Check Source

Identify:

- source name
- source type
- source-of-truth status
- source hierarchy
- source conflict
- source caveats

Use:

- `source_rules.md`
- `domain_agent_source_rules.md`
- `analytical_source_conflict_note.md`

If source is unclear, mark the evidence as:

`do not use yet`

## Step 4: Define Metric Or Signal

Before interpreting, define:

- metric name
- plain-English definition
- grain
- timeframe
- filters
- inclusions
- exclusions
- related metrics

Use:

- `metric_definitions.md`
- `domain_agent_metric_definitions.md`
- `analytical_metric_definition_note.md`

If the metric is unclear, lower confidence or mark:

`do not use yet`

## Step 5: Apply Caveats And Data Quality Notes

Check:

- known metric caveats
- data quality issues
- source lag
- definition drift
- source conflict
- small sample size
- channel mix effects
- attribution risk
- governance limits

Use:

- `metric_caveats.md`
- `data_quality_notes.md`
- `analytical_metric_caveat_note.md`
- `analytical_data_quality_note.md`

## Step 6: Label Confidence

Use one:

- high confidence
- medium confidence
- low confidence
- do not use yet

Confidence should reflect:

- source strength
- metric clarity
- caveat severity
- data quality status
- review status
- decision consequence

Do not use high confidence when source, metric, caveat or data quality conditions are unclear.

## Step 7: Convert To Decision-Support Evidence

Use:

`analytical_decision_support_evidence.md`

The evidence note should include:

- decision or judgement supported
- analytical question
- source
- source type
- metric definition
- grain
- timeframe
- observation
- caveats
- data quality notes
- confidence
- interpretation
- what cannot be concluded
- alternative explanations
- recommended use
- human review required
- storage recommendation

## Step 8: Review Human-Review Triggers

Use:

`analytical_agent_human_review_triggers.md`

Human review is required before analytical evidence is used in a decision brief when it is:

- executive-facing
- governance-facing
- stakeholder-sensitive
- used for performance claims
- used for customer experience claims
- used for funding or resourcing advice
- based on unclear source
- based on unclear metric
- affected by material caveats
- based on exploratory analysis
- likely to be mistaken for official reporting

## Step 9: Route To Sensemaking Agent

Once evidence is ready, route to the Sensemaking Agent when:

- a decision brief is needed
- options need to be compared
- trade-offs need to be framed
- strategic implications need synthesis
- evidence from multiple sources needs combining
- recommendation needs to be shaped

The Domain Analytical Agent provides evidence.

The Sensemaking Agent creates strategic synthesis.

## Step 10: Create Or Update Decision Brief

Use:

`10_templates/decision_brief.md`

In the decision brief, analytical evidence should appear in:

- context
- evidence
- options
- risks
- trade-offs
- recommendation rationale

Do not copy raw data into the decision brief.

Use a concise evidence statement instead.

## Standard Evidence Statement For Decision Briefs

Use this pattern:

Analytical evidence from [source type] suggests [observation] with [confidence level] confidence. This should be interpreted with caution because [caveats/data quality notes]. The evidence may support [decision judgement], but it does not prove [unsupported claim]. Human review is [required/not required] before formal use.

## Routing Table

| Analytical Output Condition | Next Step |
| --- | --- |
| Source unclear | Clarify source rules before use |
| Metric unclear | Clarify metric definition before use |
| Caveat material | Strengthen caveat and review |
| Data quality issue material | Create data quality note and review |
| Low confidence | Use for sensemaking only or do not use yet |
| Decision relevance clear | Convert to decision-support evidence |
| Strategic trade-off needed | Send to Sensemaking Agent |
| Stakeholder sensitivity exists | Send to Stakeholder Journey Agent |
| Follow-up required | Send to Chief of Staff Agent |
| Evidence not reusable | Do not store |

## Storage Rules

Store analytical decision-support evidence in:

`11_analytics/[domain]/`

Store final decision briefs in the relevant template or project location.

Do not store:

- raw datasets
- customer-level records
- copied dashboard extracts
- raw Genie transcripts
- raw query outputs
- sensitive source exports
- unreviewed stakeholder-sensitive claims

## Review Checklist

Before analytical evidence enters a decision brief, confirm:

- Decision or judgement is named
- Source is named
- Source type is labelled
- Source-of-truth status is clear
- Metric is defined
- Grain is clear
- Timeframe is clear
- Caveats are visible
- Data quality issues are considered
- Confidence is proportionate
- What cannot be concluded is stated
- Human review requirement is clear
- Raw data is excluded
- Evidence is proportionate to the decision
- Sensemaking Agent routing is appropriate

## Success Measures

This workflow is working when:

- decision briefs use stronger analytical evidence
- raw analysis does not become unsupported recommendation
- caveats are visible in decisions
- source uncertainty is not hidden
- confidence is proportionate
- human review happens before high-risk use
- agents have clear handoff points
- decision quality improves without creating reporting risk

## Failure Modes

This workflow is failing if:

- raw data is copied into decision briefs
- exploratory outputs become official claims
- caveats disappear during synthesis
- confidence is overstated
- source conflicts are ignored
- analytical evidence becomes the decision
- Sensemaking Agent receives weak or uncaveated evidence
- stakeholder-sensitive claims are used without review
- the workflow creates process overhead without improving judgement

## Minimal Use Rule

Use this workflow when analysis may shape a decision.

For low-risk exploration, keep the output temporary unless it creates reusable source, caveat or data quality learning.
