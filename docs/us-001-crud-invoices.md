# US-001: CRUD invoices

## Story (formal)
- **Como** usuario autenticado
- **Quiero** crear, editar, eliminar y listar facturas
- **Para** gestionar la información de facturación de forma confiable

## Type
- Functional requirement

## Acceptance criteria
- Create invoice: `POST /api/v1/invoices` returns 201 with the created invoice.
- Update invoice: `PATCH /api/v1/invoices/:id` returns 200 with the updated invoice.
- Delete invoice: `DELETE /api/v1/invoices/:id` returns 204 with no body.
- List invoices: `GET /api/v1/invoices` returns a paginated list.
- Validation errors return 422 with error messages.
- Authorization missing/invalid returns 401.

## Definition of Done (DoD)
- CRUD endpoints work end-to-end in local environment.
- Request specs cover create, update, delete, list.
- Model validations relevant to CRUD are covered by specs.
- Rubocop passes (no critical lint errors).
- API_REFERENCE updated if payload/response changes.
- Commit messages are clear and conventional.

## Estimation (Fibonacci)
- TBD

## Notes
- API-only behavior.

## Sources (with notes)
- `/Users/gil/Documents/email-cleaner/rails-assessment/A3_DOCS_SCOPE.md` — read: doc scope rules for A3 — found: which docs are in/out of scope — used: no (governance only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ADR-TESTING-RSPEC.md` — read: decision to use RSpec — found: testing framework choice — used: no (not a CRUD requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/API_REFERENCE.md` — read: endpoints + params — found: CRUD endpoints and responses — used: yes (maps CRUD operations to API).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ARCHITECTURE.md` — read: data model + flows — found: invoice table and general flows — used: no (does not change CRUD story/criteria).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/DECISIONS.md` — read: auth + controller/scopes + deps — found: implementation decisions — used: no (not part of user story itself).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/index.md` — read: doc index — found: canonical doc links — used: no (navigation only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/TESTING.md` — read: test commands/scope — found: tests for CRUD and filters — used: no (testing, not story definition).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README_SUBMISSION.md` — read: setup + usage — found: how to run and test — used: no (delivery doc).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README.md` — read: assessment user stories — found: CRUD invoices story — used: yes (primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CASOS_DE_USO_LECTURA.md` — read: how to read docs — found: where to look for requirements — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CHECKLIST_ENTREGA.md` — read: delivery checklist — found: start/deliver steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CONTROL_DE_FASES.md` — read: phase usage — found: doc usage per phase — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ENTENDIMIENTO_DEL_PROYECTO.md` — read: requirements summary — found: CRUD list — used: yes (story content).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a1/README.md` — read: Spanish A1 quiz/challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a2/README.md` — read: Spanish A2 challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/README.md` — read: Spanish general rules — found: rules and recommendations — used: no (not CRUD requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/EXPLICACION_CAMBIOS_RETROACTIVA.md` — read: summary of prior implementation — found: what was built previously — used: no (history, not requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/GUIA_APLICADA_A3.md` — read: style/practices — found: coding guidance — used: yes (DoD includes lint/tests/docs).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INSIGHTS_ANALISIS_KREDIMX.md` — read: evaluation insights — found: quality focus — used: yes (DoD reflects evaluation points).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INVENTARIO_DOCS.md` — read: doc inventory — found: list of docs — used: no (catalog only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/MAPA_GENERAL.md` — read: data + endpoints — found: CRUD endpoints and invoice fields — used: yes (confirms CRUD scope).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ORDEN_DE_LECTURA.md` — read: reading order — found: navigation flow — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PLAN_Y_ESTRATEGIA.md` — read: phases — found: CRUD in phase plan — used: no (planning, not story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PROCESO_DE_ENTREGA.md` — read: delivery steps — found: operational delivery steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PRODUCT_SPEC.md` — read: product-level view — found: high-level features — used: no (derived, not primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/README.md` — read: general rules — found: commit/mention rules — used: no (not CRUD requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/scrum.md` — read: scrum theory + story format — found: story syntax and criteria principles — used: yes (structure and quality).
- `/Users/gil/Documents/email-cleaner/rails-assessment/WORKLOG.md` — read: activity log — found: previous work steps — used: no (history only).
