# Domain Analytical Agent Review Prompt

## Purpose

Use this prompt to review outputs from Domain Analytical Agents before they are stored, shared or used in decision-making.

The prompt helps check whether analytical outputs are source-aware, caveated, proportionate and safe to use.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Analytical outputs should improve judgement. They should not create false certainty.

## When To Use

Use this review prompt when a Domain Analytical Agent has produced:

- analytical summary
- metric caveat note
- trend summary
- anomaly summary
- data quality note
- decision-support evidence summary
- Genie context update
- source rules update
- metric definition update
- agent consistency check

Use this before analytical material is:

- stored in `11_analytics/[domain]/`
- used in a decision brief
- referenced in an opportunity review
- used in stakeholder communication
- shared in executive-facing material
- treated as evidence for a recommendation

## Review Prompt

Act as a Domain Analytical Agent reviewer for Strategic OS.

Review the analytical output below.

Check whether it is safe, useful, caveated and proportionate for decision-support use.

Separate:

- source
- metric definition
- observed data
- caveats
- assumptions
- interpretation
- recommendation
- human review requirements

Assess the output against the following questions.

## Analytical Output To Review

[PASTE OUTPUT HERE]

## Review Questions

### 1. Source Clarity

- Is the source clearly named?
- Is the source approved for this use?
- Is the source governed, contextual or exploratory?
- Is the source of truth clear?
- Are any unsupported sources being used?

### 2. Metric Definition

- Are key metrics defined?
- Is the grain of analysis clear?
- Is the timeframe clear?
- Are filters or exclusions visible?
- Could the metric be interpreted in more than one way?

### 3. Caveats

- Are caveats clearly stated?
- Are data quality limitations visible?
- Is lag, incompleteness or sampling risk mentioned where relevant?
- Are known source limitations included?
- Are caveats strong enough for the claims being made?

### 4. Evidence And Interpretation

- Is observed data separated from interpretation?
- Are assumptions clearly marked?
- Is the interpretation proportionate to the evidence?
- Are weak signals labelled as weak?
- Are correlations, trends or anomalies overclaimed?

### 5. Confidence

- Is confidence labelled?
- Is confidence justified?
- Is confidence too high for the evidence available?
- Does the output distinguish strong evidence from directional signal?

### 6. Decision Relevance

- Does the output support a real decision or judgement?
- Is the decision relevance explicit?
- Is the recommendation within the limits of the data?
- Does the output need a Sensemaking Agent to convert it into a decision brief?

### 7. Governance And Safety

- Does the output avoid customer-level records?
- Does it avoid raw governed data?
- Does it avoid sensitive organisational extracts?
- Does it avoid naming individuals or teams unnecessarily?
- Could the output be mistaken for official reporting?
- Does it need human review before use?

### 8. Storage

- Should this output be stored?
- Is `11_analytics/[domain]/` the right location?
- Should it become a metric caveat, source rule, data quality note or analytical summary?
- Should it remain a temporary working note?
- Should it be discarded?

## Review Output Structure

Use this structure for the review.

### Review Result

Choose one:

- Safe to use as decision-support evidence
- Safe to store with caveats
- Needs caveat strengthening
- Needs source clarification
- Needs metric definition clarification
- Needs human review before use
- Do not use yet
- Do not store

### Summary

[Summarise the review in a few sentences.]

### Source Assessment

Source:

Source type:

- governed
- contextual
- exploratory
- unknown

Assessment:

### Metric Assessment

Metric clarity:

- clear
- partly clear
- unclear

Issues:

### Caveat Assessment

Caveat quality:

- strong
- adequate
- weak
- missing

Required caveats:

### Evidence And Interpretation Assessment

Evidence quality:

- strong
- medium
- weak
- incomplete

Interpretation quality:

- proportionate
- partly overclaimed
- overclaimed
- unclear

Notes:

### Confidence Assessment

Recommended confidence level:

- high confidence
- medium confidence
- low confidence

Rationale:

### Decision Use

Can this support a decision?

- yes
- yes, with caveats
- not yet
- no

Decision or judgement it may support:

Limits of use:

### Human Review Required

Human review required?

- yes
- no

Reason:

### Storage Recommendation

Recommended location:

Recommended file type:

- analytical summary
- metric caveat note
- source rules update
- metric definition update
- data quality note
- agent consistency check
- temporary working note
- do not store

Reason:

### Required Changes

- Change 1:
- Change 2:
- Change 3:

### Final Recommendation

[State the final recommendation.]

## Reviewer Checklist

Before accepting the output, check:

- Source is clear
- Metric definition is clear
- Caveats are visible
- Evidence is separated from interpretation
- Confidence is proportionate
- Decision relevance is explicit
- Sensitive data is excluded
- Human review points are clear
- Storage recommendation is safe
- Claims do not exceed evidence

## Failure Modes

This review prompt is not working if:

- it approves outputs without caveats
- it treats exploratory analysis as governed truth
- it ignores source hierarchy
- it misses data quality issues
- it allows raw data into Strategic OS
- it overstates confidence
- it focuses on formatting rather than decision usefulness
- it fails to flag human review
- it creates analytical clutter without improving judgement

## Minimal Use Rule

Use the review prompt only for analytical outputs worth keeping or using.

Do not review every temporary query.

Review the outputs that may influence decisions, recommendations, reporting interpretation or future analytical practice.
