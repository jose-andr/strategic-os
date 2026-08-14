# Microsoft 365 Copilot Capability Assessment

## Purpose

Record the current privacy-safe assessment of Microsoft 365 Copilot capabilities in the organisational environment.

This is the working assessment output.

Do not paste raw organisational evidence into this file.

## Assessment scale

### Availability status

- Confirmed
- Available but not enabled
- Unknown
- Restricted
- Requires licence
- Requires admin approval
- Requires user testing

### Decision

- Adopt
- Adopt with verification
- Pilot
- Defer
- Do not rely on
- Reject

### Ongoing management burden

- Low
- Medium
- High
- Unknown

## Capability assessment

| Capability | Business use | Current availability | Evidence | Licence / admin dependency | Privacy / governance | Automation potential | Management burden | Strategic OS role | Recommended test | Decision |
|---|---|---|---|---|---|---|---|---|---|---|
| Teams meeting recap | Reduce manual meeting follow-up | Requires user testing | Not yet tested | Unknown | Meeting capture, transcript and records rules may apply | Medium | Unknown | Produce reviewed decisions, actions and reusable abstractions | Test on one authorised Teams meeting | Pilot pending test |
| Teams transcription | Create source material for recap and retrieval | Requires user testing | Not yet tested | Unknown | Consent, privacy and records rules may apply | Medium | Unknown | Source remains in Microsoft environment; retain only safe abstraction | Check whether transcription is enabled and permitted | Defer pending test |
| Meeting action extraction | Reduce manual action capture | Requires user testing | Not yet tested | Unknown | Human verification required | Medium | Unknown | Convert reviewed actions into existing work systems, not raw transcript storage | Ask Copilot for actions, owners and unresolved items | Pilot pending test |
| SharePoint retrieval | Find approved organisational knowledge | Requires user testing | Not yet tested | Unknown | Existing permissions must be respected | Low | Unknown | Retrieve context; Strategic OS stores reusable interpretation only | Ask a known-answer question from a known SharePoint source | Pilot pending test |
| OneDrive retrieval | Find and summarise authorised documents | Requires user testing | Not yet tested | Unknown | Existing permissions and source currency matter | Low | Unknown | Retrieve source context without copying raw documents | Ask for the latest known document and verify version | Pilot pending test |
| Teams knowledge retrieval | Find decisions and context from Teams | Requires user testing | Not yet tested | Unknown | Access and retention rules apply | Low | Unknown | Support contextual synthesis | Ask a known-answer question from a known Teams source | Pilot pending test |
| Email retrieval | Find decisions and commitments in email | Requires user testing | Not yet tested | Unknown | Email remains organisational record | Low | Unknown | Retrieve and summarise; retain only reviewed decision context | Test against a known email thread | Pilot pending test |
| Cross-source synthesis | Reduce manual searching across Microsoft 365 | Requires user testing | Not yet tested | Unknown | Permissions and source conflicts must remain visible | Medium | Unknown | High-value enterprise context layer if provenance is clear | Ask one known-answer question requiring multiple sources | Pilot pending test |
| Outlook drafting | Reduce repetitive communication effort | Requires user testing | Not yet tested | Unknown | Human review required before sending | Low | Unknown | Draft communication from authorised context | Test on a routine low-risk email | Pilot pending test |
| Calendar support | Improve preparation and prioritisation | Requires user testing | Not yet tested | Unknown | Calendar context may contain sensitive information | Low | Unknown | Support daily briefing and meeting preparation patterns | Ask for next-day meeting preparation needs | Pilot pending test |
| Document support | Summarise or draft within Microsoft 365 | Requires user testing | Not yet tested | Unknown | Source ownership and human review apply | Low | Unknown | Produce working organisational content while durable reusable patterns stay in Strategic OS | Test in one approved document workflow | Pilot pending test |
| Copilot Search | Enterprise-wide knowledge discovery | Unknown | Not yet observed | May require licence or enablement | Search scope and permissions must be understood | Low | Unknown | Potential primary retrieval surface | Check whether Copilot Search is visible and what sources it covers | Defer pending availability |
| Copilot agents | Reusable enterprise task support | Unknown | Not yet observed | Likely licence / admin dependent | Agent permissions, instructions and data access require governance | High | Unknown | Potential enterprise execution layer, not Strategic OS authority | Check agent catalogue and creation access | Defer pending availability |
| Copilot Studio | Build organisation-approved agents | Unknown | Not yet observed | Likely licence / admin dependent | Environment, connector and deployment controls apply | High | Unknown | Possible controlled enterprise automation layer | Check access and environment restrictions | Defer pending availability |
| Power Automate | Workflow automation | Unknown | Not yet observed | May require environment / connector approval | Connector, records and failure controls apply | High | Unknown | Automate approved operational handoffs where worthwhile | Test one low-risk recurring admin task | Defer pending availability |
| Admin task automation | Reduce repetitive manual administration | Requires user testing | No real task selected yet | Depends on selected capability | Must remain low risk and reviewable | High | Unknown | Reduce recurring work while preserving human decision points | Select one real repetitive task and measure steps removed | Defer pending task selection |
| Browser / device access | Ensure capability works on managed environment | Requires user testing | Not yet tested | Organisational policy dependent | Standard security controls apply | None | Low | Determines practical usability | Test required features in standard managed browser/device | Pilot pending test |
| Permission behaviour | Confirm source access boundaries | Requires user testing | Not yet tested | Tenant and identity dependent | Critical control | None | Low | Determines trustworthiness of retrieval layer | Compare retrieval from accessible and inaccessible sources | Pilot pending test |
| Governance guidance | Determine approved operating boundaries | Unknown | Guidance not yet captured | May require targeted stakeholder confirmation | Critical | None | Medium | Defines safe use boundaries | Locate current AI, privacy, records and security guidance | Defer pending evidence |

## Test 1 — Teams meeting support

**Status:** Requires user testing

### Business question

Can the organisation's Microsoft environment reliably turn authorised Teams meeting content into useful recap, decisions and actions with acceptable verification and governance burden?

### Test

Use one authorised Teams meeting for which the participant already knows the main decisions and actions.

Check:

- transcript availability;
- recap availability;
- ability to identify decisions;
- ability to identify actions;
- ability to identify owners;
- ability to identify unresolved questions;
- source grounding;
- accuracy;
- hallucination or omission risk;
- verification burden; and
- governance constraints.

### Record

**Meeting type:**  
Safe general description only.

**Transcript available:**  
Unknown

**Recap available:**  
Unknown

**Decision extraction quality:**  
Unknown

**Action extraction quality:**  
Unknown

**Owner extraction quality:**  
Unknown

**Source grounding:**  
Unknown

**Verification burden:**  
Unknown

**Governance status:**  
Unknown

**Management burden:**  
Unknown

**Decision:**  
Pending

**Privacy-safe observation:**  
Pending

## Test 2 — Organisational knowledge retrieval

**Status:** Requires user testing

### Business question

Can Copilot retrieve the right organisational source, expose provenance and reduce search and synthesis effort enough that verification remains lightweight?

### Test pattern

Use three to five questions where the correct answer and expected source are already known.

Test across:

- SharePoint;
- OneDrive;
- Teams;
- email; and
- cross-source retrieval where available.

### Record per question

**Question:**  
Safe generalisation only if needed.

**Expected source:**  
Safe source reference only.

**Source found:**  
Yes / No / Partial

**Correct source:**  
Yes / No / Partial

**Answer accurate:**  
Yes / No / Partial

**Citations or provenance visible:**  
Yes / No

**Current versus outdated content distinguished:**  
Yes / No / Unknown

**Permission behaviour:**  
Expected / Unexpected / Unknown

**Manual verification required:**  
Low / Medium / High

**Status:**  
Pending

**Decision:**  
Pending

## Test 3 — Administrative leverage

**Status:** Requires real task selection

### Business question

Can an approved Microsoft capability remove meaningful recurring administration without creating equivalent monitoring, configuration or reconciliation effort?

### Task selection rule

Choose one task that is:

- repetitive;
- low risk;
- currently manual;
- easy to verify;
- performed often enough to matter; and
- unlikely to require complex integration for the first test.

### Record

**Task:**  
Pending

**Current manual steps:**  
Pending

**Proposed Copilot / automation support:**  
Pending

**Steps removed:**  
Pending

**Human checks retained:**  
Pending

**Setup effort:**  
Pending

**Failure modes:**  
Pending

**Approval dependencies:**  
Pending

**Ongoing monitoring:**  
Pending

**Management burden:**  
Pending

**Decision:**  
Pending

## Current recommendation

Do not design the operating model around unverified Microsoft 365 capabilities.

Test meeting support first, organisational knowledge retrieval second, and administrative automation third.

Adopt only those capabilities that demonstrate recurring value, acceptable verification burden, appropriate governance and low ongoing management overhead.
