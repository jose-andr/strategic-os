# Analytics Index

## Purpose

This index tracks analytics domains, interpretation patterns, metric caveats and data-agent support files stored in `11_analytics/`.

Use it to make analytics-related Strategic OS knowledge easier to find, review and reuse.

The index supports the Strategic OS North Star:

> Increase strategic opportunities by helping leaders make better strategic decisions.

This is not a data catalogue.

It is not a reporting source of truth.

It is a lightweight navigation aid for analytics interpretation, source rules, caveats and decision-support patterns.

## What To Index

Index analytics domains or files that:

- define metric caveats
- clarify source rules
- support governed data interpretation
- help review Databricks or Genie outputs
- support analytics-enabled decision-making
- define domain-agent context
- clarify source hierarchy
- explain known limitations
- support consistent analytical reasoning
- may be reused across decisions or projects

Do not index:

- raw data exports
- customer-level records
- governed datasets
- screenshots of restricted dashboards
- copied Power BI tables
- raw Databricks query outputs
- confidential operational data
- sensitive metric breakdowns
- material that belongs only in official systems

## Analytics Index

| Domain | Folder | Status | Primary Use | Key Files | Review Date |
| --- | --- | --- | --- | --- | --- |
|  |  | Active |  |  |  |

## Status Values

Use simple status values.

| Status | Meaning |
| --- | --- |
| Captured | Domain or pattern identified but not yet structured |
| Shaping | Being developed or clarified |
| Active | Current and useful |
| Needs review | Requires source, caveat or governance review |
| Superseded | Replaced by newer source rules or domain guidance |
| Archived | Retained for history only |

## Field Guidance

## Domain

Use a clear, privacy-safe analytics domain name.

Good examples:

- service-account
- channel-performance
- customer-contact
- case-management
- digital-containment
- cost-to-serve
- complaints-insights

Avoid:

- confidential program names
- customer identifiers
- named stakeholder issues
- sensitive internal issue names
- governed dataset names that should not be exposed

## Folder

Use the exact folder path.

Example:

`11_analytics/service-account/`

## Status

Use one of the standard status values.

## Primary Use

Describe what this analytics domain supports.

Examples:

- service account review
- metric interpretation
- Genie consistency check
- dashboard caveat review
- governed source hierarchy
- decision-support analysis
- project analytics support

## Key Files

List the most useful files in the domain.

Examples:

- `agent_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `genie_context.md`
- `metric_caveats.md`
- `source_rules.md`

## Review Date

Use the next date this analytics domain should be reviewed.

Use ISO format:

`YYYY-MM-DD`

Leave blank if no review is scheduled.

## Recommended Analytics Domain Pattern

A mature analytics domain may include:

- `README.md`
- `agent_context.md`
- `agent_review_prompt.md`
- `agent_consistency_check.md`
- `genie_context.md`
- `metric_caveats.md`
- `source_rules.md`
- `review_log.md`

Use only the files that create value.

Do not create empty structure for its own sake.

## Analytics Domain Types

Use these types where helpful.

| Domain Type | Description |
| --- | --- |
| Metric Interpretation | Clarifies how a metric should be understood |
| Source Rules | Defines source hierarchy and source-of-truth logic |
| Genie Context | Provides safe context for Databricks Genie interactions |
| Agent Review | Supports analytics-agent review or consistency checking |
| Caveat Library | Captures known limitations, exclusions or interpretation risks |
| Decision Support | Connects analytics interpretation to a decision or recommendation |
| Dashboard Interpretation | Helps explain Power BI or reporting views without copying data |
| Project Analytics | Supports a specific project with safe interpretation guidance |

## Source-Of-Truth Rules

Analytics work must respect source boundaries.

| Information Type | Source Of Truth |
| --- | --- |
| Governed data | Databricks or approved governed data platform |
| Approved dashboards | Power BI |
| Official organisational records | SharePoint / OneDrive or approved organisational storage |
| Delivery records | Jira or approved delivery system |
| Strategic OS analytics guidance | GitHub |
| Metric caveats and interpretation notes | `11_analytics/` |
| Raw operational data | Official systems only |

Strategic OS may store interpretation guidance.

Strategic OS must not store raw governed data.

## Review Rhythm

Review this index during:

- monthly analytics review, where relevant
- project analytics review
- quarterly Strategic OS QA assessment
- Databricks or Genie reliability review
- source-rule change review

Do not review it more often than it creates value.

## Analytics Review Questions

Use these questions when reviewing an analytics domain.

### Source

- What is the source of truth?
- Are source rules clear?
- Has the source hierarchy changed?
- Are governed sources separated from contextual signals?
- Are official dashboards referenced without copying restricted content?

### Caveats

- Are caveats visible?
- Are exclusions clear?
- Are metric definitions stable?
- Are confidence levels appropriate?
- Are interpretation limits stated?

### Decision Use

- What decision does this analysis support?
- What should not be concluded from this data?
- What assumptions are being made?
- What human review is required?
- What next action does the analysis support?

### Governance

- Is raw data excluded?
- Are customer-level records excluded?
- Are restricted screenshots excluded?
- Are governed datasets kept in official tools?
- Are sensitive breakdowns avoided?
- Is the file safe to commit?

## Reuse Opportunities

Analytics patterns may later become:

- decision brief caveats
- project analytics guidance
- dashboard interpretation notes
- metric review prompts
- Genie context improvements
- agent consistency checks
- lessons learned
- reusable frameworks
- source hierarchy rules
- career evidence of analytics-enabled decision support

## Privacy And Governance Guidance

Analytics indexes should never expose sensitive data.

Do not include:

- customer-level records
- raw operational data
- governed dataset extracts
- sensitive metric breakdowns
- confidential dashboard screenshots
- private stakeholder commentary
- restricted source details
- query outputs copied from Databricks or Genie

Use safe abstractions.

Instead of:

`raw contact-centre customer table`

Use:

`customer-contact-source-rules`

Instead of:

`dashboard screenshot showing team-level underperformance`

Use:

`dashboard-interpretation-caveats`

Instead of:

`Genie output for customer case data`

Use:

`genie-context-for-safe-metric-review`

## Quality Check Before Indexing

Before adding an analytics domain or file to the index, check:

- Is this worth finding again?
- Is the domain name privacy-safe?
- Is the status accurate?
- Is the source of truth clear?
- Are caveats visible?
- Is raw data excluded?
- Is the file useful for decision support?
- Does the file belong in Strategic OS rather than an official system?
- Could this support a future project, decision brief or QA review?

## Success Measures

This index is working when:

- analytics domains are easy to find
- source rules are visible
- caveats are not lost
- Databricks and Genie outputs are reviewed consistently
- Power BI remains the reporting source of truth
- Strategic OS stores interpretation rather than raw data
- analytics work supports better decisions
- quarterly QA review is easier

## Failure Modes

This index is failing if:

- raw data is stored in Strategic OS
- governed metrics are copied without caveats
- source rules are unclear
- contextual signals are treated as governed truth
- sensitive breakdowns appear in file names or notes
- domains are not reviewed after source changes
- analytics files become disconnected from decisions
- the index becomes harder to maintain than useful

## Minimal Use Rule

Index analytics knowledge that helps future interpretation or decision-making.

Do not index data.

A useful analytics index is better than a complete catalogue.
