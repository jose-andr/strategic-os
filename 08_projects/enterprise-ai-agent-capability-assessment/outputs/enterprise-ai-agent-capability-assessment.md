# Enterprise AI Agent Capability Assessment

## Status

**Initial assessment:** Complete

The purpose of this assessment was to identify a small number of practical enterprise AI uses that reduce administration or improve access to organisational information.

The goal was not to catalogue every AI capability available in the organisation.

## Assessment result

| Capability | Platform | Result | Decision |
|---|---|---|---|
| Internal organisational process navigation | CoMpanion | Proven useful | Adopt |
| Internal policy and guidance navigation | CoMpanion | Strong fit based on internal knowledge access; validate source where material | Adopt |
| Internal forms and service pathways | CoMpanion | Proven useful | Adopt |
| Teams meeting activity management | Microsoft 365 Copilot | Available | Adopt for narrow use |
| Teams chat activity management | Microsoft 365 Copilot | Available capability | Adopt for narrow use |
| Broad internal policy search through generic Copilot Chat | Microsoft 365 Copilot | Internal source access not demonstrated | Do not rely on |
| Custom Teams Meeting Admin agent | Copilot Agent Builder | Insufficient execution capability demonstrated | Reject |
| Governed analytics | Databricks Genie | Already tested in analytics work | Continue |
| Jira / Confluence AI workflow | Atlassian Rovo | Not assessed in this phase | Defer to project workflow |
| Miro board AI workflow | Miro AI / Sidekick | Not assessed in this phase | Defer to project workflow |

## CoMpanion

### Role

> Internal organisational process, policy and service-navigation agent.

### Capability evidence

CoMpanion demonstrated useful internal process retrieval for software and system-access requests.

It was able to identify and distinguish:

- new software requests;
- contractor access;
- licensed software requests;
- Microsoft product requests;
- Adobe software purchasing;
- other software purchasing;
- network-account pathways;
- Salesforce access;
- Pathway support;
- Aurion access;
- Jira / Confluence access;
- Technology Engagement Requests.

It surfaced internal sources and direct organisational request pathways.

Sources used in the observed test included:

- CoMWeb;
- Ivanti / Service Hub knowledge;
- approved organisational source material exposed through CoMpanion.

### What CoMpanion can support

Use it for questions such as:

- What is the approved process for this?
- Which internal system should I use?
- Which form should I submit?
- What access request is required?
- What role or approval is needed?
- Where is the authoritative internal guidance?
- What internal source should I validate before acting?

### Execution boundary

CoMpanion states that it does not directly:

- create or update content;
- create or update accounts;
- modify permits;
- create documents;
- perform administrative actions;
- make decisions affecting individuals.

### Preferred interaction pattern

> Ask → locate source → understand process → follow link → act in system of record.

### Strategic OS decision

**Adopt.**

CoMpanion is the preferred agent for internal organisational process and policy navigation.

Do not duplicate this role with a custom Strategic OS agent.

## Microsoft 365 Copilot in Teams

### Role

> Teams activity management assistant.

### Scope

Use Copilot for:

- meeting recap;
- decision extraction;
- action and owner extraction;
- unresolved questions;
- identifying personal follow-up;
- preparing follow-up messages;
- preparing task lists;
- catching up on Teams conversations;
- meeting preparation where Teams context is available.

### Meeting configuration observed

#### Copilot

Copilot can be enabled:

> During and after the meeting.

This setting appeared organisation-controlled in the tested meeting configuration.

#### Transcription

Transcription can be configured as:

> Transcribe only.

However, a newly created meeting still defaulted to:

> Off.

No user-accessible meeting template was available to make transcription-only the default for every new meeting.

### Practical workflow

Current lowest-maintenance workflow:

1. Create Teams meeting.
2. Enable transcription where appropriate.
3. Copilot is available during and after the meeting.
4. Allow Teams to retain meeting context.
5. Use Copilot for recap, decisions, actions and follow-up preparation.
6. Human reviews and transfers required actions to the appropriate system.

### Policy-search test

Generic Copilot Chat was tested for internal AI-use guidance.

It did not demonstrate access to the necessary internal organisational repositories and returned public external guidance instead.

Therefore:

> Generic Copilot Chat should not be treated as the preferred internal organisational policy agent.

Use CoMpanion for internal organisational guidance.

### Strategic OS decision

**Adopt for narrow use.**

Copilot owns Teams activity management, not broad organisational knowledge management.

## Custom Copilot Agent Builder

### Experiment

A possible custom Meeting Admin agent was explored.

The intended workflow was:

> Create meeting → configure transcription → use meeting context → prepare recap and actions.

### Finding

The available Agent Builder surface demonstrated lightweight agent configuration but did not provide enough confirmed execution capability to justify building and maintaining the proposed agent.

There was insufficient evidence from the explored configuration that the agent could reliably:

- create and configure Teams meetings;
- enable transcription automatically;
- control Teams meeting options;
- execute useful downstream administrative actions.

### Decision

**Reject for now.**

Do not build the custom Meeting Admin agent.

Use native Teams Copilot capability first.

Revisit only if repeated work reveals a genuine gap and approved execution capability becomes available.

## Databricks Genie

### Role

> Governed analytics and evidence retrieval.

Genie has already been tested through Strategic OS analytics work.

Continue to use it for:

- governed business questions;
- metric retrieval;
- diagnostic analysis;
- source and grain validation;
- metric-definition checking;
- repeatable analytical evidence.

Do not duplicate Genie testing in this project.

Strategic OS remains responsible for turning analytical evidence into:

- interpretation;
- caveat;
- recommendation;
- decision implication.

## Atlassian Rovo

### Status

**Deferred to project workflow.**

Rovo is available in the organisational environment.

Do not conduct generic capability exploration now.

Assess it when an active Jira or Confluence workflow creates a real problem worth solving.

Likely future areas:

- project-state synthesis;
- decision traceability;
- Jira / Confluence reconciliation;
- RAID preparation;
- delivery-to-documentation alignment.

## Miro AI / Sidekick

### Status

**Deferred to project workflow.**

Miro AI is available.

Assess it later when real board activity creates administrative handoff work.

Potential narrow uses:

- action extraction;
- decision extraction;
- board summarisation;
- preparation of Jira / Confluence handoff material.

Do not rely on Miro AI for:

- creativity;
- service-design judgement;
- visual design;
- systems-thinking judgement.

These remain human-led.

## Enterprise AI operating model

Internal organisational guidance  
→ CoMpanion  
→ source + process + form  
→ human  
→ organisational system of record

Teams meetings and chats  
→ Microsoft 365 Copilot  
→ recap + actions + follow-up  
→ human  
→ appropriate work system

Governed organisational data  
→ Databricks Genie  
→ metrics + diagnostics + evidence  
→ human  
→ Strategic OS interpretation

Jira / Confluence  
→ Rovo  
→ assess later in project workflow

Miro boards  
→ Miro AI  
→ assess later in project workflow

## Final decision

Do not build a broad enterprise-AI architecture.

Use the smallest approved capability closest to the authoritative source.

Current adopted pattern:

> CoMpanion for organisational navigation.  
> Copilot for Teams activity.  
> Genie for analytics.  
> Rovo and Miro AI only when real project workflows justify testing.  
> Strategic OS for reusable interpretation and decision logic.  
> Human judgement for decisions, creativity and design.

## Assessment state

**Complete.**

Do not continue generic enterprise-AI exploration.

Future capability assessment should occur through real work.
