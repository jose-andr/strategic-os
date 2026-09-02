# Sensemaking Agent — Conversation Intake Workflow

## Purpose

Define the minimum execution workflow for turning approved conversation material into reviewed strategic signals using the existing Strategic OS Sensemaking Agent.

This file operationalises:

`07_ai_agents/sensemaking_agent/relevance_ai_conversation_intake.md`

It does not redefine Sensemaking Agent behaviour.

The behavioural contract remains in:

- `07_ai_agents/sensemaking_agent/agent_spec.md`
- `07_ai_agents/sensemaking_agent/relevance_ai_conversation_intake.md`
- `07_ai_agents/agent_prompt_pattern.md`

This file defines execution only.

---

## MVP goal

Validate the following runtime:

    Slack intake
        ↓
    Make.com
        ↓
    Existing Relevance AI Sensemaking Agent
    Conversation Intake Mode
        ↓
    Seven-part extraction
        ↓
    Slack review
        ↓
    Approve / Edit / Discard

The MVP stops at human review.

Do not automate durable GitHub storage during the MVP.

---

## Operating boundary

Process conversation material only when its use is permitted.

Potential sources include:

- approved Microsoft Teams transcripts;
- approved PLAUD transcripts;
- approved meeting notes;
- approved workshop notes;
- another approved transcript source; or
- personal reflection.

Do not use this workflow to bypass:

- recording restrictions;
- transcription restrictions;
- consent requirements;
- privacy requirements;
- security controls;
- records requirements; or
- organisational information-management rules.

Organisational source material remains in the relevant organisational system of record.

Strategic OS retains only reviewed, privacy-safe abstraction where enduring value exists.

---

# MVP architecture

    Approved conversation source
        ↓
    Slack intake
        ↓
    Make trigger
        ↓
    Validate and structure input
        ↓
    Existing Relevance AI Sensemaking Agent
        ↓
    Conversation Intake Mode
        ↓
    Structured seven-part output
        ↓
    Make formats result
        ↓
    Slack review
        ↓
    Human decision
        ↓
    Approve / Edit / Discard

## Slack

Slack is the:

- intake surface;
- interaction surface;
- review surface.

Slack is not durable Strategic OS storage.

## Make.com

Make is the orchestration layer.

It may:

- receive the trigger;
- parse input;
- validate required fields;
- call Relevance AI;
- receive structured output;
- format the response;
- return it to Slack;
- capture workflow state.

Make must not perform strategic reasoning.

## Relevance AI

Relevance AI is the reasoning layer.

Use the existing:

**Strategic OS — Sensemaking Agent**

Do not create another Sensemaking Agent.

For approved conversation material, use:

**Conversation Intake Mode**

## GitHub / Strategic OS

GitHub remains the durable Strategic OS source of truth.

No automatic GitHub write is included in the MVP.

Only reviewed abstraction may later be promoted into an existing Strategic OS destination.

---

# Conversation Intake output

Conversation Intake Mode returns:

1. **Decision**
2. **Evidence**
3. **Stakeholder signal**
4. **Unresolved**
5. **Strategic opportunity**
6. **Next action**
7. **Strategic signal**

Also return:

- Recommended destination
- Confidence
- Caveats
- Human review required: Yes

The reasoning contract for these fields is defined in:

`relevance_ai_conversation_intake.md`

---

# Intake convention

Use the lowest-complexity approved intake mechanism available.

The intended MVP pattern is:

    conversation-review
        ↓
    source type
        ↓
    conversation context
        ↓
    transcript or notes

The exact Slack implementation may vary based on the available workspace and Make integration.

Do not over-design the interaction before real use exposes a need.

---

## Minimum input

### Source type

Use one of:

- `teams`
- `plaud`
- `approved_notes`
- `workshop`
- `reflection`
- `other`

### Conversation context

Provide a short, privacy-safe description of why the conversation matters.

### Transcript or notes

Provide only the approved source material required for analysis.

---

## Optional input

Where useful:

- meeting date;
- known decision question;
- project context;
- known stakeholders;
- source reference.

Do not require optional metadata when it adds unnecessary friction.

---

# Source hierarchy

Use the following capture order:

    Is an approved Teams transcript available?
        ↓
    Yes → use Teams transcript
        ↓
    No
        ↓
    Is external capture permitted?
        ↓
    Yes → use PLAUD or another approved source
        ↓
    No
        ↓
    Use approved manual notes or no capture

Do not pay to recreate a transcript that already exists in an approved organisational system.

PLAUD is a supplementary capture source, not the Strategic OS knowledge repository.

---

# Make workflow

## Step 1 — Receive intake

Receive the conversation-review request from Slack or the approved intake mechanism.

Capture only what is required for the workflow.

Avoid creating unnecessary durable copies of source content.

---

## Step 2 — Parse input

Extract:

- source type;
- conversation context;
- transcript or notes;
- optional metadata.

If required information is missing, stop and request correction.

Do not send materially incomplete input to Relevance AI merely to keep the automation moving.

---

## Step 3 — Confirm privacy and permission

The workflow must have an explicit confirmation that the source may be processed.

The workflow does not determine organisational permission.

If permission is unclear:

> Stop and require human confirmation.

Do not infer permission from:

- access to a transcript;
- source type;
- technical ability to process it;
- presence in Slack; or
- possession of a recording.

---

## Step 4 — Invoke Relevance AI

Call the existing:

**Strategic OS — Sensemaking Agent**

Apply:

**Conversation Intake Mode**

Provide the input contract defined in:

`relevance_ai_conversation_intake.md`

Do not duplicate the full Sensemaking Agent prompt inside Make.

Strategic OS defines behaviour.

Make only invokes the runtime.

---

## Step 5 — Validate structural output

Confirm that the response contains the required Conversation Intake fields.

If output is malformed:

- do not invent missing strategic content in Make;
- do not reinterpret the conversation in Make;
- retry the agent call where appropriate; or
- return the failure for human review.

Reasoning failures belong to the agent layer.

---

## Step 6 — Return Slack review

Return a concise review message.

Recommended summary:

    Strategic Conversation Signal

    Decision:
    [decision]

    Strategic signal:
    [reusable strategic signal]

    Next action:
    [specific next action]

    Recommended destination:
    [destination]

    Confidence:
    [High / Medium / Low]

    Caveats:
    [material caveats]

    Human review required:
    Yes

The full seven-part extraction may be included where useful.

Keep the review surface concise enough for practical use.

---

# Human review

Every Conversation Intake output requires human review.

The reviewer checks:

- evidence accuracy;
- separation of evidence and interpretation;
- uncertainty;
- stakeholder safety;
- strategic usefulness;
- sensitive-detail minimisation;
- destination suitability;
- whether anything should be retained.

Human review is mandatory before durable retention.

---

## Approve

Approve when the abstraction is:

- accurate;
- proportionate;
- useful;
- privacy-safe;
- worth carrying forward.

Approval does not automatically write to GitHub during the MVP.

---

## Edit

Edit when the signal is useful but needs:

- factual correction;
- stronger caveat;
- reframing;
- additional context;
- redaction; or
- destination change.

Only the reviewed version should become a candidate for durable retention.

---

## Discard

Discard when:

- there is no enduring strategic value;
- interpretation is unreliable;
- evidence is insufficient;
- content is too sensitive;
- the signal duplicates existing knowledge; or
- retention would create more management overhead than value.

Discard is a valid successful outcome.

---

# Post-review routing

During the MVP, durable routing remains manual.

| Signal type | Strategic OS destination |
|---|---|
| Decision or trade-off | `03_decision_briefs/` |
| Strategic opportunity | `02_strategic_opportunities/` |
| Reusable lesson | `05_lessons_learned/` |
| Reusable stakeholder pattern | `06_stakeholder_patterns/` |
| Project-specific strategic context | `08_projects/` |
| Career evidence | `01_career/` |
| Useful but unresolved | `00_inbox/` |
| No enduring value | Discard |

Do not create a new storage type merely because the source was a conversation.

---

# Retention rule

The retention boundary is:

    Raw conversation
        ↓
    Temporary approved processing
        ↓
    Sensemaking extraction
        ↓
    Human review
        ↓
    Minimum useful abstraction
        ↓
    Existing Strategic OS destination

Do not store raw transcripts or recordings in Strategic OS.

Do not retain a full Slack conversation merely because a useful strategic signal emerged from it.

---

# Error handling

## Missing required input

Stop and request the missing information.

Do not invoke the agent.

## Permission unclear

Stop and require human confirmation.

## Relevance AI unavailable

Report the runtime failure.

Do not substitute Make-based strategic reasoning.

## Malformed agent output

Retry where appropriate or return the failure for review.

Do not reconstruct strategic meaning in Make.

## Sensitive content concern

Stop durable routing and require human review.

## No strategic value

Recommend:

`Discard`

Do not manufacture a decision, opportunity or lesson to justify the workflow.

---

# Runtime implementation

The current production implementation uses:

    Webhook intake
        ↓
    Privacy gate
        ↓
    Data Store
        ↓
    Relevance AI
        ↓
    human-review-required
        ↓
    Slack review
        ↓
    Approval listener

Current review command taxonomy:

- `P <workflow-id>` — Approve
- `L <workflow-id>` — Rework
- `M <workflow-id>` — Stop

Current implementation priority:

> `P` only

Do not implement `L` or `M` until the approval path is proven end to end.

---

# Approval path

Current intended approval path:

    Slack
        ↓
    Text Parser
        ↓
    Data Store lookup
        ↓
    Validate human-review-required state
        ↓
    Data Store update
        ↓
    Slack confirmation

Use the Text Parser output as the workflow identifier.

Do not use inline substring expressions in Data Store key fields.

Current approval parser pattern:

`^P\s+(?<workflow_id>[a-fA-F0-9]{32})$`

Expected approval-state transition:

- `previous_state = human-review-required`
- `current_state = approved`
- `decision_status = approved`
- `human_action_required = false`
- `completed_at` populated
- `updated_at` populated

Do not weaken the state prerequisite.

---

# First runtime test

Use a permitted, low-risk or synthetic source.

Verify:

1. intake is received;
2. privacy confirmation is enforced;
3. workflow state is created;
4. Relevance AI receives the expected input;
5. the existing Sensemaking Agent runs;
6. Conversation Intake Mode returns the required structure;
7. Slack receives the human-review output;
8. the approval command resolves the correct workflow;
9. state changes from `human-review-required` to `approved`;
10. approval confirmation is returned;
11. no raw source content is automatically written to Strategic OS.

---

# MVP success criteria

The workflow is operational when:

- [ ] intake works reliably;
- [ ] privacy confirmation gates processing;
- [ ] the existing Sensemaking Agent is invoked;
- [ ] Conversation Intake Mode behaves according to the Strategic OS contract;
- [ ] evidence and interpretation remain distinct;
- [ ] Make performs orchestration rather than reasoning;
- [ ] Slack provides a useful human-review surface;
- [ ] approval updates the correct workflow;
- [ ] approval state persists correctly;
- [ ] raw conversation material is not automatically retained;
- [ ] approved abstraction can be manually routed to an existing Strategic OS destination.

---

# Review after real use

Run approximately 5–10 permitted conversations before expanding the architecture.

Review:

- whether the seven-part extraction is useful;
- whether outputs improve decisions;
- whether Slack is an effective review surface;
- whether approval handling creates friction;
- whether Edit or Discard are needed frequently;
- whether destination recommendations are reliable;
- whether manual post-review routing becomes repetitive;
- whether privacy controls behave correctly;
- whether the workflow creates reusable strategic knowledge.

Only repeated real-use friction should trigger architecture changes.

---

# Do not automate yet

Keep the following paused:

- automated Teams transcript retrieval;
- automated PLAUD transcript retrieval;
- PLAUD MCP integration;
- Copilot interpretation dependency;
- automatic agent-to-agent routing;
- automatic strategic opportunity creation;
- automatic decision brief creation;
- automatic stakeholder-pattern creation;
- automatic GitHub commits;
- automatic pull requests;
- automatic durable retention;
- new PLAUD-specific agent;
- new top-level automation folder;
- broader multi-agent runtime.

These remain future signals rather than current requirements.

---

# Expansion triggers

Consider further automation only when repeated use demonstrates that:

- manual intake creates material friction;
- manual approval handling is inefficient;
- manual routing is repeatedly burdensome;
- another agent handoff occurs often enough to justify automation;
- source integrations can be implemented safely within approved governance boundaries.

Do not expand simply because the technology permits it.

---

# Operating principle

> Capture only where permitted. Reason in the Sensemaking Agent. Review with a human. Retain only the minimum reusable strategic signal.

The workflow succeeds when useful conversations improve future decisions without turning Strategic OS into a transcript archive.
