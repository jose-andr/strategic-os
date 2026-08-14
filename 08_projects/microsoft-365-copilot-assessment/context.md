# Microsoft 365 Copilot Capability Assessment

## Purpose

Assess which Microsoft 365 Copilot capabilities are actually available, useful and governable in the organisational environment.

The objective is to identify the smallest set of capabilities that creates meaningful operational leverage while requiring minimal recurring human administration.

This assessment focuses on current tenant reality rather than Microsoft's theoretical product catalogue.

## Decision question

Which Microsoft 365 Copilot capabilities should become part of the working operating model because they:

- reduce meaningful recurring work;
- improve access to authorised organisational knowledge;
- support better meeting follow-through or administration;
- respect existing permissions and governance;
- work reliably within organisational device and browser constraints; and
- remove more ongoing administration than they introduce?

## Decision rule

> Adopt a capability when it creates meaningful recurring leverage without introducing equivalent governance, configuration, reconciliation or maintenance burden.

Prefer:

> complex-once, simple-to-run over simple-to-start, manually-maintained forever.

## Priority capability areas

1. Teams meeting recap, transcription and action extraction
2. Organisational knowledge retrieval across SharePoint, OneDrive, Teams and email
3. Email, calendar and document support
4. Copilot Search
5. Copilot agents and Copilot Studio
6. Power Automate and workflow automation
7. Administrative task automation
8. Permissions and organisational governance
9. Device and browser constraints
10. Ongoing management burden

## Assessment dimensions

For each capability, assess:

- business use;
- current availability;
- evidence status;
- licence dependency;
- administrator dependency;
- privacy and governance considerations;
- automation potential;
- ongoing management burden;
- Strategic OS integration role;
- recommended test; and
- decision.

## Status vocabulary

Use one or more of the following:

- Confirmed
- Available but not enabled
- Unknown
- Restricted
- Requires licence
- Requires admin approval
- Requires user testing

Do not infer capability from Microsoft product documentation alone.

A capability is confirmed only when it is observable or reliably evidenced in the organisational environment.

## Evidence handling

Strategic OS must not store raw organisational or tenant-sensitive evidence.

Do not store:

- screenshots containing organisational content;
- meeting transcripts;
- emails;
- internal documents;
- tenant configuration details that should remain controlled;
- customer or staff personal information;
- confidential organisational extracts; or
- credentials or access information.

Where evidence is required, retain it in the appropriate approved organisational system of record.

Strategic OS may retain:

- evidence status;
- safe source references;
- generalised observations;
- capability conclusions;
- caveats;
- decision logic;
- management-burden observations; and
- reusable lessons.

## Source-of-truth boundary

Microsoft 365 and other approved organisational platforms remain the source of truth for organisational content and tenant capability evidence.

Strategic OS records only the reusable interpretation and operating decisions arising from the assessment.

Microsoft 365 Copilot should act as an enterprise AI layer over authorised organisational knowledge and workflows. It does not become a Strategic OS source of truth.

## Initial tests

### Test 1 — Teams meeting support

Determine whether the organisational environment supports useful meeting recap, transcription, decision extraction and action extraction.

Assess:

- transcript availability;
- recap availability;
- ability to identify decisions;
- ability to identify actions and owners;
- source grounding;
- reliability;
- governance constraints; and
- manual verification burden.

### Test 2 — Organisational knowledge retrieval

Determine whether Copilot can reliably retrieve and synthesise authorised organisational knowledge.

Test known-answer questions against:

- SharePoint;
- OneDrive;
- Teams;
- email; and
- cross-source retrieval where available.

Assess:

- whether the correct source is found;
- whether provenance is visible;
- whether outdated and current material can be distinguished;
- whether permissions behave as expected;
- answer accuracy; and
- manual verification burden.

### Test 3 — Administrative leverage

Identify one repetitive, low-risk administrative task and determine whether Copilot or an approved Microsoft workflow capability can materially reduce the manual steps.

Assess:

- steps removed;
- steps still requiring human intervention;
- setup effort;
- failure modes;
- approval requirements;
- ongoing monitoring; and
- recurring maintenance burden.

## Strategic OS integration hypothesis

Potential Microsoft 365 Copilot role:

- retrieve authorised organisational context;
- summarise organisational information;
- support meeting preparation and follow-through;
- assist with communication and document work;
- support approved workflow automation; and
- reduce repetitive administrative effort.

Potential Strategic OS role:

- preserve reusable interpretation;
- record capability decisions and caveats;
- retain operating patterns and lessons;
- support strategic reasoning; and
- avoid duplicating organisational source material.

This relationship must be validated through real use.

## Current status

Assessment initiated.

No Microsoft 365 Copilot capability should yet be treated as confirmed unless validated against the organisational environment.

## Open questions

- Which Microsoft 365 Copilot licence is assigned?
- Which Copilot experiences are enabled?
- Is Teams transcription available and permitted?
- Is intelligent meeting recap available?
- Can Copilot retrieve authorised information across SharePoint, OneDrive, Teams and email?
- Is Copilot Search enabled?
- Are organisational agents available?
- Is Copilot Studio available?
- Is Power Automate available and appropriately integrated?
- Which connectors and workflow capabilities are approved?
- What administrator controls apply?
- What organisational AI, privacy, records and security guidance applies?
- What browser or device restrictions affect use?
- Which capabilities reduce recurring work enough to justify adoption?

## Next action

Run the Teams meeting-support test and record only the privacy-safe result and decision in the project assessment.
