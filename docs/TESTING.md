# Testing

## Run tests

```bash
bundle exec rails db:create RAILS_ENV=test
bundle exec rails db:migrate RAILS_ENV=test
bundle exec rspec
```

## Targeted (filters)

```bash
bundle exec rspec spec/requests/invoices_spec.rb
bundle exec rspec spec/models/invoice_spec.rb
```

## Scope
- Model specs for validations and scopes
- Request specs for CRUD, filters, import, QR
