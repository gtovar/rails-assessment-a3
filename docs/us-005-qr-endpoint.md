# US-005: QR endpoint

## Story (formal)
- **Como** usuario autenticado
- **Quiero** generar un QR desde `cfdi_digital_stamp`
- **Para** leer la factura más rápido

## Type
- Functional requirement

## Acceptance criteria
- `GET /api/v1/invoices/:id/qr` returns an `image/png` response.
- QR is generated from `cfdi_digital_stamp`.
- Invalid invoice id returns 404.
- Authorization missing/invalid returns 401.

## Definition of Done (DoD)
- QR endpoint works end-to-end.
- Request spec covers success and not-found cases.
- Rubocop passes (no critical lint errors).
- API_REFERENCE updated if response details change.
- Commit messages are clear and conventional.

## Estimation (Fibonacci)
- TBD

## Notes
- API-only endpoint.

## Sources (with notes)
- `/Users/gil/Documents/email-cleaner/rails-assessment/A3_DOCS_SCOPE.md` — read: doc scope rules for A3 — found: which docs are in/out of scope — used: no (governance only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ADR-TESTING-RSPEC.md` — read: decision to use RSpec — found: testing framework choice — used: no (not a QR requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/API_REFERENCE.md` — read: endpoints + params — found: QR endpoint response type — used: yes (defines API behavior).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ARCHITECTURE.md` — read: QR flow — found: QR generation from `cfdi_digital_stamp` — used: yes (confirms flow for this story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/DECISIONS.md` — read: deps decisions — found: QR gems chosen — used: no (implementation, not story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/index.md` — read: doc index — found: canonical doc links — used: no (navigation only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/TESTING.md` — read: test scope — found: QR tests mentioned — used: no (testing, not story definition).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README_SUBMISSION.md` — read: usage — found: QR note in Postman — used: no (delivery doc).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README.md` — read: assessment user stories — found: QR endpoint story — used: yes (primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CASOS_DE_USO_LECTURA.md` — read: how to read docs — found: where to look for requirements — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CHECKLIST_ENTREGA.md` — read: delivery checklist — found: start/deliver steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CONTROL_DE_FASES.md` — read: phase usage — found: doc usage per phase — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ENTENDIMIENTO_DEL_PROYECTO.md` — read: requirements summary — found: QR endpoint requirement — used: yes (story content).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a1/README.md` — read: Spanish A1 quiz/challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a2/README.md` — read: Spanish A2 challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/README.md` — read: Spanish general rules — found: rules and recommendations — used: no (not QR requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/EXPLICACION_CAMBIOS_RETROACTIVA.md` — read: summary of prior implementation — found: prior QR implementation — used: no (history, not requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/GUIA_APLICADA_A3.md` — read: style/practices — found: coding guidance — used: yes (DoD includes lint/tests/docs).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INSIGHTS_ANALISIS_KREDIMX.md` — read: evaluation insights — found: quality focus — used: yes (DoD reflects evaluation points).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INVENTARIO_DOCS.md` — read: doc inventory — found: list of docs — used: no (catalog only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/MAPA_GENERAL.md` — read: data + endpoints — found: `cfdi_digital_stamp` as QR source — used: yes (confirms QR input field).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ORDEN_DE_LECTURA.md` — read: reading order — found: navigation flow — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PLAN_Y_ESTRATEGIA.md` — read: phases — found: QR in endpoint plan — used: no (planning, not story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PROCESO_DE_ENTREGA.md` — read: delivery steps — found: operational delivery steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PRODUCT_SPEC.md` — read: product-level view — found: QR listed as feature — used: no (derived, not primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/README.md` — read: general rules — found: commit/mention rules — used: no (not QR requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/scrum.md` — read: scrum theory + story format — found: story syntax and criteria principles — used: yes (structure and quality).
- `/Users/gil/Documents/email-cleaner/rails-assessment/WORKLOG.md` — read: activity log — found: previous work steps — used: no (history only).
