# Architecture

## Overview
API-only Rails app that manages invoices.

## Core entities
- Invoice
  - emitter (name, rfc)
  - receiver (name, rfc)
  - amount (cents, currency)
  - dates (emitted_at, signed_at, expires_at)
  - cfdi_digital_stamp (QR source)

## Key flows
- CRUD invoices
- Filtered listing
- Received invoices by emitter + total
- ZIP/XML import → parse → persist
- QR rendering from `cfdi_digital_stamp`

## Performance considerations
- Pagination for list endpoints
- Avoid N+1 queries
