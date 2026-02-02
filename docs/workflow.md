# Workflow

## Branching
- Base branch: `develop`
- Stable branch: `main` (updated from `develop` at checkpoints)
- Work branches: `type/short-desc` (example: `feat/invoices-crud`)
- No direct commits on `develop` or `main`; merge via branches.

## Commit conventions
Use Conventional Commits:

```
<type>: <short description>
```

Valid types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.

## Work cycle
1) Read assessment requirements
2) Implement feature in a small branch from `develop`
3) Add or update tests
4) Update docs if needed
5) Merge to `develop`
6) Promote to `main` at checkpoints

## Quality gates (minimum)
- Tests run and pass
- Rubocop passes (when applicable)
- Docs updated when behavior changes

## CI/CD
- CI: `.github/workflows/ci.yml` runs on push/PR to `develop` and `main`.
- CD (bonus): `.github/workflows/deploy.yml` deploys to Heroku on `main` (and manual trigger).
- Secrets required: `HEROKU_API_KEY`, `HEROKU_APP_NAME`, `HEROKU_EMAIL`.

## Deployment flow
1) Work on a feature branch
2) Open PR to `main`
3) Merge PR once CI is green
4) Deploy triggers automatically on `main` push
5) Validate the app and endpoints after deploy
