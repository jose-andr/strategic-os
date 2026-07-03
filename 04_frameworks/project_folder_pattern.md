# Project Folder Pattern

## Purpose

This framework defines the standard folder pattern for projects inside Strategic OS.

The goal is to make future project folders consistent, easy to navigate and useful beyond the immediate delivery period.

A project folder should help capture context, decisions, stakeholder considerations, outputs and lessons without becoming a dumping ground.

## Core Principle

Every project folder should make the project understandable without needing chat history, scattered notes or memory.

A useful project folder should show:

- what the project is
- why it matters
- what decisions were made
- who or what is affected
- what outputs were created
- what was learned
- what should be reused later

## Default Project Location

Create project folders inside:

`08_projects/`

Use lowercase, hyphenated folder names.

Pattern:

`08_projects/project-name/`

Example:

`08_projects/channel-strategy/`

## Standard Project Folder Structure

Use this structure for most projects:

`08_projects/project-name/README.md`

`08_projects/project-name/context.md`

`08_projects/project-name/decisions.md`

`08_projects/project-name/stakeholder-notes.md`

`08_projects/project-name/outputs/`

`08_projects/project-name/lessons-learned.md`

`08_projects/project-name/archive/`

## When To Create A Project Folder

Create a project folder when work has enough substance to require dedicated structure.

Good candidates include:

- active projects
- strategic initiatives
- service design work
- analytics-enabled decision work
- operating model work
- stakeholder-heavy work
- reusable case studies
- work likely to create career evidence
- work likely to produce multiple outputs
- work that may continue over weeks or months

Do not create a project folder for:

- a single task
- a temporary idea
- a minor meeting note
- a low-value draft
- sensitive material that should not be stored
- work better suited to `00_inbox/`, `03_decision_briefs/` or `05_lessons_learned/`

## Project README

### Purpose

The project README gives a quick overview of the project.

It should help someone understand the project without opening every file.

### Recommended Sections

- Project purpose
- Why this matters
- Current status
- Key questions
- Primary outputs
- Related decisions
- Related stakeholders
- Related templates or agents
- Review rhythm
- Storage and privacy notes

### Project Status Values

Use simple status values:

- Captured
- Shaping
- Active
- Paused
- Completed
- Archived

## Context File

Use:

`context.md`

### Purpose

The context file explains the background and operating environment.

It may include:

- problem background
- strategic context
- customer context
- organisational context
- known constraints
- key assumptions
- relevant evidence
- links to related internal source locations, where safe
- caveats

### Do Not Store

Do not store:

- raw organisational source documents
- customer-level records
- confidential extracts
- governed datasets
- sensitive stakeholder commentary
- private employee matters

Use privacy-safe summaries instead.

## Decisions File

Use:

`decisions.md`

### Purpose

The decisions file tracks important decisions and decision points.

It should help show how the project moved from ambiguity to action.

### Recommended Decision Entry

Use this structure:

## Decision Title

Date:

Status:

Decision required:

Context:

Options considered:

Recommendation:

Decision made:

Rationale:

Evidence:

Assumptions:

Risks:

Stakeholder implications:

Next action:

Related files:

### Decision Status Values

Use:

- Proposed
- Under review
- Decided
- Deferred
- Superseded
- Closed

## Stakeholder Notes File

Use:

`stakeholder-notes.md`

### Purpose

The stakeholder notes file captures privacy-safe stakeholder patterns, alignment conditions and engagement considerations.

It should not be a record of private stakeholder commentary.

### Recommended Sections

- Stakeholder groups
- Alignment conditions
- Known concerns
- Engagement needs
- Communication framing
- Influence risks
- Follow-up considerations
- Privacy-safe stakeholder patterns

### Privacy Rule

Capture patterns, not private commentary.

Instead of storing:

`Jane said the project sponsor is blocking the work`

Use:

`There may be a senior sponsorship alignment risk that needs careful framing`

## Outputs Folder

Use:

`outputs/`

### Purpose

The outputs folder stores project artefacts that are useful to retain.

Examples:

- decision briefs
- synthesis notes
- journey maps
- service blueprints
- system maps
- workshop plans
- presentation outlines
- recommendation summaries
- opportunity reviews
- analytics interpretation notes
- final project outputs

### Output Naming

Use clear, dated file names.

Pattern:

`YYYY-MM-DD_output-type_topic.md`

Example:

`2026-07-03_decision-brief_channel-mix-priorities.md`

If the output was produced by an agent, follow:

`07_ai_agents/agent_file_naming.md`

## Lessons Learned File

Use:

`lessons-learned.md`

### Purpose

The lessons learned file captures reusable learning from the project.

It should help future work become faster, clearer and more effective.

### Recommended Sections

- What worked
- What did not work
- What surprised us
- What should be repeated
- What should be avoided
- What pattern is reusable
- What should become a template or framework
- What career evidence was created

### Conversion Paths

Strong lessons may later move or copy into:

- `05_lessons_learned/`
- `04_frameworks/`
- `10_templates/`
- `01_career/`

## Archive Folder

Use:

`archive/`

### Purpose

The archive folder stores old, superseded or no-longer-active material that may still be useful for historical context.

Archive:

- outdated drafts
- superseded outputs
- old versions
- closed decision notes
- inactive planning material

Do not archive sensitive material that should not be stored at all.

Delete unsafe or unnecessary material.

## Optional Project Files

Add optional files only when useful.

Possible optional files:

`research-notes.md`

`analytics-notes.md`

`workshop-plan.md`

`service-map.md`

`system-map.md`

`risks.md`

`timeline.md`

`agent_output_index.md`

`career-evidence.md`

Use optional files to reduce clutter, not increase it.

## Agent Use In Projects

Use Strategic OS agents to support project work.

| Need | Recommended Agent |
| --- | --- |
| Ambiguous problem or decision framing | Sensemaking Agent |
| Stakeholder alignment and influence | Stakeholder Journey Agent |
| Momentum and delivery focus | Shipping Coach |
| Career evidence and opportunity value | Career Architect |
| Daily coordination and follow-ups | Chief of Staff Agent |

Agents support judgement.

They do not replace project ownership, stakeholder engagement or governance.

## Template Use In Projects

Use templates when they make project outputs faster or more consistent.

Useful templates may include:

- `10_templates/decision_brief.md`
- `10_templates/lesson_learned.md`
- `10_templates/stakeholder_alignment_assessment.md`
- `10_templates/shipping_recommendation.md`
- `10_templates/opportunity_review.md`
- `10_templates/daily_briefing.md`

## Project Creation Checklist

Before creating a project folder, ask:

- Is this more than a single note or task?
- Will this work produce multiple outputs?
- Will decisions need to be tracked?
- Will stakeholder alignment matter?
- Will lessons or career evidence be created?
- Is it safe to store project summaries in Strategic OS?
- Is a project folder the simplest useful structure?

## Project Review Checklist

During project review, ask:

- Is the README current?
- Is the context still accurate?
- Are key decisions captured?
- Are stakeholder notes privacy-safe?
- Are useful outputs stored?
- Are outdated drafts archived or deleted?
- Are lessons captured?
- Has career evidence been identified?
- Should any output become a reusable template or framework?

## Project Closure Checklist

When closing a project, review:

- final status
- final outputs
- decisions made
- lessons learned
- reusable patterns
- career evidence
- archived drafts
- sensitive material
- related opportunity records
- related decision briefs

Close the project when:

- outputs are stored
- lessons are captured
- reusable material is moved to the right place
- sensitive or unnecessary material is removed
- the project README reflects the final state

## Privacy And Governance Rules

Do not store:

- customer-level records
- confidential organisational extracts
- governed datasets
- raw system exports
- private employee matters
- sensitive stakeholder commentary
- operational data copied from systems of record
- material that belongs only in official organisational systems

Prefer storing:

- safe summaries
- non-sensitive project context
- decision logic
- reusable patterns
- lessons learned
- public or personal reflections
- links or references to official storage locations, where appropriate and safe

## Success Measures

The project folder pattern is working when:

- project folders are easy to navigate
- decisions are visible
- outputs are findable
- stakeholder patterns are captured safely
- lessons are reused
- career evidence is easier to identify
- old drafts do not clutter the folder
- future project setup is faster
- project work connects back to the Strategic OS North Star

## Failure Modes

The pattern is failing if:

- project folders become dumping grounds
- sensitive material is stored unnecessarily
- decisions are not captured
- outputs are scattered
- lessons are not reused
- folders are over-structured for small work
- every project invents a new structure
- archive folders hide material that should be deleted
- project evidence is disconnected from career or opportunity folders

## Minimal Use Rule

Use only the structure the project needs.

Small projects may only need:

- `README.md`
- `decisions.md`
- `outputs/`
- `lessons-learned.md`

Larger projects may need the full pattern.

The structure should make the work clearer, not heavier.
