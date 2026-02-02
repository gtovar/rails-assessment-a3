# US-003: Received invoices by emitter with total

## Story (formal)
- **Como** usuario autenticado
- **Quiero** ver facturas recibidas de un emisor y el total del monto filtrado
- **Para** analizar lo recibido por proveedor en un periodo

## Type
- Functional requirement

## Acceptance criteria
- `GET /api/v1/received_invoices` requires `emitter_rfc`.
- Supports `emitted_from` and `emitted_to` filters.
- Response includes `total_amount_cents` and `currency` in metadata.
- Pagination fields are present in the response.
- Missing required params return 400.
- Authorization missing/invalid returns 401.

## Definition of Done (DoD)
- Received-invoices endpoint works end-to-end.
- Request specs cover required params and totals.
- Query logic avoids N+1 issues.
- Rubocop passes (no critical lint errors).
- API_REFERENCE updated if params/response change.
- Commit messages are clear and conventional.

## Estimation (Fibonacci)
- TBD

## Notes
- Emitter filter is required.

## Sources (with notes)
- `/Users/gil/Documents/email-cleaner/rails-assessment/A3_DOCS_SCOPE.md` — read: doc scope rules for A3 — found: which docs are in/out of scope — used: no (governance only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ADR-TESTING-RSPEC.md` — read: decision to use RSpec — found: testing framework choice — used: no (not a story requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/API_REFERENCE.md` — read: endpoints + params — found: received_invoices params and totals — used: yes (defines endpoint behavior).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ARCHITECTURE.md` — read: data model + flows — found: invoice fields and flows — used: no (does not add acceptance criteria).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/DECISIONS.md` — read: auth + controller/scopes + deps — found: implementation decisions — used: no (not part of story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/index.md` — read: doc index — found: canonical doc links — used: no (navigation only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/TESTING.md` — read: test commands/scope — found: tests for received invoices — used: no (testing, not story definition).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README_SUBMISSION.md` — read: setup + usage — found: Postman usage — used: no (delivery doc).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README.md` — read: assessment user stories — found: received invoices story — used: yes (primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CASOS_DE_USO_LECTURA.md` — read: how to read docs — found: where to look for requirements — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CHECKLIST_ENTREGA.md` — read: delivery checklist — found: start/deliver steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CONTROL_DE_FASES.md` — read: phase usage — found: doc usage per phase — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ENTENDIMIENTO_DEL_PROYECTO.md` — read: requirements summary — found: received invoices + total — used: yes (story content).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a1/README.md` — read: Spanish A1 quiz/challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a2/README.md` — read: Spanish A2 challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/README.md` — read: Spanish general rules — found: rules and recommendations — used: no (not story requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/EXPLICACION_CAMBIOS_RETROACTIVA.md` — read: summary of prior implementation — found: what was built previously — used: no (history, not requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/GUIA_APLICADA_A3.md` — read: style/practices — found: coding guidance — used: yes (DoD includes lint/tests/docs).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INSIGHTS_ANALISIS_KREDIMX.md` — read: evaluation insights — found: quality focus — used: yes (DoD reflects evaluation points).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INVENTARIO_DOCS.md` — read: doc inventory — found: list of docs — used: no (catalog only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/MAPA_GENERAL.md` — read: data + endpoints — found: received endpoint + totals — used: yes (confirms required params and totals).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ORDEN_DE_LECTURA.md` — read: reading order — found: navigation flow — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PLAN_Y_ESTRATEGIA.md` — read: phases — found: received list in endpoint design phase — used: no (planning, not story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PROCESO_DE_ENTREGA.md` — read: delivery steps — found: operational delivery steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PRODUCT_SPEC.md` — read: product-level view — found: received invoices feature listed — used: no (derived, not primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/README.md` — read: general rules — found: commit/mention rules — used: no (not story requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/scrum.md` — read: scrum theory + story format — found: story syntax and criteria principles — used: yes (structure and quality).
- `/Users/gil/Documents/email-cleaner/rails-assessment/WORKLOG.md` — read: activity log — found: previous work steps — used: no (history only).
