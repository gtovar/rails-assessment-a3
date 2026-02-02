# Testing

## Run tests

```bash
bundle exec rails db:create RAILS_ENV=test
bundle exec rails db:migrate RAILS_ENV=test
bundle exec rspec
```

## Scope
- Model specs for validations and scopes
- Request specs for CRUD, filters, import, QR
