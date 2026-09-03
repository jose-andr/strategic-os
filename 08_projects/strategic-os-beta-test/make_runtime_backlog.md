# Strategic OS Make Runtime Backlog

## Purpose

Track runtime corrections, hardening work and future adaptations identified while operating the validated Strategic OS specialist workflows in Make, Relevance AI and Slack.

This backlog is not the active implementation sequence.

The validated specialist runtime set is:

- Sensemaking Agent
- Stakeholder Journey Agent
- Career Architect
- Shipping Coach
- Chief of Staff Agent

The active rule is:

> Operate the validated specialist runtimes through real work before expanding orchestration.

Do not pull items from this backlog merely because they are technically possible.

Prioritise items only when:

- they block a validated runtime;
- repeated real use exposes a genuine problem;
- they materially improve privacy, reliability or decision quality; or
- the active implementation phase explicitly requires them.

Multi-agent routing, automatic sequencing and additional review commands remain future adaptations rather than current requirements.
# Current Runtime

Active runtime pattern:

```text
Webhook intake
    ↓
Privacy gate
    ↓
Data Store
    ↓
Relevance AI
Strategic OS — Sensemaking Agent
    ↓
human-review-required
    ↓
Slack
    ↓
P approval listener
---

# Validated Runtime Evidence

## P approval path — validated

Status:

> Validated — 2026-09-02

The approval path has now passed end to end using a fresh synthetic Sensemaking workflow.

Validated execution path:

    Slack 2
        ↓
    Text Parser 22
        ↓
    Data Store 7
        ↓
    Router 18
        ↓
    Data Store 19
        ↓
    Slack 21

Validated command format:

`P <32-character-workflow-id>`

Example test workflow:

`19adddad86754fdc9d669c0b6209c028`

### Runtime evidence

The Slack approval command successfully:

- matched the Text Parser pattern;
- extracted the correct workflow ID;
- retrieved the correct Data Store record;
- passed the `human-review-required` state prerequisite;
- updated the same workflow record;
- returned an approval confirmation to Slack.

Persisted state was confirmed as:

- `previous_state = human-review-required`
- `current_state = approved`
- `decision_status = approved`
- `human_action_required = false`
- `completed_at` populated
- `updated_at` populated

The source workflow also retained:

- `privacy_status = confirmed`
- `privacy_confirmed = true`

### Validation result

> The `P` approval path is operationally validated.

This is runtime evidence, not configuration-only evidence.

---

## Runtime defect — Slack approval instruction mismatch

Status:

> Resolved

### Problem

The Sensemaking Review scenario displayed the approval instruction as:

`P <workflow-id> - Approve`

The Slack Review Response parser intentionally accepted only:

`P <workflow-id>`

using:

`^P\s+(?<workflow_id>[a-fA-F0-9]{32})$`

A live test confirmed that the extra `- Approve` text prevented the workflow from progressing beyond the Text Parser.

### Fix

Update the Sensemaking Review Slack message so the displayed command is exactly:

`P <workflow-id>`

Do not append descriptive text after the workflow ID.

### Reusable runtime lesson

> Human-facing command instructions must exactly match the executable parser contract.

Do not rely on users to infer which part of a displayed command should be copied.

---

# Current Runtime State

Validated:

- [x] Sensemaking intake reaches Relevance AI
- [x] Sensemaking output reaches Slack human review
- [x] privacy confirmation gates normal processing
- [x] Text Parser extracts the 32-character workflow ID
- [x] Data Store lookup resolves the correct workflow
- [x] approval route requires `human-review-required`
- [x] `P` updates the workflow to `approved`
- [x] approval state persists correctly
- [x] Slack returns approval confirmation

Not yet validated:

- [ ] `L` rework route
- [ ] `M` stop route
- [ ] authorised responder validation
- [ ] Relevance failure handling
- [ ] Slack notification failure handling
- [ ] privacy rejection user feedback

Current implementation rule:

> Do not add `L` or `M` merely because `P` now works. Move next to real Sensemaking Agent validation against a real work item unless operational use exposes a more urgent runtime defect.
