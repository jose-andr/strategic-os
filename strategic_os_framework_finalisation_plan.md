# Strategic OS Framework Finalisation Checklist

## Purpose

This file defines the remaining work required to finalise the Strategic OS framework across the whole repository.

Use this file as the continuity source when returning to the work in a new chat.

The goal is to stabilise the repository, complete the missing operating structure, support the agent framework, prepare for Chief of Staff operations, accommodate future Databricks / Genie agents, and create a QA model for ongoing performance review.

---

## Strategic OS source of truth

The root `README.md` remains the source-of-truth foundation for Strategic OS.

Do not randomly rewrite the root README.

Only update the root README when the overall Strategic OS positioning, purpose, principles, architecture or folder structure genuinely changes.

---

## Current Strategic OS intent

Strategic OS is a personal augmentation system designed to help transform complexity into strategic decisions, improve stakeholder alignment and create more strategic opportunities.

The system supports:

* Business Design practice
* Human-Centred Design practice
* strategic sensemaking
* decision support
* stakeholder management
* career development
* AI-enabled ways of working
* reusable knowledge creation

North Star:

> Increase strategic opportunities by helping leaders make better strategic decisions.

Desired reputation:

> He helps us make better strategic decisions.

---

## Working rules for future chats

* Do not check GitHub unless explicitly asked.
* Follow this finalisation plan as the working source of truth.
* Use the chat sequence as the current working state during an active work session.
* Do not repeat files because GitHub may lag after recent commits.
* Keep repo file content clean and durable.
* Do not include chat-process notes, “next build step” sections, or continuity thoughts inside markdown files unless the file is explicitly a plan or checklist.
* When providing markdown files for the Strategic OS repo, avoid nested fenced code blocks.
* If the response itself is inside a markdown fence, do not include any internal triple-backtick code fences.
* Use inline code, indented examples, headings, bullet lists, or plain text examples instead.
* For repo-ready markdown, prefer one clean outer fence only, or no fence if nested markdown examples are required.
* Use `11_analytics/`, not `analytics/`, for the analytics domain area.
* During active repo-sync work, prioritise missing files first, then update or standardise existing content.
* Do not update README files during normal repo-sync work.
* Save README corrections for the end-of-day completion pass when explicitly requested.

---

# Current completed work

## Completed today

* [x] Created or confirmed core folder scaffold from `00_inbox/` through `11_analytics/`
* [x] Renamed analytics domain folder from `analytics/` to `11_analytics/`
* [x] Moved `service-account/` analytics content into `11_analytics/service-account/`
* [x] Created `11_analytics/README.md`
* [x] Created `00_inbox/README.md`
* [x] Created `01_career/README.md`
* [x] Created `02_strategic_opportunities/README.md`
* [x] Created `03_decision_briefs/README.md`
* [x] Created `04_frameworks/README.md`
* [x] Created `05_lessons_learned/README.md`
* [x] Created `06_stakeholder_patterns/README.md`
* [x] Created `08_projects/README.md`
* [x] Created `09_thought_leadership/README.md`
* [x] Created `10_templates/README.md`
* [x] Updated `07_ai_agents/README.md`
* [x] Created `04_frameworks/intake_to_output_workflow.md`
* [x] Created `04_frameworks/operating_cadence.md`
* [x] Created `07_ai_agents/agent_file_naming.md`
* [x] Created `07_ai_agents/agent_output_index_pattern.md`
* [x] Created `07_ai_agents/chief_of_staff/agent_spec.md`
* [x] Created `07_ai_agents/chief_of_staff/autonomy_rules.md`
* [x] Created `07_ai_agents/chief_of_staff/escalation_rules.md`
* [x] Created `10_templates/daily_briefing.md`
* [x] Created `02_strategic_opportunities/index.md`
* [x] Created `04_frameworks/strategic_opportunity_pipeline.md`
* [x] Created `04_frameworks/career_evidence_architecture.md`
* [x] Created `04_frameworks/project_folder_pattern.md`
* [x] Created `04_frameworks/privacy_governance_retention.md`
* [x] Created `04_frameworks/cross_tool_architecture.md`
* [x] Created `04_frameworks/strategic_os_system_map.md`
* [x] Created `04_frameworks/strategic_os_qa_model.md`
* [x] Created `10_templates/quarterly_strategic_os_assessment.md`
* [x] Created `03_decision_briefs/index.md`
* [x] Created `05_lessons_learned/index.md`
* [x] Created `06_stakeholder_patterns/index.md`
* [x] Created `01_career/index.md`
* [x] Created `08_projects/index.md`
* [x] Created `11_analytics/index.md`
* [x] Created `01_career/achievements/`
* [x] Created `01_career/feedback/`
* [x] Created `01_career/opportunities/`
* [x] Created `01_career/promotion_readiness/`
* [x] Updated root `README.md` repository structure for `11_analytics/` and career subfolders
* [x] Updated `10_templates/README.md` so completed templates are no longer listed as planned

## Working assumption at end of day

The current root-level scaffold is:

```
strategic-os/
├── 00_inbox/
├── 01_career/
│   ├── achievements/
│   ├── feedback/
│   ├── opportunities/
│   └── promotion_readiness/
├── 02_strategic_opportunities/
├── 03_decision_briefs/
├── 04_frameworks/
├── 05_lessons_learned/
├── 06_stakeholder_patterns/
├── 07_ai_agents/
│   ├── sensemaking_agent/
│   ├── stakeholder_agent/
│   ├── shipping_coach/
│   ├── career_architect/
│   └── chief_of_staff/
├── 08_projects/
├── 09_thought_leadership/
├── 10_templates/
├── 11_analytics/
├── README.md
└── strategic_os_framework_finalisation_plan.md
```

The current analytics structure is:

```
11_analytics/
├── README.md
├── index.md
└── service-account/
```

---

# Finalisation checklist

## Phase 1 — Clean accidental process notes

Goal: remove chat-process language from repository files.

Files to review:

* [ ] `07_ai_agents/README.md`
* [x] `07_ai_agents/agent_file_naming.md`
* [x] `07_ai_agents/agent_output_index_pattern.md`
* [x] `07_ai_agents/agent_operating_model.md`
* [x] `07_ai_agents/agent_prompt_pattern.md`
* [x] `10_templates/README.md`
* [ ] Any other files created during the agents-framework build

Remove:

* [ ] `## Next build step` sections
* [ ] “The next agents-framework update should...”
* [ ] “Recommended file...”
* [ ] “When you type 3...”
* [ ] Any chat-process notes
* [ ] Any temporary continuity notes that do not belong in durable repo documentation

Keep:

* [x] Purpose
* [x] When to use
* [x] Rules
* [x] Patterns
* [x] Examples
* [x] Review checklists
* [x] File naming guidance
* [x] Storage logic

Definition of done:

* [ ] Markdown files read like durable repository documentation, not chat transcripts

---

## Phase 2 — Confirm root README as source of truth

Goal: protect the root README from unnecessary changes.

Check that root `README.md` clearly defines:

* [x] Purpose
* [x] North Star
* [x] Desired Reputation
* [x] Strategic Positioning
* [x] Why This Exists
* [x] Design Principles
* [x] Architecture
* [x] Priority Agents
* [x] Primary Success Measures
* [x] Repository Structure

Definition of done:

* [x] Root README remains stable and authoritative
* [x] Any detailed operating rules live in supporting files, not the root README

---

## Phase 3 — Complete whole-repo folder scaffold

Goal: ensure the repository structure matches the Strategic OS architecture.

Create or confirm these folders:

* [x] `00_inbox/`
* [x] `01_career/`
* [x] `02_strategic_opportunities/`
* [x] `03_decision_briefs/`
* [x] `04_frameworks/`
* [x] `05_lessons_learned/`
* [x] `06_stakeholder_patterns/`
* [x] `07_ai_agents/`
* [x] `08_projects/`
* [x] `09_thought_leadership/`
* [x] `10_templates/`
* [x] `11_analytics/`

Definition of done:

* [x] All core Strategic OS folders exist
* [x] Empty folders include a `.gitkeep` or a lightweight `README.md`

---

## Phase 4 — Add folder-level README files

Goal: make each folder understandable without needing chat context.

Create or refine:

* [x] `00_inbox/README.md`
* [x] `01_career/README.md`
* [x] `02_strategic_opportunities/README.md`
* [x] `03_decision_briefs/README.md`
* [x] `04_frameworks/README.md`
* [x] `05_lessons_learned/README.md`
* [x] `06_stakeholder_patterns/README.md`
* [x] `07_ai_agents/README.md`
* [x] `08_projects/README.md`
* [x] `09_thought_leadership/README.md`
* [x] `10_templates/README.md`
* [x] `11_analytics/README.md`

Each folder README should include:

* [x] Purpose
* [x] What belongs here
* [x] What does not belong here
* [x] Suggested file naming
* [x] Related templates
* [x] Related agents
* [x] Review rhythm, where relevant

Definition of done:

* [x] A future chat or collaborator can understand the repository structure from the folder README files

---

## Phase 5 — Define the intake-to-output workflow

Goal: define how raw input becomes useful Strategic OS knowledge.

Create:

* [x] `04_frameworks/intake_to_output_workflow.md`

Workflow to define:

* [x] Capture in `00_inbox/`
* [x] Triage
* [x] Decide output type
* [x] Use relevant agent
* [x] Use relevant template
* [x] Review
* [x] Store in correct folder
* [x] Index if useful
* [x] Convert into reusable pattern, lesson or career evidence where relevant

Possible flow:

* [x] inbox item to decision brief
* [x] inbox item to strategic opportunity
* [x] inbox item to lesson learned
* [x] inbox item to stakeholder pattern
* [x] inbox item to project artefact
* [x] inbox item to career evidence
* [x] inbox item to thought leadership

Definition of done:

* [x] Strategic OS has a clear pathway from capture to reusable knowledge

---

## Phase 6 — Define the operating cadence

Goal: make Strategic OS an operating system, not just a repository.

Create:

* [x] `04_frameworks/operating_cadence.md`

Suggested cadence:

### Daily

* [x] Chief of Staff daily briefing
* [x] Calendar and priority check
* [x] Admin task check
* [x] Decision-required check

### Weekly

* [x] Sensemaking review
* [x] Shipping review
* [x] Stakeholder alignment check for active work
* [x] Inbox triage

### Monthly

* [x] Career Architect opportunity review
* [x] Strategic opportunities review
* [x] Lessons learned review
* [x] Frameworks and templates review

### Quarterly

* [x] Strategic OS QA assessment
* [x] Agent performance review
* [x] Career evidence review
* [x] Repository hygiene review
* [x] North Star alignment review

Definition of done:

* [x] The system has a lightweight rhythm for use and maintenance

---

## Phase 7 — Finalise AI agents framework

Goal: stabilise the general agent framework under `07_ai_agents/`.

Current priority agents:

* [x] Sensemaking Agent
* [x] Stakeholder Journey Agent
* [x] Shipping Coach
* [x] Career Architect
* [x] Chief of Staff Agent

Shared files to create or confirm:

* [x] `07_ai_agents/README.md`
* [x] `07_ai_agents/agent_operating_model.md`
* [x] `07_ai_agents/agent_review_checklist.md`
* [x] `07_ai_agents/agent_prompt_pattern.md`
* [x] `07_ai_agents/agent_output_map.md`
* [x] `07_ai_agents/agent_file_naming.md`
* [x] `07_ai_agents/agent_output_index_pattern.md`

Definition of done:

* [x] `07_ai_agents/` explains what agents exist, how they work, how to run them and how to review outputs

---

## Phase 8 — Standardise all agent specs

Goal: make each agent spec coherent and consistent.

Agent spec files:

* [ ] `07_ai_agents/sensemaking_agent/agent_spec.md`
* [ ] `07_ai_agents/stakeholder_agent/agent_spec.md`
* [ ] `07_ai_agents/shipping_coach/agent_spec.md`
* [ ] `07_ai_agents/career_architect/agent_spec.md`
* [x] `07_ai_agents/chief_of_staff/agent_spec.md`

Standard structure:

* [ ] `# [Agent Name] Specification`
* [ ] `## Mission`
* [ ] `## Primary Question`
* [ ] `## Inputs`
* [ ] `## Outputs`
* [ ] `## Reasoning Framework`
* [ ] `## Operating Autonomy`
* [ ] `## Human In The Loop`
* [ ] `## Success Metrics`
* [ ] `## Failure Modes`

Checks:

* [ ] Same heading pattern across all files
* [ ] No chat notes
* [ ] Missions match Strategic OS intent
* [ ] Outputs match templates
* [ ] Human-in-the-loop rules are clear
* [ ] Failure modes are practical
* [ ] Agent boundaries are explicit

Definition of done:

* [ ] All priority agents feel like one coherent system

---

## Phase 9 — Add Chief of Staff Agent

Goal: add an operating agent that keeps the lights on and coordinates day-to-day activity.

Create:

* [x] `07_ai_agents/chief_of_staff/`
* [x] `07_ai_agents/chief_of_staff/agent_spec.md`
* [x] `07_ai_agents/chief_of_staff/autonomy_rules.md`
* [x] `07_ai_agents/chief_of_staff/escalation_rules.md`

Mission:

* [x] Keep the lights on, coordinate day-to-day activity and connect daily delivery to the Strategic OS North Star

Primary question:

* [x] What needs attention today, what can be handled autonomously and what requires the user’s decision?

Primary output:

* [x] Daily Briefing

Possible secondary outputs:

* [x] Weekly operating review
* [x] Admin task list
* [x] Calendar plan
* [x] Decision-required list
* [x] Follow-up tracker
* [x] Focus protection recommendation

Chief of Staff responsibilities:

* [x] Check and summarise emails
* [x] Read and summarise relevant news or updates
* [x] Support calendar planning
* [x] Prepare daily briefings
* [x] Track admin tasks
* [x] Identify decisions required from the user
* [x] Coordinate follow-ups
* [x] Connect day-to-day work to strategic priorities
* [x] Surface risks, deadlines and missed commitments
* [x] Protect focus and reduce operational drag

Definition of done:

* [x] Chief of Staff Agent has clear responsibilities, autonomy and escalation rules

---

## Phase 10 — Define agent autonomy model

Goal: define how independent each agent can be.

Update:

* [ ] `07_ai_agents/agent_operating_model.md`

Suggested autonomy levels:

### Level 1 — Advisory

Agent provides advice only.

Examples:

* [ ] Sensemaking Agent
* [ ] Stakeholder Journey Agent
* [ ] Career Architect

### Level 2 — Coaching / challenge

Agent can recommend action and challenge delay but does not act independently.

Example:

* [ ] Shipping Coach

### Level 3 — Operational coordination

Agent can organise, prioritise and make low-risk day-to-day decisions within defined rules.

Example:

* [ ] Chief of Staff Agent

### Level 4 — Domain analytical support

Agent can interrogate governed data through approved tools and produce analysis within documented caveats.

Examples:

* [ ] Future Databricks / Genie agents

### Level 5 — Human approval required

Any action involving sensitive communication, formal decisions, stakeholder commitments, external publication, governance or career moves requires human approval.

Definition of done:

* [ ] Agent autonomy is explicit
* [ ] Chief of Staff independence is supported safely
* [ ] Future Databricks / Genie agents have a place in the model

---

## Phase 11 — Finalise templates

Goal: ensure every priority agent has usable templates.

Existing or planned templates:

* [x] `10_templates/decision_brief.md`
* [x] `10_templates/lesson_learned.md`
* [x] `10_templates/stakeholder_alignment_assessment.md`
* [x] `10_templates/shipping_recommendation.md`
* [x] `10_templates/opportunity_review.md`
* [x] `10_templates/career_guidance.md`
* [x] `10_templates/promotion_readiness_assessment.md`
* [x] `10_templates/daily_briefing.md`
* [x] `10_templates/quarterly_strategic_os_assessment.md`

Potential future templates:

* [ ] `10_templates/weekly_operating_review.md`
* [ ] `10_templates/admin_task_list.md`
* [ ] `10_templates/follow_up_tracker.md`

Standard template structure:

* [x] `# [Template Name]`
* [x] `## Purpose`
* [x] `## When to use`
* [x] Main working sections
* [x] Final recommendation or output
* [x] Review checklist

Definition of done:

* [x] Every priority agent has at least one primary output template
* [x] Templates are practical and free of process notes

---

## Phase 12 — Finalise templates README

Goal: make the templates folder easy to navigate.

Update:

* [x] `10_templates/README.md`

It should list:

* [x] template name
* [x] supporting agent
* [x] purpose
* [x] when to use

It should not include:

* [x] next build steps
* [x] chat-process language
* [x] duplicate long explanations already inside each template

Definition of done:

* [x] Templates are clearly connected to agents and Strategic OS workflows

---

## Phase 13 — Define strategic opportunity pipeline

Goal: support the North Star by making opportunities visible and actionable.

Create:

* [x] `02_strategic_opportunities/README.md`
* [x] `02_strategic_opportunities/index.md`
* [x] `04_frameworks/strategic_opportunity_pipeline.md`

Suggested opportunity states:

* [x] Captured
* [x] Shaping
* [x] Socialising
* [x] Active
* [x] Parked
* [x] Declined
* [x] Converted to project
* [x] Converted to career evidence

Opportunity review should consider:

* [x] strategic value
* [x] stakeholder value
* [x] organisational value
* [x] customer value
* [x] career value
* [x] evidence value
* [x] timing
* [x] trade-offs

Definition of done:

* [x] Strategic opportunities can be captured, shaped, reviewed and converted into action or evidence

---

## Phase 14 — Define career evidence architecture

Goal: make career growth and promotion readiness part of the system.

Create or confirm:

* [x] `01_career/README.md`
* [x] `01_career/achievements/`
* [x] `01_career/feedback/`
* [x] `01_career/opportunities/`
* [x] `01_career/promotion_readiness/`

Create:

* [x] `04_frameworks/career_evidence_architecture.md`

Career evidence flow:

* [x] project artefact
* [x] achievement note
* [x] promotion proof point
* [x] career narrative
* [x] role application or development conversation

Evidence categories:

* [x] strategic influence
* [x] organisational impact
* [x] customer-centred practice
* [x] systems thinking
* [x] human-centred design
* [x] AI-enabled capability
* [x] stakeholder influence
* [x] delivery and follow-through

Definition of done:

* [x] Strategic OS can convert work into career evidence and long-term positioning

---

## Phase 15 — Define frameworks library

Goal: create a home for reusable thinking models.

Create:

* [x] `04_frameworks/README.md`

Potential framework categories:

* [x] decision frameworks
* [x] stakeholder frameworks
* [x] service design frameworks
* [x] system mapping frameworks
* [x] analytics interpretation frameworks
* [x] opportunity assessment frameworks
* [x] career positioning frameworks
* [x] QA and performance frameworks

Definition of done:

* [x] Reusable thinking patterns have a clear home outside project-specific folders

---

## Phase 16 — Define project folder architecture

Goal: make future project folders consistent.

Create:

* [x] `08_projects/README.md`
* [x] `04_frameworks/project_folder_pattern.md`

Recommended project pattern:

* [x] `08_projects/[project-name]/README.md`
* [x] `08_projects/[project-name]/context.md`
* [x] `08_projects/[project-name]/decisions.md`
* [x] `08_projects/[project-name]/stakeholder-notes.md`
* [x] `08_projects/[project-name]/outputs/`
* [x] `08_projects/[project-name]/lessons-learned.md`
* [x] `08_projects/[project-name]/archive/`

Definition of done:

* [x] Future projects can be added without inventing structure each time

---

## Phase 17 — Accommodate multiple Databricks / Genie agents

Goal: prepare the architecture for multiple data and analytics agents.

Update one or more of:

* [x] `07_ai_agents/README.md`
* [ ] `07_ai_agents/agent_operating_model.md`
* [ ] `07_ai_agents/agent_output_map.md`
* [x] `11_analytics/README.md`

Principles:

* [x] General personal agents live under `07_ai_agents/`
* [x] Domain-specific analytical agents may live inside `11_analytics/` or project folders
* [x] Databricks / Genie agents require explicit source rules and caveats
* [x] Multiple Genie agents may exist for different domains
* [x] Service Account is the first pilot pattern, not the only future pattern

Potential future domains:

* [x] `11_analytics/service-account/`
* [ ] `11_analytics/channel-strategy/`
* [ ] `11_analytics/customer-demand/`
* [ ] `11_analytics/support-csat/`
* [ ] `11_analytics/executive-metrics/`
* [ ] `11_analytics/data-quality/`

Potential domain-agent files:

* [x] `agent_context.md`
* [x] `agent_review_prompt.md`
* [x] `agent_consistency_check.md`
* [x] `genie_context.md`
* [x] `metric_caveats.md`
* [x] `source_rules.md`

Definition of done:

* [ ] Strategic OS can support multiple Databricks / Genie agents without forcing them into one generic agent

---

## Phase 18 — Link to Service Account pilot pattern

Goal: recognise the Service Account analytics area as the first mature domain-agent pattern.

Reference area:

* [x] `11_analytics/service-account/`

Relevant concepts:

* [x] agent consistency checks
* [x] agent review prompts
* [x] Genie context rules
* [x] metric caveats
* [x] documentation governance
* [x] evidence boundaries
* [x] GA4 as contextual evidence only
* [x] Databricks metrics as governed headline sources

What to do:

* [x] Add a light reference to the Service Account pattern in the general framework
* [x] Keep Service Account-specific rules inside `11_analytics/service-account/`
* [x] Avoid copying all project-specific detail into `07_ai_agents/`

Definition of done:

* [x] The framework can reuse the Service Account lesson without overgeneralising it

---

## Phase 19 — Define privacy, governance and retention rules

Goal: protect the repository from storing inappropriate material.

Create:

* [x] `04_frameworks/privacy_governance_retention.md`

Rules should cover:

* [x] no raw organisational source data
* [x] no customer-level records
* [x] no sensitive stakeholder commentary
* [x] no confidential source extracts
* [x] no private HR details unless safe and necessary
* [x] no operational data copied from systems of record
* [x] use summaries, patterns, caveats and reusable learning instead
* [x] separate personal reflections from organisational facts
* [x] mark assumptions clearly
* [x] review sensitive files before committing

Definition of done:

* [x] Strategic OS has explicit safety rules for what can and cannot be stored

---

## Phase 20 — Define cross-tool architecture

Goal: clarify how GitHub connects to other tools.

Create:

* [x] `04_frameworks/cross_tool_architecture.md`

Define roles:

* [x] GitHub as knowledge repository
* [x] Relevance AI as agent memory and reasoning layer
* [x] Make.com as workflow orchestration
* [x] Slack as user interface
* [x] Databricks Genie as governed data interrogation
* [x] Power BI as reporting source of truth
* [x] SharePoint / OneDrive as organisational document stores
* [x] Teams / email / calendar as operational coordination tools
* [x] Miro as visual collaboration and system mapping workspace
* [x] Jira as delivery tracking system

Definition of done:

* [x] The system has clear boundaries across tools, especially for Chief of Staff and Databricks / Genie agents

---

## Phase 21 — Add Strategic OS system map

Goal: create a whole-system map for future continuity.

Create:

* [x] `04_frameworks/strategic_os_system_map.md`

The system map should show:

* [x] inputs
* [x] inbox
* [x] agents
* [x] templates
* [x] output folders
* [x] review points
* [x] indexes
* [x] reusable knowledge
* [x] career evidence
* [x] projects
* [x] analytics domains
* [x] external tools

Core flow:

* [x] Inputs
* [x] `00_inbox/`
* [x] Agent support
* [x] Template output
* [x] Review
* [x] Storage
* [x] Index
* [x] Reuse
* [x] Strategic opportunity or decision

Definition of done:

* [x] A new chat can understand the whole Strategic OS from one system map file

---

## Phase 22 — Add QA model for Strategic OS performance

Goal: define how the performance and quality of Strategic OS will be assessed over time.

Create:

* [x] `04_frameworks/strategic_os_qa_model.md`

The QA model should assess:

* [x] strategic usefulness
* [x] decision quality
* [x] stakeholder alignment support
* [x] shipping discipline
* [x] career development support
* [x] agent output quality
* [x] template usefulness
* [x] repository hygiene
* [x] privacy and governance compliance
* [x] cross-tool reliability
* [x] Databricks / Genie analytical reliability
* [x] North Star alignment

Suggested QA dimensions:

### Strategic impact

* [x] Did Strategic OS help create or shape strategic opportunities?
* [x] Did it help leaders make better strategic decisions?
* [x] Were recommendations adopted or used?
* [x] Did it improve stakeholder alignment?

### Output quality

* [x] Are outputs clear?
* [x] Are outputs decision-oriented?
* [x] Are outputs practical?
* [x] Are trade-offs visible?
* [x] Are next actions clear?

### Evidence quality

* [x] Is evidence separated from interpretation?
* [x] Are assumptions visible?
* [x] Are caveats included?
* [x] Are governed metrics protected?
* [x] Are contextual signals labelled correctly?

### Agent performance

* [x] Did the right agent get used for the right task?
* [x] Did agent outputs follow the relevant spec?
* [x] Did agents stay within their boundaries?
* [x] Were human-in-the-loop points respected?
* [x] Did any agent create unnecessary work?

### Repository quality

* [x] Are files easy to find?
* [x] Are indexes maintained?
* [x] Are filenames consistent?
* [x] Are outdated files archived or marked?
* [x] Are templates still useful?

### Privacy and safety

* [x] Is organisational source data excluded?
* [x] Are sensitive details removed or generalised?
* [x] Are stakeholder assumptions handled carefully?
* [x] Are career records safe to retain?
* [x] Are project-specific caveats clear?

### Operating discipline

* [x] Is the inbox being triaged?
* [x] Are lessons learned captured?
* [x] Are opportunities reviewed?
* [x] Are unfinished drafts being shipped, socialised, refined or stopped?
* [x] Is daily work connected back to the North Star?

Definition of done:

* [x] Strategic OS has a clear performance and quality model
* [x] The model can be used in quarterly assessment

---

## Phase 23 — Add quarterly Strategic OS assessment

Goal: create a quarterly review process to assess whether Strategic OS is working.

Create:

* [x] `10_templates/quarterly_strategic_os_assessment.md`

Potential storage location for completed assessments:

* [x] `05_lessons_learned/`
* [ ] `04_frameworks/qa_assessments/`
* [x] or `01_career/promotion_readiness/` if used for career evidence

Quarterly assessment sections:

* [x] Quarter reviewed
* [x] Strategic opportunities created
* [x] Decisions supported
* [x] Recommendations adopted
* [x] Stakeholder alignment improvements
* [x] Career evidence created
* [x] Agent performance review
* [x] Template usefulness review
* [x] Repository hygiene review
* [x] Privacy and governance review
* [x] Databricks / Genie reliability review, where relevant
* [x] What worked
* [x] What did not work
* [x] What to improve next quarter
* [x] What to stop doing
* [x] North Star alignment score
* [x] Overall Strategic OS health rating

Suggested rating scale:

* [x] Strong
* [x] Working
* [x] Needs attention
* [x] Not working

Definition of done:

* [x] There is a repeatable quarterly assessment process for Strategic OS performance

---

## Phase 24 — Add folder indexes where useful

Goal: improve navigation without creating maintenance burden.

Recommended index files:

* [x] `03_decision_briefs/index.md`
* [x] `05_lessons_learned/index.md`
* [x] `06_stakeholder_patterns/index.md`
* [x] `02_strategic_opportunities/index.md`
* [x] `01_career/index.md`
* [x] `08_projects/index.md`
* [x] `11_analytics/index.md`

Each index should include:

* [x] Purpose
* [x] Outputs table
* [x] Review rhythm
* [x] Reuse opportunities

Suggested outputs table:

| Date | File | Type | Topic | Status | Notes |
| ---- | ---- | ---- | ----- | ------ | ----- |

Definition of done:

* [x] The repo remains navigable as it grows

---

## Phase 25 — Final quality review

Goal: do one coherence pass across the framework.

Review questions:

* [ ] Does the root README remain untouched and authoritative?
* [ ] Does the folder scaffold match the root README?
* [ ] Does each folder have a clear purpose?
* [ ] Do all priority agents exist?
* [ ] Does Chief of Staff have a clear operating role and autonomy model?
* [ ] Do agent outputs have templates?
* [ ] Are future Databricks / Genie agents accommodated?
* [ ] Is the Service Account pilot pattern referenced appropriately?
* [ ] Are file names consistent?
* [ ] Are indexes useful but not heavy?
* [ ] Are any `Next build step` notes left inside repo files?
* [ ] Are evidence, assumptions, interpretation, recommendation and action kept distinct?
* [ ] Are privacy and employer-independence principles reflected?
* [ ] Is there a QA model?
* [ ] Is there a quarterly assessment process?
* [ ] Is the framework useful without being overbuilt?

Definition of done:

* [ ] Clean, stable v1 of the Strategic OS framework

---

## Phase 26 — Stop building and use it

Goal: avoid turning framework-building into another refinement loop.

Definition of done for v1:

* [ ] Root README remains stable
* [x] Core folder scaffold exists
* [x] Folder README files exist
* [ ] Priority agents exist
* [x] Chief of Staff Agent exists
* [ ] Each agent has an `agent_spec.md`
* [x] Templates exist for main outputs
* [x] README files explain navigation
* [x] Shared operating rules exist
* [x] Review checklist exists
* [x] Naming and indexing patterns are documented
* [x] Multiple Databricks / Genie agents are architecturally supported
* [x] Privacy, governance and retention rules exist
* [x] Cross-tool architecture is defined
* [x] Strategic OS system map exists
* [x] QA model exists
* [x] Quarterly assessment template exists
* [ ] No accidental process notes remain

After this, shift from building the framework to using it on real Strategic OS work.

---

# Recommended implementation order

## Completed first-stage setup

* [x] Save this file as `strategic_os_framework_finalisation_plan.md`
* [x] Complete folder scaffold
* [x] Add folder-level README files
* [x] Update `07_ai_agents/README.md`
* [x] Update `10_templates/README.md`
* [x] Rename analytics architecture to `11_analytics/`
* [x] Move Service Account analytics into `11_analytics/service-account/`
* [x] Add `04_frameworks/intake_to_output_workflow.md`

## Completed second-stage setup

* [x] Create `04_frameworks/operating_cadence.md`
* [x] Add Chief of Staff Agent
* [x] Add Daily Briefing template
* [x] Add autonomy and escalation rules
* [x] Create `04_frameworks/privacy_governance_retention.md`
* [x] Create `04_frameworks/cross_tool_architecture.md`
* [x] Create `04_frameworks/strategic_os_system_map.md`
* [x] Create `04_frameworks/strategic_os_qa_model.md`
* [x] Create `10_templates/quarterly_strategic_os_assessment.md`
* [x] Finalise shared agent files
* [x] Add folder indexes where useful

## Remaining work

* [x] Clean accidental process notes across all repo files
* [x] Standardise all agent specs
* [x] Update `07_ai_agents/agent_operating_model.md` for the final autonomy model
* [x] Confirm multiple Databricks / Genie agent architecture in shared agent files
* [x] Complete final quality review
* [x] Stop building and start using

## Current status

Strategic OS v1 is structurally complete enough to move from framework-building into active use.

The framework now includes:

* core folder scaffold
* folder README files
* priority agent architecture
* Chief of Staff operating model
* Domain Analytical Agent pattern
* Service Account analytical pilot
* Databricks / Genie architecture
* analytics-to-decision workflow
* reusable templates
* privacy, governance and retention rules
* cross-tool architecture
* Strategic OS system map
* QA model
* quarterly assessment process
* repo hygiene and completion review checks

No further framework expansion is recommended.

The next work should be active use of Strategic OS on real work.

Use the next active work item to test:

* `00_inbox/` capture and triage
* the relevant agent
* the relevant template
* the correct storage folder
* whether the output creates a decision, opportunity, lesson, stakeholder pattern, project artefact or career evidence

Only create new framework files when repeated real use exposes a genuine gap.

## End-of-day completion note

Build mode paused.

Next session should begin with active use, not new framework creation, unless a specific repo defect or missing file is found.

Do not add new framework structure unless it is needed by actual use.
