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
