# GA4 Portal Entry Data Dictionary

Use this file to document the fields expected in approved GA4 portal-entry CSV exports.

GA4 exports in this folder must be aggregated and non-sensitive.

## Common fields

| Field | Description | Notes |
|---|---|---|
| `date` | Reporting date for the aggregated row. | Use `YYYY-MM-DD` where available. |
| `device_category` | Device category such as desktop, mobile, or tablet. | Used for device mix analysis. |
| `page_title` | Entry page title or service page label. | Prefer page title over full URL where possible. |
| `page_path` | Page path without query strings. | Do not include full URLs with query strings or tokens. |
| `event_name` | GA4 event name used for portal-entry tracking. | Must be documented in metadata. |
| `link_text` | Text of selected login or registration link, where available. | Use only if non-sensitive. |
| `destination_type` | Login or sign-up destination classification. | Derived field if needed. |
| `session_source_medium` | Source / medium, where available. | Contextual only. |
| `day_of_week` | Day of week for the event or aggregated date. | Used for weekday pattern. |
| `hour` | Hour of day. | Use 0–23 format. |
| `is_business_hours` | Boolean or Yes/No flag for business-hours classification. | Business-hours rule must be documented. |
| `event_count` | Count of selected portal-entry events. | Aggregated count only. |

## Derived fields

| Field | Description |
|---|---|
| `destination_type` | Classifies selected links as `Login`, `Sign-up`, or `Other / unknown`. |
| `is_business_hours` | Classifies whether an event occurred during agreed business hours. |
| `analysis_area` | Identifies whether the export supports device mix, entry pages, weekday pattern, hour-of-day pattern, login vs sign-up split, source channel, or business-hours share. |

## Rules

Do not include:

- user identifiers
- client IDs
- session IDs
- IP addresses
- full URLs with query strings or tokens
- personal information
- raw event-level exports
- customer-level records

GA4 portal-entry data should be treated as selected-link behaviour only, not total portal usage.
