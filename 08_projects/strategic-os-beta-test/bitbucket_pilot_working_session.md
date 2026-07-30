# Bitbucket Documentation Pilot — Working Session

## Status

Draft for stakeholder session

## Session purpose

Decide whether to proceed with a contained Bitbucket pilot for reusable internal project artefacts and customer-facing knowledge assets.

## Participants

- Manager
- CRM Product Owner
- Senior Service Designer
- José Andrade — facilitator and pilot lead

## Duration

45 minutes

## Decision required

At the end of the session, decide whether to:

- proceed with a contained pilot;
- proceed subject to specific conditions;
- refine the proposal before deciding; or
- stop the pilot concept.

## Decision statement

> Should we test whether Bitbucket can provide a governed, reusable and machine-readable source layer for selected project, design and customer-information assets that need to support multiple teams and publishing channels?

## Desired outcomes

The session should produce:

- a shared view of the opportunity;
- agreement or disagreement on the proposed capability;
- identified risks and constraints;
- one preferred pilot asset;
- initial stakeholder roles;
- required governance checks;
- a clear proceed, refine or stop decision; and
- one immediate next action.

## Pre-read

Participants should receive the following before the session:

- Bitbucket Documentation Pilot — Decision Brief
- one-page opportunity summary
- one example reusable asset
- one draft publishing and governance workflow

## Facilitation principles

- lead with the capability, not the technology;
- distinguish source material from publishing channels;
- avoid proposing migration of all documentation;
- keep the pilot small;
- separate confirmed requirements from assumptions;
- record objections without resolving every issue in the room;
- seek a decision on the pilot, not the final operating model; and
- do not treat technical feasibility as the only success criterion.

## Agenda

| Time | Activity | Outcome |
|---|---|---|
| 0–5 minutes | Frame the opportunity and decision | Shared understanding of why the group is meeting |
| 5–12 minutes | Review current and emerging use cases | Confirm whether the opportunity is real and timely |
| 12–22 minutes | Test the proposed source and publishing model | Identify value, duplication risks and unclear boundaries |
| 22–32 minutes | Review pilot scope, governance and contributor experience | Confirm whether the pilot is safe and practical |
| 32–40 minutes | Select the first pilot asset and roles | Define a contained starting point |
| 40–45 minutes | Make and record the decision | Proceed, refine or stop |

## Opening

Use the following framing:

> We have an opportunity to test whether an existing enterprise capability can help us maintain reusable customer, service, design and project knowledge more consistently.
>
> The proposal is not to move all documentation into Git or replace SharePoint, Confluence, Jira, CRM or publishing platforms.
>
> It is to test whether a small set of reusable assets can be maintained as governed, machine-readable source material and then adapted for use across multiple teams and channels.
>
> Today, I would like us to challenge the idea, identify the conditions needed for a safe pilot and decide whether it is worth testing.

## Opportunity discussion

### Prompt

> Where do we currently create knowledge or artefacts that need to remain useful beyond one project, document or channel?

### Example use cases

- customer information architecture;
- mappings between internal service terminology and customer language;
- customer segmentation profiles;
- service-design patterns;
- connected-interaction and channel patterns;
- reusable project templates;
- decision records;
- service definitions;
- publishing rules;
- agent-ready instructions and knowledge; and
- approved content components for multiple channels.

### Evidence to introduce

- Channel Strategy Y2 will begin producing reusable customer and interaction assets;
- customer segmentation research is ready to move into practical use;
- emerging agents may require trusted and machine-readable source material;
- project artefacts are often created for one immediate use and are difficult to maintain across time or platforms; and
- Bitbucket is already an enterprise capability used by City of Melbourne development teams.

## Capability model

Present the model as:

    Evidence and source systems
                |
                v
    Reusable governed source assets
                |
                v
    Review and approval workflow
                |
                v
    Channel-specific adaptation
                |
                v
    SharePoint / Confluence / newsletters
    websites / apps / CRM / knowledge / agents

### Clarification

The reusable source layer would contain selected:

- definitions;
- mappings;
- patterns;
- approved summaries;
- design logic;
- governance rules;
- decision records;
- metadata;
- ownership information;
- caveats; and
- source references.

It would not contain:

- raw customer information;
- credentials;
- sensitive operational data;
- controlled organisational records;
- raw research transcripts;
- delivery-task detail; or
- copies of every document used by the team.

## Stakeholder challenge questions

### Questions for the manager

- Is the proposed opportunity significant enough to test?
- What risks or organisational dependencies could block the pilot?
- What evidence would be needed before supporting wider use?
- Who should sponsor or approve the pilot?
- What would make the pilot too broad?

### Questions for the CRM Product Owner

- Which definitions or assets would benefit from clearer versioning and ownership?
- Where could this create duplication with CRM, Jira or Confluence?
- What technical or access constraints need validation?
- Which existing Git workflow could be reused?
- What would make the contribution model practical for non-developers?

### Questions for the senior service designer

- Which design or customer-information assets should become maintained capability?
- What would make the repository useful rather than restrictive?
- How should visual and collaborative artefacts connect to structured source files?
- What design evidence and rationale must remain visible?
- Which pilot asset would demonstrate value most clearly?

## Proposed pilot assets

Use the following criteria to select the first asset:

- needed by more than one team or channel;
- likely to change over time;
- safe to store in structured form;
- has a clear owner or potential owner;
- benefits from review and change history;
- can be represented primarily through text, metadata or references;
- has an identifiable current or emerging use; and
- small enough to test without migration work.

### Candidate 1 — Customer information architecture mapping

Could include:

- internal service name;
- system label or code;
- customer intent;
- customer-friendly name;
- customer-facing description;
- channel applicability;
- owner;
- evidence source;
- status;
- review date; and
- related assets.

### Candidate 2 — Customer segmentation profile

Could include:

- segment name;
- evidence basis;
- characteristics;
- needs;
- behaviours;
- barriers;
- channel implications;
- service-design implications;
- caveats;
- owner;
- status; and
- review date.

### Candidate 3 — Connected-interaction pattern

Could include:

- customer need;
- use context;
- response mode;
- routing principle;
- minimum handover information;
- status-update expectations;
- applicable channels;
- constraints;
- evidence;
- owner; and
- lifecycle status.

## Recommended first asset

Recommend starting with the customer information architecture mapping.

### Rationale

It provides a practical connection between:

- internal service terminology;
- customer language;
- CRM and system labels;
- websites and applications;
- knowledge content;
- Channel Strategy work; and
- emerging AI-agent use cases.

It is also narrow enough to test versioning, ownership, review and multi-channel reuse without needing to solve the full documentation model.

## Proposed publishing and governance workflow

    Asset owner creates or updates source
                    |
                    v
    Change proposed in Bitbucket
                    |
                    v
    Subject-matter review
                    |
                    v
    Design, product or technical review
                    |
                    v
    Approval by accountable owner
                    |
                    v
    Approved change merged
                    |
                    v
    Content adapted for selected channels
                    |
                    v
    Publication reference recorded
                    |
                    v
    Review, supersede or retire

## Governance questions

The group does not need to fully solve these during the session, but should identify whether they are manageable.

- Who is accountable for the accuracy of each asset?
- Who may propose changes?
- Which changes need specialist review?
- Who approves publication?
- How are affected channels identified?
- How is an approved source version linked to published content?
- How are review dates set?
- How are outdated assets marked or retired?
- Which content must remain in another system of record?
- Which information-security or records checks are required?

## Contributor experience

The pilot should test a low-barrier contribution approach.

Possible contribution methods include:

- browser-based editing in Bitbucket;
- structured Markdown templates;
- guided change forms;
- named reviewers;
- simple pull-request instructions;
- repository previews;
- contribution support from the repository steward; and
- source updates prepared from approved workshop or design outputs.

The pilot should not assume all participants will use command-line Git.

## Pilot boundaries

### Included

- one repository or approved project space;
- one reusable asset type;
- up to three example records or components;
- a simple contribution guide;
- named ownership and reviewers;
- one approval workflow;
- reuse across two or three channels;
- manual publishing where necessary;
- a short test and retrospective; and
- non-sensitive information only.

### Excluded

- migration of existing documentation libraries;
- automated multi-channel publishing;
- raw research or customer data;
- branch-wide adoption;
- replacement of existing platforms;
- complex repository architecture;
- formal enterprise information architecture;
- custom software development; and
- final governance policy.

## Decision options

### Proceed

The opportunity is valid and the proposed pilot is sufficiently safe and contained.

### Proceed with conditions

The pilot may proceed after named conditions are resolved.

Examples:

- security or records consultation;
- confirmation of Bitbucket access;
- identification of an asset owner;
- simplified contributor workflow; or
- narrower asset scope.

### Refine

The opportunity appears valuable, but the pilot proposal is not yet clear or safe enough.

Record the specific questions that must be answered.

### Stop

The proposed approach does not provide sufficient value, duplicates existing capability or creates disproportionate risk.

Record the rationale so the same concept is not repeatedly reconsidered without new evidence.

## Decision record

| Field | Record |
|---|---|
| Decision | Proceed / Proceed with conditions / Refine / Stop |
| Date | |
| Decision owner | |
| Participants | |
| Rationale | |
| Conditions | |
| First pilot asset | |
| Asset owner | |
| Required reviewers | |
| Publishing channels | |
| Governance checks | |
| Immediate next action | |
| Action owner | |
| Due date | |

## Risks and assumptions captured during session

| Type | Description | Status | Owner | Next action |
|---|---|---|---|---|
| Risk / Assumption / Issue / Dependency | | Open | | |

## Closing question

> Based on the value, boundaries and risks discussed, is there enough confidence to test this with one asset and a small group before making any broader commitment?

## Immediate next step if approved

Create the minimum pilot repository structure for the selected asset, including:

- asset template;
- contribution guide;
- ownership metadata;
- review workflow;
- example source content;
- publishing record; and
- beta evaluation log.
