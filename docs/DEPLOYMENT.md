# Deployment (Heroku)

This project supports a simple Heroku deploy for the "bonus" requirement.

## 1) Prerequisites
- Heroku CLI installed
- A Heroku account
- GitHub repo with Actions enabled

## 2) Create the app
```
heroku create rails-assessment-a3-gtovar
```

Verify:
```
heroku apps:info -a rails-assessment-a3-gtovar
```

## 3) Configure GitHub Actions secrets
In GitHub repo settings:

- `HEROKU_API_KEY`
- `HEROKU_APP_NAME` = `rails-assessment-a3-gtovar`
- `HEROKU_EMAIL`

API key:
```
heroku auth:token
```

## 4) Optional: set Ruby buildpack
```
heroku buildpacks:set heroku/ruby -a rails-assessment-a3-gtovar
```

## 5) Deploy
Push to `main` to trigger the workflow:
```
git push origin main
```

Manual trigger:
GitHub Actions -> "Deploy (Heroku)" -> Run workflow.

## 6) Heroku config vars (minimum)
These depend on how the app is configured:

- `DATABASE_URL` is provided automatically when the Heroku Postgres add-on is created.
- If you use encrypted credentials, set `RAILS_MASTER_KEY`.
- If you require an API token for requests, set `API_TOKEN`.

## 7) Notes from local deploy verification
Local deploy via `act` succeeded, with these warnings from Heroku:

- Puma 5.6.4 is below Heroku's recommended 7.0.3+.
- Ruby 3.1.0 is EOL; consider upgrading to 3.1.7 or 3.3.x.
- No Procfile detected (default web server is used).
- "Detecting rails configuration failed" warning (did not block deploy).

## 8) Procfile
A minimal Procfile is included to declare the web process explicitly:
```
web: bundle exec puma -C config/puma.rb
```
