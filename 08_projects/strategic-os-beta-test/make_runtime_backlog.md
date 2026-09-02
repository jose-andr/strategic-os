# Strategic OS Make Runtime Backlog

## Purpose

Track runtime corrections, hardening work and future adaptations identified while stabilising the Strategic OS Sensemaking workflow in Make, Relevance AI and Slack.

This backlog is not the active implementation sequence.

The active rule is:

> Stabilise the current Sensemaking path before expanding the runtime.

Do not pull items from this backlog merely because they are technically possible.

Prioritise items only when:

- they block the current runtime;
- repeated use exposes a genuine problem;
- they materially improve privacy, reliability or decision quality; or
- the active implementation phase explicitly requires them.

---

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
