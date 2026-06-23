# Schema Validation Summary

This file summarises what we learned from validating the curated Databricks schema for the Service Account EOFY celebration analysis.

## Schema validated

`datahub_datamart.customer_account_management`

## Tables reviewed

- `vwaccount`
- `vwcase`
- `vwpermit`
- `vwservice_enablement`
- `vwsupport`
- `vwsupport_enriched`

## Validation matrix

| Celebration metric | Recommended table | Required fields found? | Support status | Notes |
|---|---|---|---|---|
| New service accounts YoY | To confirm | To confirm | To validate |  |
| Active service accounts YoY | To confirm | To confirm | To validate |  |
| Self-service activity YoY | To confirm | To confirm | To validate |  |
| Activity by category | To confirm | To confirm | To validate |  |
| Support cases YoY | To confirm | To confirm | To validate |  |
| Support per 100 transactions | To confirm | To confirm | To validate |  |
| Activity CSAT | To confirm | To confirm | To validate |  |
| Support CSAT | To confirm | To confirm | To validate |  |
| Support by channel | To confirm | To confirm | To validate |  |

## Field mapping notes

### `vwaccount`

To complete after field review.

### `vwcase`

To complete after field review.

### `vwpermit`

To complete after field review.

### `vwservice_enablement`

To complete after field review.

### `vwsupport`

To complete after field review.

### `vwsupport_enriched`

To complete after field review.

## Key definition questions

- What is the preferred definition of a Service Account customer?
- What is the preferred source of truth for self-service activity?
- What is the correct date field for activity financial year reporting?
- What is the correct date field for support financial year reporting?
- What is the correct definition of support demand?
- Where is Activity CSAT stored?
- Where is Support CSAT stored?
- What is the positive CSAT response logic?
- Should support per 100 transactions use all support, Service Account support only, or CX-managed support only?

## Initial conclusion

To complete after field mapping.
