# US-002: Filter invoices

## Story (formal)
- **Como** usuario autenticado
- **Quiero** filtrar facturas por estado, emisor, receptor y rango de monto
- **Para** encontrar facturas rápidamente

## Type
- Functional requirement

## Acceptance criteria
- `GET /api/v1/invoices` supports filters: status, emitter_rfc, receiver_rfc, amount_min, amount_max.
- Filters can be combined in a single request.
- Response includes pagination metadata (`page`, `per_page`, `total`).
- Invalid filter values return 422 with error messages.
- Authorization missing/invalid returns 401.

## Definition of Done (DoD)
- Filters work end-to-end in the list endpoint.
- Request specs cover each filter and combined filters.
- Model scopes (or equivalent query logic) are tested.
- Rubocop passes (no critical lint errors).
- API_REFERENCE updated if filter params change.
- Commit messages are clear and conventional.

## Estimation (Fibonacci)
- TBD

## Notes
- Filters apply to the invoices list endpoint.

## Sources (with notes)
- `/Users/gil/Documents/email-cleaner/rails-assessment/A3_DOCS_SCOPE.md` — read: doc scope rules for A3 — found: which docs are in/out of scope — used: no (governance only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ADR-TESTING-RSPEC.md` — read: decision to use RSpec — found: testing framework choice — used: no (not a filter requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/API_REFERENCE.md` — read: endpoints + params — found: filter query params — used: yes (defines filter inputs).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ARCHITECTURE.md` — read: data model + flows — found: invoice fields and filters — used: no (does not add filter criteria).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/DECISIONS.md` — read: auth + controller/scopes + deps — found: scope decision — used: no (implementation detail, not requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/index.md` — read: doc index — found: canonical doc links — used: no (navigation only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/TESTING.md` — read: test commands/scope — found: filter tests — used: no (testing, not story definition).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README_SUBMISSION.md` — read: setup + usage — found: Postman usage — used: no (delivery doc).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README.md` — read: assessment user stories — found: filter story — used: yes (primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CASOS_DE_USO_LECTURA.md` — read: how to read docs — found: where to look for requirements — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CHECKLIST_ENTREGA.md` — read: delivery checklist — found: start/deliver steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CONTROL_DE_FASES.md` — read: phase usage — found: doc usage per phase — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ENTENDIMIENTO_DEL_PROYECTO.md` — read: requirements summary — found: filter criteria list — used: yes (story content).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a1/README.md` — read: Spanish A1 quiz/challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a2/README.md` — read: Spanish A2 challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/README.md` — read: Spanish general rules — found: rules and recommendations — used: no (not filter requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/EXPLICACION_CAMBIOS_RETROACTIVA.md` — read: summary of prior implementation — found: what was built previously — used: no (history, not requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/GUIA_APLICADA_A3.md` — read: style/practices — found: coding guidance — used: yes (DoD includes lint/tests/docs).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INSIGHTS_ANALISIS_KREDIMX.md` — read: evaluation insights — found: quality focus — used: yes (DoD reflects evaluation points).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INVENTARIO_DOCS.md` — read: doc inventory — found: list of docs — used: no (catalog only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/MAPA_GENERAL.md` — read: data + endpoints — found: filter fields and endpoints — used: yes (confirms filter scope).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ORDEN_DE_LECTURA.md` — read: reading order — found: navigation flow — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PLAN_Y_ESTRATEGIA.md` — read: phases — found: filters in endpoint design phase — used: no (planning, not story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PROCESO_DE_ENTREGA.md` — read: delivery steps — found: operational delivery steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PRODUCT_SPEC.md` — read: product-level view — found: filter feature listed — used: no (derived, not primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/README.md` — read: general rules — found: commit/mention rules — used: no (not filter requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/scrum.md` — read: scrum theory + story format — found: story syntax and criteria principles — used: yes (structure and quality).
- `/Users/gil/Documents/email-cleaner/rails-assessment/WORKLOG.md` — read: activity log — found: previous work steps — used: no (history only).
