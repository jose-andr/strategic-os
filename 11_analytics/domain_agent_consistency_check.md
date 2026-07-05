# Domain Analytical Agent Consistency Check

## Purpose

Use this checklist to test whether a Domain Analytical Agent produces stable, source-aware and caveated outputs over time.

The consistency check helps prevent analytical agents from changing definitions, forgetting caveats, overstating confidence or treating exploratory outputs as governed truth.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

A Domain Analytical Agent is only useful if it improves analytical judgement consistently.

## When To Use

Use this checklist when:

- creating a new Domain Analytical Agent
- reviewing an existing analytical agent
- adding a new analytics domain
- changing source rules
- changing metric definitions
- changing Genie or Databricks context
- reviewing quarterly analytics reliability
- checking whether analytical outputs can support decisions
- investigating inconsistent agent outputs

Use it for domains such as:

- `11_analytics/service-account/`
- `11_analytics/channel-strategy/`
- `11_analytics/customer-demand/`
- `11_analytics/support-csat/`
- `11_analytics/executive-metrics/`
- `11_analytics/data-quality/`

## Core Principle

The same analytical question should receive the same source logic, metric definition, caveats and confidence treatment each time.

The wording may vary.

The governance logic should not.

## Consistency Test Details

Date:

Reviewer:

Domain:

Agent or prompt reviewed:

Source files reviewed:

Output examples reviewed:

Status:

Suggested status values:

- Draft
- Tested
- Needs revision
- Passed
- Superseded
- Archived

## Files To Check

Review the domain files that exist.

| File | Exists? | Current? | Notes |
| --- | --- | --- | --- |
| `agent_context.md` | Yes / No | Yes / No / Unknown |  |
| `source_rules.md` | Yes / No | Yes / No / Unknown |  |
| `metric_definitions.md` | Yes / No | Yes / No / Unknown |  |
| `metric_caveats.md` | Yes / No | Yes / No / Unknown |  |
| `genie_context.md` | Yes / No | Yes / No / Unknown |  |
| `agent_review_prompt.md` | Yes / No | Yes / No / Unknown |  |
| `agent_consistency_check.md` | Yes / No | Yes / No / Unknown |  |
| `data_quality_notes.md` | Yes / No | Yes / No / Unknown |  |

## Test Questions

Use a small set of repeatable test questions.

Each test question should check whether the agent applies source rules, metric definitions and caveats consistently.

| Test Question | Purpose | Expected Source Logic | Expected Caveat |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

Example test question types:

- definition question
- trend interpretation question
- anomaly question
- source conflict question
- data quality question
- decision-support question
- governed versus contextual signal question
- caveat recall question

## Source Consistency

Check whether the agent uses the correct source hierarchy.

| Check | Result | Notes |
| --- | --- | --- |
| Uses approved sources | Pass / Partial / Fail |  |
| Names source clearly | Pass / Partial / Fail |  |
| Distinguishes source of truth from context | Pass / Partial / Fail |  |
| Handles conflicting sources correctly | Pass / Partial / Fail |  |
| Avoids unsupported sources | Pass / Partial / Fail |  |
| Defers to official reporting where required | Pass / Partial / Fail |  |

## Metric Definition Consistency

Check whether the agent uses metrics consistently.

| Check | Result | Notes |
| --- | --- | --- |
| Defines key metrics correctly | Pass / Partial / Fail |  |
| Uses the correct grain | Pass / Partial / Fail |  |
| Names timeframe clearly | Pass / Partial / Fail |  |
| Mentions filters or exclusions where relevant | Pass / Partial / Fail |  |
| Avoids mixing similar but different metrics | Pass / Partial / Fail |  |
| Avoids inventing metric definitions | Pass / Partial / Fail |  |

## Caveat Consistency

Check whether caveats are included consistently.

| Check | Result | Notes |
| --- | --- | --- |
| Includes known caveats | Pass / Partial / Fail |  |
| Mentions data lag where relevant | Pass / Partial / Fail |  |
| Mentions incompleteness where relevant | Pass / Partial / Fail |  |
| Mentions source limitations where relevant | Pass / Partial / Fail |  |
| Mentions filter or segmentation risks | Pass / Partial / Fail |  |
| Does not bury caveats after strong claims | Pass / Partial / Fail |  |

## Evidence And Interpretation Consistency

Check whether the agent separates observation from meaning.

| Check | Result | Notes |
| --- | --- | --- |
| Separates observed data from interpretation | Pass / Partial / Fail |  |
| Marks assumptions clearly | Pass / Partial / Fail |  |
| Labels weak signals appropriately | Pass / Partial / Fail |  |
| Avoids overclaiming trends or anomalies | Pass / Partial / Fail |  |
| Avoids implying causation without evidence | Pass / Partial / Fail |  |
| States what cannot be concluded | Pass / Partial / Fail |  |

## Confidence Consistency

Check whether confidence is proportionate.

| Check | Result | Notes |
| --- | --- | --- |
| Uses confidence labels | Pass / Partial / Fail |  |
| Justifies confidence level | Pass / Partial / Fail |  |
| Lowers confidence when evidence is incomplete | Pass / Partial / Fail |  |
| Avoids high confidence from weak evidence | Pass / Partial / Fail |  |
| Distinguishes governed metric from directional signal | Pass / Partial / Fail |  |

Use confidence labels:

- high confidence
- medium confidence
- low confidence

## Decision-Support Consistency

Check whether the agent connects analysis to decisions without overstepping.

| Check | Result | Notes |
| --- | --- | --- |
| Names decision relevance | Pass / Partial / Fail |  |
| Keeps recommendation within data limits | Pass / Partial / Fail |  |
| Flags when Sensemaking Agent should take over | Pass / Partial / Fail |  |
| Avoids making final decisions | Pass / Partial / Fail |  |
| Identifies human review needs | Pass / Partial / Fail |  |

## Governance And Privacy Consistency

Check whether the agent protects sensitive material.

| Check | Result | Notes |
| --- | --- | --- |
| Avoids customer-level records | Pass / Partial / Fail |  |
| Avoids raw governed data | Pass / Partial / Fail |  |
| Avoids restricted screenshots or extracts | Pass / Partial / Fail |  |
| Avoids naming individuals unnecessarily | Pass / Partial / Fail |  |
| Avoids comparing teams or people without review | Pass / Partial / Fail |  |
| Does not store raw Genie or Databricks output | Pass / Partial / Fail |  |

## Output Storage Consistency

Check whether storage recommendations are safe and useful.

| Check | Result | Notes |
| --- | --- | --- |
| Recommends correct analytics domain folder | Pass / Partial / Fail |  |
| Avoids storing temporary query notes | Pass / Partial / Fail |  |
| Converts caveats into reusable notes where useful | Pass / Partial / Fail |  |
| Keeps raw data out of Strategic OS | Pass / Partial / Fail |  |
| Identifies when output should not be stored | Pass / Partial / Fail |  |

## Repeated Question Test

Ask the same question more than once in separate runs.

### Test Question

Question:

### Run 1 Result

Source used:

Metric definition:

Caveats:

Confidence:

Decision relevance:

Issues:

### Run 2 Result

Source used:

Metric definition:

Caveats:

Confidence:

Decision relevance:

Issues:

### Consistency Assessment

Choose one:

- consistent
- mostly consistent
- inconsistent
- unsafe

Notes:

## Source Conflict Test

Use this when multiple sources may disagree.

### Test Question

Question:

### Expected Behaviour

The agent should:

- identify source conflict
- state source hierarchy
- avoid blending incompatible figures
- defer to governed source where required
- explain caveats
- flag human review

### Result

Assessment:

Required change:

## Caveat Recall Test

Use this to check whether the agent remembers important caveats.

### Test Question

Question:

### Required Caveats

- Caveat 1:
- Caveat 2:
- Caveat 3:

### Result

Included all caveats?

- Yes
- Partly
- No

Notes:

## Final Consistency Rating

Choose one:

- Passed
- Passed with minor changes
- Needs revision
- Not safe for decision-support use
- Retire or redesign

### Rationale

Rationale:

### Required Changes

- Change 1:
- Change 2:
- Change 3:

### Files To Update

| File | Change Needed | Priority |
| --- | --- | --- |
|  |  | High / Medium / Low |

## Human Review Required

Human review is required before the agent is used for:

- executive-facing outputs
- governance reporting
- formal recommendations
- sensitive stakeholder communication
- performance claims
- public-facing claims
- comparison between teams or individuals
- decisions with material consequences

## Review Checklist

Before marking the consistency check complete, confirm:

- Source rules were tested
- Metric definitions were tested
- Caveats were tested
- Confidence was tested
- Privacy boundaries were tested
- Decision-support boundaries were tested
- Storage recommendations were tested
- Repeated questions produced stable logic
- Human review points are clear
- Required file updates are identified

## Success Measures

This consistency check is working when:

- analytical outputs become more stable
- caveats appear consistently
- source rules are followed
- metric definitions do not drift
- weak evidence is labelled correctly
- human review points are visible
- Strategic OS avoids storing raw data
- decision-support evidence becomes more reliable

## Failure Modes

This consistency check is not working if:

- it only checks formatting
- it ignores source hierarchy
- it misses caveat drift
- it allows inconsistent metric definitions
- it treats different answers as acceptable without explanation
- it ignores privacy and governance risks
- it fails to identify human review triggers
- it approves outputs that overclaim from weak evidence
- it creates review burden without improving reliability

## Minimal Use Rule

Use consistency checks for analytical agents that influence decisions.

Do not run heavy consistency checks on one-off exploratory analysis.

The purpose is reliable analytical judgement, not process for its own sake.
