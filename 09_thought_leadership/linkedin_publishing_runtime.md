# LinkedIn Publishing Runtime

## Purpose

Define the validated Strategic OS runtime for publishing safe thought-leadership content to LinkedIn.

This runtime supports deliberate publishing with explicit human approval.

It does not automate thought-leadership generation or require specialist-agent orchestration.

## Operating principle

> AI prepares → human reviews → explicit human approval → Make publishes.

Human approval is the publication boundary.

No LinkedIn post should be published automatically from a draft-generation or specialist-reasoning step.

## Runtime status

Status: Validated end to end

Validated path:

Custom webhook
→ privacy gate
→ Strategic OS Post ID generation
→ LinkedIn Data Store
→ Slack human review
→ explicit `P <post-id>` approval
→ Data Store lookup
→ workflow-state guard
→ LinkedIn publish
→ Data Store state update
→ Slack publication confirmation

## Runtime components

### Scenario 1

`Strategic OS — LinkedIn Draft Review`

Purpose:

Receive a prepared LinkedIn draft, confirm it is safe to process, create a Strategic OS Post ID, persist the draft and send it to Slack for human review.

Flow:

`Webhook → privacy filter → UUID → Data Store → Slack review`

### Scenario 2

`Strategic OS — LinkedIn Publish Approval`

Purpose:

Detect explicit human approval, verify the persisted workflow state and publish the approved draft.

Flow:

`Slack polling → approval parser → Data Store lookup → state guard → LinkedIn publish → Data Store update → Slack confirmation`

Operational polling interval:

`5 minutes`

## Data Store

Data Store:

`strategic_os_linkedin_posts`

The Make Data Store Key is the Strategic OS Post ID.

Do not create a duplicate `post_id` field.

Key distinction:

- Data Store Key = internal Strategic OS Post ID
- `linkedin_post_id` = external LinkedIn publication URN

Example external identifier format:

`urn:li:share:<identifier>`

Do not manufacture a LinkedIn URL.

Populate `linkedin_post_url` only when a trustworthy URL is returned by the publishing platform or integration.

## Draft intake

Expected fields:

- `headline`
- `body`
- `hashtags`
- `source_note`
- `submitted_by`
- `slack_destination`
- `privacy_confirmed`

Required privacy condition:

`privacy_confirmed = true`

Drafts that do not pass the privacy gate must not proceed to review or publication.

## Initial workflow state

A successfully accepted draft enters:

- `privacy_status = confirmed`
- `previous_state = draft-received`
- `current_state = human-review-required`
- `decision_status = pending`
- `human_action_required = true`

## Human review

Slack is the human-review surface.

Approval format:

`P <Strategic OS Post ID>`

Validated UUID parser:

`^P\s+(?<post_id>[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12})$`

Publication must not occur merely because a draft exists in Slack.

Explicit approval is required.

### Slack polling behaviour

`Strategic OS — LinkedIn Publish Approval` polls the private Slack review channel every 5 minutes.

The polling trigger processes channel messages sequentially. Historical draft-review messages, publication confirmations and older approvals may therefore be encountered before a newly submitted approval.

Non-approval messages are safely rejected by the approval parser because they do not exactly match:

`P <Strategic OS Post ID>`

When enabling or re-enabling the polling scenario after testing, configuration changes or an extended inactive period:

1. reset the Slack trigger starting point to `From now on`;
2. save the scenario;
3. submit the new approval message after the reset.

This prevents the scenario from draining stale Slack history before processing the current approval.

Do not add additional routing or queue-management automation unless repeated normal use shows this operating rule is insufficient.

## Publication state guard

Before publishing, all of the following must be true:

- `current_state = human-review-required`
- `decision_status = pending`
- `human_action_required = true`
- `privacy_confirmed = true`
- `privacy_status = confirmed`

This persisted-state guard provides duplicate-publication protection for already completed records.

## LinkedIn content source

LinkedIn publication content must use the persisted Data Store draft.

Do not map Slack message content directly into the LinkedIn publishing module.

Publishing format:

`<body>`

followed by:

`<hashtags>`

Current publication settings:

- Visibility: Anyone
- Feed distribution: Main feed
- Media: none
- Mentions: none

## Successful publication state

After LinkedIn confirms publication:

- `previous_state = human-review-required`
- `current_state = published`
- `decision_status = approved`
- `human_action_required = false`
- `linkedin_post_id = returned LinkedIn publication URN`
- `approved_at = publication approval time`
- `published_at = publication time`
- `updated_at = current time`

Original draft and provenance fields should be preserved.

## Failure behaviour

If LinkedIn publication fails:

- do not mark the record as published;
- do not send a successful-publication confirmation;
- retain the existing workflow state for investigation or retry.

Duplicate-content responses encountered during synthetic testing did not indicate a runtime architecture defect.

Do not add complex retry or error-handling logic until repeated real use demonstrates a need.

## Specialist-agent relationship

Strategic OS specialists may support preparation or judgement but are not mandatory stages in the publishing runtime.

Possible uses:

- Sensemaking Agent — argument clarity
- Stakeholder Journey Agent — audience adaptation
- Career Architect — positioning alignment
- Shipping Coach — publication readiness
- Chief of Staff Agent — timing and prioritisation

Do not automatically invoke all specialists before publication.

Human specialist selection remains intentional.

## Privacy boundary

Do not publish or persist:

- confidential organisational information;
- raw organisational source data;
- customer records;
- identifiable case material;
- credentials or access tokens;
- sensitive stakeholder commentary;
- internal-only operational material.

Use only safe, generalised and portable material suitable for public thought leadership.

## Current operating rule

> Operate the validated runtime through real publishing before adding more automation.

Do not add without demonstrated need:

- automatic drafting;
- automatic specialist sequencing;
- image publishing;
- scheduled LinkedIn publishing;
- dedicated LinkedIn Slack channels;
- automatic retries;
- complex failure handlers;
- manufactured LinkedIn URLs;
- additional orchestration layers.

## Systems of record

- Make — orchestration and workflow state
- Slack — human-review and approval surface
- LinkedIn — published content
- GitHub / Strategic OS — reusable operating logic and publishing pattern

Strategic OS does not replace these systems of record.
