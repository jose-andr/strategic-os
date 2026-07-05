# Strategic OS Repo Hygiene Quality Pass

## Purpose

This checklist is used to review the Strategic OS repository after a structured build pass.

It helps confirm that the repository is coherent, non-duplicative, safely organised and ready for active use.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

Repo hygiene supports the North Star by keeping the system usable, findable and trustworthy.

## When To Use

Use this pass after:

- a major framework build
- a template build
- an agent architecture update
- an analytics or Databricks / Genie update
- repeated `3` repo-sync work
- end-of-day completion review
- before declaring a Strategic OS version stable

## Core Principle

Do not keep adding structure if the existing structure is already sufficient.

A hygiene pass should improve clarity, reduce duplication and confirm readiness.

It should not expand the framework unless a real gap is found.

## Review Scope

Review these areas:

- root structure
- `04_frameworks/`
- `07_ai_agents/`
- `10_templates/`
- `11_analytics/`
- domain analytics folders
- naming consistency
- source-of-truth boundaries
- privacy and retention rules
- README update requirements, if explicitly requested

## 1. File Existence Check

Confirm that expected files exist.

| Area | Check | Result | Notes |
| --- | --- | --- | --- |
| Frameworks | Core operating frameworks exist | Pass / Partial / Fail |  |
| Agents | Priority agent specs exist | Pass / Partial / Fail |  |
| Agents | Agent operating model exists | Pass / Partial / Fail |  |
| Agents | Agent prompt and review patterns exist | Pass / Partial / Fail |  |
| Templates | Decision and operating templates exist | Pass / Partial / Fail |  |
| Analytics | General analytics patterns exist | Pass / Partial / Fail |  |
| Analytics | Service Account pilot domain exists | Pass / Partial / Fail |  |
| Analytics | Databricks / Genie architecture exists | Pass / Partial / Fail |  |
| Analytics | Analytics-to-decision workflow exists | Pass / Partial / Fail |  |

## 2. Duplicate Check

Check whether any files overlap too much.

| Possible Duplicate Area | Review Question | Result | Action |
| --- | --- | --- | --- |
| Agent review files | Are review checklist files distinct? | Pass / Review |  |
| Analytics review files | Are review prompt, checklist and quality review distinct? | Pass / Review |  |
| Analytics caveat files | Are general patterns distinct from domain files? | Pass / Review |  |
| Source rules | Are general and domain-specific source rules clearly separated? | Pass / Review |  |
| Storage rules | Are analytics storage rules aligned with privacy governance? | Pass / Review |  |
| Operating cadence | Does cadence duplicate Chief of Staff templates unnecessarily? | Pass / Review |  |

If files overlap, prefer:

- keep the more general file as the pattern
- keep the domain file as the applied example
- archive or consolidate only when duplication creates confusion

## 3. Naming Consistency Check

Check that file names use stable, predictable naming.

| Rule | Result | Notes |
| --- | --- | --- |
| Lowercase file names | Pass / Partial / Fail |  |
| Underscores used for files | Pass / Partial / Fail |  |
| Hyphens used for domain folders where appropriate | Pass / Partial / Fail |  |
| Standing files use stable names | Pass / Partial / Fail |  |
| Dated outputs follow naming pattern | Pass / Partial / Fail |  |
| No vague names like `notes.md` or `final.md` | Pass / Partial / Fail |  |

## 4. Folder Logic Check

Confirm each file lives in the right place.

| Folder | Intended Content | Check |
| --- | --- | --- |
| `04_frameworks/` | Strategic operating frameworks | No templates or domain outputs |
| `07_ai_agents/` | Agent specs, operating rules and prompt patterns | No project-specific outputs |
| `10_templates/` | Reusable templates | No filled-in working outputs |
| `11_analytics/` | Analytics architecture, patterns and domains | No raw data |
| `11_analytics/service-account/` | Service Account analytical agent domain | No unrelated analytics domains |
| `08_projects/` | Project-specific working material | No reusable system-wide patterns unless promoted |

## 5. Source-Of-Truth Check

Confirm source-of-truth boundaries remain clear.

| Source Type | Source Of Truth | Strategic OS Role | Result |
| --- | --- | --- | --- |
| Repo structure | GitHub | Store framework files | Pass / Review |
| Governed data | Databricks or official data platform | Store interpretation only | Pass / Review |
| Reporting | Power BI or approved reporting layer | Store caveats and evidence notes only | Pass / Review |
| Communication | Teams, email, calendar | Store abstracted follow-up context only | Pass / Review |
| Tasks | Jira or official task system | Store summary and coordination notes only | Pass / Review |
| Customer records | Official customer system | Do not store records | Pass / Review |

## 6. Privacy And Governance Check

Confirm Strategic OS does not contain unsafe material.

Check that repo files avoid:

- raw datasets
- customer-level records
- copied dashboard extracts
- raw Genie transcripts
- restricted screenshots
- credentials or access tokens
- private stakeholder commentary
- unnecessary names of individuals
- unsupported performance claims
- sensitive organisational extracts

## 7. Agent Architecture Check

Review agent architecture for coherence.

| Check | Result | Notes |
| --- | --- | --- |
| Agent roles are distinct | Pass / Partial / Fail |  |
| Autonomy levels are clear | Pass / Partial / Fail |  |
| Human review triggers are visible | Pass / Partial / Fail |  |
| Chief of Staff boundaries are clear | Pass / Partial / Fail |  |
| Domain Analytical Agent role is clear | Pass / Partial / Fail |  |
| Agents do not send messages or make commitments without approval | Pass / Partial / Fail |  |
| Agents route outputs to correct templates | Pass / Partial / Fail |  |

## 8. Analytics Architecture Check

Review analytics architecture for coherence.

| Check | Result | Notes |
| --- | --- | --- |
| Analytics domains do not store raw data | Pass / Partial / Fail |  |
| Source rules are present | Pass / Partial / Fail |  |
| Metric definitions are present where needed | Pass / Partial / Fail |  |
| Caveats are reusable | Pass / Partial / Fail |  |
| Data quality notes capture issues, not data | Pass / Partial / Fail |  |
| Genie context is caveated | Pass / Partial / Fail |  |
| Human review triggers are clear | Pass / Partial / Fail |  |
| Analytics-to-decision workflow is clear | Pass / Partial / Fail |  |

## 9. Template Usefulness Check

Review templates for usefulness.

| Check | Result | Notes |
| --- | --- | --- |
| Templates are reusable | Pass / Partial / Fail |  |
| Templates are not overly long for normal use | Pass / Partial / Fail |  |
| Templates include human review where needed | Pass / Partial / Fail |  |
| Templates separate evidence from interpretation | Pass / Partial / Fail |  |
| Templates include storage guidance | Pass / Partial / Fail |  |
| Templates support decisions, not admin for its own sake | Pass / Partial / Fail |  |

## 10. README Update Check

Do not update README files during normal repo-sync work.

Only update README files when explicitly requested as an end-of-day or completion pass.

When README review is requested, check:

- root README reflects current system structure
- major folders are described accurately
- analytics architecture is represented if needed
- agent architecture is represented if needed
- no README claims files or capabilities that do not exist
- README stays concise

## Final Review Decision

Choose one:

- repo is coherent enough for active use
- minor naming cleanup required
- duplicate review required
- source-of-truth clarification required
- privacy cleanup required
- README completion pass required
- further framework build required
- stop building and start using

## Required Actions

| Action | File Or Folder | Priority | Owner |
| --- | --- | --- | --- |
|  |  | High / Medium / Low |  |

## Success Measures

The repo hygiene pass is working when:

- files are easy to find
- structure is coherent
- duplicate files are avoided
- source-of-truth boundaries are clear
- privacy rules are protected
- agents and templates are usable
- analytics architecture is safe
- README updates are deferred unless requested
- no new framework is added without a real gap

## Failure Modes

Repo hygiene is failing if:

- new files are created when cleanup is needed
- README files are updated too early
- duplicate patterns accumulate
- analytics files store raw data
- agent boundaries blur
- templates become too heavy to use
- repo structure becomes hard to navigate
- the system keeps expanding instead of being used

## Minimal Use Rule

Use this pass to confirm readiness.

Only create or change files when the review finds a real issue.

When the system is coherent enough, stop building and start using Strategic OS.
