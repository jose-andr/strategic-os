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

## Current Runtime

Five specialist Strategic OS runtimes are validated end to end in Make:

- Sensemaking Agent
- Stakeholder Journey Agent
- Career Architect
- Shipping Coach
- Chief of Staff Agent

Each specialist currently follows the same proven runtime pattern:

`Webhook → privacy gate → shared Data Store → selected Relevance AI agent → post-agent Data Store update → Slack human review → P approval listener`

The shared runtime currently supports:

- specialist-specific webhook intake;
- `privacy_confirmed = true` gating;
- persistence in the shared `strategic_os_beta_workflows` Data Store;
- specialist execution in Relevance AI;
- storage of the specialist output in `latest_output`;
- transition from `processing` to `human-review-required`;
- Slack-based human review;
- strict approval command parsing using:

  `^P\s+(?<workflow_id>[a-fA-F0-9]{32})$`

- lookup of the matching workflow record;
- transition to approved state;
- approval-state persistence;
- Slack confirmation.

Expected approved state:

- `previous_state = human-review-required`
- `current_state = approved`
- `decision_status = approved`
- `human_action_required = false`
- `completed_at = now`
- `updated_at = now`
- `privacy_status = confirmed`

The runtime remains intentionally specialist-by-specialist.

Not yet implemented:

- multi-agent routing;
- automatic specialist sequencing;
- automatic downstream hand-offs;
- rework or stop commands;
- automated repository writes.

These remain backlog items until repeated use demonstrates a real need.

## Not Yet Validated

- [ ] `L` rework route
- [ ] `M` stop route
- [ ] authorised responder validation
- [ ] Relevance failure handling
- [ ] Slack notification failure handling
- [ ] privacy rejection user feedback

## Current Implementation Rule

> Operate the validated specialist runtimes through real work before expanding orchestration.

Do not implement `L`, `M`, multi-agent routing, automatic sequencing or other runtime hardening merely because the five specialist paths are now operational.

Prioritise the next runtime change only when:

- repeated real use exposes a genuine operational problem;
- a defect blocks a validated specialist path;
- privacy, reliability or decision quality materially improves; or
- a new orchestration pattern becomes necessary to support real work.

The current priority is use, observation and evidence — not further runtime expansion.