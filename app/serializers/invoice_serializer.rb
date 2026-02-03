# frozen_string_literal: true

class InvoiceSerializer
  class << self
    def call(invoice)
      base_attributes(invoice)
        .merge(emitter_attributes(invoice))
        .merge(receiver_attributes(invoice))
        .merge(amount_attributes(invoice))
        .merge(timestamps(invoice))
    end

    private

    def base_attributes(invoice)
      {
        id: invoice.id,
        invoice_uuid: invoice.invoice_uuid,
        status: invoice.status,
        emitted_at: invoice.emitted_at,
        expires_at: invoice.expires_at,
        signed_at: invoice.signed_at,
        cfdi_digital_stamp: invoice.cfdi_digital_stamp
      }
    end

    def emitter_attributes(invoice)
      { emitter: { name: invoice.emitter_name, rfc: invoice.emitter_rfc } }
    end

    def receiver_attributes(invoice)
      { receiver: { name: invoice.receiver_name, rfc: invoice.receiver_rfc } }
    end

    def amount_attributes(invoice)
      { amount: { cents: invoice.amount_cents, currency: invoice.amount_currency } }
    end

    def timestamps(invoice)
      { created_at: invoice.created_at, updated_at: invoice.updated_at }
    end
  end
end
