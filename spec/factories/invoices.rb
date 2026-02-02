FactoryBot.define do
  factory :invoice do
    invoice_uuid { SecureRandom.uuid }
    status { "active" }
    emitter_name { "ACME SA" }
    emitter_rfc { "XAXX010101000" }
    receiver_name { "Gil Tovar" }
    receiver_rfc { "XEXX010101000" }
    amount_cents { 125_000 }
    amount_currency { "MXN" }
    emitted_at { Date.current }
    expires_at { Date.current + 30 }
    signed_at { Date.current }
    cfdi_digital_stamp { "abc123" }
  end
end
