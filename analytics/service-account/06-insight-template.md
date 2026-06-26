# Service Account YoY Analysis Template

Use this template to turn validated Databricks, Power BI, or proxy analysis results into a concise EOFY celebration insight.

This template is designed for the one-slide Service Account / Portal CX celebration story.

## 1. Headline

Service Account is scaling: more customers are using the portal, self-service activity is growing, and support demand is reducing relative to activity.

## 2. Key numbers

| Story point | Metric | Previous FY / baseline | Current FY / current period | Movement | Interpretation |
|---|---|---:|---:|---:|---|
| More customers | Customers: Service Account / portal sign-ups | To calculate | To calculate | To calculate | Pending final Customers YoY result. |
| More self-service activity | Activity applications | 2,209 | 3,766 | +70.5% | More customers are progressing application workflow activity through the portal. |
| Less support demand relative to activity | Support per 100 activities | 496.9 | 409.3 | -17.6% | Support volume increased, but support demand reduced relative to activity. |
| Strong activity CSAT | Portal-enabled Activity CSAT | 18 responses / 88.9% | 888 responses / 76.5% | Do not frame as YoY improvement | Current-year satisfaction is strong, but the prior-year response base is too small for a stable YoY claim. |
| Support stabilisation | RPP expert enquiry CSAT proxy | 69% post-portal impact | 78% current ELT period | +9 pts | Residential Parking expert support is showing signs of stabilisation after migration. |

## 3. What changed

Service Account usage increased materially during the current financial year.

Application workflow activity increased from 2,209 to 3,766 applications, a 70.5% increase.

Support cases also increased in raw volume, but not as quickly as activity. Support demand reduced from 496.9 to 409.3 support cases per 100 activities, a 17.6% improvement.

Activity CSAT should be treated as a current-state strength metric rather than a YoY improvement metric. The current-year result is 76.5% from 888 valid responses, but the previous-year base has only 18 valid responses.

Support CSAT is best described through the RPP Support CSAT proxy, which suggests that Residential Parking support is stabilising after migration.

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

Current known driver signal:

- Parking appears to dominate the current Activity CSAT response base.
- `PARKING PERMIT - PARKING PERMIT APPLICATION` has 578 post-enable valid responses and no pre-enable valid responses in `customer_intelligence.vwcase`.
- This supports the interpretation that pre/post CSAT is structurally limited, likely because comparable pre-portal survey data is not available in the current CRM / CSAT source.

## 5. Why it matters

This analysis shows that Service Account is beginning to scale as a digital service model, not just as a technology rollout.

The current story is:

- more customers are using the portal
- more application activity is happening through self-service
- support demand is reducing relative to activity
- customers are reporting strong satisfaction with portal-enabled activity
- Residential Parking support is showing signs of stabilisation after migration

The strategic implication is that Service Account is creating the conditions for more scalable, lower-friction customer interactions, while still requiring targeted support for complex or recently migrated services.

## 6. Caveats

Use caveats in supporting notes, not as the main slide message.

| Area | Caveat |
|---|---|
| Customers | Final Customers YoY result still required. |
| Activity | Activity definition is accepted for this pilot but not yet a final enterprise reporting standard. |
| Support | Support should be shown as a rate, not raw volume. |
| Activity CSAT | Previous FY has only 18 valid responses, so avoid direct YoY improvement framing. |
| Pre/post CSAT | Most portal-enabled services have no usable pre-enable CSAT in `customer_intelligence.vwcase`. |
| Support CSAT | RPP Support CSAT is a proxy based on selected enquiry/support services, not a complete Service Account support CSAT standard. |
| Service milestones | Capability changes may explain some metric movement and should be referenced in notes. |
| Data storage | Do not store raw customer-level records, survey comments, case URLs, or personal information in GitHub. |

## 7. Suggested celebration message

Service Account adoption and usage are growing. Application workflow activity increased by 70.5%, while support demand per 100 activities reduced by 17.6%. Customers are reporting strong satisfaction with portal-enabled activity, with 76.5% CSAT from 888 current-year responses. Residential Parking support is also showing signs of stabilisation after migration, with expert enquiry CSAT recovering from 69% post-portal to 78% in the current ELT period.

## 8. Slide-ready proof points

| Proof point | Slide wording |
|---|---|
| More customers | More customers signed up to Service Account. |
| More self-service activity | Self-service activity increased by 70.5%. |
| Less support demand relative to activity | Support demand reduced by 17.6% relative to activity. |
| Strong activity CSAT | Portal-enabled activity CSAT is strong at 76.5%. |
| Support stabilisation | Residential Parking expert support is stabilising after migration. |

## 9. Speaker note

CSAT should be interpreted carefully. Direct Activity CSAT is treated as a current-state strength metric because previous-year response volume is too small for a stable YoY comparison. Residential Parking support CSAT is a proxy based on selected enquiry/support services and should be used as explanatory evidence of stabilisation, not as a complete Service Account support CSAT standard.
