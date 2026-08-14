# Microsoft 365 Copilot Capability Assessment

## Purpose

Assess which Microsoft 365 Copilot capabilities are actually available, useful and governable in the organisational environment.

The objective is to identify the smallest set of capabilities that creates meaningful operational leverage with minimal recurring human administration.

This project records privacy-safe assessment logic, conclusions, decisions and reusable lessons only.

## Decision question

Which Microsoft 365 Copilot capabilities should become part of the working operating model because they:

- reduce meaningful recurring work;
- improve access to authorised organisational knowledge;
- support better meeting follow-through or administration;
- respect existing permissions and governance;
- work reliably within organisational device and browser constraints; and
- remove more ongoing administration than they introduce?

## Current status

**Phase:** Assessment initiated

**Overall status:** Requires user testing

No Microsoft 365 Copilot capability should be treated as confirmed unless it has been validated in the organisational environment.

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

## Project files

- `context.md` — background, scope, constraints and assessment logic
- `decisions.md` — material adoption and architecture decisions
- `stakeholder-notes.md` — safe stakeholder and governance considerations
- `outputs/copilot-capability-assessment.md` — current capability assessment and test record
- `lessons-learned.md` — reusable lessons that emerge from real use
- `archive/` — superseded privacy-safe project material only

## Source-of-truth boundary

Organisational systems remain the source of truth for organisational content, governed data, tenant configuration and official records.

Strategic OS records only:

- capability status;
- safe source references;
- generalised observations;
- interpretation;
- caveats;
- decisions;
- management-burden observations; and
- reusable lessons.

Do not store raw organisational evidence in this project.

## Decision rule

> Adopt a capability when it creates meaningful recurring leverage without introducing equivalent governance, configuration, reconciliation or maintenance burden.

Prefer:

> complex-once, simple-to-run over simple-to-start, manually-maintained forever.

## Next action

Run the Teams meeting-support test and record only the privacy-safe outcome in `outputs/copilot-capability-assessment.md`.
