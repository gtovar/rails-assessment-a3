# API Reference

## Authentication
All endpoints require an API token:

```
Authorization: Bearer <TOKEN>
```

## POST /api/v1/invoices
Create an invoice.

## GET /api/v1/invoices
List invoices with filters:
- status
- emitter_rfc
- receiver_rfc
- amount_min
- amount_max
- page, per_page
Notes:
- invalid filter values return 422 with error messages
- status must be one of the allowed enum values
- amount_min/amount_max must be numeric

## GET /api/v1/invoices/:id
Get invoice details.

## PATCH /api/v1/invoices/:id
Update invoice.

## DELETE /api/v1/invoices/:id
Delete invoice.

## GET /api/v1/received_invoices
List received invoices by emitter:
- emitter_rfc (required)
- emitted_from, emitted_to
- returns total amount in response

## POST /api/v1/invoices/import
Import invoices from ZIP (multipart/form-data `file`).

## GET /api/v1/invoices/:id/qr
Render QR image (image/png).

## Error responses
- 401 Unauthorized: missing/invalid token
- 400 Bad Request: missing required params
- 422 Unprocessable Entity: validation errors (including invalid filters)
