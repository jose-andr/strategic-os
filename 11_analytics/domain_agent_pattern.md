# Domain Analytical Agent Pattern

## Purpose

This pattern defines how to create and operate domain-specific analytical agents in Strategic OS.

Domain Analytical Agents support governed data interpretation, metric caveat handling, source-aware analysis and decision-support evidence.

They are not general personal productivity agents.

They help the user interpret data safely, consistently and with clear caveats.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Domain Analytical Agents support the North Star by improving the quality, reliability and usefulness of analytical evidence in strategic decisions.

## Core Principle

A Domain Analytical Agent should help interpret governed data.

It should not become the source of truth.

The source of truth remains the governed data platform, approved dashboard, reporting layer or official system.

The agent may help explain, question, caveat and structure analytical evidence for decision-making.

## When To Create A Domain Analytical Agent

Create a Domain Analytical Agent only when there is a real analytical domain that needs repeated support.

A domain may justify an agent when it has:

- recurring analytical questions
- specific source systems
- metric definitions
- known caveats
- decision-support use cases
- governance or source hierarchy rules
- data quality risks
- repeated interpretation patterns
- Genie or Databricks context
- need for consistent review prompts

Do not create a domain agent for a one-off analysis.

## Suggested Folder Location

Domain Analytical Agents should usually live in:

`11_analytics/[domain]/`

Examples:

- `11_analytics/service-account/`
- `11_analytics/channel-strategy/`
- `11_analytics/customer-demand/`
- `11_analytics/support-csat/`
- `11_analytics/executive-metrics/`
- `11_analytics/data-quality/`

Use a project folder instead when the analytical work is specific to one project:

`08_projects/[project-name]/analytics/`

## Standard Domain Folder Structure

A mature analytical domain may include:

- `README.md`
- `agent_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `genie_context.md`
- `data_quality_notes.md`
- `sql/`
- `archive/`

Create only the files that are needed.

Do not create empty structure for its own sake.

## Required Files

At minimum, a useful domain agent should have:

- `agent_context.md`
- `source_rules.md`
- `metric_caveats.md`
- `agent_review_prompt.md`

## Optional Files

Add these only when useful:

- `metric_definitions.md`
- `genie_context.md`
- `agent_consistency_check.md`
- `data_quality_notes.md`
- `agent_output_index.md`
- `sql/`
- `archive/`

## Agent Context

The `agent_context.md` file should define what the agent is for.

Include:

- domain purpose
- main questions the agent can answer
- source systems
- relevant metrics
- known caveats
- common decision-support use cases
- prohibited claims
- human review triggers
- storage rules

## Source Rules

The `source_rules.md` file should define source hierarchy.

Include:

- approved source systems
- governed reporting sources
- contextual sources
- sources not to use
- source-of-truth order
- when to defer to official reporting
- how to handle conflicting sources
- how to describe confidence

## Metric Definitions

The `metric_definitions.md` file should define key terms.

Include:

| Metric | Definition | Source | Grain | Refresh | Notes |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

Use this file when metrics are repeated across analysis.

## Metric Caveats

The `metric_caveats.md` file should document known interpretation limits.

Include:

| Caveat | Affected Metric | Why It Matters | How To Handle |
| --- | --- | --- | --- |
|  |  |  |  |

Common caveat types include:

- incomplete data
- source lag
- definition mismatch
- sampling limitation
- channel mix distortion
- duplicate records
- inconsistent categorisation
- dashboard filter dependency
- historical reporting change
- contextual signal only

## Genie Context

The `genie_context.md` file should help Databricks Genie or similar tools answer domain questions consistently.

Include:

- domain summary
- preferred terminology
- approved metrics
- source hierarchy
- common questions
- caveats to mention
- prohibited interpretations
- safe response pattern

Do not include sensitive data, customer-level rows or copied governed outputs.

## Agent Review Prompt

The `agent_review_prompt.md` file should define how outputs are checked.

It should ask the agent to check:

- source used
- metric definition
- caveats
- confidence
- data quality risks
- whether the output is governed, contextual or directional
- whether human review is required
- whether the output can support a decision
- whether claims are proportionate to evidence

## Agent Consistency Check

The `agent_consistency_check.md` file should help test whether the agent is producing stable answers.

Use it when the domain has repeated reporting or governance risk.

Check:

- does the agent use the same metric definition each time?
- does it mention caveats consistently?
- does it avoid unsupported claims?
- does it defer to governed dashboards where required?
- does it separate data from interpretation?
- does it flag human review points?
- does it avoid copying raw data into outputs?

## Data Quality Notes

The `data_quality_notes.md` file should capture reusable data quality issues.

Include:

| Issue | Source | Impact | Status | Review Date |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

Do not store raw data extracts.

Capture the issue, implication and safe interpretation guidance.

## Domain Agent Autonomy

Default autonomy level:

Level 4 — Domain Analytical Support

A Domain Analytical Agent may:

- retrieve approved analytical context
- summarise governed data outputs
- explain metric definitions
- identify caveats
- identify trends or anomalies
- compare metrics within approved source rules
- support decision briefs with analytical evidence
- prepare data quality notes
- recommend human review
- recommend storage location

A Domain Analytical Agent must not:

- become the source of truth
- treat exploratory outputs as official reporting
- copy raw datasets into Strategic OS
- store customer-level records
- omit metric caveats
- make final governance claims
- publish analytical findings
- make decisions based on data alone
- present contextual signals as governed truth
- bypass human review for executive or official use

## Evidence Standard

Domain Analytical Agent outputs must separate:

- source
- metric definition
- observed data
- caveat
- interpretation
- confidence
- recommendation
- human review requirement

Use confidence labels:

- high confidence
- medium confidence
- low confidence

Use evidence labels:

- governed metric
- contextual signal
- directional indicator
- incomplete evidence
- exploratory analysis

## Output Types

Common outputs include:

- analytical summary
- metric caveat note
- source rules update
- data quality note
- trend summary
- anomaly summary
- decision-support evidence summary
- Genie context update
- consistency check
- review prompt update

## Storage Rules

Store domain analytical outputs in:

`11_analytics/[domain]/`

Store project-specific analytical outputs in:

`08_projects/[project-name]/analytics/`

Do not store:

- raw data exports
- customer-level records
- governed datasets
- copied dashboard values
- sensitive query outputs
- screenshots of restricted systems
- raw Genie transcripts
- unsupported analytical claims

## Decision-Support Use

Analytical outputs may support:

- decision briefs
- opportunity reviews
- service reviews
- performance interpretation
- project prioritisation
- stakeholder conversations
- strategic planning
- operating model analysis

Before using analysis in a decision, check:

- is the source approved?
- is the metric definition clear?
- are caveats visible?
- is the confidence level appropriate?
- is human review required?
- could this be misread as official reporting?
- does the recommendation go beyond the data?

## Human Review Required

Human review is required before analytical outputs are:

- treated as definitive
- shared as official reporting
- used in governance
- used in executive-facing material
- used to make claims about organisational performance
- used to compare teams or individuals
- used to support public-facing claims
- used where data quality is uncertain
- converted into a strategic recommendation

## Standard Analytical Output Pattern

Use this structure for analytical summaries.

### Question

What analytical question is being answered?

### Source

What source or system was used?

### Metric Definition

What metric definition applies?

### Observation

What does the data appear to show?

### Caveats

What limits interpretation?

### Confidence

High, medium or low.

### Interpretation

What might this mean?

### Decision Relevance

What decision or judgement could this support?

### Human Review Required

What needs review before use?

### Storage Recommendation

Where should this output live?

## Agent Routing

Use a Domain Analytical Agent when:

- governed data needs interpretation
- metric caveats matter
- source rules are required
- Genie or Databricks outputs need structure
- analytical evidence will support a decision
- data quality concerns may affect meaning

Use the Sensemaking Agent after analytical interpretation when:

- the analysis needs to become a decision brief
- trade-offs need to be framed
- strategic implications need synthesis
- evidence from multiple sources needs combining

Use the Stakeholder Journey Agent when:

- analytical findings may affect stakeholder alignment
- performance interpretation is sensitive
- communication needs careful framing

Use the Chief of Staff Agent when:

- analytical review needs to be scheduled
- analytical follow-ups need tracking
- operating cadence should surface a recurring data issue

## Review Checklist

Before storing or using a Domain Analytical Agent output, check:

- Is the source clear?
- Is the metric definition clear?
- Are caveats visible?
- Is confidence labelled?
- Is governed data separated from contextual signal?
- Are assumptions separated from observations?
- Is the interpretation proportionate?
- Is human review required?
- Is the output stored in the correct analytics domain?
- Is sensitive data excluded?
- Does the output support better strategic decision-making?

## Success Measures

A Domain Analytical Agent is working when:

- analytical interpretation is more consistent
- metric caveats are easier to find
- source rules are respected
- decision briefs use better evidence
- data quality issues are visible
- governed and contextual signals are not confused
- human review happens before formal use
- Strategic OS does not store raw governed data
- analytical outputs improve judgement without overclaiming

## Failure Modes

A Domain Analytical Agent is failing if:

- it gives answers without caveats
- it treats itself as the source of truth
- it stores raw data
- it copies sensitive outputs into Strategic OS
- it uses inconsistent metric definitions
- it hides data quality issues
- it overstates confidence
- it produces analysis with no decision relevance
- it bypasses human review
- it creates more analytical clutter than clarity

## Minimal Use Rule

Create the smallest useful domain agent.

Add files only when the domain needs them.

Keep governed data in governed systems.

Keep Strategic OS focused on source rules, caveats, interpretation guidance and decision-support evidence.
