# US-004: Import XML invoices (ZIP)

## Story (formal)
- **Como** usuario autenticado
- **Quiero** importar un ZIP de XML de facturas
- **Para** registrar en la base de datos las facturas en lote

## Type
- Functional requirement

## Acceptance criteria
- `POST /api/v1/invoices/import` accepts a ZIP file (multipart/form-data `file`).
- Supports hundreds of XML files per ZIP.
- Uses sample ZIP: `public/20220811012132-invoices.zip`.
- Allows generating more XML via `rake xml:generate_invoice`.
- XML parsing can use `Hash.from_xml`.
- Response includes `imported`, `failed`, and `errors`.
- Authorization missing/invalid returns 401.

## Definition of Done (DoD)
- Import works end-to-end with the sample ZIP.
- Request spec covers successful import and error reporting.
- Import service handles invalid XML without crashing.
- Rubocop passes (no critical lint errors).
- API_REFERENCE updated if import payload/response changes.
- Commit messages are clear and conventional.

## Estimation (Fibonacci)
- TBD

## Notes
- Import should report imported vs failed results.

## Sources (with notes)
- `/Users/gil/Documents/email-cleaner/rails-assessment/A3_DOCS_SCOPE.md` — read: doc scope rules for A3 — found: which docs are in/out of scope — used: no (governance only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ADR-TESTING-RSPEC.md` — read: decision to use RSpec — found: testing framework choice — used: no (not an import requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/API_REFERENCE.md` — read: endpoints + params — found: import endpoint and response shape — used: yes (defines API behavior).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/ARCHITECTURE.md` — read: import flow — found: ZIP → XML → invoice persistence — used: yes (confirms flow for this story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/DECISIONS.md` — read: deps decisions — found: `rubyzip` and QR gems — used: no (implementation, not story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/index.md` — read: doc index — found: canonical doc links — used: no (navigation only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/docs/TESTING.md` — read: test scope — found: import tests mentioned — used: no (testing, not story definition).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README_SUBMISSION.md` — read: usage — found: import ZIP note — used: no (delivery doc).
- `/Users/gil/Documents/email-cleaner/rails-assessment/a3/README.md` — read: assessment user stories — found: import ZIP/XML story — used: yes (primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CASOS_DE_USO_LECTURA.md` — read: how to read docs — found: where to look for requirements — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CHECKLIST_ENTREGA.md` — read: delivery checklist — found: start/deliver steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/CONTROL_DE_FASES.md` — read: phase usage — found: doc usage per phase — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ENTENDIMIENTO_DEL_PROYECTO.md` — read: requirements summary — found: ZIP import criteria — used: yes (story content).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a1/README.md` — read: Spanish A1 quiz/challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/a2/README.md` — read: Spanish A2 challenge — found: unrelated to A3 — used: no (different challenge).
- `/Users/gil/Documents/email-cleaner/rails-assessment/es/README.md` — read: Spanish general rules — found: rules and recommendations — used: no (not import requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/EXPLICACION_CAMBIOS_RETROACTIVA.md` — read: summary of prior implementation — found: prior import implementation — used: no (history, not requirements).
- `/Users/gil/Documents/email-cleaner/rails-assessment/GUIA_APLICADA_A3.md` — read: style/practices — found: coding guidance — used: yes (DoD includes lint/tests/docs).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INSIGHTS_ANALISIS_KREDIMX.md` — read: evaluation insights — found: quality focus — used: yes (DoD reflects evaluation points).
- `/Users/gil/Documents/email-cleaner/rails-assessment/INVENTARIO_DOCS.md` — read: doc inventory — found: list of docs — used: no (catalog only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/MAPA_GENERAL.md` — read: data + endpoints — found: import endpoint and XML details — used: yes (confirms inputs/flow).
- `/Users/gil/Documents/email-cleaner/rails-assessment/ORDEN_DE_LECTURA.md` — read: reading order — found: navigation flow — used: no (process only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PLAN_Y_ESTRATEGIA.md` — read: phases — found: import phase in plan — used: no (planning, not story).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PROCESO_DE_ENTREGA.md` — read: delivery steps — found: operational delivery steps — used: no (delivery only).
- `/Users/gil/Documents/email-cleaner/rails-assessment/PRODUCT_SPEC.md` — read: product-level view — found: import feature listed — used: no (derived, not primary requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/README.md` — read: general rules — found: commit/mention rules — used: no (not import requirement).
- `/Users/gil/Documents/email-cleaner/rails-assessment/scrum.md` — read: scrum theory + story format — found: story syntax and criteria principles — used: yes (structure and quality).
- `/Users/gil/Documents/email-cleaner/rails-assessment/WORKLOG.md` — read: activity log — found: previous work steps — used: no (history only).
