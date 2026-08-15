# Enterprise AI Agent Capability Assessment — Decisions

## Purpose

Record material decisions about how enterprise AI agents should support Strategic OS work.

## Decisions

### D001 — Replace the Copilot-only assessment

**Status:** Confirmed

Assess Microsoft 365 Copilot, Atlassian Rovo, Databricks Genie and Miro AI as complementary enterprise AI capabilities rather than treating Copilot as the only enterprise AI layer.

### D002 — Optimise for administrative leverage

**Status:** Confirmed

Evaluate agents on their ability to remove recurring administrative effort, retrieve authoritative organisational information and prepare review-ready outputs.

Do not prioritise creativity, design generation, generic brainstorming or stylistic writing quality.

### D003 — Prefer native-system strengths

**Status:** Confirmed

Working allocation:
- Microsoft 365 Copilot → meetings, email, calendar, Microsoft 365 knowledge and personal administration.
- Atlassian Rovo → Jira, Confluence, project governance and Atlassian-based knowledge.
- Databricks Genie → governed analytics and metric evidence.
- Miro AI / Sidekick → extraction and summarisation of existing board content.

### D004 — Agents prepare; humans approve and act

**Status:** Confirmed

Preferred pattern:

> Retrieve → summarise → prepare → human review → action.

Do not design around autonomous execution.

### D005 — Policy retrieval requires provenance

**Status:** Confirmed

An agent is useful for organisational policy retrieval only when it can surface or reference the authoritative organisational source.

### D006 — Avoid duplicated agent capability

**Status:** Confirmed

Do not create overlapping agents across platforms unless duplication solves a distinct, evidenced need.

### D007 — Strategic OS remains the interpretation layer

**Status:** Confirmed

Enterprise agents retrieve and prepare organisational context. Strategic OS stores only safe, reusable interpretation, decisions, caveats and operating patterns.

## Open decisions

- Which Microsoft 365 admin routines justify adoption?
- Which organisational policies are reliably discoverable through Copilot?
- Can Rovo trace decisions and project state across Jira and Confluence?
- Can Rovo surface authoritative organisational process or policy pages?
- Which repeatable Genie questions can become standard evidence routines?
- Can Miro Sidekick reliably extract actions and decisions without changing meaning?
- Which write or automation actions are actually permitted?
