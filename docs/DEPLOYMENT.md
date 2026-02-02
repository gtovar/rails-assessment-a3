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
