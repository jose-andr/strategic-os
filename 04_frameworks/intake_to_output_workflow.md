# Intake To Output Workflow

## Purpose

This framework defines how raw input becomes useful Strategic OS knowledge.

It creates a clear pathway from capture to decision support, reusable learning, stakeholder insight, project material, career evidence and strategic opportunity development.

The goal is to prevent Strategic OS from becoming a dumping ground.

Every useful input should either become an output, become reusable knowledge, remain temporary, or be discarded.

## Strategic OS North Star

> Increase strategic opportunities by helping leaders make better strategic decisions.

## Core Principle

Capture broadly.

Triage deliberately.

Store selectively.

Reuse intentionally.

Discard confidently.

Automate repetitive administration where safe.

## Workflow Overview

The standard workflow is:

1. Capture
2. Triage
3. Decide output type
4. Use relevant agent
5. Use relevant template
6. Review
7. Store in the correct repository folder
8. Link or explore through Obsidian when useful and available
9. Reuse
10. Discard or archive what no longer has value

Slack is the primary Strategic OS agent interaction surface.

GitHub web is the primary cloud-accessible Strategic OS workspace.

GitHub-backed Markdown is the durable Strategic OS record.

Obsidian desktop and mobile are optional enhanced navigation, linking and visual-thinking surfaces.

Approved enterprise tools such as Microsoft 365 Copilot may support organisational meeting synthesis, knowledge retrieval and automation before privacy-safe abstraction into Strategic OS.

Approved capture tools may provide temporary source material, but the capture surface does not determine durable storage.

## 1. Capture

### Purpose

Capture useful raw material before it is lost.

Raw material may include:

- meeting notes
- stakeholder comments
- project observations
- customer insights
- service pain points
- strategic signals
- decision questions
- risks
- ideas
- lessons
- career evidence
- analytics observations
- thought-leadership seeds
- daily briefing notes
- weekly operating review signals
- follow-up dependencies
- Databricks or Genie interpretation notes
- approved Copilot meeting or knowledge summaries
- privacy-safe abstractions from approved capture tools

### Capture Surfaces

Inputs may begin in:

- Slack
- GitHub web
- `00_inbox/`
- Obsidian desktop or mobile when available
- meeting notes
- Microsoft 365 Copilot or other approved enterprise AI
- approved organisational tools
- approved conversation-capture tools
- an agent conversation
- personal reflection

The capture surface does not determine the durable storage location.

Raw organisational source material should remain in its approved system of record.

Only reviewed, privacy-safe and reusable abstraction should move into Strategic OS.

### Slack Capture Rule

Slack is useful for fast capture and agent interaction.

Do not retain an entire Slack conversation merely because part of it is useful.

Extract the reusable signal and move only the reviewed, privacy-safe result into Strategic OS.

### Obsidian Capture Rule

Obsidian desktop or mobile may be used for optional Markdown capture when available, but Strategic OS must not depend on Obsidian for capture or operation.

Unprocessed material should still follow the inbox and triage discipline.

Avoid creating permanent notes for every thought.

If the input is not yet classified and is safe to retain, use `00_inbox/`.

### Enterprise AI And Conversation-Capture Rule

Organisational conversations may contain useful decision context, stakeholder signals, commitments, risks, unresolved questions and reusable learning.

Strategic OS should use those conversations selectively without becoming a transcript repository.

The operating principle is:

> Reuse approved source transcripts where they already exist. Use approved capture tools only where needed. Interpret through Strategic OS agents. Retain only reviewed strategic abstraction.

#### Source hierarchy

Use the lowest-cost approved source that preserves useful conversational evidence.

Preferred order:

1. approved organisational transcript, such as a Microsoft Teams transcript;
2. approved external capture and transcription service, such as PLAUD, where organisational requirements permit;
3. approved manual notes;
4. no capture where recording or transcription is not permitted.

Microsoft 365 Copilot may support authorised organisational synthesis, search or administrative work where enabled, but Strategic OS does not depend on Copilot-generated interpretation.

Where a raw Teams transcript is available and permitted for use, prefer the transcript itself as source evidence rather than relying on an AI-generated meeting summary.

PLAUD should be treated as a complementary conversation-capture capability, not the mandatory source for every meeting.

Useful PLAUD scenarios may include:

- permitted Teams or online meetings where organisational transcription is unavailable;
- permitted in-person stakeholder meetings;
- permitted workshops;
- permitted phone conversations;
- personal reflections or voice notes; and
- other conversations that would otherwise lose strategically useful context.

External capture tools such as PLAUD remain subject to organisational approval, consent, privacy, security, information-management and records requirements.

A capture tool must never be used to bypass a restriction on recording or transcription.

#### Source-independent conversation intake

Strategic OS agents should operate on approved conversational evidence regardless of which permitted source produced it.

Typical sources may include:

- Teams transcript;
- PLAUD transcript;
- approved meeting notes;
- approved workshop notes; or
- personal reflection.

The downstream reasoning workflow should remain consistent across sources.

Suggested flow:

    Conversation
        ↓
    Approved transcript or notes
        ↓
    Strategic OS conversation extraction
        ↓
    Human review
        ↓
    Approve / edit / discard
        ↓
    Relevant Strategic OS destination

The capture source does not determine the Strategic OS destination.

#### Conversation extraction

Where a transcript or sufficiently detailed conversation record is available, the relevant Strategic OS agent should extract only decision-relevant and reusable signals.

Use this seven-part structure:

1. **Decision**  
   What decision was made, clarified, deferred, challenged or revealed as necessary?

2. **Evidence**  
   What was explicitly stated, agreed or demonstrated?

3. **Stakeholder signal**  
   What became clearer about priorities, concerns, expectations, decision criteria, alignment, tension or support needs?

4. **Unresolved**  
   What remains uncertain, contested, unvalidated, dependent on further evidence or awaiting a decision?

5. **Strategic opportunity**  
   Is there an opportunity to improve a strategic decision, stakeholder alignment, evidence use, service design or organisational capability?

6. **Next action**  
   What is the smallest useful next action?

7. **Strategic signal**  
   What is the minimum reusable insight worth carrying forward?

The extraction must:

- distinguish evidence from interpretation;
- preserve uncertainty;
- avoid inventing agreement, intent, decisions or commitments;
- flag possible transcription errors or missing context;
- identify claims requiring validation against a system of record;
- minimise sensitive or identifiable detail; and
- remain a draft until human reviewed.

If no meaningful strategic signal exists, discard the output.

#### Tool roles

Where approved and configured, the preferred roles are:

**Teams or approved organisational systems**

Provide authorised source transcripts and remain organisational systems of record.

**PLAUD**

Provides supplementary conversation capture and transcription where permitted.

PLAUD does not become the Strategic OS knowledge repository.

**Slack**

Acts as the primary Strategic OS interaction and review surface.

Slack may be used to:

- submit an approved transcript or reference;
- trigger conversation analysis;
- review the extracted strategic signal;
- approve, edit or discard the result; and
- request follow-up from the relevant agent.

Slack conversation history should not be treated as durable Strategic OS knowledge merely because analysis occurred there.

**Make.com**

Provides workflow orchestration where appropriate.

Typical responsibilities may include:

- receiving an approved conversation input;
- routing metadata and permitted transcript content to the relevant agent;
- returning structured outputs to Slack;
- routing approved outputs toward the correct workflow; and
- reducing repetitive manual administration.

Make.com should move and coordinate information rather than provide strategic judgement.

**Relevance AI**

Provides agent reasoning, structured interpretation and memory where appropriate.

A conversation-analysis agent may use the seven-part extraction structure to convert approved source material into decision-relevant signals.

Relevance AI must not be treated as an organisational system of record.

**GitHub / Strategic OS**

Stores only approved durable abstraction.

Raw organisational transcripts, recordings and sensitive source material must not be stored in the Strategic OS repository.

#### Human review gate

Conversation-derived outputs require human review before durable retention.

The reviewer should decide:

- Is the evidence represented accurately?
- Is interpretation separated from what was explicitly stated?
- Is the decision signal real rather than inferred?
- Are stakeholder signals proportionate to the evidence?
- Is sensitive material sufficiently removed or abstracted?
- Does the output contain reusable strategic value?
- Does it belong in Strategic OS at all?
- Which existing output type or folder is appropriate?

The result should be:

- approve;
- edit; or
- discard.

Automatic transcript-to-GitHub storage is not permitted.

#### Routing approved strategic signals

After review, route only the minimum useful abstraction.

Typical routing includes:

- decision or trade-off → `03_decision_briefs/`
- strategic possibility → `02_strategic_opportunities/`
- reusable learning → `05_lessons_learned/`
- stakeholder pattern → `06_stakeholder_patterns/`
- project-specific context → `08_projects/`
- career evidence → `01_career/`
- useful but not yet classified → `00_inbox/`
- no enduring value → discard

Do not create a new output type when an existing Strategic OS structure is adequate.

#### Cost-aware capture rule

Do not pay to recreate a transcript that already exists in an approved organisational system.

For an online meeting:

    Is an approved organisational transcript available?
        ↓
      Yes → use that transcript
        ↓
       No
        ↓
    Is external capture permitted?
        ↓
      Yes → use approved PLAUD capture or another approved source
        ↓
       No
        ↓
    use approved manual notes or do not capture

This keeps PLAUD focused on the conversations where it adds unique value rather than duplicating existing organisational capabilities.

#### Retention boundary

Raw conversation material may pass through approved processing environments where permitted, but it does not become durable Strategic OS knowledge.

The retention boundary is:

    Raw transcript or recording
        ↓
    temporary approved processing
        ↓
    strategic extraction
        ↓
    human review
        ↓
    approved abstraction only
        ↓
    Strategic OS

Strategic OS stores meaning, not meeting archives.

## 2. Triage

Ask:

- What is this?
- Why does it matter?
- Is there a decision here?
- Is there an opportunity?
- Is there reusable learning?
- Does a stakeholder pattern exist?
- Does it belong to a project?
- Does it support career evidence?
- Is it an analytical interpretation?
- Is an agent useful?
- Is it safe to retain?
- Should it be discarded instead?
- Can this workflow be automated or simplified to reduce recurring human administration without weakening review or governance?

## 3. Decide Output Type

Common output types include:

| Input Need | Output |
|---|---|
| Decision or trade-off | Decision Brief |
| Strategic possibility | Opportunity Review |
| Reusable learning | Lesson Learned |
| Stakeholder alignment issue | Stakeholder Alignment Assessment |
| Delivery friction | Shipping Recommendation |
| Career positioning | Career Guidance |
| Promotion evidence | Promotion Readiness Assessment |
| Daily coordination | Daily Briefing |
| Governed analytical question | Caveated analytical summary |
| Reusable method | Framework |
| Repeated structure | Template |

Do not create a new output type when an existing one is adequate.

## 4. Use Relevant Agent

Use an agent when it meaningfully improves clarity, challenge, synthesis or reuse.

Typical routing:

- Sensemaking Agent — ambiguity, decisions, synthesis
- Stakeholder Journey Agent — alignment, influence, engagement
- Shipping Coach — over-refinement, stalled work, delivery
- Career Architect — career evidence, positioning, opportunities
- Chief of Staff Agent — operating rhythm, coordination, follow-up
- Domain Analytical Agent — governed analytics interpretation

Enterprise AI tools such as Microsoft 365 Copilot remain distinct from Strategic OS agents.

Copilot may supply authorised organisational context or administrative assistance where approved.

Strategic OS agents remain responsible for reusable strategic reasoning patterns, not enterprise source ownership.

## 5. Use Relevant Template

Use a template when it improves consistency, reuse or review.

Common templates include:

- `10_templates/decision_brief.md`
- `10_templates/lesson_learned.md`
- `10_templates/stakeholder_alignment_assessment.md`
- `10_templates/shipping_recommendation.md`
- `10_templates/opportunity_review.md`
- `10_templates/career_guidance.md`
- `10_templates/promotion_readiness_assessment.md`
- `10_templates/daily_briefing.md`
- `10_templates/quarterly_strategic_os_assessment.md`

Do not force a template onto work that does not benefit from structure.

## 6. Review

Before durable storage, ask:

- Is the purpose clear?
- Is the recommendation explicit where relevant?
- Are assumptions separated from evidence?
- Is the confidence level appropriate?
- Is sensitive material removed or abstracted?
- Is the output useful beyond the immediate moment?
- Is the storage location correct?
- Does this need human review before use?
- Is this safe to store?
- Could this be discarded instead?
- Does this support the Strategic OS North Star?

### Human Review Triggers

Human review is required when the output involves:

- stakeholder sensitivity
- formal decisions
- confidential organisational information
- customer-level information
- governed data
- reputational risk
- career or HR consequences
- external publication
- commitments affecting others
- analysis that may be treated as official reporting
- conversion of temporary conversation context into durable knowledge

## 7. Store In The Correct Folder

| Output | Storage Location |
|---|---|
| Unsorted capture | `00_inbox/` |
| Career evidence or positioning | `01_career/` |
| Strategic opportunity | `02_strategic_opportunities/` |
| Decision brief | `03_decision_briefs/` |
| Reusable framework | `04_frameworks/` |
| Lesson learned | `05_lessons_learned/` |
| Stakeholder pattern | `06_stakeholder_patterns/` |
| Agent specification | `07_ai_agents/` |
| Project artefact | `08_projects/` |
| Thought leadership | `09_thought_leadership/` |
| Reusable template | `10_templates/` |
| Analytics guidance | `11_analytics/` |
| QA output | `12_quality/` |

GitHub is authoritative for durable Strategic OS content.

GitHub web is the primary cloud-accessible workspace for maintaining that content.

Obsidian is an optional enhanced interface to that content.

## 8. Link Or Explore Where Useful

Create links only when they improve future retrieval or reasoning.

Useful links may connect:

- a decision to supporting evidence
- a decision to affected stakeholders
- a project to lessons
- a metric to its definition and caveat
- an opportunity to career evidence
- a framework to examples of use
- a stakeholder pattern to relevant decisions

Links may be created through standard Markdown or enhanced through Obsidian when available.

Do not add links merely to make a graph denser.

The purpose of linking is decision support, not visual complexity.

## 9. Reuse

Reusable Strategic OS knowledge should improve future work.

Reuse may include:

- informing a new decision
- preparing for a stakeholder conversation
- applying a service-design pattern
- checking an analytical caveat
- recognising a repeated organisational pattern
- supporting a strategic opportunity
- building career evidence
- adapting a template
- improving an agent prompt
- informing a thought-leadership idea

## 10. Discard Or Archive

Discard:

- raw temporary chat content
- duplicate notes
- low-value capture
- sensitive material that should not be retained
- source material already governed elsewhere
- obsolete operating noise
- raw meeting recordings or transcripts
- raw Copilot or capture-tool output that has no durable Strategic OS value

Archive only when history itself has reusable value.

## Common Flow Patterns

### Inbox Item To Decision Brief

`00_inbox/`
→ Sensemaking Agent
→ `10_templates/decision_brief.md`
→ human review
→ `03_decision_briefs/`
→ GitHub
→ optional Obsidian navigation

Review for:

- clear decision required
- options
- trade-offs
- recommendation
- assumptions
- risks
- next action
- human review points

### Interaction To Durable Knowledge

Slack / approved agent conversation / approved Copilot summary
→ useful insight or recommendation
→ extract reusable value
→ privacy and evidence review
→ relevant template if needed
→ GitHub-backed Markdown
→ optional Obsidian navigation

Do not preserve the raw interaction as the knowledge object.

### Inbox Item To Strategic Opportunity

`00_inbox/`
→ Career Architect or Sensemaking Agent
→ `10_templates/opportunity_review.md`
→ `02_strategic_opportunities/`

Review for:

- opportunity value
- timing
- strategic fit
- stakeholder support
- next move
- evidence required
- trade-offs
- revisit trigger

### Inbox Item To Lesson Learned

`00_inbox/`
→ Shipping Coach or Sensemaking Agent
→ `10_templates/lesson_learned.md`
→ `05_lessons_learned/`

Review for:

- what happened
- what worked
- what failed
- what should be repeated
- what should be avoided
- reusable principle
- privacy-safe abstraction

### Inbox Item To Stakeholder Pattern

`00_inbox/`
→ Stakeholder Journey Agent
→ `10_templates/stakeholder_alignment_assessment.md`
→ `06_stakeholder_patterns/`

Review for:

- stakeholder need
- alignment condition
- concern or resistance
- influence path
- communication framing
- privacy-safe abstraction
- assumptions about people or teams

### Governed Analytics To Decision Support

Business question
→ governed source
→ definition, numerator, denominator, grain and filters
→ caveat check
→ analytical agent
→ human review
→ safe decision-support interpretation

Do not copy raw governed data into Strategic OS.

### Teams Meeting To Organisational Actions And Strategic Signal

Teams meeting
→ use approved raw Teams transcript where available
→ otherwise use an approved capture source where permitted
→ conversation extraction
→ decisions, evidence, stakeholder signals, unresolved questions and opportunities reviewed
→ organisational tasks stay in approved task or collaboration systems
→ reusable strategic learning abstracted where useful
→ human review
→ Strategic OS only if safe and reusable

Do not depend on Copilot-generated interpretation when the approved raw transcript is available.

### Approved Portable Capture To Strategic Signal

Approved in-person, phone or online recording
→ approved capture tool such as PLAUD where permitted
→ transcript
→ conversation extraction
→ consent, privacy and governance review
→ raw source remains outside Strategic OS
→ reusable strategic signal abstracted
→ human review
→ Strategic OS only if appropriate

### Conversation Intake Through Agent Workflow

Approved Teams transcript / PLAUD transcript / approved meeting notes
→ Slack intake or approved workflow trigger
→ Make.com orchestration where configured
→ Relevance AI or relevant Strategic OS agent
→ seven-part conversation extraction
→ Slack review surface
→ approve / edit / discard
→ approved abstraction routed to existing Strategic OS output type
→ GitHub-backed Markdown only when durable retention is justified

Tool responsibilities:

- source system captures or stores the authorised evidence
- Make.com moves and coordinates information
- Relevance AI or the relevant agent interprets the information
- Slack provides the human interaction and review surface
- the human reviewer decides what is retained
- Strategic OS stores only the approved reusable abstraction

## Low-Management Workflow Rule

Prefer workflows that require minimal recurring human administration once configured.

Automation should reduce repetitive capture, routing, filing, reminders and administrative coordination where it can do so safely.

Do not automate:

- strategic judgement
- formal approval
- sensitive stakeholder communication
- governance decisions
- uncontrolled movement of organisational content into Strategic OS

Initial configuration may be complex when it creates a simpler, stable and lower-maintenance operating model afterwards.

## Workflow Review Questions

Ask periodically:

- Which capture channels are genuinely useful?
- Which outputs are repeatedly reused?
- Which steps create unnecessary friction?
- Which steps can be safely automated?
- Are any tools duplicating each other?
- Is GitHub still authoritative?
- Can the workflow operate without optional local applications?
- Is recurring human management proportionate to the value created?
- Are raw organisational sources staying in approved systems?
- Is Strategic OS still helping decisions rather than creating documentation volume?

Do not expand the workflow unless repeated use exposes a genuine gap.
