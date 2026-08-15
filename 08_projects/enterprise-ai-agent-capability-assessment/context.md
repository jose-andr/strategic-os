# Enterprise AI Agent Capability Assessment — Context

## Background

The organisation provides multiple enterprise AI surfaces across existing systems. The opportunity is not to choose a single "best AI", but to understand which approved agent is useful for which recurring work.

The assessment focuses on operational capability rather than creativity, design generation or generic response quality.

## Objective

Identify a simple, low-maintenance enterprise AI operating model in which each agent is used for the work it is naturally best positioned to support.

## Working assumptions

Assume:
- organisational culture is conservative and risk-averse;
- agent permissions are likely to be restricted;
- write actions may require explicit approval or remain unavailable;
- cross-system connectors may be limited;
- human review remains mandatory for material outputs;
- policies and source records stay in organisational systems;
- creativity and design remain human-led;
- automation value can still be high even when execution is manual.

## Primary use cases

### Recurring administrative work

Examples:
- meeting follow-up preparation;
- action extraction;
- status summary preparation;
- email or work-item triage;
- decision-log candidates;
- RAID update preparation;
- metric packs;
- board-to-task handoff.

### Organisational policy and guidance retrieval

Examples:
- AI use;
- privacy;
- records;
- information security;
- meeting recording or transcription;
- accessibility;
- procurement;
- customer information handling;
- approved process guidance.

The key test is whether the agent can find the authoritative source and make provenance visible.

### Native-system leverage

- Copilot → Microsoft 365
- Rovo → Jira and Confluence
- Genie → governed Databricks analytics
- Miro AI → existing board content

## Evaluation fields

For each tested capability record:
- platform;
- native system;
- recurring work supported;
- authoritative source available;
- retrieval capability;
- preparation capability;
- write / action capability;
- permission or approval dependency;
- human review required;
- manual steps removed;
- ongoing management burden;
- privacy / source-of-truth boundary;
- Strategic OS role;
- decision.

## Status vocabulary

Capability status:
- Confirmed
- Visible
- Available but restricted
- Requires user testing
- Requires admin approval
- Requires licence
- Not available
- Unknown

Decision:
- Adopt
- Adopt for narrow use
- Pilot
- Defer
- Do not rely on
- Reject

Management burden:
- Low
- Medium
- High
- Unknown

## Evidence rule

Capability presence may be confirmed from the organisational interface.

Operational capability requires a real user test.

Do not infer unrestricted access from vendor product documentation.

## Privacy rule

Do not store raw meeting transcripts, emails, organisational policy text, customer or staff personal information, bulk Jira or Confluence content, Miro exports, governed datasets, sensitive screenshots, credentials, tokens or controlled configuration.

Strategic OS may store capability status, safe source references, generalised observations, platform-role decisions, caveats, management-burden findings and reusable operating patterns.
