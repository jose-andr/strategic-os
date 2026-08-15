# Enterprise AI Agent Capability Assessment — Context

## Background

The organisation provides multiple enterprise AI capabilities across existing organisational systems.

The objective of this assessment was not to identify one universal AI assistant.

It was to determine which existing enterprise AI capabilities can remove recurring administration or improve organisational information retrieval while preserving:

- organisational systems of record;
- human accountability;
- privacy and governance;
- low ongoing management burden.

## Working assumptions

The assessment assumed a conservative and risk-averse organisational environment.

Therefore:

- read and retrieval capabilities are more likely than autonomous execution;
- write actions may be restricted;
- connectors may require approval;
- humans remain responsible for decisions and final actions;
- organisational information should remain in approved organisational systems;
- creativity and design should remain human-led;
- an agent can still be valuable without autonomous execution.

## Assessment focus

The exploration concentrated on:

1. recurring administrative work;
2. organisational policy and process navigation;
3. native-system strengths;
4. low management burden.

It intentionally deprioritised:

- generic response-quality comparisons;
- creativity;
- design generation;
- broad brainstorming;
- building custom agents without a demonstrated operational need.

## Findings

### CoMpanion

CoMpanion is an organisation-created agent available through Microsoft Teams and other approved Microsoft surfaces.

Observed and agent-reported organisational knowledge sources include:

- CoMWeb;
- Service Hub;
- Salesforce Knowledge;
- selected approved organisational knowledge sources;
- selected external resources where relevant.

Additional sources claimed by the agent include organisational operational systems and knowledge repositories. These should be treated as agent-reported until directly validated through use.

CoMpanion demonstrated useful internal process retrieval through the software and access-request test.

It was able to:

- distinguish different request types;
- identify relevant internal knowledge sources;
- provide direct Service Hub pathways;
- identify Technology Engagement requirements;
- distinguish software, access and system-specific processes;
- surface role or approval constraints where available.

CoMpanion explicitly states that it does not:

- create or update organisational content;
- create or update accounts;
- modify permits;
- create documents;
- perform administrative actions;
- make decisions that affect individuals.

Its strongest role is therefore organisational navigation rather than execution.

### Microsoft 365 Copilot in Teams

Microsoft 365 Copilot capabilities were explored specifically in relation to Teams activity.

Observed Teams meeting configuration showed:

- Copilot can be available during and after meetings;
- this setting may be organisation-controlled;
- transcription can be enabled;
- transcription does not currently default on for every newly created meeting;
- no user-accessible meeting template was available to remove this recurring setup step.

Generic Copilot Chat was also tested for internal organisational policy retrieval.

It did not demonstrate access to the internal organisational repositories required for that role and instead returned publicly available external guidance.

Therefore, broad organisational policy retrieval should not be assigned to generic Copilot Chat where CoMpanion provides more direct approved organisational access.

The preferred Copilot role is:

> Teams meeting and chat activity management.

### Custom Copilot agent exploration

Microsoft Agent Builder was available.

The explored configuration surface supported instructions, knowledge and other lightweight agent configuration.

The exploration did not provide sufficient evidence that a user-created agent could reliably:

- create Teams meetings;
- change meeting transcription settings;
- automate meeting-option configuration;
- perform useful post-meeting execution;
- remove enough administration to justify another maintained agent.

The proposed custom "Meeting Admin" agent is therefore not being pursued.

This is a deliberate scope decision rather than a claim that Microsoft cannot technically support more advanced automation.

Revisit only if real work exposes a recurring gap and approved capabilities become available.

### Databricks Genie

Databricks Genie has already been tested through existing analytics work.

Its established role is:

> governed analytics and evidence retrieval.

The assessment does not duplicate that work.

Existing Strategic OS analytics rules remain applicable, including:

- source alignment;
- denominator safety;
- metric-definition discipline;
- caveated interpretation;
- separation of governed metrics from exploratory diagnostics.

### Atlassian Rovo

Rovo is available in the organisational environment.

No generic capability assessment is required now.

It will be assessed later through real Jira and Confluence project workflows where its native context provides a meaningful advantage.

### Miro AI / Sidekick

Miro AI / Sidekick is available in the organisational environment.

It will be assessed later in real Miro/project workflows.

The focus should remain narrow:

- extraction;
- summarisation;
- action identification;
- decision identification;
- administrative handoff.

Do not assess it as a substitute for human creativity, workshop design or visual design judgement.

## Resulting operating model

### CoMpanion

Use for:

> internal organisational process, policy and service navigation.

### Microsoft 365 Copilot in Teams

Use for:

> meeting and chat activity management.

### Databricks Genie

Use for:

> governed analytics and evidence.

### Rovo

Assess later for:

> Jira and Confluence project workflows.

### Miro AI

Assess later for:

> Miro board workflow administration.

### Strategic OS

Use for:

> reusable interpretation, strategic reasoning, decisions, patterns and lessons.

### Human

Retain responsibility for:

- judgement;
- decisions;
- creativity;
- design;
- stakeholder communication;
- final validation.

## Architecture principle

Do not force enterprise AI capabilities into a single unified agent.

Prefer the existing approved tool closest to the authoritative source and task.

> Native access + low administration + human review is preferable to duplicated cross-platform automation.

## Privacy boundary

Do not store in Strategic OS:

- raw internal policies;
- emails;
- meeting transcripts;
- customer or staff personal information;
- Service Hub content;
- raw Jira or Confluence records;
- Miro board exports;
- governed organisational datasets;
- sensitive configuration;
- credentials.

Strategic OS may retain:

- safe capability observations;
- decisions;
- caveats;
- reusable patterns;
- management-burden findings;
- lessons learned.
