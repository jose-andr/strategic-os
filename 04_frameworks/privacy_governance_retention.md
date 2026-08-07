# Privacy, Governance And Retention

## Purpose

This framework defines what can and cannot be stored in Strategic OS.

Strategic OS is a personal strategic operating system. It should preserve reusable knowledge, decision logic, frameworks, safe summaries, patterns, reflections and career evidence.

It should not become a shadow organisational record system.

The purpose of this framework is to protect:

- customers
- stakeholders
- the user
- the organisation
- governed data sources
- confidential work
- the long-term usefulness of the repository

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Privacy, governance and retention rules protect the North Star by keeping the system safe, reusable and trustworthy.

## Core Principle

Store reusable knowledge, not raw organisational source material.

Strategic OS should capture:

- what was learned
- how decisions were framed
- what patterns emerged
- what assumptions were tested
- what can be reused
- what capability was demonstrated
- what caveats should be remembered

Strategic OS should not duplicate confidential systems of record.

## Storage Architecture

GitHub is the authoritative store for durable Strategic OS knowledge.

Obsidian is a workspace over that Markdown knowledge.

Slack and agent runtimes are interaction and reasoning surfaces.

This means privacy rules apply across all Strategic OS surfaces, not only GitHub.

Do not assume that material is safe merely because it is stored locally in Obsidian, temporarily in Slack, or inside an agent memory layer.

## What Strategic OS Can Store

Strategic OS may store:

- privacy-safe summaries
- reusable frameworks
- templates
- decision logic
- lessons learned
- non-sensitive career evidence
- abstracted stakeholder patterns
- project reflections
- safe opportunity notes
- prompt patterns
- agent specifications
- autonomy and escalation rules
- governance caveats
- analytics interpretation guidance
- metric caveats
- source rules
- personal operating principles
- public or non-sensitive reference material
- links or references to official systems where safe
- Obsidian metadata or links that improve navigation without exposing sensitive material

## What Strategic OS Must Not Store

Do not store:

- customer personal information
- customer-level records
- raw organisational datasets
- credentials
- access tokens
- client secrets
- private employee records
- raw HR material
- sensitive stakeholder commentary
- confidential organisational documents
- unredacted screenshots
- restricted system extracts
- raw email, Teams or Slack threads
- governed dashboard exports
- raw Databricks or Genie outputs containing sensitive information
- material whose retention would create a shadow system of record

These restrictions apply to GitHub, Obsidian, agent memory and automated workflows.

## Obsidian-Specific Rules

Obsidian does not create a privacy exception.

The vault should contain only material appropriate for Strategic OS retention.

Do not use local-only Obsidian notes as a hidden store for material that would be inappropriate in the repository.

If temporary scratch material contains sensitive information:

- minimise it
- abstract it as early as possible
- do not link it broadly
- do not sync or commit it
- delete it when the immediate purpose is complete

Obsidian plugins must not be assumed safe by default.

Before enabling a plugin that reads, indexes, syncs or sends vault content externally, consider:

- what content it can access
- whether it sends content to third parties
- where data is processed
- whether credentials are required
- whether data is retained externally
- whether the plugin is necessary

Prefer the smallest plugin set required for useful operation.

## Slack-Specific Rules

Slack is an interaction surface, not durable Strategic OS memory.

Do not treat raw Slack history as repository-ready knowledge.

When a conversation contains reusable value:

1. identify the useful insight
2. remove unnecessary identifying or sensitive details
3. separate evidence from interpretation
4. review the result
5. store only the safe durable knowledge object

## Agent Memory Rules

Agent memory must not become a shadow archive.

Retain only information that is:

- necessary
- proportionate
- safe
- useful
- intentionally approved for persistence

Do not retain sensitive raw context merely to improve convenience.

## Privacy-Safe Abstraction

Use abstraction when the learning is valuable but the source material is sensitive.

### Unsafe

`A named stakeholder said a specific team repeatedly failed vulnerable customers.`

### Safer

`There may be a cross-team handover risk where vulnerability indicators require continuity and clear ownership.`

### Unsafe

`Customer case 12345 waited 18 days and called three times.`

### Safer

`A repeated-contact pattern may indicate that customers are not receiving clear status visibility after lodging a request.`

### Unsafe

`The internal dashboard shows Team X has the worst resolution rate.`

### Safer

`Resolution performance varies across teams and should be interpreted with agreed metric definitions, caveats and governance context.`

## Governance Boundaries

Strategic OS is not a replacement for official systems.

Official systems remain the source of truth for:

- organisational records
- customer records
- operational data
- legal or policy documents
- HR records
- procurement records
- financial records
- governed reporting
- formal project documentation
- official decisions
- approved communication records

Strategic OS may reference official material when safe, but should not copy confidential content from those systems.

## Analytics And Data Rules

For analytics-related work, Strategic OS may store:

- metric definitions
- caveats
- interpretation guidance
- source hierarchy rules
- safe analytical notes
- reusable review prompts
- known limitations
- decision-support framing
- data quality notes
- reviewed analytical assumptions

Strategic OS must not store:

- raw data exports
- customer-level data
- copied operational datasets
- governed metrics without source caveats
- screenshots of restricted dashboards
- sensitive query outputs
- confidential data extracts
- raw Databricks or Genie transcripts where sensitive data appears

When using analytics, clearly label:

- source
- definition
- numerator and denominator where relevant
- grain
- filters
- caveat
- confidence
- whether the metric is governed, contextual or directional
- whether interpretation needs human review

## Source-Of-Truth Rule

Use the originating official system when the question requires the official record.

Use Strategic OS when the question requires:

- reusable interpretation
- a framework
- a decision model
- a lesson
- a safe pattern
- a caveat
- a strategic synthesis

Use Obsidian to navigate Strategic OS knowledge, not to override source ownership.

## Human Review

Human review is required before durable retention when material involves:

- stakeholder sensitivity
- confidential organisational context
- career or HR implications
- governed data
- external publication
- legal, policy or compliance interpretation
- customer impacts
- formal decisions
- reputational consequences

## Chief Of Staff Output Rules

Most Chief of Staff outputs should remain temporary.

Do not retain routine:

- daily briefings
- admin task lists
- follow-up trackers
- calendar notes
- reminder lists
- low-value operating notes

Store only when the output creates durable value, such as:

- decision context
- project continuity
- strategic opportunity signal
- reusable lesson
- stakeholder pattern
- career evidence
- risk or blocker requiring later review

If a daily or weekly operating note contains sensitive information, generalise it before storing or do not store it.

## Retention Rules

Strategic OS should retain material only while it remains useful, safe and appropriate.

### Keep

Keep files that are:

- reusable
- decision-relevant
- career-relevant
- privacy-safe
- framework-level
- template-level
- useful for future projects
- useful for quarterly review
- useful for understanding system evolution
- useful for analytical caveat or source-rule reuse

### Archive

Archive files that are:

- superseded but useful for history
- old versions with learning value
- closed project summaries
- completed assessments
- outdated drafts with reference value
- inactive opportunities with a clear revisit trigger

### Delete

Delete files that are:

- sensitive
- unsafe
- duplicated
- low value
- misleading
- no longer useful
- raw source material
- confidential extracts
- temporary task noise
- likely to create risk if retained

## Review Before Commit Or Sync

Before committing or synchronising a durable file, check:

- Does this contain raw organisational source material?
- Does this contain customer-level information?
- Does this contain sensitive stakeholder commentary?
- Does this contain confidential extracts?
- Does this copy operational data from a system of record?
- Does this include private HR or employee information?
- Does this include raw Databricks, Genie or Power BI output?
- Does an Obsidian plugin expose this content externally?
- Are assumptions clearly marked?
- Is evidence separated from interpretation?
- Is the file useful beyond the immediate moment?
- Is GitHub the intended authoritative destination?
- Should this be deleted instead?

## Review Rhythm

Review privacy, governance and retention at least quarterly and whenever a new integration, agent-memory mechanism, Obsidian plugin or synchronisation method is introduced.

## Final Rule

Strategic OS should remember the reusable lesson, not retain the sensitive source.

Obsidian improves access to the knowledge.

It does not change what is safe to keep.
