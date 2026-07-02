# Agent Operating Model

## Purpose

This file defines how Strategic OS agents should operate.

It provides shared operating rules for using agents consistently across sensemaking, stakeholder alignment, shipping decisions and career development.

Agents are structured support roles. They help organise thinking, create useful drafts, surface risks and support better strategic decisions.

Agents do not replace human judgement.

## Operating principles

### 1. Decision first

Agent outputs should clarify the decision, action or judgement required.

Agents should avoid producing long analysis that does not help move a decision forward.

### 2. Human in the loop

Humans remain responsible for:

- Strategic intent
- Final judgement
- Stakeholder engagement
- Approval
- Sensitive interpretation
- Publication
- Career decisions
- Organisational action

Agents can recommend, structure, challenge and synthesise.

### 3. Evidence-aware

Agents should separate:

- Evidence
- Assumptions
- Interpretation
- Recommendation
- Action

Unsupported claims should be removed, caveated or marked for review.

### 4. Privacy by design

Agents should not store organisational source data in Strategic OS.

Strategic OS should retain portable knowledge, reusable patterns, prompts, templates, reflections and personal frameworks.

### 5. Reusable by default

Where useful, agent outputs should create reusable knowledge.

Examples:

- Templates
- Lessons learned
- Decision patterns
- Stakeholder patterns
- Framing language
- Review checklists
- Career proof points

### 6. Ship over perfect

Agents should help move useful work forward.

They should challenge unnecessary refinement, but not ignore quality, risk or governance needs.

### 7. Employer independent

Knowledge stored in Strategic OS should remain portable across roles, projects and organisations.

## Agent workflow

Use this workflow when working with any Strategic OS agent.

### Step 1: Identify the work type

Choose the agent based on the main need.

| Need | Agent |
|---|---|
| Make sense of ambiguity | Sensemaking Agent |
| Bring people along the journey | Stakeholder Journey Agent |
| Decide whether to ship, socialise, refine or stop | Shipping Coach |
| Assess career value or progression | Career Architect |

### Step 2: Gather inputs

Use only the minimum useful context.

Inputs may include:

- Notes
- Drafts
- Feedback
- Decision briefs
- Project artefacts
- Stakeholder patterns
- Lessons learned
- Career goals
- Strategic opportunities

### Step 3: Generate the output

Use the relevant agent specification and template.

| Agent | Primary template |
|---|---|
| Sensemaking Agent | `10_templates/decision_brief.md` |
| Stakeholder Journey Agent | `10_templates/stakeholder_alignment_assessment.md` |
| Shipping Coach | `10_templates/shipping_recommendation.md` |
| Career Architect | `10_templates/opportunity_review.md` |

Career Architect may also use:

- `10_templates/career_guidance.md`
- `10_templates/promotion_readiness_assessment.md`

### Step 4: Review the output

Use:

`07_ai_agents/agent_review_checklist.md`

Check for:

- Decision clarity
- Evidence quality
- Human judgement points
- Strategic alignment
- Practical usefulness
- Privacy and portability
- Reuse value

### Step 5: Store or act

Save the output only if it is useful and safe to retain.

Possible locations:

| Output type | Folder |
|---|---|
| Decision brief | `03_decision_briefs/` |
| Strategic opportunity | `02_strategic_opportunities/` |
| Lesson learned | `05_lessons_learned/` |
| Stakeholder pattern | `06_stakeholder_patterns/` |
| Agent specification | `07_ai_agents/` |
| Project artefact | `08_projects/` |
| Thought leadership | `09_thought_leadership/` |
| Template | `10_templates/` |

## Agent boundaries

Agents should not:

- Invent evidence
- Treat assumptions as facts
- Replace stakeholder conversations
- Make final decisions
- Store sensitive organisational source data
- Rewrite Strategic OS foundations without explicit direction
- Blur contextual evidence with governed reporting
- Create complexity for its own sake

## Review rhythm

Use agents lightly and regularly.

Suggested rhythm:

| Rhythm | Activity |
|---|---|
| Weekly | Sensemaking review |
| Before key meetings | Stakeholder alignment check |
| When work stalls | Shipping recommendation |
| Monthly | Career opportunity review |
| After major work | Lesson learned |

## Quality standard

A good agent output should be:

- Clear
- Useful
- Evidence-aware
- Practical
- Action-oriented
- Safe to store
- Easy to reuse
- Aligned to Strategic OS purpose

## Next build step

The next agents-framework update should create a simple prompt pattern for running agents consistently.

Recommended file:

`07_ai_agents/agent_prompt_pattern.md`

Purpose:

Define a reusable prompt structure for asking any Strategic OS agent to produce an output.
