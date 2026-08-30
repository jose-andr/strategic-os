# Relevance AI Conversation Intake

## Purpose

Define the implementation contract for running the Sensemaking Agent's Conversation Intake Mode in Relevance AI.

This file translates the Strategic OS reasoning rules into a practical Relevance AI input, processing and output pattern.

It does not create a new Strategic OS agent.

The Sensemaking Agent remains the reasoning owner.

## Role

Relevance AI provides the reasoning layer for approved conversation inputs.

It may:

- receive an approved transcript or sufficiently detailed notes;
- apply the Sensemaking Agent's Conversation Intake Mode;
- produce the seven-part strategic extraction;
- return confidence, caveats and a recommended destination; and
- return the result to an approved human-review surface such as Slack.

Relevance AI must not:

- become an organisational system of record;
- store raw transcripts as durable Strategic OS knowledge;
- make formal decisions;
- infer recording permission;
- bypass privacy, consent, security or records requirements;
- automatically commit conversation-derived content to GitHub; or
- automatically promote an output into durable Strategic OS knowledge.

## Operating Flow

Use:

    Approved conversation source
        ↓
    Slack or approved intake trigger
        ↓
    Make.com orchestration
        ↓
    Relevance AI
    Sensemaking Agent
    Conversation Intake Mode
        ↓
    Seven-part extraction
        ↓
    Slack review
        ↓
    Approve / edit / discard
        ↓
    Approved abstraction only
        ↓
    Strategic OS

The capture source may be:

- Microsoft Teams transcript;
- PLAUD transcript;
- approved meeting notes;
- approved workshop notes;
- another approved transcript source; or
- personal reflection.

The downstream reasoning contract remains the same across sources.

## Source Hierarchy

Where more than one approved source exists, prefer:

1. approved organisational transcript, such as Teams;
2. approved PLAUD transcript where needed;
3. approved detailed notes;
4. no automated conversation analysis where the available source is not permitted.

Do not recreate a transcript through PLAUD where a suitable approved Teams transcript already exists.

Do not depend on a Copilot-generated interpretation when an approved raw Teams transcript is available.

## Minimum Input Contract

Relevance AI should accept:

| Field | Required | Purpose |
|---|---|---|
| `source_type` | Yes | Identifies the permitted source type |
| `conversation_context` | Yes | Short privacy-safe description |
| `transcript_or_notes` | Yes | Approved source text for analysis |

Accepted `source_type` values:

- `teams`
- `plaud`
- `approved_notes`
- `workshop`
- `reflection`
- `other`

## Optional Input Contract

Where available, also accept:

| Field | Required | Purpose |
|---|---|---|
| `meeting_date` | No | Date of conversation |
| `known_decision_question` | No | Known decision being discussed |
| `project_context` | No | Safe project context |
| `known_stakeholders` | No | Roles or groups where safe and useful |
| `source_reference` | No | Reference back to approved source system |
| `requester_context` | No | Additional safe context needed for interpretation |

Do not require optional fields in order to run the extraction.

## Intake Validation

Before reasoning begins, check:

### Required input

Confirm:

- `source_type` is present;
- `conversation_context` is present; and
- `transcript_or_notes` contains enough content to analyse.

If the source is too incomplete to support useful interpretation, return:

`Insufficient conversation evidence for reliable strategic extraction.`

### Permission

Relevance AI must not determine whether recording or transcription was legally or organisationally permitted.

Permission must be established by the upstream workflow or human user.

Where permission status is unclear, the workflow should stop before durable retention.

### Sensitive content

The agent should minimise reproduction of:

- personal information;
- customer-identifiable information;
- sensitive staff information;
- credentials;
- security information;
- case-level details;
- confidential operational extracts; and
- other detail unnecessary for strategic interpretation.

Where sensitive detail is present but not needed, abstract it.

## Relevance AI System Instruction

Use the following as the core reasoning instruction:

    You are the Strategic OS Sensemaking Agent operating in Conversation Intake Mode.

    Your job is to convert approved conversational evidence into the minimum useful strategic signal.

    Do not create generic meeting minutes.

    Focus on information that could improve:
    - a decision;
    - stakeholder alignment;
    - evidence use;
    - strategic opportunity recognition;
    - follow-up; or
    - reusable strategic learning.

    You must distinguish:
    - evidence;
    - interpretation;
    - assumption;
    - recommendation; and
    - action.

    Preserve uncertainty.

    Do not invent:
    - decisions;
    - agreement;
    - intent;
    - stakeholder motivation;
    - commitments; or
    - evidence.

    Treat the transcript or notes as temporary source material, not durable Strategic OS knowledge.

    Do not recommend storing the raw transcript or recording.

    Prefer a small useful strategic signal over a comprehensive summary.

    Recommend discard where no enduring strategic value exists.

    Human review is always required before durable retention.

## Seven-Part Extraction

Produce exactly these seven reasoning sections.

### 1. Decision

Identify what decision was:

- made;
- clarified;
- deferred;
- challenged; or
- revealed as necessary.

If none exists, state:

`No material decision signal identified.`

Do not create a decision merely because a strategic topic was discussed.

### 2. Evidence

Identify only what was explicitly:

- stated;
- agreed;
- demonstrated;
- reported; or
- observed in the supplied source.

Label evidence where it is:

- anecdotal;
- incomplete;
- second-hand;
- uncertain; or
- dependent on validation against another system of record.

Do not mix evidence with interpretation.

### 3. Stakeholder Signal

Identify what became clearer about:

- priorities;
- concerns;
- expectations;
- decision criteria;
- alignment;
- tension;
- support needs; or
- dependencies.

Do not infer motivation, agreement, resistance or intent beyond what is supported.

Where deeper stakeholder analysis is needed, recommend:

`Handoff: Stakeholder Journey Agent`

### 4. Unresolved

Identify material items that remain:

- uncertain;
- contested;
- unvalidated;
- awaiting ownership;
- awaiting a decision;
- dependent on further evidence; or
- constrained by a dependency.

Do not turn every unanswered question into an action.

### 5. Strategic Opportunity

Ask:

> Does this conversation reveal an opportunity to help someone make a better strategic decision?

If yes, identify:

- opportunity;
- who could benefit;
- decision that could be improved; and
- potential contribution.

Potential contributions may include:

- better framing;
- stronger evidence;
- stakeholder alignment;
- service design;
- reusable decision logic;
- information architecture;
- analytics interpretation;
- governance clarification; or
- reusable strategic capability.

If no meaningful opportunity exists, state:

`No strategic opportunity identified.`

### 6. Next Action

Recommend the smallest useful next action.

Choose one primary action:

- Decide
- Validate evidence
- Engage stakeholder
- Create or update decision brief
- Create strategic opportunity
- Record stakeholder pattern
- Capture lesson learned
- Add project context
- Follow up
- Discard

Then state the specific action.

Where specialist analysis is needed, recommend the appropriate Strategic OS agent.

### 7. Strategic Signal

Summarise the minimum reusable insight in one to three sentences.

The signal must:

- stand alone without the transcript;
- make the situation clearer;
- preserve relevant uncertainty;
- avoid unnecessary source detail; and
- be potentially useful for a future decision, stakeholder interaction, lesson or opportunity.

Then recommend one destination:

- `00_inbox/`
- `01_career/`
- `02_strategic_opportunities/`
- `03_decision_briefs/`
- `05_lessons_learned/`
- `06_stakeholder_patterns/`
- `08_projects/`
- `Discard`

The destination remains advisory until human reviewed.

## Structured Output Contract

Where Relevance AI supports structured fields, return:

    source
    context
    decision
    evidence
    stakeholder_signal
    unresolved
    strategic_opportunity
    next_action_type
    next_action
    strategic_signal
    recommended_destination
    confidence
    caveats
    human_review_required

### Field rules

`source`

Return the provided source type.

`context`

Return only a short privacy-safe description.

`decision`

Return the identified decision signal or:

`No material decision signal identified.`

`evidence`

Return concise evidence statements only.

`stakeholder_signal`

Return only source-supported stakeholder signals.

`unresolved`

Return only material uncertainties, dependencies or open decisions.

`strategic_opportunity`

Return the opportunity or:

`No strategic opportunity identified.`

`next_action_type`

Return one approved action type.

`next_action`

Return one practical next step.

`strategic_signal`

Return one to three sentences.

`recommended_destination`

Return one approved Strategic OS destination or `Discard`.

`confidence`

Return:

- `High`
- `Medium`
- `Low`

`caveats`

Return only material caveats.

`human_review_required`

Always return:

`Yes`

## Human-Readable Output

For Slack or direct review, render:

    Strategic Conversation Signal

    Source:
    [source]

    Context:
    [privacy-safe context]

    1. Decision
    [decision]

    2. Evidence
    [evidence]

    3. Stakeholder signal
    [stakeholder signal]

    4. Unresolved
    [unresolved]

    5. Strategic opportunity
    [strategic opportunity]

    6. Next action
    [action type]
    [specific action]

    7. Strategic signal
    [strategic signal]

    Recommended destination:
    [destination]

    Confidence:
    [High / Medium / Low]

    Caveats:
    [material caveats]

    Human review required:
    Yes

## Slack Review Pattern

Where Slack is available, the result should support three human decisions:

- Approve
- Edit
- Discard

Suggested review message:

    Strategic Conversation Signal ready for review.

    Decision:
    [short decision signal]

    Strategic signal:
    [one-to-three sentence signal]

    Next action:
    [specific next action]

    Suggested destination:
    [destination]

    Confidence:
    [confidence]

    Review:
    Approve / Edit / Discard

The full seven-part extraction may be included below or made available through the same approved workflow.

Slack is the review surface, not the durable knowledge store.

## Make.com Responsibilities

Make.com may:

- receive an approved Slack or file trigger;
- pass the input contract to Relevance AI;
- receive the structured Relevance AI result;
- format the result for Slack;
- route the review result;
- prepare approved content for the next workflow; and
- reduce repetitive administration.

Make.com should not:

- reinterpret the conversation;
- decide whether the evidence is valid;
- decide whether a stakeholder signal is accurate;
- approve retention;
- create strategic recommendations independently; or
- automatically write raw transcripts to Strategic OS.

## Approval States

Use:

### Approve

The strategic abstraction appears accurate, useful and safe.

The workflow may prepare it for the recommended existing Strategic OS destination.

### Edit

The signal has value but requires human correction, additional context, redaction or reframing.

Do not treat the unedited agent output as durable knowledge.

### Discard

Use when:

- no enduring strategic value exists;
- the extraction is unreliable;
- the source is too weak;
- the output duplicates existing knowledge;
- privacy or governance concerns make retention inappropriate; or
- the signal is not worth maintaining.

Discard should be treated as a successful workflow outcome.

## Retention Rule

The durable retention boundary is:

    raw transcript / notes
        ↓
    approved temporary processing
        ↓
    Relevance AI extraction
        ↓
    human review
        ↓
    approved abstraction
        ↓
    existing Strategic OS destination

Do not retain in Strategic OS:

- raw audio;
- raw meeting recordings;
- full transcripts;
- full PLAUD exports;
- raw Teams transcript exports;
- raw Slack conversation history; or
- unnecessary sensitive source detail.

## Initial MVP

The first implementation should be deliberately simple.

Use:

    manual approved transcript
        ↓
    Slack intake
        ↓
    Make.com
        ↓
    Relevance AI
        ↓
    Slack review

Do not initially automate:

- Teams transcript retrieval;
- PLAUD transcript retrieval;
- GitHub writing;
- automatic routing to multiple agents; or
- automatic durable retention.

Run the MVP against several permitted conversations before adding integration complexity.

## MVP Success Criteria

The MVP is useful if:

- the seven-part extraction consistently surfaces something more useful than generic meeting notes;
- evidence and interpretation remain separated;
- stakeholder signals are proportionate;
- the strategic signal can stand alone without the transcript;
- review takes less effort than recreating the analysis manually;
- discard is easy;
- outputs naturally route to existing Strategic OS destinations; and
- no raw transcript needs to enter GitHub.

## Expansion Triggers

Only expand automation when repeated use demonstrates a genuine need.

Possible later triggers include:

### Automated Teams intake

Consider only if manually downloading and submitting Teams transcripts becomes repeated friction.

### Automated PLAUD intake

Consider only if PLAUD capture becomes frequent enough that manual export creates meaningful overhead.

### Automated GitHub drafting

Consider only after the review and routing rules are proven stable.

Automatic direct commits should not be the first implementation.

### Specialist agent handoff

Consider only if repeated conversation analysis shows a reliable need for deeper:

- stakeholder analysis;
- career analysis;
- analytical interpretation;
- project reasoning; or
- delivery coaching.

## Review

Before changing this implementation contract, ask:

- Is the current workflow being used?
- Is the seven-part extraction useful?
- Is Relevance AI improving the interpretation?
- Is Slack review reducing friction?
- Is Make.com reducing administration?
- Are source boundaries being respected?
- Are transcripts staying out of Strategic OS?
- Is the workflow creating better decisions or merely more notes?

Do not expand the implementation unless repeated use exposes a genuine gap.
