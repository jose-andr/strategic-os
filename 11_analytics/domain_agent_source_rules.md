# Domain Analytical Agent Source Rules

## Purpose

This pattern defines how Domain Analytical Agents should handle source systems, source hierarchy and evidence quality.

It helps analytical agents decide which sources to use, how to describe confidence and when to defer to governed reporting or human review.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Source rules support the North Star by making analytical evidence more reliable, traceable and proportionate.

## Core Principle

Use the right source for the right claim.

Do not treat all data sources as equal.

A Domain Analytical Agent should always know whether it is using:

- governed source of truth
- approved reporting layer
- contextual signal
- exploratory analysis
- user-provided interpretation
- incomplete or uncertain evidence

## Source Types

| Source Type | Meaning | Typical Use |
| --- | --- | --- |
| Governed source of truth | Approved system or dataset for the metric | Formal metric interpretation and decision support |
| Approved reporting layer | Dashboard or reporting view accepted for business use | Performance monitoring and trend review |
| Contextual source | Supporting signal that adds context but is not definitive | Sensemaking and hypothesis generation |
| Exploratory analysis | One-off query, slice or early investigation | Learning, testing and caveat discovery |
| User-provided context | Notes or interpretation supplied by the user | Framing and decision relevance |
| External reference | Public or third-party source | Benchmarking or background context |

## Source Hierarchy

Use this hierarchy unless a domain-specific file defines a different order.

| Priority | Source Category | Use |
| --- | --- | --- |
| 1 | Governed source of truth | Use for formal metric claims |
| 2 | Approved reporting layer | Use for standard performance views |
| 3 | Approved analytical query | Use for reviewed analytical investigation |
| 4 | Domain caveat or source-rule file | Use to interpret meaning and limits |
| 5 | Contextual operational signal | Use for sensemaking only |
| 6 | User-provided notes | Use as context, not evidence of record |
| 7 | Exploratory output | Use only with caveats |
| 8 | External benchmark | Use only when source, scope and comparability are clear |

## Source Rule File

Each analytics domain should define local source rules when repeated analysis is expected.

Recommended location:

`11_analytics/[domain]/source_rules.md`

A source rules file should include:

- approved source systems
- source hierarchy
- approved reporting views
- contextual sources
- sources not to use
- source caveats
- metric ownership
- refresh cadence
- known data quality issues
- human review triggers
- official source of truth statement

## Standard Source Rule Structure

Use this structure for a domain source rules file.

### Domain

[Name of analytical domain]

### Purpose

[What the domain supports]

### Source Of Truth

[Primary governed source]

### Approved Reporting Sources

[List approved dashboards or reporting views]

### Approved Analytical Sources

[List approved tables, views, queries or tools]

### Contextual Sources

[List sources that can support interpretation but are not definitive]

### Sources Not To Use

[List excluded, deprecated or unreliable sources]

### Source Hierarchy

[State order of authority]

### Caveats

[Known source limitations]

### Refresh Cadence

[How often sources update]

### Metric Owner Or Steward

[Owner if known]

### Human Review Triggers

[When human review is required]

## Handling Conflicting Sources

When sources disagree, the agent should:

1. identify the conflict
2. name the sources
3. state the source hierarchy
4. avoid blending figures without explanation
5. use the governed source where formal claims are needed
6. use contextual sources only as supporting signals
7. explain uncertainty
8. recommend human review if the conflict affects a decision

Do not average conflicting sources unless the domain rule explicitly allows it.

Do not silently choose the source that best supports the desired interpretation.

## Governed Source Claims

Use governed source claims when:

- the source of truth is known
- the metric definition is approved
- caveats are documented
- the intended use is decision support or formal interpretation
- the output may be reused in a decision brief

A governed source claim should include:

- source
- metric definition
- timeframe
- caveats
- confidence
- review requirement

## Contextual Signal Claims

Use contextual signal claims when:

- the source is useful but not authoritative
- the evidence is directional
- the signal helps explain behaviour, experience or operating context
- the output is supporting sensemaking rather than formal reporting

A contextual signal claim should use cautious language.

Use phrases such as:

- may indicate
- suggests
- could reflect
- is consistent with
- should be checked against governed data

Avoid phrases such as:

- proves
- confirms
- definitively shows
- the cause is
- the organisation is performing at

## Exploratory Analysis Claims

Use exploratory analysis claims when the analysis is early, incomplete or one-off.

The agent must state:

- source
- method or query basis where safe
- scope
- caveats
- confidence
- what cannot be concluded
- whether the analysis needs review

Exploratory analysis should not be treated as official reporting.

## External Benchmarks

External benchmarks may be useful, but they must be handled carefully.

Before using a benchmark, check:

- source credibility
- date
- geography
- sector comparability
- metric definition
- sample or methodology
- whether it is relevant to the local context

Benchmarks should support context, not replace local evidence.

## User-Provided Context

User-provided context may guide interpretation, but it should not be treated as governed evidence.

Use it for:

- framing the question
- understanding decision relevance
- identifying stakeholder or operational context
- identifying possible caveats
- shaping next questions

Label it as:

- user-provided context
- working assumption
- interpretation to validate

## Source Labelling

Every analytical output should label its source type.

Use one of:

- governed source
- approved reporting source
- approved analytical source
- contextual signal
- exploratory analysis
- user-provided context
- external benchmark
- unknown source

If source type is unknown, the output should not be used for decision support without review.

## Confidence Rules

Use confidence labels based on source strength, metric clarity and caveats.

| Confidence | Use When |
| --- | --- |
| High confidence | Governed source, clear metric, known caveats, suitable use |
| Medium confidence | Approved source but some caveats, partial evidence or limited scope |
| Low confidence | Exploratory, incomplete, contextual or unclear source |
| Do not use yet | Source unknown, metric unclear, caveats missing or sensitive data risk |

Confidence should be lowered when:

- source is unclear
- metric definition is uncertain
- data is incomplete
- timeframe is ambiguous
- source conflict exists
- caveats are material
- analysis is exploratory
- output may be sensitive

## Required Caveats

Include caveats when relevant.

Common caveats include:

- data lag
- incomplete records
- duplicate records
- filter dependency
- channel mix effects
- definition mismatch
- sample bias
- manual data entry risk
- unresolved data quality issue
- source system transition
- small sample size
- missing segmentation
- contextual source only
- exploratory output only

## Prohibited Source Practices

Domain Analytical Agents must not:

- invent sources
- hide source uncertainty
- treat all sources as equal
- blend conflicting sources without explanation
- cite contextual signals as governed truth
- present exploratory analysis as official reporting
- copy raw governed data into Strategic OS
- store customer-level records
- use sensitive source details unnecessarily
- overstate confidence from weak evidence
- make claims without metric definitions
- ignore known caveats

## Human Review Triggers

Human review is required when:

- sources conflict
- source of truth is unclear
- metric definition is unclear
- caveats materially affect interpretation
- the output may be used in governance
- the output may be executive-facing
- the output may affect stakeholders
- the output compares teams, individuals or performance
- the output may support public-facing claims
- the output uses sensitive or restricted information
- the output could be mistaken for official reporting

## Storage Rules

Store source rules in:

`11_analytics/[domain]/source_rules.md`

Store general source-rule patterns in:

`11_analytics/domain_agent_source_rules.md`

Do not store:

- raw source data
- copied governed datasets
- customer-level records
- sensitive query outputs
- screenshots from restricted reporting tools
- source extracts that belong in official systems

## Standard Source Statement

Use this pattern in analytical outputs.

### Source

[Name source or reporting layer]

### Source Type

[Governed source / Approved reporting source / Contextual signal / Exploratory analysis]

### Metric Definition

[Define metric]

### Timeframe

[State timeframe]

### Caveats

[State caveats]

### Confidence

[High / Medium / Low]

### Human Review

[State whether human review is required]

## Example Source Statements

### Governed Source Example

Source type:

Governed source

Use:

This can support decision-making if the metric definition and caveats are accepted.

Caveat:

Interpretation should remain within the metric definition and timeframe.

### Contextual Signal Example

Source type:

Contextual signal

Use:

This may help explain a pattern, but it should be checked against governed data before formal use.

Caveat:

Do not treat this as a source-of-truth metric.

### Exploratory Analysis Example

Source type:

Exploratory analysis

Use:

This may help generate a hypothesis or identify a possible issue.

Caveat:

Do not use as official reporting without review.

## Review Checklist

Before using an analytical source, check:

- Is the source named?
- Is the source type labelled?
- Is the source approved for this use?
- Is the metric definition clear?
- Is the timeframe clear?
- Are filters or exclusions visible?
- Are caveats included?
- Is confidence proportionate?
- Is human review required?
- Could this be mistaken for official reporting?
- Is the output safe to store?

## Success Measures

Source rules are working when:

- agents use the right source for the right claim
- source hierarchy is clear
- source conflicts are surfaced
- caveats are included consistently
- confidence is proportionate
- contextual signals are not overstated
- exploratory analysis stays exploratory
- decision briefs use better evidence
- governed data remains in governed systems

## Failure Modes

Source rules are failing if:

- sources are not named
- conflicting sources are blended
- caveats are omitted
- exploratory outputs are treated as governed
- contextual signals are used as proof
- confidence is too high
- metric definitions drift
- raw source data is copied into Strategic OS
- human review is skipped for high-risk use
- analytical claims exceed the source quality

## Minimal Use Rule

Use the strongest appropriate source.

Name the source.

State the caveat.

Lower confidence when uncertain.

Ask for human review when the source could affect a decision.
