# Rails Assessment A3 — Starter

Rails API-only starter scaffold for the A3 assessment.

## Current state
- Rails 6.1 app scaffold (no business features implemented yet)
- Documentation in `docs/`
- CI workflow in `.github/workflows/ci.yml`
- Heroku deploy workflow in `.github/workflows/deploy.yml`

## Requirements
- Ruby 3.1.0
- PostgreSQL (>= 9.3)

## Setup
```bash
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
```

## Documentation
- Index: `docs/index.md`

## License
Private (assessment use only).
