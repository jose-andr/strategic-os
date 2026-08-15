# Enterprise AI Agent Capability Assessment — Stakeholder Notes

## Purpose

Capture safe, generalised governance and stakeholder considerations that affect enterprise AI use.

## Working organisational posture

Assume a conservative risk posture until evidence shows otherwise.

Favour:
- read access before write access;
- preparation before autonomous action;
- existing approved systems before new integrations;
- explicit provenance;
- narrow use cases;
- human review;
- reversible workflows.

## Stakeholder questions

### Microsoft 365 / IT administration
- Which Copilot capabilities are licensed?
- Which agent-building capabilities are enabled?
- Which connectors or actions are permitted?
- Can agents write to organisational systems or only retrieve?

### Atlassian administration
- Which Rovo sources and connectors are enabled?
- Can Rovo agents access both Jira and Confluence?
- Can agents be used in Jira automation?
- Which write actions are restricted?
- Are policy spaces indexed and authoritative?

### Data / Databricks governance
- Which Genie spaces are governed for business use?
- Which metric definitions are authoritative?
- Can Genie expose source, grain, filters and metric logic?

### Privacy / records / information security
- What policy governs AI use?
- What guidance applies to meeting transcripts and summaries?
- What information may be used with enterprise agents?
- Which generated outputs become organisational records?
- Which integrations or connectors are prohibited?

## Engagement rule

Do not begin broad governance discovery before a concrete use case exposes a dependency.

Use:
1. identify a recurring task;
2. test the visible capability;
3. record the exact restriction;
4. ask the smallest governance or admin question needed;
5. update the decision.
