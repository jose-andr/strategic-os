# Enterprise AI Agent Capability Assessment

## Purpose

Test what approved enterprise AI agents can do for recurring Strategic OS-related work.

Focus on:
1. automating or preparing repetitive administrative tasks;
2. locating authoritative organisational policy and guidance; and
3. exploiting each platform's native strength.

Do not assess creativity or design quality.

## Operating model under test

| Platform | Native strength | Strategic OS support role |
|---|---|---|
| Microsoft 365 Copilot / Agent Builder | Microsoft 365 work context | Personal administration, meetings, email, calendar, policy retrieval, specialist admin agents |
| Atlassian Rovo | Jira and Confluence | Project governance, decision retrieval, delivery status, policy/process retrieval |
| Databricks Genie | Governed data | Metric retrieval, diagnostic evidence, repeatable analytical preparation |
| Miro AI / Sidekick | Existing board content | Extract actions, decisions and structured summaries |

## Test record

For each test record:

**Platform:**  
**Capability:**  
**Native source:**  
**Recurring work:**  
**Capability status:**  
**Authoritative source visible:** Yes / No / Not applicable  
**Read capability:** Confirmed / Restricted / Unknown  
**Prepare capability:** Confirmed / Restricted / Unknown  
**Write / action capability:** Confirmed / Restricted / Unknown  
**Human steps removed:**  
**Approval / licence dependency:**  
**Ongoing management burden:** Low / Medium / High / Unknown  
**Privacy / source-of-truth boundary:**  
**Strategic OS role:**  
**Decision:** Adopt / Adopt for narrow use / Pilot / Defer / Do not rely on / Reject  
**Safe observation:**  

---

# Microsoft 365 Copilot / Agent Builder

## M1 — Organisational policy finder

Ask:

> Find the current organisational guidance for [topic]. Identify the authoritative source, where it is stored, its status or date if visible, and the practical implications for my work. Do not rely on general Microsoft guidance where an internal source exists.

Test:
- source discovery;
- provenance;
- current vs superseded material;
- internal vs external distinction;
- practical summary.

Adopt if Copilot materially reduces policy search effort while keeping the source visible.

## M2 — Daily administrative briefing

Ask:

> Based on the Microsoft 365 information I am authorised to access, identify the meetings, email threads, follow-ups and unresolved actions that need my attention today. Group them by urgency and show the source for each item.

Test:
- calendar awareness;
- email awareness;
- meeting context;
- action identification;
- source visibility;
- task preparation.

Adopt only if it reduces manual checking across multiple Microsoft apps.

## M3 — Meeting follow-up preparation

Ask for:
- agreed actions;
- owners;
- unresolved questions;
- decisions;
- follow-up message draft;
- tasks ready for manual creation.

Do not assess writing style.

Adopt if it reduces note-processing and follow-up administration.

## M4 — Specialist admin agent

Test whether Agent Builder can encode one narrow recurring routine such as:
- meeting follow-up preparation;
- policy lookup;
- weekly work review.

Record:
- persistent instructions;
- approved knowledge sources;
- tools/actions;
- sharing restrictions;
- authentication maintenance;
- repeated prompting removed.

Adopt only when setup produces simpler recurring work.

---

# Atlassian Rovo

## R1 — Project control summary

Ask:

> Summarise the current state of [project]. Separate open decisions, blocked or overdue work, risks, dependencies and actions requiring attention. Cite the relevant Jira or Confluence source for each item.

Adopt if it reduces manual project-status reconciliation.

## R2 — Decision traceability

Ask:

> Find recorded decisions about [topic]. Show where each decision is documented and identify Jira work that appears affected by it.

Adopt if it reliably reduces manual decision archaeology.

## R3 — Documentation-to-delivery drift

Ask:

> Compare the agreed outcomes and current priorities in Confluence with active Jira work. Identify important outcomes with no visible delivery activity and active work that does not clearly map to documented project intent.

Pilot if it produces a useful exception list for human review.

## R4 — Atlassian policy / process finder

Ask:

> Find the current approved organisational process for [topic]. Identify the authoritative Confluence page, page status and owner if visible. Flag conflicting or superseded pages rather than reconciling them yourself.

Adopt if it finds authoritative guidance with provenance.

## R5 — Governance admin preparation

Test preparation of:
- decision-log candidates;
- RAID updates;
- blocked-work summaries;
- stakeholder follow-up lists;
- sprint or delivery summaries.

Adopt for narrow use when preparation is faster than manual assembly.

---

# Databricks Genie

## G1 — Repeatable metric pack

Use a governed metric.

Ask for:
- metric definition;
- numerator;
- denominator;
- source table or governed object;
- grain;
- filters;
- current period;
- comparison period;
- change;
- caveats.

Adopt when source-aligned, denominator-safe and repeatable.

## G2 — Diagnostic breakdown

Ask:

> Which dimensions account for most of the observed change in [metric]?

Test useful breakdowns such as service, channel, customer type, status, period or geography where appropriate.

Adopt when it reliably prepares diagnostic evidence for human interpretation.

## G3 — Metric-definition finder

Ask:

> What governed definition, source, grain and filters should be used for [metric]?

Use when it improves metric consistency.

## G4 — Recurring leadership evidence preparation

Test whether Genie can repeatedly prepare:
- metric;
- comparison;
- diagnostic breakdown;
- anomaly;
- caveat;
- source.

Strategic interpretation remains human / Strategic OS work.

---

# Miro AI / Sidekick

## MI1 — Action extraction

Select existing board content and ask:

> Extract only actions explicitly supported by the selected content. Include owner and timing only where present. Put uncertain items in a separate "needs confirmation" section.

Adopt for narrow use if it reduces board cleanup without inventing commitments.

## MI2 — Decision extraction

Ask:

> Identify decisions explicitly present in the selected content. Separate confirmed decisions from proposals, questions and unresolved items.

Adopt for narrow use if verification is fast.

## MI3 — Board-to-handoff summary

Request:
- confirmed decisions;
- actions;
- owners where stated;
- unresolved questions;
- dependencies where explicit;
- items requiring clarification.

Adopt when this shortens transfer from board work into Jira, Confluence or meeting follow-up.

---

# Cross-platform comparison

| Capability | Copilot | Rovo | Genie | Miro AI | Preferred owner |
|---|---|---|---|---|---|
| Organisational policy retrieval | Test | Test where Confluence-hosted | Not primary | Not primary | Pending |
| Meeting follow-up preparation | Test | Not primary | Not primary | Not primary | Pending |
| Email / calendar administration | Test | Not primary | Not primary | Not primary | Pending |
| Jira / Confluence project control | Secondary | Test | Not primary | Not primary | Pending |
| Decision traceability in project systems | Secondary | Test | Not primary | Not primary | Pending |
| Governed metric retrieval | Secondary only | Not primary | Test | Not primary | Pending |
| Diagnostic analytics | Not primary | Not primary | Test | Not primary | Pending |
| Board action / decision extraction | Not primary | Not primary | Not primary | Test | Pending |
| Write / execute actions | Test restrictions | Test restrictions | Test restrictions | Test restrictions | Pending |

## Selection rule

Choose a preferred platform owner when it:
1. has the strongest native source access;
2. preserves provenance;
3. removes meaningful recurring manual work;
4. needs the least integration or maintenance;
5. works within organisational controls;
6. keeps human review proportionate.

Do not duplicate capability across platforms unless a second implementation solves a distinct need.

## Target operating model

> Enterprise agents retrieve, summarise and prepare inside approved organisational systems. Humans review and act. Strategic OS retains only reusable interpretation, decisions, caveats and operating patterns.

The assessment succeeds when it produces a small number of dependable routines, not a large catalogue of possible AI features.
