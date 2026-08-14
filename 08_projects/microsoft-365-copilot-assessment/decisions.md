# Microsoft 365 Copilot Capability Assessment — Decisions

## Purpose

Record material decisions arising from the Microsoft 365 Copilot capability assessment.

This file captures decisions and reusable rationale only.

Raw organisational evidence remains in approved organisational systems of record.

## Decision status

Use:

- Proposed
- Testing
- Confirmed
- Rejected
- Deferred
- Superseded

## Evidence status

Use:

- Confirmed
- Available but not enabled
- Unknown
- Restricted
- Requires licence
- Requires admin approval
- Requires user testing

## Decision criteria

A capability should be adopted only when it:

- solves a recurring business need;
- produces meaningful time, quality or decision leverage;
- works reliably within the organisational environment;
- respects existing permissions and governance;
- does not require unsafe duplication of organisational information;
- has an acceptable verification burden;
- removes more recurring administration than it introduces; and
- fits the Strategic OS source-of-truth model.

Prefer:

> complex-once, simple-to-run over simple-to-start, manually-maintained forever.

## Decisions

### D001 — Treat Microsoft 365 Copilot as an enterprise AI layer

**Status:** Confirmed

**Decision:**  
Microsoft 365 Copilot is treated as an enterprise AI capability for authorised organisational work, not as a Strategic OS source of truth.

**Rationale:**  
Organisational knowledge, records and governed data remain in approved organisational systems. Copilot may retrieve, synthesise or act on authorised information within that environment.

**Strategic OS implication:**  
Strategic OS may retain reusable interpretation, operating patterns, decisions, caveats and lessons arising from Copilot use, but not raw organisational source material.

---

### D002 — Validate tenant reality before designing around Copilot capabilities

**Status:** Confirmed

**Decision:**  
No Copilot capability will be treated as available simply because it exists in Microsoft's product catalogue.

**Rationale:**  
Actual capability depends on licence, tenant configuration, permissions, administrator controls, governance and device access.

**Assessment implication:**  
Capabilities must be classified using observable organisational evidence.

---

### D003 — Prioritise low-management operational leverage

**Status:** Confirmed

**Decision:**  
Prioritise capabilities that reduce recurring work without creating equivalent configuration, reconciliation, monitoring or maintenance effort.

**Rationale:**  
The Strategic OS architecture favours low ongoing human-management burden once a capability is configured.

**Assessment implication:**  
Every capability test must consider ongoing management burden, not only functional usefulness.

---

### D004 — Keep raw assessment evidence outside Strategic OS

**Status:** Confirmed

**Decision:**  
Raw tenant-specific evidence remains in appropriate organisational systems of record.

**Do not store in Strategic OS:**

- meeting transcripts;
- organisational emails;
- screenshots containing internal information;
- internal documents;
- sensitive tenant configuration;
- customer or staff personal information;
- credentials; or
- controlled operational extracts.

**Strategic OS may record:**

- capability status;
- safe source references;
- conclusions;
- caveats;
- management-burden observations;
- decisions; and
- reusable lessons.

---

### D005 — Test meeting support first

**Status:** Testing

**Evidence status:** Requires user testing

**Decision:**  
Teams meeting recap, transcription and action extraction will be the first capability tested.

**Reason for priority:**  
Meeting preparation, capture and follow-through are recurring administrative activities with potential for significant leverage and relatively low integration complexity.

**Test question:**  
Can the organisation's Microsoft environment reliably turn authorised Teams meeting content into useful recap, decisions and actions with acceptable verification and governance burden?

**Adoption decision:**  
Pending test.

---

### D006 — Test organisational knowledge retrieval second

**Status:** Proposed

**Evidence status:** Requires user testing

**Decision:**  
Assess whether Copilot can reliably retrieve authorised information across Microsoft 365 sources.

**Priority sources:**

- SharePoint;
- OneDrive;
- Teams;
- email; and
- cross-source retrieval where available.

**Test question:**  
Can Copilot reliably find the correct organisational source, expose provenance and reduce manual search effort enough that verification remains lightweight?

**Adoption decision:**  
Pending test.

---

### D007 — Test administrative automation only against a real recurring task

**Status:** Proposed

**Evidence status:** Requires user testing

**Decision:**  
Do not evaluate automation using hypothetical workflows alone.

Select one real, repetitive, low-risk administrative task and assess whether Copilot, Power Automate or an approved Microsoft capability materially reduces manual effort.

**Test question:**  
Does the automation remove more recurring administration than it introduces?

**Adoption decision:**  
Pending test.

## Open decisions

- whether Teams meeting recap is available and sufficiently useful;
- whether transcription is enabled and permitted;
- whether Copilot can reliably retrieve knowledge across organisational sources;
- whether Copilot Search is available;
- whether agents or Copilot Studio provide useful leverage;
- whether Power Automate is available and appropriate;
- which administrative tasks are suitable for automation;
- what licence or administrator dependencies apply;
- what governance restrictions affect use;
- what device or browser constraints apply; and
- which capabilities warrant inclusion in the normal Strategic OS operating model.

## Decision review rule

Update this file only when:

- a capability test changes an adoption decision;
- new evidence materially changes a previous conclusion;
- governance or licensing changes the feasibility of a capability; or
- repeated use reveals a durable operating lesson.

Do not use this file as a running test diary.
