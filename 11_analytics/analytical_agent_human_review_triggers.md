# Analytical Agent Human Review Triggers

## Purpose

This framework defines when analytical agent outputs require human review before they are stored, shared or used in Strategic OS decision-making.

It helps prevent analytical outputs from being treated as official, final or safe before the source, metric, caveat and confidence conditions are clear.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Human review protects decision quality when analytical evidence may be uncertain, sensitive, caveated or consequential.

## Core Principle

Analytical agents may support judgement.

They must not replace accountable human review when evidence affects decisions, stakeholders, governance or organisational claims.

## Default Rule

Human review is required before analytical outputs are used for:

- formal decision briefs
- executive-facing material
- governance
- stakeholder-sensitive communication
- performance claims
- customer experience claims
- public-facing claims
- funding or resourcing advice
- comparison between teams, individuals or services
- official reporting interpretation
- decisions with material consequences

## Review Trigger Categories

Human review is required when any of the following triggers apply.

## 1. Source Triggers

Review is required when:

- source of truth is unclear
- source type is unknown
- source hierarchy is missing
- source conflict exists
- governed source is not confirmed
- dashboard and query results disagree
- Genie output conflicts with approved reporting
- source has changed
- source is deprecated
- source freshness is unclear
- source is contextual or exploratory but may support a decision

## 2. Metric Triggers

Review is required when:

- metric definition is unclear
- metric grain is unclear
- metric owner is unknown
- metric calculation is unknown
- metric has changed over time
- similar metrics may be confused
- inclusions or exclusions are hidden
- filters materially affect meaning
- metric is used outside its intended context
- metric is newly created or not yet approved

## 3. Caveat Triggers

Review is required when:

- caveats are missing
- caveats materially affect interpretation
- caveat severity is high or blocking
- caveats are inferred rather than confirmed
- unsafe interpretation risk exists
- caveats are likely to be misunderstood
- caveated evidence may be used in decision-making
- a caveat affects stakeholder-sensitive communication

## 4. Data Quality Triggers

Review is required when:

- data quality severity is high or blocking
- data completeness is uncertain
- duplicate records may affect interpretation
- source refresh cadence is unknown
- mapping or coding issues may distort results
- migration or system change may affect trend comparison
- missing fields affect segmentation
- data quality issue affects confidence
- workaround is uncertain
- data quality note affects a recommendation

## 5. Confidence Triggers

Review is required when:

- confidence is low
- output should be marked “do not use yet”
- confidence rationale is weak
- confidence appears too high for the evidence
- source, metric or caveat uncertainty lowers confidence
- interpretation relies on exploratory analysis
- output may be mistaken for official reporting

## 6. Interpretation Triggers

Review is required when:

- output implies cause
- output interprets a trend or anomaly
- output makes a recommendation
- output could affect prioritisation
- output could affect stakeholder perception
- output could affect investment, funding or resourcing
- output identifies risk or underperformance
- output compares groups, teams or services
- output goes beyond observed evidence
- alternative explanations are not clear

## 7. Governance Triggers

Review is required when:

- output may be used in governance forums
- output may be used as official reporting interpretation
- output may inform audit, compliance or risk discussion
- output may influence policy, budget or service standards
- output may be shared beyond the working context
- output uses governed reporting but adds interpretation
- output may be retained as reusable evidence

## 8. Privacy And Sensitivity Triggers

Review is required when:

- output contains sensitive organisational context
- output could identify individuals
- output could identify small groups
- output references customer-level information
- output references stakeholder-sensitive issues
- output includes operational risk
- output could create reputational risk
- output may be inappropriate for GitHub storage
- output may need abstraction before storing

## 9. Communication Triggers

Review is required before analytical outputs are used in:

- emails
- Teams messages
- executive updates
- governance papers
- stakeholder briefings
- public-facing material
- workshop summaries
- decision recommendations
- escalation notes

Analytical agents may draft communication.

They must not send communication.

## 10. Storage Triggers

Review is required before storing analytical outputs when:

- source material is sensitive
- output includes governed data interpretation
- output may be reused as evidence
- output contains caveated claims
- output includes stakeholder-sensitive interpretation
- output could be mistaken for official reporting
- storage location is uncertain
- output may need abstraction
- output may need archiving rather than active storage

## Review Decision

Use one of these decisions:

- no review required
- review recommended
- human review required before use
- human review required before storage
- human review required before sharing
- do not use yet
- do not store

## Standard Review Trigger Statement

Use this pattern:

Human review is required because [trigger]. The output is based on [source type] with [confidence level] confidence. It may support [decision or judgement], but it should not be used for [restricted use] until [review action].

## Review Routing

| Trigger Type | Review Path |
| --- | --- |
| Source uncertainty | Clarify source rules |
| Metric uncertainty | Clarify metric definitions |
| Caveat weakness | Update metric caveats |
| Data quality issue | Update data quality notes |
| Strategic decision use | Send to Sensemaking Agent |
| Stakeholder sensitivity | Send to Stakeholder Journey Agent |
| Operating follow-up | Send to Chief of Staff Agent |
| Storage uncertainty | Review privacy and retention rules |

## Checklist

Before deciding review is not required, confirm:

- source is clear
- source type is labelled
- metric is defined
- caveats are visible
- data quality issues are considered
- confidence is proportionate
- output is not executive-facing
- output is not governance-facing
- output is not stakeholder-sensitive
- output does not make performance claims
- output does not compare people, teams or services
- output does not include raw or sensitive data
- output will not be mistaken for official reporting

## Failure Modes

Human review triggers are failing if:

- agents approve analytical outputs too easily
- low-confidence outputs are used in decisions
- exploratory analysis becomes official reporting
- stakeholder-sensitive claims are shared without review
- caveats are ignored
- source conflicts are hidden
- raw or sensitive data is stored
- review burden is applied to trivial outputs
- review becomes a formatting exercise rather than judgement protection

## Minimal Use Rule

Require human review when the output could affect decisions, stakeholders, governance, confidence or trust.

Do not require full review for temporary, low-risk exploratory questions that will not be stored or reused.
