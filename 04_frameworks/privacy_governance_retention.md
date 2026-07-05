# Privacy, Governance And Retention

## Purpose

This framework defines what can and cannot be stored in Strategic OS.

Strategic OS is a personal strategic operating system. It should preserve reusable knowledge, decision logic, frameworks, safe summaries, patterns, reflections and career evidence.

It should not become a shadow organisational record system.

The purpose of this framework is to protect:

* customers
* stakeholders
* the user
* the organisation
* governed data sources
* confidential work
* the long-term usefulness of the repository

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Privacy, governance and retention rules protect the North Star by keeping the system safe, reusable and trustworthy.

## Core Principle

Store reusable knowledge, not raw organisational source material.

Strategic OS should capture:

* what was learned
* how decisions were framed
* what patterns emerged
* what assumptions were tested
* what can be reused
* what capability was demonstrated
* what caveats should be remembered

Strategic OS should not duplicate confidential systems of record.

## What Strategic OS Can Store

Strategic OS may store:

* privacy-safe summaries
* reusable frameworks
* templates
* decision logic
* lessons learned
* non-sensitive career evidence
* abstracted stakeholder patterns
* project reflections
* safe opportunity notes
* prompt patterns
* agent specifications
* autonomy and escalation rules
* governance caveats
* analytics interpretation guidance
* metric caveats
* source rules
* personal operating principles
* public or non-sensitive reference material
* links or references to official systems, where safe

## What Strategic OS Must Not Store

Do not store:

* customer-level records
* personally identifiable customer information
* raw organisational documents
* confidential source extracts
* governed datasets
* operational data copied from systems of record
* sensitive stakeholder commentary
* private employee matters
* HR records
* procurement-sensitive material
* legal advice
* unpublished organisational decisions
* raw emails containing confidential information
* confidential meeting transcripts
* system exports
* screenshots of sensitive systems
* access credentials
* passwords
* tokens
* private keys
* identifiable complaints or case details
* raw Databricks or Genie outputs containing sensitive information
* Power BI screenshots or copied reporting extracts
* Teams, email or calendar threads copied into the repo

## Preferred Storage Pattern

When something useful comes from sensitive or organisational work, convert it before storing.

| Source Material           | Do Not Store                                | Store Instead                                      |
| ------------------------- | ------------------------------------------- | -------------------------------------------------- |
| Customer record           | Raw case details                            | Abstracted service pattern                         |
| Stakeholder comment       | Named private comment                       | Privacy-safe alignment risk                        |
| Internal report           | Confidential extract                        | Safe summary of decision logic                     |
| Dashboard export          | Copied operational data                     | Metric caveat or interpretation note               |
| Email thread              | Full email text                             | Follow-up principle or action pattern              |
| Meeting transcript        | Raw transcript                              | Key decision, assumption or lesson                 |
| HR-related matter         | Private employee details                    | General capability or process lesson               |
| Databricks / Genie result | Raw query output                            | Reviewed analytical interpretation with caveats    |
| Power BI report           | Screenshot or copied values                 | Metric definition, caveat or safe source reference |
| Miro board                | Full exported board with sensitive material | Abstracted pattern or public-safe artefact         |
| Jira issue                | Full operational record                     | Delivery lesson or decision logic                  |

## Evidence, Assumptions And Interpretation

Strategic OS files should clearly separate:

* evidence
* assumptions
* interpretation
* recommendation
* action

### Evidence

Evidence is information directly observed, measured or confirmed.

Examples:

* a decision was made
* a template was used
* a workshop occurred
* a recommendation was adopted
* a metric changed, where the source is governed and safely referenced

### Assumptions

Assumptions are beliefs that may be reasonable but are not yet confirmed.

Examples:

* a stakeholder may be concerned about timing
* a service issue may relate to unclear ownership
* a pattern may indicate unmet customer need

### Interpretation

Interpretation is the meaning drawn from evidence and assumptions.

Examples:

* this may indicate a handover issue
* this suggests a need for clearer decision rights
* this pattern may create customer effort

### Recommendation

A recommendation is a proposed action or direction.

Examples:

* clarify the decision owner
* test the framing with stakeholders
* create a decision brief
* park the opportunity until evidence improves

### Action

An action is the next step to be taken.

Examples:

* draft a brief
* prepare a conversation
* update a template
* capture a lesson learned
* review an analytics caveat

## Privacy-Safe Abstraction

Use abstraction when the learning is valuable but the source material is sensitive.

### Unsafe

`Jane Smith said the complaints process is broken because Team X keeps missing vulnerable customer cases.`

### Safer

`There may be a cross-team handover risk in complaint handling, especially where customer vulnerability indicators require continuity and clear ownership.`

### Unsafe

`Customer case 12345 shows that the resident waited 18 days and called three times.`

### Safer

`A repeated-contact pattern may indicate that customers are not receiving clear status visibility after lodging a request.`

### Unsafe

`The internal dashboard shows Team X has the worst resolution rate.`

### Safer

`Resolution performance varies across teams and should be interpreted with agreed metric definitions, caveats and governance context.`

## Governance Boundaries

Strategic OS is not a replacement for official systems.

Official systems remain the source of truth for:

* organisational records
* customer records
* operational data
* legal or policy documents
* HR records
* procurement records
* financial records
* governed reporting
* formal project documentation
* official decisions
* approved communication records

Strategic OS may reference the existence of official material when safe, but should not copy confidential content from those systems.

## Analytics And Data Rules

For analytics-related work, Strategic OS may store:

* metric definitions
* caveats
* interpretation guidance
* source hierarchy rules
* safe analytical notes
* reusable review prompts
* known limitations
* decision-support framing
* data quality notes
* reviewed analytical assumptions

Strategic OS must not store:

* raw data exports
* customer-level data
* copied operational datasets
* governed metrics without source caveats
* screenshots of restricted dashboards
* sensitive query outputs
* confidential data extracts
* raw Databricks or Genie transcripts where sensitive data appears

When using analytics, clearly label:

* source
* definition
* caveat
* confidence
* whether the metric is governed, contextual or directional
* whether interpretation needs human review

## Databricks And Genie Rules

Databricks and Genie may support governed analytical interpretation.

Strategic OS may store:

* source rules
* metric caveats
* safe analytical prompts
* agent review prompts
* Genie context notes
* decision-support interpretation
* data quality caveats
* analytical assumptions that need checking

Strategic OS must not store:

* raw query outputs
* copied tables
* customer-level records
* sensitive operational rows
* dashboard screenshots
* restricted source data
* confidential extracts
* outputs that could be treated as official reporting without review

Store domain-specific analytical material in:

`11_analytics/[domain]/`

Examples:

* `11_analytics/service-account/`
* `11_analytics/channel-strategy/`
* `11_analytics/customer-demand/`
* `11_analytics/support-csat/`
* `11_analytics/executive-metrics/`
* `11_analytics/data-quality/`

Use Domain Analytical Agents for governed data interpretation and caveat-aware analysis.

## Stakeholder Information Rules

Strategic OS may store stakeholder patterns.

It should not store private stakeholder commentary.

### Store

* alignment conditions
* influence patterns
* communication needs
* engagement risks
* abstracted concerns
* decision-readiness observations
* reusable stakeholder lessons
* generalised engagement sequences

### Do Not Store

* private comments attributed to named individuals
* sensitive conflict details
* unverified motives
* confidential relationship dynamics
* personal criticism
* private employee information
* anything that would breach trust if read out of context

## Career Evidence Rules

Career evidence should be safe, truthful and reusable.

### Store

* achievements
* outcomes
* capability examples
* non-sensitive feedback summaries
* portfolio-safe examples
* promotion proof points
* role application evidence
* lessons showing growth
* privacy-safe career narratives

### Do Not Store

* private performance information about others
* confidential recruitment material
* sensitive employee matters
* named stakeholder criticism
* raw confidential feedback
* internal documents copied as evidence
* claims that cannot be supported
* inflated impact claims

## Chief Of Staff Output Rules

Most Chief of Staff outputs should remain temporary.

Do not store routine:

* daily briefings
* admin task lists
* follow-up trackers
* calendar notes
* reminder lists
* low-value operating notes

Store only when the output creates durable value, such as:

* decision context
* project continuity
* strategic opportunity signal
* reusable lesson
* stakeholder pattern
* career evidence
* risk or blocker requiring later review

If a daily or weekly operating note contains sensitive information, generalise it before storing or do not store it.

## Retention Rules

Strategic OS should retain material only while it remains useful, safe and appropriate.

## Keep

Keep files that are:

* reusable
* decision-relevant
* career-relevant
* privacy-safe
* framework-level
* template-level
* useful for future projects
* useful for quarterly review
* useful for understanding system evolution
* useful for analytical caveat or source-rule reuse

## Archive

Archive files that are:

* superseded but useful for history
* old versions with learning value
* closed project summaries
* completed assessments
* outdated drafts with reference value
* inactive opportunities with a clear revisit trigger

## Delete

Delete files that are:

* sensitive
* unsafe
* duplicated
* low value
* misleading
* no longer useful
* raw source material
* confidential extracts
* temporary task noise
* likely to create risk if retained

## Review Before Commit

Before committing a file to the repository, check:

* Does this contain raw organisational source material?
* Does this contain customer-level information?
* Does this contain sensitive stakeholder commentary?
* Does this contain confidential extracts?
* Does this copy operational data from a system of record?
* Does this include private HR or employee information?
* Does this include raw Databricks, Genie or Power BI output?
* Are assumptions clearly marked?
* Is evidence separated from interpretation?
* Is the file useful beyond the immediate moment?
* Is the storage location appropriate?
* Would this still feel safe if reviewed later?

If unsure, do not commit the file in its current form.

Convert it into a safer summary first.

## Sensitivity Levels

Use simple sensitivity levels when helpful.

| Level         | Meaning                                   | Storage Guidance               |
| ------------- | ----------------------------------------- | ------------------------------ |
| Public        | Already public or safe to share           | May be stored if useful        |
| Personal      | Personal reflection or career note        | Store carefully and truthfully |
| Internal-safe | Non-sensitive work summary                | May be stored as a summary     |
| Sensitive     | Could affect trust, privacy or governance | Abstract, minimise or avoid    |
| Restricted    | Should remain in official systems only    | Do not store                   |

## File-Level Safety Note

Where useful, add a short safety note to files that are based on sensitive work.

Example:

`Privacy note: This file contains abstracted patterns only. It does not include customer-level records, confidential extracts or raw organisational source material.`

Use a safety note when a file is derived from:

* stakeholder-sensitive work
* analytics interpretation
* customer experience patterns
* career evidence
* project retrospectives
* operating reviews
* sensitive organisational context

## Agent Rules

Strategic OS agents must follow these rules.

Agents should:

* summarise safely
* abstract sensitive detail
* separate evidence from assumptions
* identify uncertainty
* recommend human review when sensitivity exists
* avoid storing raw source material
* respect folder-level storage rules
* stay within autonomy boundaries
* flag Level 5 human-approval triggers

Agents must not:

* copy confidential material into repo files
* infer private motives as fact
* convert sensitive information into permanent notes without review
* present governed data without caveats
* replace human judgement on sensitive matters
* make commitments on behalf of the user
* treat draft advice as approved advice

## Cross-Tool Rules

Strategic OS may connect conceptually to other tools, but each tool has a boundary.

| Tool                     | Role                            | Boundary                                                            |
| ------------------------ | ------------------------------- | ------------------------------------------------------------------- |
| GitHub                   | Personal knowledge repository   | Do not store raw confidential organisational records                |
| Databricks / Genie       | Governed data interrogation     | Do not copy raw sensitive outputs into GitHub                       |
| Power BI                 | Reporting source of truth       | Reference definitions and caveats, not screenshots or exports       |
| SharePoint / OneDrive    | Organisational document storage | Leave official documents in official storage                        |
| Teams / Email / Calendar | Operational coordination        | Summarise actions, do not copy private threads                      |
| Miro                     | Visual collaboration            | Store safe summaries or exported public-safe artefacts only         |
| Jira                     | Delivery tracking               | Store lessons or decision logic, not full operational records       |
| Slack or chat tools      | Fast coordination               | Capture only safe actions, lessons or decisions                     |
| Relevance AI / Make.com  | Automation and workflow support | Do not automate storage of sensitive source material without review |

## Quarterly Review

During quarterly repository hygiene review, check:

* Are any files storing material that should be removed?
* Are sensitive details abstracted?
* Are assumptions marked?
* Are old drafts still needed?
* Are indexes exposing too much information?
* Are analytics caveats still accurate?
* Are career evidence files safe and useful?
* Are project folders free from raw confidential source material?
* Are Chief of Staff temporary outputs being deleted or kept only when useful?
* Are Domain Analytical Agent outputs stored with source rules and caveats?
* Are any files better suited to official organisational systems?

## Success Measures

This framework is working when:

* Strategic OS remains safe to maintain
* useful knowledge is retained without duplicating source systems
* sensitive information is abstracted or excluded
* assumptions are visible
* decision logic is reusable
* career evidence is credible and safe
* analytics interpretation includes caveats
* stakeholder patterns preserve trust
* temporary operating notes do not create clutter
* files remain useful over time

## Failure Modes

This framework is failing if:

* raw organisational documents are copied into the repo
* customer-level details appear in files
* sensitive stakeholder commentary is retained
* assumptions are presented as facts
* analytics outputs lack caveats
* career evidence includes unsafe details
* project folders become shadow records
* old sensitive drafts remain in the repository
* Chief of Staff outputs become permanent task clutter
* Databricks or Genie outputs are stored without source rules
* the repo becomes risky to maintain or share

## Minimal Use Rule

When in doubt, store less.

Keep the pattern, not the private detail.

Keep the decision logic, not the confidential source.

Keep the learning, not the raw record.
