# Reusable CX Knowledge Architecture

## Status

Discovery

## Working title

Reusable CX Knowledge Architecture

## Research pattern

Knowledge-as-code

## Purpose

Explore how durable CX knowledge can be structured as reusable, governed artefacts that support:

* internal teams;
* customer-facing experiences;
* service design;
* digital delivery;
* AI systems;
* automation;
* development workflows; and
* quality assurance.

The project investigates whether stable CX standards, rules and principles can move beyond static documents and become machine-readable, version-controlled knowledge assets that can be reused across multiple interfaces and implementation contexts.

The proposed approach uses Bitbucket as a potential canonical repository for selected reusable artefacts, with Confluence, AI tools, development environments and other interfaces consuming or presenting that knowledge.

This is a hypothesis to test, not a predetermined platform decision.

---

# Strategic question

> How might we structure durable CX knowledge so it can be governed once and reused by people, AI and software delivery without creating multiple manually maintained versions?

---

# Opportunity

CX principles and standards are often communicated through:

* presentations;
* project documents;
* Confluence pages;
* design artefacts;
* workshop outputs;
* guidance documents; and
* individual practitioner knowledge.

These formats can communicate intent effectively, but the underlying rules may need to be repeatedly interpreted when work moves into:

* content;
* digital products;
* CRM;
* service design;
* development;
* testing;
* automation; or
* AI-enabled workflows.

This creates a risk that strategic intent becomes progressively weaker as it moves toward implementation.

The opportunity is to investigate whether selected CX knowledge can instead become reusable organisational assets.

The desired progression is:

**Principle → Rule → Artefact → Implementation → Validation → Reuse**

---

# Core hypothesis

Where CX knowledge is sufficiently stable and reusable, representing it as structured, version-controlled artefacts may improve:

* consistency;
* traceability;
* reuse;
* AI retrieval;
* implementation quality;
* governance;
* maintainability; and
* connection between strategy and delivery.

Markdown is a strong candidate because it is:

* human-readable;
* machine-readable;
* portable;
* diffable;
* versionable;
* AI-friendly;
* compatible with Git workflows;
* easy to transform into other formats; and
* independent of a single presentation interface.

Structured formats such as YAML or JSON may complement Markdown where machine-readable definitions are required.

The project should test where this model creates real value rather than assume all organisational documentation belongs in code.

---

# Proposed architecture

The proposed architecture separates the **knowledge source** from the **interfaces that present or use it**.

```text
                       GOVERNED CX KNOWLEDGE
                               │
                               ▼
                           BITBUCKET
                    reusable canonical artefacts
                      Markdown / YAML / schemas
                               │
                 ┌─────────────┼─────────────┐
                 │             │             │
                 ▼             ▼             ▼
            CONFLUENCE      AI / SEARCH    DEV STACK
            human view      retrieval      implementation
            narrative       reasoning      validation
            guidance        assistants     tooling
                 │                           │
                 └──────────────┬────────────┘
                                ▼
                               JIRA
                         delivery / adoption
```

## Proposed tool roles

### Bitbucket

Potential canonical source for stable reusable artefacts such as:

* CX principles;
* standards;
* interaction rules;
* service patterns;
* customer-language rules;
* status patterns;
* routing rules;
* information schemas;
* AI instructions;
* development guidance;
* acceptance criteria; and
* machine-readable definitions.

### Confluence

Human-facing context and sensemaking layer for:

* project narrative;
* discovery;
* rationale;
* decisions;
* stakeholder context;
* guidance;
* navigation; and
* presentation of reusable artefacts.

Confluence does not necessarily need to own the canonical version of every reusable standard.

### Jira

Delivery layer for:

* implementation;
* ownership;
* tasks;
* priorities;
* progress;
* adoption; and
* remediation.

### AI and search

Potential consumers of approved artefacts for:

* retrieval;
* summarisation;
* guided reasoning;
* content assistance;
* standards interpretation;
* implementation support; and
* quality review.

### Development stack

Potential consumers of CX artefacts through:

* developer instructions;
* acceptance criteria;
* component guidance;
* schemas;
* test cases;
* linting or automated checks;
* pull-request guidance; and
* AI coding-agent context.

---

# 4D approach

## 1. Discover

### Objective

Understand the current CX knowledge environment and identify where reusable artefacts could create meaningful value.

### Key questions

* What CX principles, rules and standards already exist?
* Where do they currently live?
* Which are repeatedly recreated or interpreted?
* Which are used across multiple channels or projects?
* Which information is stable enough to become reusable?
* Where does implementation diverge from CX intent?
* Which knowledge currently depends on individual staff?
* Where are multiple versions maintained?
* Which content is already Markdown or otherwise structured?
* Which teams currently use Bitbucket or Git-based workflows?
* What governance, security or access constraints apply?
* What existing AI capabilities could consume structured knowledge?

### Research activities

* map current CX knowledge sources;
* inventory recurring rules and standards;
* identify duplication;
* map information flows;
* identify implementation handoffs;
* interview CX, Digital, CRM, content and development stakeholders;
* review existing Confluence structures;
* review relevant Bitbucket practices;
* identify AI/search use cases;
* identify current governance constraints; and
* identify potential pilot artefacts.

### Discovery artefacts

* current-state knowledge map;
* knowledge-flow map;
* reusable-content inventory;
* duplication and maintenance analysis;
* stakeholder map;
* platform constraints;
* candidate artefact list; and
* initial opportunity assessment.

### Discovery decision

Determine whether there is sufficient repeated knowledge, implementation friction and multi-use demand to justify progressing to a formal reusable-artefact model.

---

# 2. Define

### Objective

Define which knowledge should become reusable artefacts and establish the minimum governance and architecture required.

### Key questions

* What qualifies as a reusable CX artefact?
* What should remain in Confluence?
* What should remain in other systems of record?
* What should potentially become canonical in Bitbucket?
* Which formats are appropriate?
* What metadata is required?
* Who owns each artefact?
* How are changes reviewed?
* How is deprecation handled?
* How should mandatory rules differ from guidance?
* What makes an artefact suitable for AI consumption?
* What should be testable by machines?
* Where must human judgement remain?

### Proposed artefact categories

Candidate categories include:

#### Principles

Stable statements describing intended CX outcomes.

#### Rules

Specific expectations derived from principles.

#### Patterns

Reusable approaches to recurring interaction or service problems.

#### Schemas

Structured definitions used by systems or development workflows.

#### AI instructions

Approved instructions that help AI apply CX standards consistently.

#### Tests

Criteria used to verify whether an implementation follows an agreed rule.

### Proposed artefact structure

A minimum Markdown artefact might contain:

* title;
* artefact type;
* status;
* owner;
* version;
* purpose;
* rule or principle;
* rationale;
* implementation guidance;
* examples;
* exceptions;
* related artefacts;
* validation requirements; and
* source references.

Only fields that create real operational value should become mandatory.

### Define outputs

* reusable artefact taxonomy;
* source-of-truth decision model;
* minimum Markdown pattern;
* metadata model;
* ownership model;
* review and approval model;
* deprecation model;
* AI-readiness criteria;
* implementation-use criteria; and
* pilot selection.

### Define decision

Agree whether Bitbucket should be tested as the canonical source for selected artefact types.

This decision should apply only to identified artefact classes, not all branch documentation.

---

# 3. Design

### Objective

Design and prototype the reusable knowledge architecture using a small number of real CX artefacts.

### Proposed pilots

Strong pilot candidates include:

1. Connected Interaction Principle
2. Journey Status Pattern
3. Customer Intent / Language Rule

Additional candidates may include:

* response modes;
* routing principles;
* minimum handover context;
* service-information quality rules; and
* customer support principles.

### Pilot model

Each pilot should test the complete flow:

**CX intent
→ Markdown artefact
→ Bitbucket version control
→ human presentation
→ AI retrieval
→ development application
→ quality validation**

### Example

A principle might state:

> Customers should not need to understand the organisation's internal structure to find the right service.

The reusable artefact could then inform:

#### Service design

Organise pathways around customer intent.

#### Content

Use language customers recognise.

#### Information architecture

Avoid relying only on internal organisational structures.

#### Development

Ensure search and navigation do not depend solely on internal terminology.

#### AI

Interpret customer queries using customer-intent language before internal service terminology.

#### Quality assurance

Test priority journeys using realistic customer-language queries.

One governing principle therefore supports multiple implementation contexts.

### Design questions

* Can a single artefact serve multiple consumers?
* Does Confluence need to copy the artefact or only present it?
* Can AI identify the authoritative version?
* Can developers use the artefact without interpreting a long strategy document?
* Can tests be derived from the rule?
* Can customer-facing content use the same underlying logic?
* Are variants needed for different channels?
* How are exceptions represented?
* Is the artefact easier to maintain than current documentation?
* Can the architecture work without manual synchronisation?

### Design outputs

* pilot Bitbucket structure;
* Markdown artefact template;
* example artefacts;
* Confluence presentation pattern;
* Jira linking pattern;
* AI retrieval prototype;
* developer-consumption pattern;
* QA / validation pattern;
* governance workflow; and
* architecture prototype.

### Design decision

Determine whether the proposed model is:

* technically viable;
* operationally viable;
* understandable by non-technical users;
* AI-friendly;
* maintainable; and
* sufficiently valuable to progress into live implementation.

---

# 4. Deliver

### Objective

Test the architecture through real work and determine whether it should become a reusable CX capability.

### Delivery approach

Delivery should begin narrowly.

Do not migrate existing documentation at scale.

Instead:

1. select approved pilot artefacts;
2. establish their canonical source;
3. connect them to relevant Confluence context;
4. use them in active delivery work;
5. test AI retrieval where permitted;
6. test developer or QA consumption;
7. measure maintenance effort;
8. capture stakeholder feedback; and
9. compare the approach with current practice.

### Delivery tests

Evaluate whether the approach improves:

#### Reuse

Can one artefact support multiple contexts?

#### Consistency

Do downstream implementations stay closer to the governing CX rule?

#### Findability

Can people and AI locate the authoritative knowledge?

#### Traceability

Can users identify:

* ownership;
* version;
* history;
* rationale; and
* current status?

#### Maintainability

Does one change propagate conceptually across consumers without requiring multiple manual edits?

#### AI usability

Can approved AI capabilities retrieve and apply the artefact accurately?

#### Development integration

Can developers, designers or QA use the artefact directly within delivery workflows?

#### Governance

Can changes be reviewed without introducing excessive administration?

### Delivery measures

Potential indicators include:

* number of duplicate artefacts removed;
* number of downstream uses per canonical artefact;
* time required to update a rule;
* number of manual copies maintained;
* implementation inconsistencies identified;
* AI retrieval accuracy;
* staff findability;
* adoption by delivery teams;
* maintenance burden; and
* reuse across projects.

Measures should be treated as exploratory until a stable baseline exists.

### Deliver outputs

* tested reusable artefacts;
* validated architecture;
* viability assessment;
* governance recommendation;
* adoption guidance;
* lessons learned;
* scaling recommendation; and
* decision on whether knowledge-as-code should become an enduring CX capability.

### Deliver decision

Choose one of:

**Adopt**

The model creates sufficient value to become a reusable capability.

**Adapt**

The approach has value but requires architectural or governance changes.

**Limit**

Use only for specific artefact types.

**Stop**

The maintenance or complexity exceeds the demonstrated value.

---

# Multi-use design principle

The core architectural principle is:

> Define the governing knowledge once, then transform or present it appropriately for different consumers.

This distinguishes between:

## Governing rule

The stable underlying intent.

## Internal expression

Guidance for staff, designers, service owners or developers.

## Customer-facing expression

The appropriate presentation of that rule within a channel or interaction.

## Machine expression

Structured instructions, metadata, schemas or tests that allow software or AI to apply the same intent.

The goal is shared logic, not identical wording everywhere.

---

# CX in the development stack

A major research objective is to determine whether CX principles can move closer to implementation.

The desired progression is:

**CX principle
→ explicit rule
→ reusable artefact
→ development requirement
→ testable behaviour
→ release assurance**

Potential integration points include:

* design systems;
* component documentation;
* content standards;
* service schemas;
* API requirements;
* developer documentation;
* acceptance criteria;
* automated tests;
* linting;
* pull-request templates;
* CI/CD checks;
* AI coding-agent instructions; and
* release assurance.

Not every CX principle should become executable.

The research should identify where automation is appropriate and where human judgement remains necessary.

---

# AI proposition

The project should not be positioned primarily as an AI initiative.

Its AI argument is:

> Better structured and governed organisational knowledge creates better conditions for trustworthy AI retrieval and reuse.

AI-friendly knowledge should have:

* clear authority;
* explicit ownership;
* stable terminology;
* modular structure;
* source traceability;
* version history;
* explicit rules;
* clear examples;
* known exceptions; and
* clear distinction between mandatory requirements and guidance.

The intended progression is:

**Trusted source
→ structured artefact
→ reliable retrieval
→ contextual reasoning
→ governed AI use**

---

# Business-value proposition

The viability hypothesis is:

**One governed artefact
→ multiple consumers
→ less duplication
→ less reconciliation
→ greater consistency
→ lower recurring maintenance**

Potential value includes:

### Staff

* easier retrieval;
* clearer standards;
* less repeated interpretation;
* fewer conflicting versions.

### Delivery teams

* clearer implementation guidance;
* standards closer to development workflows;
* easier validation;
* stronger traceability.

### CX

* better translation of strategic intent into implementation;
* more consistent experience across channels;
* reusable patterns rather than repeated redesign.

### Organisation

* stronger knowledge governance;
* better AI readiness;
* reduced documentation duplication;
* reusable organisational capability.

### Customers

Indirect value may include:

* clearer language;
* more consistent interactions;
* better status information;
* more coherent pathways; and
* reduced variation between channels.

These benefits require evidence through pilots and should not be treated as established outcomes before testing.

---

# Relationship to portfolio

## Customer Accounts Management

Provides trusted information **about the customer**.

**Trusted accounts → reliable customer context**

## Knowledge Management

Provides trusted information **about services and customer needs**.

**Trusted service knowledge → reliable service context**

## Reusable CX Knowledge Architecture

Provides reusable rules governing **how customer experience should be designed and implemented**.

**Trusted CX standards → reusable implementation context**

Together:

**Customer context

* service context
* CX implementation context
  → stronger connected interactions and AI readiness**

---

# Strategic OS interpretation

The reusable Strategic OS principle is:

> Encode durable strategic knowledge in forms that humans can understand, AI can retrieve and delivery systems can apply.

A complementary principle is:

> Separate the authoritative knowledge object from the interfaces used to present or consume it.

This supports a broader capability pattern:

**Evidence
→ principle
→ rule
→ reusable artefact
→ implementation
→ validation
→ learning**

---

# Career capability signal

This project demonstrates capability beyond documentation management.

It combines:

* strategic design;
* information architecture;
* service design;
* systems thinking;
* CX governance;
* knowledge architecture;
* platform architecture;
* AI readiness;
* development integration;
* operating-model design; and
* capability building.

The strategic contribution is designing how CX intent can move reliably from strategy into operational and technical implementation.

This complements the proposed shift toward leading an enduring customer information and service-information capability rather than delivering isolated projects.

---

# Current decisions

* Use the 4D cycle to structure the project.
* Treat knowledge-as-code as a hypothesis to test.
* Test Bitbucket as a potential canonical source for selected reusable artefacts.
* Do not treat Bitbucket as the source of truth for all organisational documentation.
* Keep Confluence as an important human-facing context and navigation layer.
* Keep Jira as the delivery-management layer.
* Separate canonical knowledge from its presentation interfaces.
* Prefer Markdown for initial reusable artefact pilots.
* Introduce YAML or other structured formats only where machine readability creates additional value.
* Test reuse across humans, AI and development workflows.
* Start with a small number of high-value pilot artefacts.
* Measure ongoing management burden as part of viability.
* Do not migrate existing documentation at scale until the model is validated.

---

# Open questions

* Which CX knowledge types genuinely benefit from code-based representation?
* Which current standards are stable enough to pilot?
* Can Bitbucket be accessed appropriately by all required consumers?
* How should non-technical users contribute to governed artefacts?
* Can Confluence present canonical content without creating a second maintained copy?
* Which AI tools can consume the repository within organisational governance?
* Can AI responses retain source and version traceability?
* Which development tools can consume the artefacts directly?
* Which CX rules can become testable requirements?
* Where must human judgement remain?
* What governance model is proportionate?
* How should customer-facing variants relate to canonical rules?
* Does this architecture reduce maintenance in practice?
* Which results would justify scaling beyond the initial pilots?
