# EOFY Service Account Celebration Slide

This file defines the intended one-slide story for the EOFY Service Account / Portal CX celebration analysis.

## Slide title

Digital Customer Experience  
EOFY Service Account Performance

## Story frame

More customers.  
More self-service activity.  
Less support demand relative to activity.  
Better Activity CSAT.  
Support CSAT only where manually mapped and documented.

## Slide purpose

Show how Service Account / Portal CX performed this financial year compared with the previous financial year, using a concise executive-ready celebration format.

## Comparison period

| Period | Date window |
|---|---|
| Previous FY, FY2024/25 | 2024-07-01 to 2025-07-01 |
| Current FY, FY2025/26 | 2025-07-01 to 2026-07-01 |

Use half-open date windows in analysis:

    date_field >= start_date
    AND date_field < end_date

## Slide tiles

### More customers

15,570 Service Account / portal sign-ups  
+58.3% YoY

Previous FY: 9,838

### More self-service activity

3,751 application workflow activities  
+69.8% YoY

Previous FY: 2,209

### Less support demand relative to activity

412.6 support cases per 100 activities  
about 17.0% lower YoY

Previous FY: 496.9

### Better Activity CSAT

80.6% portal-enabled Activity CSAT  
+4.1 percentage points YoY

Previous FY: 76.5%

Valid responses increased from 889 to 1,721.

### Support CSAT

Use only where manual support service mapping has been applied and documented.

Do not claim overall Support CSAT improvement unless the manual mapping has been applied.

## Supporting narrative

Service Account continued to mature as a digital service platform this year, with more customers using the portal and more application workflow activity completed.

Support cases increased in raw volume, but activity grew faster. This means support demand reduced relative to activity.

Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with a stronger response base than the previous year.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Slide-safe storyline

Service Account adoption and usage are growing.

Customer sign-ups increased by 58.3%, from 9,838 to 15,570.

Application workflow activity increased by 69.8%, from 2,209 to 3,751.

Support demand per 100 activities reduced by about 17.0%, from 496.9 to 412.6.

Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

Do not claim that Support CSAT improved overall unless the manual mapping has been applied.

## Final draft narrative

Service Account adoption and usage are growing. Customer sign-ups increased by 58.3%, application workflow activity increased by 69.8%, and support demand per 100 activities reduced by about 17.0%. Portal-enabled Activity CSAT improved from 76.5% to 80.6%, with valid responses increasing from 889 to 1,721.

Support CSAT should only be discussed where the manual support service mapping has been applied and documented.

## Suggested slide story

| Story point | Suggested treatment |
|---|---|
| More customers | Service Account / portal sign-ups increased from 9,838 to 15,570, up 58.3%. |
| More self-service activity | Application workflow activity increased from 2,209 to 3,751, up 69.8%. |
| Less support demand relative to activity | Support per 100 activities reduced from 496.9 to 412.6, about 17.0% lower. |
| Better Activity CSAT | Portal-enabled Activity CSAT improved from 76.5% to 80.6%. |
| Stronger Activity CSAT response base | Valid Activity CSAT responses increased from 889 to 1,721. |
| Support CSAT | Use only where the manual support service mapping has been applied and documented. |

## Design notes

- Keep the slide celebratory but evidence-led.
- Use five headline tiles.
- Use plain language.
- Avoid technical data language on the slide.
- Show Support as a rate, not raw support volume.
- Use `Activity` instead of `transactions` where possible.
- Keep caveats in speaker notes or supporting appendix, not on the main slide.

## Suggested visual hierarchy

1. Top headline: Service Account adoption and usage are growing.
2. Five metric tiles across the slide or in a 3+2 grid.
3. Highlight growth metrics in positive accent colour.
4. Highlight support rate reduction as an efficiency / reduced friction signal.
5. Use a small note or icon for Support CSAT mapping caveat if Support CSAT is referenced.

## Suggested speaker note

Customers means Service Account / portal sign-ups, not all CRM accounts. Activity means application workflow activity, not permit lifecycle activity. Support is shown as support demand relative to Activity, not raw support volume.

Activity CSAT is compared between FY2024/25 and FY2025/26. FY2023/24 has only 18 valid responses and should not be used as the main baseline.

Support CSAT requires a manual mapping between portal-enabled services and support/enquiry service names. Until that mapping is implemented as a governed Databricks table or curated view, Support CSAT is a documented pilot metric only, not a repeatable self-serve Genie metric.

## Do not say

Do not say:

> Support CSAT improved overall.

Unless the manual Support CSAT mapping has been applied and the result is explicitly documented.

Do not say:

> Portal enablement caused the CSAT improvement.

Use correlation language unless causality is supported.

Do not say:

> Pre/post enablement CSAT improved across the full portal service cohort.

Most portal-enabled services do not have a usable pre-enable CSAT base.

Do not say:

> RPP Support CSAT proxy represents full Service Account Support CSAT.

The RPP proxy is service-specific explanatory evidence only.
