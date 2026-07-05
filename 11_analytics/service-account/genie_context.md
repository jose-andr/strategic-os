# Service Account Genie Context

## Purpose

This file gives Databricks Genie, or a similar natural-language analytics tool, safe context for the Service Account analytical domain.

It helps service account questions use consistent terminology, source hierarchy, metric definitions, caveats and review requirements.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Genie context supports better decisions by making natural-language analytical outputs more consistent, caveated and reviewable.

## Domain

Service Account

## Intended Use

Use this context to support service account analytical questions such as:

- What does this service account metric mean?
- What source should be used for this question?
- What caveats affect this metric?
- What does the data appear to show?
- What cannot be concluded from this output?
- What decision or judgement could this evidence support?
- What human review is required before use?

## Core Principle

Genie may help retrieve or explain data.

Genie is not the source of truth by itself.

Service account Genie-supported outputs must be interpreted through:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- human review
- decision relevance

## Source Hierarchy

Use this hierarchy unless superseded by confirmed source rules.

| Priority | Source Category | Use |
| --- | --- | --- |
| 1 | Confirmed governed source of truth | Formal metric claims and decision support |
| 2 | Approved reporting layer | Standard trend or performance interpretation |
| 3 | Approved analytical query or view | Reviewed analytical investigation |
| 4 | Service account source rules | Source interpretation and hierarchy |
| 5 | Service account metric definitions | Metric meaning and boundaries |
| 6 | Service account metric caveats | Interpretation limits |
| 7 | Service account data quality notes | Reliability risks |
| 8 | Contextual operational signal | Sensemaking and hypothesis generation |
| 9 | User-provided context | Framing and decision relevance |
| 10 | Exploratory analysis | Early investigation only |

Until the governed source of truth is confirmed, treat outputs as contextual or exploratory and require human review before decision use.

## Approved Terms

| Term | Use This Meaning | Avoid Confusing With |
| --- | --- | --- |
| Service account | The domain object or record being analysed, pending confirmed definition | Customer, case, request, interaction or transaction unless confirmed |
| Account | A service account record, if confirmed by source rules | Individual customer or household unless confirmed |
| Case | A managed item, issue or workflow record, if source uses this grain | Account, interaction or transaction |
| Request | A customer or service request, if source uses this grain | Case closure or customer resolution |
| Interaction | A contact or touchpoint with the service, if captured | Account or case volume |
| Channel | The contact or service delivery channel recorded in source data | Customer preference or channel effectiveness |
| Active | A service account currently considered active by confirmed source logic | Backlog unless defined |
| Closed | A system or workflow closure state | Customer resolution |
| Resolved | A resolution state, if separately defined | Closure unless confirmed |
| Repeat contact | A repeated or follow-up contact based on confirmed matching logic | Proof of failure demand |
| Reopen | A record reopened after closure based on confirmed logic | Proof of poor service |
| Escalation | A record escalated according to confirmed process rules | Poor performance or blame |

## Approved Metrics

| Metric | Definition | Source | Caveat |
| --- | --- | --- | --- |
| Service account volume | Number of service account items within scope | To confirm | Grain must be confirmed |
| Active service accounts | Number of service accounts considered active | To confirm | Active-status logic must be confirmed |
| New service accounts | Number created within a period | To confirm | Creation date may not equal demand start |
| Closed or resolved service accounts | Number closed or resolved in a period | To confirm | Closure may not equal customer resolution |
| Service account age | Time since start event or creation | To confirm | Start and end rules must be confirmed |
| Time to resolution | Time from start event to closure or resolution | To confirm | May measure system closure, not customer outcome |
| Repeat contact | Follow-up or repeated interaction | To confirm | Matching and attribution rules must be confirmed |
| Channel of contact | Recorded channel for interaction or request | To confirm | Channel mix does not prove preference |
| Escalation rate | Count or proportion escalated | To confirm | Definition and denominator must be confirmed |
| Reopen rate | Count or proportion reopened after closure | To confirm | Reopen may reflect administrative handling |

## Common Questions

| Question | Preferred Interpretation |
| --- | --- |
| What is service account volume? | Define grain first, then interpret volume cautiously |
| Are active service accounts increasing? | Confirm active-status logic, timeframe and source before interpreting |
| How many new service accounts were created? | Confirm creation-date logic and duplicate handling |
| Are items being resolved faster? | Confirm resolution definition and whether closure equals customer resolution |
| What channels are customers using? | Treat channel as recorded channel mix, not preference |
| Is repeat contact high? | Treat repeat contact as investigation signal, not proof of cause |
| Are escalations increasing? | Confirm escalation definition and process context |
| Are reopened items a quality issue? | Treat reopen rate as a signal requiring review |
| Can this support a decision brief? | Only with source, metric definition, caveats, confidence and human review |

## Known Caveats

Always check `metric_caveats.md`.

Common service account caveats include:

- grain caveat
- source of truth not confirmed
- active-status caveat
- closure versus resolution caveat
- repeat contact attribution caveat
- channel mix caveat
- escalation definition caveat
- reopen logic caveat
- duplicate or migrated record caveat
- refresh cadence caveat

## Data Quality Notes

Always check `data_quality_notes.md`.

Known or likely issues include:

- source of truth not yet confirmed
- metric grain not yet confirmed
- active status logic not yet confirmed
- closure and resolution logic not yet confirmed
- duplicate, test or migrated records may affect counts
- channel mapping may be incomplete or inconsistent
- repeat contact matching logic not yet confirmed
- reopen and escalation coding may reflect process variation
- refresh cadence not yet confirmed

## Safe Prompting Pattern

Use prompts that request caveated interpretation.

Example:

Question:

[Ask the service account analytical question.]

Apply this context:

- define the metric before interpreting it
- name the source
- label the source type
- state the timeframe
- state the grain
- include known caveats
- include relevant data quality notes
- separate observation from interpretation
- state confidence
- identify what cannot be concluded
- identify human review required
- avoid official reporting claims unless source and review support them

## Safe Response Pattern

A safe Genie-supported response should include:

### Question

[Question answered]

### Source

[Source used]

### Source Type

[Governed / Approved reporting / Approved analytical / Contextual / Exploratory / Unknown]

### Metric Definition

[Metric meaning]

### Timeframe

[Timeframe used]

### Grain

[Account / Case / Request / Interaction / Transaction / Unknown]

### Observation

[What the data appears to show]

### Caveats

[Known limits]

### Data Quality Notes

[Known reliability issues]

### Confidence

[High / Medium / Low / Do not use yet]

### Interpretation

[What this may mean]

### What Cannot Be Concluded

[State limits]

### Decision Relevance

[What decision or judgement it may support]

### Human Review

[Review required before use]

## Prohibited Interpretations

Genie-supported service account outputs must not:

- treat Genie as the source of truth
- use unknown tables as authoritative
- ignore metric definitions
- omit caveats
- present exploratory outputs as official reporting
- infer cause without evidence
- treat closure as customer resolution without confirmation
- treat repeat contact as proof of failure demand
- treat channel mix as customer preference
- compare teams or individuals without review
- make public-facing claims without review
- store raw query outputs in Strategic OS
- bypass governed dashboards where required
- imply that a decision has been made
- overstate confidence

## Source Conflict Handling

If Genie output conflicts with another source:

1. name the conflicting sources
2. check `source_rules.md`
3. state the source hierarchy
4. avoid blending incompatible figures
5. lower confidence
6. recommend human review
7. use governed source for formal claims where required

## Caveat Handling

If a service account metric has known caveats, include them.

If caveats are unknown, state:

Caveats are not yet confirmed. This output should not be used for decision support until source rules and metric caveats are reviewed.

## Data Quality Handling

If data quality issues are known, include:

- affected source
- affected metric
- severity
- interpretation impact
- safe use
- human review trigger

If data quality is unknown, lower confidence.

## Human Review Required

Human review is required before Genie-supported outputs are:

- used in decision briefs
- used in executive-facing material
- used in governance
- used for performance claims
- used for customer experience claims
- used in stakeholder-sensitive communication
- used to compare teams or individuals
- used in public-facing claims
- used where source, metric or caveat is unclear
- stored as reusable analytical evidence

## Storage Rules

Store reusable Genie context in:

`11_analytics/service-account/genie_context.md`

Store reviewed analytical summaries in:

`11_analytics/service-account/`

Do not store:

- raw Genie transcripts
- raw query results
- customer-level rows
- copied governed outputs
- restricted table details
- sensitive screenshots
- exploratory outputs with no reuse value

## Relationship To Domain Files

This file should align with:

- `source_rules.md`
- `metric_definitions.md`
- `metric_caveats.md`
- `data_quality_notes.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`

If one changes, check whether this Genie context needs updating.

## Review Checklist

Before using or updating this Genie context, check:

- Is the domain purpose clear?
- Is source hierarchy clear?
- Are approved terms defined?
- Are approved metrics listed?
- Are caveats visible?
- Are data quality issues included?
- Are prohibited interpretations listed?
- Are human review triggers clear?
- Are storage rules safe?
- Does the context avoid raw or sensitive data?
- Does it improve decision-support quality?

## Success Measures

Service account Genie context is working when:

- users ask clearer service account questions
- Genie-supported outputs use consistent terms
- metric definitions are stable
- caveats are included
- data quality issues are visible
- source hierarchy is respected
- confidence is proportionate
- human review happens before formal use
- Strategic OS avoids storing raw Genie outputs
- analytical evidence becomes more useful for decisions

## Failure Modes

Service account Genie context is failing if:

- Genie answers are treated as source of truth
- caveats disappear
- metric definitions drift
- outputs use inconsistent terminology
- raw query outputs are stored in Strategic OS
- source conflicts are hidden
- confidence is too high
- human review is skipped
- users gain false certainty
- context becomes too broad to govern

## Minimal Use Rule

Use Genie context only where natural-language analytics is actually being used.

Keep it narrow, service-account-specific and caveated.
