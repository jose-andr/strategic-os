# Stakeholder Alignment Assessment

## Status

Draft for beta use

## Initiative

Modern, reusable and machine-readable documentation framework using Bitbucket.

## Decision sought

Support a contained pilot to test whether Bitbucket can provide a governed, reusable source-of-truth model for selected internal project artefacts and customer-facing knowledge assets.

## Core proposition

Use an established enterprise capability to create reusable, governed source material that can support:

- internal project documentation;
- service-design patterns;
- customer information architecture;
- customer segmentation profiles;
- customer-friendly terminology;
- channel and routing principles;
- publishing workflows;
- AI-agent-ready knowledge; and
- controlled reuse across SharePoint, Confluence, newsletters, customer websites, applications and other delivery channels.

The pilot would not replace existing systems of record or publishing platforms.

It would test whether selected source assets can be maintained once, governed clearly and reused across multiple teams and channels.

## Stakeholder overview

| Stakeholder | Likely position | Primary interest | Primary concern | Desired movement |
|---|---|---|---|---|
| Manager | Open but risk-conscious | Team value, governance, adoption and strategic relevance | Additional overhead, unclear ownership or duplication of existing tools | Support a contained pilot with clear boundaries and measures |
| CRM Product Owner | Potential technical and operational ally | Structured definitions, traceability, reuse and integration with delivery practices | Duplication with CRM, Confluence or Jira; unclear technical ownership | Help shape the operating model and identify a practical pilot use case |
| Senior Service Designer | Likely supportive of reusable design knowledge | Design-system thinking, consistency, customer language and artefact reuse | Git accessibility, collaboration barriers and over-technical implementation | Validate the design value and help shape an inclusive contribution model |

## Shared stakeholder message

The proposal is not to move all documentation into Git.

The proposal is to test whether selected reusable assets benefit from:

- structured Markdown;
- visible ownership;
- version history;
- controlled contribution;
- review and approval workflows;
- machine readability;
- cross-channel reuse; and
- clear relationships to existing systems of record.

## Manager engagement

### What matters to the manager

- whether the problem is significant enough to act on;
- whether the approach supports branch priorities;
- whether the pilot creates delivery or governance risk;
- whether adoption effort is proportionate;
- whether the proposal duplicates an existing capability;
- whether ownership and maintenance are clear; and
- whether the pilot can produce evidence before further investment.

### Recommended framing

Position the idea as a capability and governance pilot, not a technology rollout.

Lead with:

> We have an opportunity to test whether an existing enterprise capability can help us maintain reusable customer, service and project knowledge more consistently across teams and channels.

Emphasise:

- the pilot is contained;
- Bitbucket is already enterprise established;
- no replacement of SharePoint, Confluence, Jira or publishing platforms is proposed;
- no raw customer or sensitive organisational data will be stored;
- the pilot will use a small set of reusable assets;
- success and stop criteria will be defined in advance; and
- the outcome will be evidence, not an assumed implementation decision.

### Likely questions

- Why can this not be done in SharePoint or Confluence?
- Who will own and maintain the content?
- Will staff need technical Git skills?
- What governance approvals are needed?
- What problem is urgent enough to justify the pilot?
- What happens if the pilot works?
- What happens if adoption is low?

### Evidence to prepare

- examples of duplicated or disconnected artefacts;
- examples of content that needs reuse across channels;
- Channel Strategy outputs likely to require ongoing maintenance;
- customer segmentation assets ready for operational use;
- examples of current or emerging agents that need trusted source material;
- confirmation of Bitbucket access and enterprise use;
- an initial pilot boundary;
- success measures; and
- a simple risk and mitigation view.

### Desired outcome

Manager agreement to explore or sponsor the pilot and nominate any required governance or technology stakeholders.

## CRM Product Owner engagement

### What matters to the CRM Product Owner

- clear service and customer definitions;
- traceability of changes;
- alignment between business language and system fields;
- structured artefacts that support delivery;
- integration with CRM and product workflows;
- avoidance of duplicate sources of truth;
- technical feasibility; and
- sustainable ownership.

### Recommended framing

Position the approach as a source-definition and reuse layer that complements product and delivery systems.

Lead with:

> This could give us a clearer way to maintain shared definitions, customer-facing semantics and reusable decision logic that CRM and other channels can reference without making Bitbucket the operational system of record.

Emphasise:

- internal service labels can be mapped to customer-friendly language;
- definitions and decision logic can have visible version history;
- proposed changes can be reviewed before publication;
- approved source assets can inform CRM, website, knowledge and agent outputs;
- Jira continues to manage delivery;
- CRM remains the operational system;
- Confluence and SharePoint remain valid collaboration and publishing environments; and
- Bitbucket manages selected reusable source material.

### Likely questions

- What content would live in Bitbucket?
- How would it connect to CRM configuration?
- Who approves terminology or data-definition changes?
- Would this create another source of truth?
- Can non-technical contributors participate?
- How would updates be published to other platforms?
- Who manages access, branching and pull requests?

### Evidence to prepare

- one example mapping from internal terminology to customer language;
- one reusable service definition;
- one example of a content change affecting multiple channels;
- a simple source-to-channel workflow;
- proposed repository roles;
- an example review and approval process; and
- a clear systems-of-record boundary.

### Desired outcome

CRM Product Owner participation in shaping the pilot workflow, repository governance and one practical cross-channel use case.

## Senior Service Designer engagement

### What matters to the senior service designer

- whether the approach improves design practice;
- whether design assets remain understandable and reusable;
- whether customer language stays evidence-based;
- whether artefacts can evolve rather than become static deliverables;
- whether the workflow supports collaboration;
- whether the technical model excludes contributors; and
- whether the approach strengthens or constrains service design.

### Recommended framing

Position the approach as a way to turn project outputs into maintained design capability.

Lead with:

> This could help us move from producing isolated project artefacts to maintaining reusable service-design, customer-language and interaction patterns that can evolve across initiatives.

Emphasise:

- customer information architecture can be maintained over time;
- segmentation profiles can become living, governed assets;
- Channel Strategy patterns can be reused across services;
- design rationale and decisions remain traceable;
- visual or collaborative tools can still be used for discovery and design;
- Git would hold approved structured outputs, not replace workshops or design tools;
- contribution methods must be accessible to non-developers; and
- the pilot should test usability as well as technical feasibility.

### Likely questions

- Will this make design work too rigid?
- How will visual artefacts be handled?
- Can designers contribute without command-line Git?
- How will evidence and design rationale be preserved?
- Who decides when a pattern becomes reusable?
- How will obsolete artefacts be retired?
- How will teams know which version is current?

### Evidence to prepare

- one customer-information-architecture example;
- one segmentation profile structure;
- one reusable service-design pattern;
- a simple contribution workflow for non-technical users;
- a content lifecycle model;
- status labels such as Draft, In review, Approved, Superseded and Archived; and
- an example showing how the repository complements Miro, Figma, SharePoint or Confluence.

### Desired outcome

Senior Service Designer validation of the design value, contribution model and initial asset structure.

## Alignment strategy

### Recommended sequence

1. Socialise the problem and opportunity informally with the senior service designer.
2. Test the proposed asset types and accessibility concerns.
3. Discuss the source-of-truth and technical operating model with the CRM Product Owner.
4. Refine the pilot boundary and risk controls.
5. Present a joint or partially validated proposal to the manager.
6. Seek approval for a contained pilot rather than full implementation.

### Why this sequence

The senior service designer can help validate the value and language.

The CRM Product Owner can help test technical feasibility and source-of-truth boundaries.

The manager can then assess a more credible proposal that has already been challenged by relevant peers.

## Potential resistance signals

| Signal | Interpretation | Response |
|---|---|---|
| “We already have SharePoint or Confluence” | Concern about duplication | Clarify that those remain collaboration and publishing platforms; the pilot tests reusable structured source material |
| “Git is only for developers” | Accessibility concern | Demonstrate a simple browser-based contribution and review process |
| “This will create another source of truth” | Governance concern | Define which assets qualify, which systems remain authoritative and how links are maintained |
| “Who will maintain it?” | Ownership concern | Include explicit owners, reviewers and review dates in the pilot |
| “This sounds too broad” | Scope concern | Limit the pilot to a small number of assets and one cross-channel workflow |
| “How will content reach other channels?” | Publishing concern | Show a defined draft, review, approve and publish workflow |
| “What is the immediate business value?” | Priority concern | Use Channel Strategy, segmentation research and agent readiness as practical near-term use cases |

## Proposed pilot stakeholder roles

| Role | Initial responsibility |
|---|---|
| Manager | Sponsor, approve scope and resolve governance escalation |
| José | Pilot lead, repository steward and workflow designer |
| CRM Product Owner | Technical and source-of-truth adviser |
| Senior Service Designer | Design-quality and contributor-experience adviser |
| Asset owner | Accountable for accuracy and currency of each pilot asset |
| Reviewer | Reviews changes for subject-matter, design or technical quality |
| Publisher | Confirms approved content is adapted to the relevant channel |

## Minimum agreement needed

The pilot can proceed when stakeholders agree that:

- the problem is worth testing;
- Bitbucket is suitable for a contained experiment;
- existing systems of record will not be replaced;
- the initial asset set is small and non-sensitive;
- ownership and review responsibilities are visible;
- non-technical contribution will be tested;
- success and stop criteria are defined; and
- pilot outcomes will be reviewed before any recommendation to scale.

## Suggested meeting outcome

At the end of the initial discussion, seek agreement on:

1. whether the opportunity is worth testing;
2. which asset should be the first pilot subject;
3. who should help shape the pilot;
4. which governance or technology stakeholders need early involvement; and
5. whether José should prepare a short pilot proposal.

## Alignment status

| Stakeholder | Current status | Evidence | Next action |
|---|---|---|---|
| Manager | Not yet tested | No direct discussion recorded | Present opportunity after peer validation |
| CRM Product Owner | Not yet tested | No direct discussion recorded | Test source-of-truth and workflow assumptions |
| Senior Service Designer | Not yet tested | No direct discussion recorded | Test design value and contribution accessibility |

## Open questions

- Which specific asset should be used as the first pilot?
- Does the team already have an approved Bitbucket project available?
- What browser-based contribution options are available?
- Which governance stakeholders should be consulted?
- Which publishing channels should be included in the first workflow?
- How will repository content be linked to organisational systems of record?
- What level of automation is realistic during the beta?
