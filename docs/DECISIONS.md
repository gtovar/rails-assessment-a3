# Decisions

## D1 — Invoice validations scope (minimal, assessment-safe)

**Decision**  
Use minimal validations for the Invoice model: presence + uniqueness on key fields, simple status enum, currency length 3, and amount_cents >= 0.

**Rationale**  
- The XML and README define these fields as required inputs.
- Overly strict validation (RFC regex, strict date rules) can break sample ZIP imports.
- The assessment prioritizes core functionality and clarity over full SAT compliance.

**Scope**  
Model-level validations only.

**Implications**  
- Import is resilient to variations in sample data.
- Data consistency is still enforced for required fields.

**Status**  
Accepted.

## D2 — CI/CD strategy (simple GitHub Actions + Heroku)

**Decision**  
Use GitHub Actions for CI (tests + rubocop) on `develop`/`main` and Heroku deploy on `main`.

**Rationale**  
- Keeps pipeline simple and aligned with assessment scope.
- CI enforces basic quality gates before merge.
- CD only from `main` matches the stable branch rule.

**Scope**  
CI: `.github/workflows/ci.yml`  
CD: `.github/workflows/deploy.yml`

**Implications**  
- Requires Heroku secrets in GitHub Actions.
- CI will fail if tests or rubocop fail.

**Status**  
Accepted.
