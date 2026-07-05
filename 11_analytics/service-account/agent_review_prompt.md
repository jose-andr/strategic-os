# Service Account Analytical Agent Review Prompt

## Purpose

Use this prompt to review outputs from the Service Account Analytical Agent before they are stored, shared or used in decision-making.

The prompt checks whether service account analysis is source-aware, caveated, proportionate and safe to use.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Service account analytical outputs should improve judgement. They should not create false certainty.

## When To Use

Use this review prompt when the Service Account Analytical Agent has produced:

- analytical summary
- metric caveat note
- source rules update
- metric definition update
- data quality note
- trend summary
- anomaly summary
- decision-support evidence summary
- Genie-supported output
- consistency check

Use this before service account analytical material is:

- stored in `11_analytics/service-account/`
- used in a decision brief
- referenced in an opportunity review
- used in stakeholder communication
- shared in executive-facing material
- treated as evidence for a recommendation

## Review Prompt

Act as a Service Account Analytical Agent reviewer for Strategic OS.

Review the analytical output below.

Check whether it is safe, useful, caveated and proportionate for decision-support use.

Separate:

- source
- source type
- metric definition
- observed data
- caveats
- data quality notes
- assumptions
- interpretation
- recommendation
- human review requirements
- storage recommendation

## Analytical Output To Review

[PASTE OUTPUT HERE]

## Review Questions

### 1. Source Clarity

- Is the source clearly named?
- Is the source type labelled?
- Is the governed source of truth confirmed?
- Is the source approved for this use?
- Is the source governed, contextual or exploratory?
- Are any unsupported sources being used?
- Is source uncertainty visible?

### 2. Metric Definition

- Are service account metrics defined before interpretation?
- Is the grain clear?
- Is the timeframe clear?
- Are inclusions and exclusions visible?
- Are filters or segments visible?
- Could account, case, request, interaction or transaction be confused?
- Are similar metrics being mixed?

### 3. Caveats

- Are relevant caveats included?
- Is closure separated from customer resolution?
- Is repeat contact treated as a signal rather than proof?
- Is channel mix separated from customer preference?
- Are escalation and reopen metrics interpreted carefully?
- Are caveats strong enough for the claims being made?

### 4. Data Quality

- Are known data quality issues considered?
- Is source-of-truth uncertainty visible?
- Is metric grain uncertainty visible?
- Is refresh cadence uncertainty visible?
- Are duplicate, migrated or test record risks considered?
- Are mapping, coding or status issues considered?
- Is confidence lowered where data quality is uncertain?

### 5. Evidence And Interpretation

- Is observed data separated from interpretation?
- Are assumptions clearly marked?
- Is the interpretation proportionate to the evidence?
- Are weak signals labelled as weak?
- Are trends, anomalies or causes overclaimed?
- Does the output state what cannot be concluded?

### 6. Confidence

- Is confidence labelled?
- Is confidence justified?
- Is confidence too high for the evidence available?
- Does the output distinguish governed metric from contextual signal?
- Should the result be labelled “do not use yet”?

### 7. Decision Relevance

- Does the output support a real decision or judgement?
- Is decision relevance explicit?
- Is the recommendation within the limits of the data?
- Does the output need the Sensemaking Agent to convert it into a decision brief?
- Does the output risk implying that a decision has already been made?

### 8. Governance And Safety

- Does the output avoid customer-level records?
- Does it avoid raw governed data?
- Does it avoid sensitive organisational extracts?
- Does it avoid naming individuals or teams unnecessarily?
- Could the output be mistaken for official reporting?
- Does it need human review before use?

### 9. Storage

- Should this output be stored?
- Is `11_analytics/service-account/` the right location?
- Should it become a metric caveat, source rule, metric definition, data quality note or analytical summary?
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
- Needs data quality clarification
- Needs human review before use
- Do not use yet
- Do not store

### Summary

[Summarise the review in a few sentences.]

### Source Assessment

Source:

Source type:

- governed source
- approved reporting source
- approved analytical source
- contextual signal
- exploratory analysis
- user-provided context
- external benchmark
- unknown source

Assessment:

### Metric Assessment

Metric clarity:

- clear
- partly clear
- unclear

Grain clarity:

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

### Data Quality Assessment

Data quality risk:

- low
- medium
- high
- blocking
- unknown

Relevant issues:

Required changes:

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
- do not use yet

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
- Genie context update
- consistency check
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
- Source type is labelled
- Metric definition is clear
- Grain is clear
- Timeframe is clear
- Caveats are visible
- Data quality issues are considered
- Evidence is separated from interpretation
- Confidence is proportionate
- Decision relevance is explicit
- Sensitive data is excluded
- Human review points are clear
- Storage recommendation is safe
- Claims do not exceed evidence

## Human Review Required

Human review is required before service account analytical outputs are:

- used in decision briefs
- used in executive-facing material
- used in governance
- used for performance claims
- used for customer experience claims
- used in stakeholder-sensitive communication
- used to compare teams, individuals or services
- used in public-facing claims
- used where source, metric or caveat is unclear
- stored as reusable decision-support evidence

## Failure Modes

This review prompt is not working if:

- it approves outputs without caveats
- it treats exploratory analysis as governed truth
- it ignores source hierarchy
- it misses data quality issues
- it allows raw data into Strategic OS
- it overstates confidence
- it treats closure as customer resolution
- it treats channel mix as customer preference
- it treats repeat contact as proof of failure demand
- it focuses on formatting rather than decision usefulness
- it fails to flag human review

## Minimal Use Rule

Use this review prompt for service account outputs worth keeping or using.

Do not review every temporary query.

Review the outputs that may influence decisions, recommendations, reporting interpretation or future analytical practice.
