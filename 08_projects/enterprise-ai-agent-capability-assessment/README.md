# Enterprise AI Agent Capability Assessment

## Purpose

Assess how organisation-approved enterprise AI capabilities can reduce recurring administrative work, improve access to authoritative organisational guidance and support Strategic OS without duplicating systems of record.

The initial discovery phase is now complete.

The assessment has established a small number of useful roles rather than a broad enterprise-AI architecture.

## Decision question

Which enterprise AI capabilities should be used for which work because they:

- play to the strengths of the system they already sit within;
- reduce recurring manual administration;
- preserve authoritative organisational sources;
- work within restrictive organisational permissions and governance;
- require little ongoing configuration or maintenance; and
- avoid duplicating another platform or Strategic OS capability?

## Operating principle

Assume a conservative, risk-averse organisational environment.

Prefer:

> Retrieve → summarise → prepare → human review → action in the system of record.

Do not design around autonomous execution unless a real, approved workflow proves it is available and worthwhile.

## Current enterprise AI roles

### CoMpanion — adopted

Primary role:

> Internal organisational process, policy and service-navigation agent.

Use CoMpanion to:

- find internal processes and procedures;
- identify relevant organisational guidance;
- locate authoritative internal sources;
- find forms and Service Hub requests;
- explain role or access requirements;
- provide procedural steps;
- navigate CoMWeb, Service Hub, Salesforce Knowledge and other approved sources exposed through the agent.

CoMpanion provides guidance and navigation.

It does not create or update organisational records, accounts, permits or documents.

### Microsoft 365 Copilot in Teams — adopted for narrow use

Primary role:

> Teams activity management assistant.

Use Copilot in Teams to support:

- meeting recap;
- meeting decisions;
- actions and owners;
- unresolved questions;
- personal follow-up;
- meeting preparation where Teams context is available;
- chat catch-up;
- preparation of follow-up messages or task lists.

Do not treat generic Copilot Chat as the preferred organisational policy or process retrieval layer.

CoMpanion is better positioned for that role because it exposes approved internal organisational knowledge sources.

### Databricks Genie — existing capability

Primary role:

> Governed analytics and evidence retrieval.

Genie has already been tested through analytics work.

Continue using it for:

- governed metric retrieval;
- diagnostic analysis;
- source-aligned analytical questions;
- metric-definition checking;
- evidence preparation.

Do not duplicate the Genie assessment in this project.

### Atlassian Rovo — deferred

Rovo is available but will be evaluated later through real Jira and Confluence project workflows.

Likely areas for future testing include:

- project-state retrieval;
- decision traceability;
- Jira and Confluence reconciliation;
- project governance preparation;
- organisational process retrieval where Confluence is authoritative.

Do not create a generic Rovo test before a real project workflow requires it.

### Miro AI / Sidekick — deferred

Miro AI is available but will be evaluated later inside real Miro and project workflows.

Potential narrow uses include:

- extracting actions;
- identifying decisions;
- summarising existing board content;
- preparing handoff material.

Do not assess Miro AI as a creativity or design substitute.

## Custom Copilot agents

The proposed custom Copilot "Meeting Admin" agent is not being pursued.

Current Agent Builder exploration did not expose enough useful execution capability to justify creating and maintaining another agent.

The existing Teams Copilot capability should be used first.

Revisit custom agents only if repeated work exposes a clear task that:

- cannot be handled adequately by existing enterprise agents;
- can be automated within approved organisational controls; and
- removes more recurring administration than the agent introduces.

## Strategic OS boundary

Organisational systems remain authoritative for:

- organisational policy;
- internal procedures;
- documents;
- meetings;
- email;
- project records;
- governed analytics;
- official records.

Strategic OS retains only:

- reusable interpretation;
- decisions;
- caveats;
- operating patterns;
- safe capability findings;
- lessons learned.

Do not copy raw organisational source material into this repository.

## Current operating model

| Need | Preferred capability |
|---|---|
| Internal policy and process navigation | CoMpanion |
| Internal forms and Service Hub pathways | CoMpanion |
| Teams meeting and chat administration | Microsoft 365 Copilot in Teams |
| Governed analytics | Databricks Genie |
| Jira / Confluence AI support | Rovo — assess in project workflow |
| Miro board AI support | Miro AI — assess in project workflow |
| Strategic interpretation | Strategic OS + human judgement |
| Creativity and design | Human-led |

## Status

**Initial enterprise AI discovery: Complete**

**Next phase:** Use the adopted capabilities in normal work and only expand the model when repeated real use exposes a genuine gap.
