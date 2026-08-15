# Enterprise AI Agent Capability Assessment — Decisions

## Purpose

Record material decisions arising from the initial enterprise AI capability exploration.

## Decision status

Use:

- Proposed
- Testing
- Confirmed
- Rejected
- Deferred
- Superseded

## Decisions

### D001 — Allocate enterprise AI by native organisational strength

**Status:** Confirmed

**Decision:**  
Do not select one enterprise AI platform as the universal Strategic OS agent.

Use each approved platform for the work it is naturally best positioned to support.

**Current allocation:**

- CoMpanion → internal organisational process, policy and service navigation;
- Microsoft 365 Copilot in Teams → Teams activity management;
- Databricks Genie → governed analytics and evidence;
- Atlassian Rovo → assess later through Jira/Confluence workflows;
- Miro AI → assess later through Miro/project workflows;
- Strategic OS → reusable interpretation, decisions, caveats and patterns.

---

### D002 — Adopt CoMpanion for internal process and policy navigation

**Status:** Confirmed

**Decision:**  
Use CoMpanion as the preferred enterprise agent for locating internal organisational processes, policies, forms, system guidance and approved service pathways.

**Evidence:**  
CoMpanion successfully retrieved detailed software and access-request pathways from internal sources and surfaced direct organisational forms, knowledge articles and relevant process variants.

**Strengths observed:**

- internal organisational source access;
- source provenance;
- procedural guidance;
- direct form and Service Hub links;
- differentiation between request types;
- role and approval information where available.

**Boundary:**  
CoMpanion provides guidance and navigation rather than execution.

---

### D003 — Do not treat CoMpanion as an automation agent

**Status:** Confirmed

**Decision:**  
Do not design workflows that assume CoMpanion can create, modify, submit or approve organisational records.

**Known boundary:**  
CoMpanion states that it cannot directly create or update content, accounts, permits or documents and does not perform administrative decisions.

**Preferred pattern:**

> Find → explain → link → human acts in the system of record.

---

### D004 — Limit Microsoft 365 Copilot to Teams activity management

**Status:** Confirmed

**Decision:**  
Use Microsoft 365 Copilot primarily to reduce administration around Teams meetings and conversations.

**Priority uses:**

- meeting recap;
- decisions;
- actions and owners;
- unresolved questions;
- personal follow-up;
- chat catch-up;
- meeting preparation;
- preparation of follow-up messages or tasks.

**Rationale:**  
This plays to Copilot's observed position inside the Teams environment without making it responsible for broader organisational knowledge retrieval.

---

### D005 — Do not use generic Copilot Chat as the preferred internal policy finder

**Status:** Confirmed

**Decision:**  
Use CoMpanion instead of generic Copilot Chat for internal organisational policy and process discovery.

**Evidence:**  
The tested generic Copilot surface did not access the required internal organisational repositories and returned publicly discoverable guidance instead.

**Implication:**  
Public regulatory or external guidance retrieved by Copilot may provide useful context but should not be treated as confirmed internal organisational policy.

---

### D006 — Use Teams transcription selectively to support post-meeting Copilot

**Status:** Confirmed

**Decision:**  
Where appropriate and permitted, use transcription to create persistent Teams meeting context for post-meeting recap and follow-up.

**Observed configuration:**

- Copilot can be configured for use during and after meetings;
- transcription can be enabled;
- transcription does not currently default on for every new meeting.

**Implication:**  
The workflow is useful but retains a manual meeting-setup step.

Do not introduce a more complex workaround unless repeated use demonstrates that this step creates material friction.

---

### D007 — Scratch the custom Copilot Meeting Admin agent

**Status:** Rejected

**Decision:**  
Do not create the proposed custom Meeting Admin agent.

**Rationale:**  
The explored user Agent Builder surface did not expose enough confirmed execution or meeting-configuration capability to justify another maintained agent.

Existing Teams Copilot capability should be used first.

**Revisit only if:**

- repeated work exposes a genuine recurring gap;
- approved execution capability becomes available;
- the agent can remove more administration than it introduces.

---

### D008 — Keep Databricks Genie as the governed analytics layer

**Status:** Confirmed

**Decision:**  
Continue using Databricks Genie for governed analytical evidence rather than duplicating analytics capability across enterprise agents.

**Role:**

- governed metric retrieval;
- diagnostic breakdowns;
- metric-definition support;
- analytical evidence preparation.

Strategic interpretation remains a human / Strategic OS responsibility.

---

### D009 — Defer Rovo assessment to project workflows

**Status:** Deferred

**Decision:**  
Do not run a generic Rovo capability test now.

Assess Rovo when active Jira or Confluence project work provides a real workflow to improve.

**Likely future tests:**

- decision traceability;
- Jira/Confluence project-state retrieval;
- project governance preparation;
- documentation-to-delivery alignment.

---

### D010 — Defer Miro AI assessment to project workflows

**Status:** Deferred

**Decision:**  
Do not run a generic Miro AI capability test now.

Assess it when an active Miro board creates a real administrative handoff problem.

**Potential narrow use:**

- action extraction;
- decision extraction;
- summarisation;
- board-to-project handoff.

Do not assess it as a creativity or design substitute.

---

### D011 — Humans retain strategic judgement and creative responsibility

**Status:** Confirmed

**Decision:**  
Enterprise agents support retrieval, preparation and administration.

Humans retain responsibility for:

- decisions;
- strategic interpretation;
- creativity;
- service and visual design;
- stakeholder judgement;
- final validation.

---

### D012 — Stop broad enterprise-AI exploration

**Status:** Confirmed

**Decision:**  
The initial enterprise-AI discovery phase is complete.

Do not continue feature exploration without a real workflow problem.

Future assessment should happen within normal project work.

**Rationale:**  
Enough capability has been identified to establish a practical operating model. Further generic exploration would increase documentation without improving current decisions.
