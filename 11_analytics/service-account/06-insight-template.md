# Service Account YoY Analysis Template

Use this template to turn validated Databricks, Power BI, or documented pilot analysis results into a concise EOFY celebration insight.

This template is designed for the one-slide Service Account / Portal CX celebration story.

## 1. Headline

Service Account is scaling: more customers are using the portal, self-service activity is growing, support demand is reducing relative to activity, and Activity CSAT has improved.

## 2. Key numbers

| Story point | Metric | Previous FY, FY2024/25 | Current FY, FY2025/26 | Movement | Interpretation |
|---|---|---:|---:|---:|---|
| More customers | Customers: Service Account / portal sign-ups | 9,838 | 15,570 | +58.3% | Service Account adoption grew strongly year on year. |
| More self-service activity | Application workflow Activity | 2,209 | 3,751 | +69.8% | More customers are progressing application workflow activity through the portal. |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 412.6 | about -17.0% | Support volume increased, but support demand reduced relative to activity. |
| Better Activity CSAT | Portal-enabled Activity CSAT | 76.5% | 80.6% | +4.1 pp | Activity CSAT improved and response volume increased. |
| Stronger Activity CSAT response base | Valid Activity CSAT responses | 889 | 1,721 | +832 responses | The current comparison has a stronger response base than earlier years. |
| Support CSAT | Mapped portal-relevant support pathways | Manual mapping only | Manual mapping only | Do not claim unless mapping applied | Support CSAT is valid only where the manual support service mapping has been applied and documented. |

## 3. What changed

Service Account usage increased materially during the current financial year.

Customer sign-ups increased from 9,838 to 15,570, a 58.3% increase.

Application workflow activity increased from 2,209 to 3,751 applications, a 69.8% increase.

Support cases also increased in raw volume, from 10,976 to 15,475, but not as quickly as Activity. Support demand reduced from 496.9 to 412.6 support cases per 100 activities, a relative reduction of about 17.0%.

Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be described where the manual support service mapping has been applied and documented.

## 4. What drove the change

Use this section to summarise the main service, channel, or capability drivers once validated.

Potential drivers to check:

| Driver type | What to check |
|---|---|
| Service migration | Residential Parking Permit migration and added permit types. |
| Capability milestone | Service Account releases, Genesys go-live, website upgrade, Digital Assistant go-live. |
| Activity mix | Which service groups contributed most to activity growth. |
| Support mix | Which services or channels contributed most to support demand. |
| CSAT mix | Whether Parking, Construction, Business, or Community services dominate the CSAT response base. |
| Support pathway mix | Whether Resolved, Assisted, or Expert Enquiry pathways explain support CSAT variation. |

Current known driver signals:

- Residential Parking migration is a likely structural driver of increased Activity and CSAT response volume.
- Parking appears to contribute strongly to the current Activity CSAT response base.
- Pre/post CSAT is structurally limited for many portal-enabled services because comparable pre-enable survey data is not available in `customer_intelligence.vwcase`.
- Low Assisted pathway usage should be treated as a business validation question, not a confirmed conclusion.

## 5. Why it matters

This analysis shows that Service Account is beginning to scale as a digital service model, not just as a technology rollout.

The current story is:

- more customers are using the portal
- more application activity is happening through self-service
- support demand is reducing relative to activity
- customers are reporting improved satisfaction with portal-enabled activity
- Support CSAT is now better understood, but needs governed mapping before it can become a repeatable self-serve metric

The strategic implication is that Service Account is creating the conditions for more scalable, lower-friction customer interactions, while still requiring targeted support for complex or recently migrated services.

## 6. Caveats

Use caveats in supporting notes, not as the main slide message.

| Area | Caveat |
|---|---|
| Customers | Customers means Service Account / portal sign-ups, not all CRM accounts. |
| Activity | Activity definition is accepted for this pilot but not yet a final enterprise reporting standard. |
| Support demand | Support should be shown as a rate, not raw volume. |
| Activity CSAT | FY2023/24 has only 18 valid responses and should not be used as the main baseline. |
| Activity CSAT causality | Do not claim portal enablement caused the CSAT improvement unless causality is supported. |
| Pre/post CSAT | Most portal-enabled services have no usable pre-enable CSAT in `customer_intelligence.vwcase`. |
| Support CSAT | Support CSAT requires the manually documented support service mapping. |
| Support CSAT production | Support CSAT is not yet a repeatable self-serve Genie metric because the mapping is not yet a governed Databricks asset. |
| RPP proxy | RPP Support CSAT is a proxy based on selected enquiry/support services, not complete Service Account Support CSAT. |
| Service milestones | Capability changes may explain some metric movement and should be referenced in notes. |
| Data storage | Do not store raw customer-level records, survey comments, case URLs, or personal information in GitHub. |

## 7. Suggested celebration message

Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## 8. Slide-ready proof points

| Proof point | Slide wording |
|---|---|
| More customers | Customer sign-ups increased by 58.3%. |
| More self-service activity | Application workflow activity increased by 69.8%. |
| Less support demand relative to activity | Support demand per 100 activities reduced by about 17.0%. |
| Better Activity CSAT | Portal-enabled Activity CSAT improved from 76.5% to 80.6%. |
| Stronger response base | Valid Activity CSAT responses increased from 889 to 1,721. |
| Support CSAT | Support CSAT is valid only where the manual mapping has been applied and documented. |

## 9. Slide-safe insight rules

Use this wording pattern:

Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

Do not claim:

- Support CSAT improved overall unless the manual mapping has been applied
- portal enablement caused CSAT improvement
- pre/post enablement CSAT improved across the full portal service cohort
- RPP Support CSAT proxy represents full Service Account Support CSAT

## 10. Speaker note

Customers means Service Account / portal sign-ups, not all CRM accounts. Activity means application workflow activity, not permit lifecycle activity. Support is shown as support demand relative to Activity, not raw support volume.

Activity CSAT is compared between FY2024/25 and FY2025/26. FY2023/24 has only 18 valid responses and should not be used as the main baseline.

Support CSAT requires a manual mapping between portal-enabled services and support/enquiry service names. Until that mapping is implemented as a governed Databricks table or curated view, Support CSAT is a documented pilot metric only, not a repeatable self-serve Genie metric.
## Optional contextual evidence: GA4 portal-entry behaviour

Use this section only after GA4 CSV exports and Power BI visuals are refreshed.

### Insight question

How are customers entering selected portal login and registration journeys?

### Evidence to include

| Evidence area | What to show | Caveat |
|---|---|---|
| Portal entries | Count of tracked entries from selected portal login and registration links. | Not total portal usage. |
| Device mix | Desktop, mobile, and tablet share. | Limited to tracked selected links. |
| Entry page pattern | Top service pages driving selected portal entry. | Depends on link coverage. |
| Login vs sign-up split | Whether selected entries go to login or registration. | Not the same as completed account sign-ups. |
| Weekday / hour pattern | When selected portal entry occurs. | Contextual behaviour signal only. |
| Source channel | Acquisition/source pattern, where available. | Use only if refreshed and validated. |

### Interpretation pattern

GA4 portal-entry tracking provides supporting context on how customers access selected portal login and registration journeys. It can help explain digital entry behaviour, but it should not be treated as total portal usage or as a replacement for Databricks Service Account, Activity, Support, or CSAT metrics.

### Do not claim

Do not claim:

- GA4 portal-entry values represent total portal usage.
- Old GA4 CSV export values are current EOFY evidence.
- GA4 sign-up clicks equal Service Account sign-ups.
- GA4 replaces Databricks headline metrics.
