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

- Business Design practice
- Human-Centred Design practice
- strategic sensemaking
- decision support
- stakeholder management
- career development
- AI-enabled ways of working
- reusable knowledge creation

North Star:

> Increase strategic opportunities by helping leaders make better strategic decisions.

Desired reputation:

> He helps us make better strategic decisions.

---

# Finalisation checklist

## Phase 1 — Clean accidental process notes

Goal: remove chat-process language from repository files.

Files to review:

- [ ] `07_ai_agents/README.md`
- [ ] `07_ai_agents/agent_file_naming.md`
- [ ] `07_ai_agents/agent_output_index_pattern.md`
- [ ] `07_ai_agents/agent_operating_model.md`
- [ ] `07_ai_agents/agent_prompt_pattern.md`
- [ ] `10_templates/README.md`
- [ ] Any other files created during the agents-framework build

Remove:

- [ ] `## Next build step` sections
- [ ] “The next agents-framework update should...”
- [ ] “Recommended file...”
- [ ] “When you type 3...”
- [ ] Any chat-process notes
- [ ] Any temporary continuity notes that do not belong in durable repo documentation

Keep:

- [ ] Purpose
- [ ] When to use
- [ ] Rules
- [ ] Patterns
- [ ] Examples
- [ ] Review checklists
- [ ] File naming guidance
- [ ] Storage logic

Definition of done:

- [ ] Markdown files read like durable repository documentation, not chat transcripts

---

## Phase 2 — Confirm root README as source of truth

Goal: protect the root README from unnecessary changes.

Check that root `README.md` clearly defines:

- [ ] Purpose
- [ ] North Star
- [ ] Desired Reputation
- [ ] Strategic Positioning
- [ ] Why This Exists
- [ ] Design Principles
- [ ] Architecture
- [ ] Priority Agents
- [ ] Primary Success Measures
- [ ] Repository Structure

Definition of done:

- [ ] Root README remains stable and authoritative
- [ ] Any detailed operating rules live in supporting files, not the root README

---

## Phase 3 — Complete whole-repo folder scaffold

Goal: ensure the repository structure matches the Strategic OS architecture.

Create or confirm these folders:

- [ ] `00_inbox/`
- [ ] `01_career/`
- [ ] `02_strategic_opportunities/`
- [ ] `03_decision_briefs/`
- [ ] `04_frameworks/`
- [ ] `05_lessons_learned/`
- [ ] `06_stakeholder_patterns/`
- [ ] `07_ai_agents/`
- [ ] `08_projects/`
- [ ] `09_thought_leadership/`
- [ ] `10_templates/`
- [ ] `analytics/`

Definition of done:

- [ ] All core Strategic OS folders exist
- [ ] Empty folders include a `.gitkeep` or a lightweight `README.md`

---

## Phase 4 — Add folder-level README files

Goal: make each folder understandable without needing chat context.

Create or refine:

- [ ] `00_inbox/README.md`
- [ ] `01_career/README.md`
- [ ] `02_strategic_opportunities/README.md`
- [ ] `03_decision_briefs/README.md`
- [ ] `04_frameworks/README.md`
- [ ] `05_lessons_learned/README.md`
- [ ] `06_stakeholder_patterns/README.md`
- [ ] `07_ai_agents/README.md`
- [ ] `08_projects/README.md`
- [ ] `09_thought_leadership/README.md`
- [ ] `10_templates/README.md`
- [ ] `analytics/README.md`

Each folder README should include:

- [ ] Purpose
- [ ] What belongs here
- [ ] What does not belong here
- [ ] Suggested file naming
- [ ] Related templates
- [ ] Related agents
- [ ] Review rhythm, where relevant

Definition of done:

- [ ] A future chat or collaborator can understand the repository structure from the folder README files

---

## Phase 5 — Define the intake-to-output workflow

Goal: define how raw input becomes useful Strategic OS knowledge.

Create:

- [ ] `04_frameworks/intake_to_output_workflow.md`

Workflow to define:

- [ ] Capture in `00_inbox/`
- [ ] Triage
- [ ] Decide output type
- [ ] Use relevant agent
- [ ] Use relevant template
- [ ] Review
- [ ] Store in correct folder
- [ ] Index if useful
- [ ] Convert into reusable pattern, lesson or career evidence where relevant

Possible flow:

- [ ] inbox item to decision brief
- [ ] inbox item to strategic opportunity
- [ ] inbox item to lesson learned
- [ ] inbox item to stakeholder pattern
- [ ] inbox item to project artefact
- [ ] inbox item to career evidence
- [ ] inbox item to thought leadership

Definition of done:

- [ ] Strategic OS has a clear pathway from capture to reusable knowledge

---

## Phase 6 — Define the operating cadence

Goal: make Strategic OS an operating system, not just a repository.

Create:

- [ ] `04_frameworks/operating_cadence.md`

Suggested cadence:

### Daily

- [ ] Chief of Staff daily briefing
- [ ] Calendar and priority check
- [ ] Admin task check
- [ ] Decision-required check

### Weekly

- [ ] Sensemaking review
- [ ] Shipping review
- [ ] Stakeholder alignment check for active work
- [ ] Inbox triage

### Monthly

- [ ] Career Architect opportunity review
- [ ] Strategic opportunities review
- [ ] Lessons learned review
- [ ] Frameworks and templates review

### Quarterly

- [ ] Strategic OS QA assessment
- [ ] Agent performance review
- [ ] Career evidence review
- [ ] Repository hygiene review
- [ ] North Star alignment review

Definition of done:

- [ ] The system has a lightweight rhythm for use and maintenance

---

## Phase 7 — Finalise AI agents framework

Goal: stabilise the general agent framework under `07_ai_agents/`.

Current priority agents:

- [ ] Sensemaking Agent
- [ ] Stakeholder Journey Agent
- [ ] Shipping Coach
- [ ] Career Architect
- [ ] Chief of Staff Agent

Shared files to create or confirm:

- [ ] `07_ai_agents/README.md`
- [ ] `07_ai_agents/agent_operating_model.md`
- [ ] `07_ai_agents/agent_review_checklist.md`
- [ ] `07_ai_agents/agent_prompt_pattern.md`
- [ ] `07_ai_agents/agent_output_map.md`
- [ ] `07_ai_agents/agent_file_naming.md`
- [ ] `07_ai_agents/agent_output_index_pattern.md`

Definition of done:

- [ ] `07_ai_agents/` explains what agents exist, how they work, how to run them and how to review outputs

---

## Phase 8 — Standardise all agent specs

Goal: make each agent spec coherent and consistent.

Agent spec files:

- [ ] `07_ai_agents/sensemaking_agent/agent_spec.md`
- [ ] `07_ai_agents/stakeholder_agent/agent_spec.md`
- [ ] `07_ai_agents/shipping_coach/agent_spec.md`
- [ ] `07_ai_agents/career_architect/agent_spec.md`
- [ ] `07_ai_agents/chief_of_staff/agent_spec.md`

Standard structure:

- [ ] `# [Agent Name] Specification`
- [ ] `## Mission`
- [ ] `## Primary Question`
- [ ] `## Inputs`
- [ ] `## Outputs`
- [ ] `## Reasoning Framework`
- [ ] `## Operating Autonomy`
- [ ] `## Human In The Loop`
- [ ] `## Success Metrics`
- [ ] `## Failure Modes`

Checks:

- [ ] Same heading pattern across all files
- [ ] No chat notes
- [ ] Missions match Strategic OS intent
- [ ] Outputs match templates
- [ ] Human-in-the-loop rules are clear
- [ ] Failure modes are practical
- [ ] Agent boundaries are explicit

Definition of done:

- [ ] All priority agents feel like one coherent system

---

## Phase 9 — Add Chief of Staff Agent

Goal: add an operating agent that keeps the lights on and coordinates day-to-day activity.

Create:

- [ ] `07_ai_agents/chief_of_staff/`
- [ ] `07_ai_agents/chief_of_staff/agent_spec.md`
- [ ] `07_ai_agents/chief_of_staff/autonomy_rules.md`
- [ ] `07_ai_agents/chief_of_staff/escalation_rules.md`

Mission:

- [ ] Keep the lights on, coordinate day-to-day activity and connect daily delivery to the Strategic OS North Star

Primary question:

- [ ] What needs attention today, what can be handled autonomously and what requires the user’s decision?

Primary output:

- [ ] Daily Briefing

Possible secondary outputs:

- [ ] Weekly operating review
- [ ] Admin task list
- [ ] Calendar plan
- [ ] Decision-required list
- [ ] Follow-up tracker
- [ ] Focus protection recommendation

Chief of Staff responsibilities:

- [ ] Check and summarise emails
- [ ] Read and summarise relevant news or updates
- [ ] Support calendar planning
- [ ] Prepare daily briefings
- [ ] Track admin tasks
- [ ] Identify decisions required from the user
- [ ] Coordinate follow-ups
- [ ] Connect day-to-day work to strategic priorities
- [ ] Surface risks, deadlines and missed commitments
- [ ] Protect focus and reduce operational drag

Definition of done:

- [ ] Chief of Staff Agent has clear responsibilities, autonomy and escalation rules

---

## Phase 10 — Define agent autonomy model

Goal: define how independent each agent can be.

Update:

- [ ] `07_ai_agents/agent_operating_model.md`

Suggested autonomy levels:

### Level 1 — Advisory

Agent provides advice only.

Examples:

- [ ] Sensemaking Agent
- [ ] Stakeholder Journey Agent
- [ ] Career Architect

### Level 2 — Coaching / challenge

Agent can recommend action and challenge delay but does not act independently.

Example:

- [ ] Shipping Coach

### Level 3 — Operational coordination

Agent can organise, prioritise and make low-risk day-to-day decisions within defined rules.

Example:

- [ ] Chief of Staff Agent

### Level 4 — Domain analytical support

Agent can interrogate governed data through approved tools and produce analysis within documented caveats.

Examples:

- [ ] Future Databricks / Genie agents

### Level 5 — Human approval required

Any action involving sensitive communication, formal decisions, stakeholder commitments, external publication, governance or career moves requires human approval.

Definition of done:

- [ ] Agent autonomy is explicit
- [ ] Chief of Staff independence is supported safely
- [ ] Future Databricks / Genie agents have a place in the model

---

## Phase 11 — Finalise templates

Goal: ensure every priority agent has usable templates.

Existing or planned templates:

- [ ] `10_templates/decision_brief.md`
- [ ] `10_templates/lesson_learned.md`
- [ ] `10_templates/stakeholder_alignment_assessment.md`
- [ ] `10_templates/shipping_recommendation.md`
- [ ] `10_templates/opportunity_review.md`
- [ ] `10_templates/career_guidance.md`
- [ ] `10_templates/promotion_readiness_assessment.md`
- [ ] `10_templates/daily_briefing.md`

Potential future templates:

- [ ] `10_templates/weekly_operating_review.md`
- [ ] `10_templates/admin_task_list.md`
- [ ] `10_templates/follow_up_tracker.md`
- [ ] `10_templates/quarterly_qa_assessment.md`

Standard template structure:

- [ ] `# [Template Name]`
- [ ] `## Purpose`
- [ ] `## When to use`
- [ ] Main working sections
- [ ] Final recommendation or output
- [ ] Review checklist

Definition of done:

- [ ] Every priority agent has at least one primary output template
- [ ] Templates are practical and free of process notes

---

## Phase 12 — Finalise templates README

Goal: make the templates folder easy to navigate.

Update:

- [ ] `10_templates/README.md`

It should list:

- [ ] template name
- [ ] supporting agent
- [ ] purpose
- [ ] when to use

It should not include:

- [ ] next build steps
- [ ] chat-process language
- [ ] duplicate long explanations already inside each template

Definition of done:

- [ ] Templates are clearly connected to agents and Strategic OS workflows

---

## Phase 13 — Define strategic opportunity pipeline

Goal: support the North Star by making opportunities visible and actionable.

Create:

- [ ] `02_strategic_opportunities/README.md`
- [ ] `02_strategic_opportunities/index.md`
- [ ] `04_frameworks/strategic_opportunity_pipeline.md`

Suggested opportunity states:

- [ ] Captured
- [ ] Shaping
- [ ] Socialising
- [ ] Active
- [ ] Parked
- [ ] Declined
- [ ] Converted to project
- [ ] Converted to career evidence

Opportunity review should consider:

- [ ] strategic value
- [ ] stakeholder value
- [ ] organisational value
- [ ] customer value
- [ ] career value
- [ ] evidence value
- [ ] timing
- [ ] trade-offs

Definition of done:

- [ ] Strategic opportunities can be captured, shaped, reviewed and converted into action or evidence

---

## Phase 14 — Define career evidence architecture

Goal: make career growth and promotion readiness part of the system.

Create or confirm:

- [ ] `01_career/README.md`
- [ ] `01_career/achievements/`
- [ ] `01_career/feedback/`
- [ ] `01_career/opportunities/`
- [ ] `01_career/promotion_readiness/`

Create:

- [ ] `04_frameworks/career_evidence_architecture.md`

Career evidence flow:

- [ ] project artefact
- [ ] achievement note
- [ ] promotion proof point
- [ ] career narrative
- [ ] role application or development conversation

Evidence categories:

- [ ] strategic influence
- [ ] organisational impact
- [ ] customer-centred practice
- [ ] systems thinking
- [ ] human-centred design
- [ ] AI-enabled capability
- [ ] stakeholder influence
- [ ] delivery and follow-through

Definition of done:

- [ ] Strategic OS can convert work into career evidence and long-term positioning

---

## Phase 15 — Define frameworks library

Goal: create a home for reusable thinking models.

Create:

- [ ] `04_frameworks/README.md`

Potential framework categories:

- [ ] decision frameworks
- [ ] stakeholder frameworks
- [ ] service design frameworks
- [ ] system mapping frameworks
- [ ] analytics interpretation frameworks
- [ ] opportunity assessment frameworks
- [ ] career positioning frameworks
- [ ] QA and performance frameworks

Definition of done:

- [ ] Reusable thinking patterns have a clear home outside project-specific folders

---

## Phase 16 — Define project folder architecture

Goal: make future project folders consistent.

Create:

- [ ] `08_projects/README.md`
- [ ] `04_frameworks/project_folder_pattern.md`

Recommended project pattern:

- [ ] `08_projects/[project-name]/README.md`
- [ ] `08_projects/[project-name]/context.md`
- [ ] `08_projects/[project-name]/decisions.md`
- [ ] `08_projects/[project-name]/stakeholder-notes.md`
- [ ] `08_projects/[project-name]/outputs/`
- [ ] `08_projects/[project-name]/lessons-learned.md`
- [ ] `08_projects/[project-name]/archive/`

Definition of done:

- [ ] Future projects can be added without inventing structure each time

---

## Phase 17 — Accommodate multiple Databricks / Genie agents

Goal: prepare the architecture for multiple data and analytics agents.

Update one or more of:

- [ ] `07_ai_agents/README.md`
- [ ] `07_ai_agents/agent_operating_model.md`
- [ ] `07_ai_agents/agent_output_map.md`
- [ ] `analytics/README.md`

Principles:

- [ ] General personal agents live under `07_ai_agents/`
- [ ] Domain-specific analytical agents may live inside `analytics/` or project folders
- [ ] Databricks / Genie agents require explicit source rules and caveats
- [ ] Multiple Genie agents may exist for different domains
- [ ] Service Account is the first pilot pattern, not the only future pattern

Potential future domains:

- [ ] `analytics/service-account/`
- [ ] `analytics/channel-strategy/`
- [ ] `analytics/customer-demand/`
- [ ] `analytics/support-csat/`
- [ ] `analytics/executive-metrics/`
- [ ] `analytics/data-quality/`

Potential domain-agent files:

- [ ] `agent_context.md`
- [ ] `agent_review_prompt.md`
- [ ] `agent_consistency_check.md`
- [ ] `genie_context.md`
- [ ] `metric_caveats.md`
- [ ] `source_rules.md`

Definition of done:

- [ ] Strategic OS can support multiple Databricks / Genie agents without forcing them into one generic agent

---

## Phase 18 — Link to Service Account pilot pattern

Goal: recognise the Service Account analytics area as the first mature domain-agent pattern.

Reference area:

- [ ] `analytics/service-account/`

Relevant concepts:

- [ ] agent consistency checks
- [ ] agent review prompts
- [ ] Genie context rules
- [ ] metric caveats
- [ ] documentation governance
- [ ] evidence boundaries
- [ ] GA4 as contextual evidence only
- [ ] Databricks metrics as governed headline sources

What to do:

- [ ] Add a light reference to the Service Account pattern in the general framework
- [ ] Keep Service Account-specific rules inside `analytics/service-account/`
- [ ] Avoid copying all project-specific detail into `07_ai_agents/`

Definition of done:

- [ ] The framework can reuse the Service Account lesson without overgeneralising it

---

## Phase 19 — Define privacy, governance and retention rules

Goal: protect the repository from storing inappropriate material.

Create:

- [ ] `04_frameworks/privacy_governance_retention.md`

Rules should cover:

- [ ] no raw organisational source data
- [ ] no customer-level records
- [ ] no sensitive stakeholder commentary
- [ ] no confidential source extracts
- [ ] no private HR details unless safe and necessary
- [ ] no operational data copied from systems of record
- [ ] use summaries, patterns, caveats and reusable learning instead
- [ ] separate personal reflections from organisational facts
- [ ] mark assumptions clearly
- [ ] review sensitive files before committing

Definition of done:

- [ ] Strategic OS has explicit safety rules for what can and cannot be stored

---

## Phase 20 — Define cross-tool architecture

Goal: clarify how GitHub connects to other tools.

Create:

- [ ] `04_frameworks/cross_tool_architecture.md`

Define roles:

- [ ] GitHub as knowledge repository
- [ ] Relevance AI as agent memory and reasoning layer
- [ ] Make.com as workflow orchestration
- [ ] Slack as user interface
- [ ] Databricks Genie as governed data interrogation
- [ ] Power BI as reporting source of truth
- [ ] SharePoint / OneDrive as organisational document stores
- [ ] Teams / email / calendar as operational coordination tools
- [ ] Miro as visual collaboration and system mapping workspace
- [ ] Jira as delivery tracking system

Definition of done:

- [ ] The system has clear boundaries across tools, especially for Chief of Staff and Databricks / Genie agents

---

## Phase 21 — Add Strategic OS system map

Goal: create a whole-system map for future continuity.

Create:

- [ ] `04_frameworks/strategic_os_system_map.md`

The system map should show:

- [ ] inputs
- [ ] inbox
- [ ] agents
- [ ] templates
- [ ] output folders
- [ ] review points
- [ ] indexes
- [ ] reusable knowledge
- [ ] career evidence
- [ ] projects
- [ ] analytics domains
- [ ] external tools

Core flow:

- [ ] Inputs
- [ ] `00_inbox/`
- [ ] Agent support
- [ ] Template output
- [ ] Review
- [ ] Storage
- [ ] Index
- [ ] Reuse
- [ ] Strategic opportunity or decision

Definition of done:

- [ ] A new chat can understand the whole Strategic OS from one system map file

---

## Phase 22 — Add QA model for Strategic OS performance

Goal: define how the performance and quality of Strategic OS will be assessed over time.

Create:

- [ ] `04_frameworks/strategic_os_qa_model.md`

The QA model should assess:

- [ ] strategic usefulness
- [ ] decision quality
- [ ] stakeholder alignment support
- [ ] shipping discipline
- [ ] career development support
- [ ] agent output quality
- [ ] template usefulness
- [ ] repository hygiene
- [ ] privacy and governance compliance
- [ ] cross-tool reliability
- [ ] Databricks / Genie analytical reliability
- [ ] North Star alignment

Suggested QA dimensions:

### Strategic impact

- [ ] Did Strategic OS help create or shape strategic opportunities?
- [ ] Did it help leaders make better strategic decisions?
- [ ] Were recommendations adopted or used?
- [ ] Did it improve stakeholder alignment?

### Output quality

- [ ] Are outputs clear?
- [ ] Are outputs decision-oriented?
- [ ] Are outputs practical?
- [ ] Are trade-offs visible?
- [ ] Are next actions clear?

### Evidence quality

- [ ] Is evidence separated from interpretation?
- [ ] Are assumptions visible?
- [ ] Are caveats included?
- [ ] Are governed metrics protected?
- [ ] Are contextual signals labelled correctly?

### Agent performance

- [ ] Did the right agent get used for the right task?
- [ ] Did agent outputs follow the relevant spec?
- [ ] Did agents stay within their boundaries?
- [ ] Were human-in-the-loop points respected?
- [ ] Did any agent create unnecessary work?

### Repository quality

- [ ] Are files easy to find?
- [ ] Are indexes maintained?
- [ ] Are filenames consistent?
- [ ] Are outdated files archived or marked?
- [ ] Are templates still useful?

### Privacy and safety

- [ ] Is organisational source data excluded?
- [ ] Are sensitive details removed or generalised?
- [ ] Are stakeholder assumptions handled carefully?
- [ ] Are career records safe to retain?
- [ ] Are project-specific caveats clear?

### Operating discipline

- [ ] Is the inbox being triaged?
- [ ] Are lessons learned captured?
- [ ] Are opportunities reviewed?
- [ ] Are unfinished drafts being shipped, socialised, refined or stopped?
- [ ] Is daily work connected back to the North Star?

Definition of done:

- [ ] Strategic OS has a clear performance and quality model
- [ ] The model can be used in quarterly assessment

---

## Phase 23 — Add quarterly Strategic OS assessment

Goal: create a quarterly review process to assess whether Strategic OS is working.

Create:

- [ ] `10_templates/quarterly_strategic_os_assessment.md`

Potential storage location for completed assessments:

- [ ] `05_lessons_learned/`
- [ ] `04_frameworks/qa_assessments/`
- [ ] or `01_career/promotion_readiness/` if used for career evidence

Quarterly assessment sections:

- [ ] Quarter reviewed
- [ ] Strategic opportunities created
- [ ] Decisions supported
- [ ] Recommendations adopted
- [ ] Stakeholder alignment improvements
- [ ] Career evidence created
- [ ] Agent performance review
- [ ] Template usefulness review
- [ ] Repository hygiene review
- [ ] Privacy and governance review
- [ ] Databricks / Genie reliability review, where relevant
- [ ] What worked
- [ ] What did not work
- [ ] What to improve next quarter
- [ ] What to stop doing
- [ ] North Star alignment score
- [ ] Overall Strategic OS health rating

Suggested rating scale:

- [ ] Strong
- [ ] Working
- [ ] Needs attention
- [ ] Not working

Definition of done:

- [ ] There is a repeatable quarterly assessment process for Strategic OS performance

---

## Phase 24 — Add folder indexes where useful

Goal: improve navigation without creating maintenance burden.

Recommended index files:

- [ ] `03_decision_briefs/index.md`
- [ ] `05_lessons_learned/index.md`
- [ ] `06_stakeholder_patterns/index.md`
- [ ] `02_strategic_opportunities/index.md`
- [ ] `01_career/index.md`
- [ ] `08_projects/index.md`
- [ ] `analytics/index.md`

Each index should include:

- [ ] Purpose
- [ ] Outputs table
- [ ] Review rhythm
- [ ] Reuse opportunities

Suggested outputs table:

| Date | File | Type | Topic | Status | Notes |
|---|---|---|---|---|---|

Definition of done:

- [ ] The repo remains navigable as it grows

---

## Phase 25 — Final quality review

Goal: do one coherence pass across the framework.

Review questions:

- [ ] Does the root README remain untouched and authoritative?
- [ ] Does the folder scaffold match the root README?
- [ ] Does each folder have a clear purpose?
- [ ] Do all priority agents exist?
- [ ] Does Chief of Staff have a clear operating role and autonomy model?
- [ ] Do agent outputs have templates?
- [ ] Are future Databricks / Genie agents accommodated?
- [ ] Is the Service Account pilot pattern referenced appropriately?
- [ ] Are file names consistent?
- [ ] Are indexes useful but not heavy?
- [ ] Are any `Next build step` notes left inside repo files?
- [ ] Are evidence, assumptions, interpretation, recommendation and action kept distinct?
- [ ] Are privacy and employer-independence principles reflected?
- [ ] Is there a QA model?
- [ ] Is there a quarterly assessment process?
- [ ] Is the framework useful without being overbuilt?

Definition of done:

- [ ] Clean, stable v1 of the Strategic OS framework

---

## Phase 26 — Stop building and use it

Goal: avoid turning framework-building into another refinement loop.

Definition of done for v1:

- [ ] Root README remains stable
- [ ] Core folder scaffold exists
- [ ] Folder README files exist
- [ ] Priority agents exist
- [ ] Chief of Staff Agent exists
- [ ] Each agent has an `agent_spec.md`
- [ ] Templates exist for main outputs
- [ ] README files explain navigation
- [ ] Shared operating rules exist
- [ ] Review checklist exists
- [ ] Naming and indexing patterns are documented
- [ ] Multiple Databricks / Genie agents are architecturally supported
- [ ] Privacy, governance and retention rules exist
- [ ] Cross-tool architecture is defined
- [ ] Strategic OS system map exists
- [ ] QA model exists
- [ ] Quarterly assessment template exists
- [ ] No accidental process notes remain

After this, shift from building the framework to using it on real Strategic OS work.

---

# Recommended implementation order

## First

- [ ] Save this file as `strategic_os_framework_finalisation_plan.md`
- [ ] Clean accidental process notes from existing files
- [ ] Confirm actual repo folder state

## Second

- [ ] Complete folder scaffold
- [ ] Add folder-level README files
- [ ] Update `07_ai_agents/README.md`
- [ ] Update `10_templates/README.md`

## Third

- [ ] Add Chief of Staff Agent
- [ ] Add Daily Briefing template
- [ ] Add autonomy and escalation rules

## Fourth

- [ ] Add intake-to-output workflow
- [ ] Add operating cadence
- [ ] Add cross-tool architecture
- [ ] Add privacy, governance and retention rules

## Fifth

- [ ] Add Databricks / Genie multi-agent pattern
- [ ] Link Service Account as the first mature analytics pilot pattern

## Sixth

- [ ] Add QA model
- [ ] Add quarterly Strategic OS assessment template

## Seventh

- [ ] Add indexes where useful
- [ ] Complete final quality review
- [ ] Stop building and start using
