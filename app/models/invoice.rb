# frozen_string_literal: true

class Invoice < ApplicationRecord
  enum status: {
    active: 'active',
    cancelled: 'cancelled',
    paid: 'paid'
  }

  validates :invoice_uuid, presence: true, uniqueness: true
  validates :status, presence: true
  validates :emitter_name, presence: true
  validates :emitter_rfc, presence: true
  validates :receiver_name, presence: true
  validates :receiver_rfc, presence: true
  validates :amount_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :amount_currency, presence: true, length: { is: 3 }
  validates :emitted_at, presence: true
  validates :cfdi_digital_stamp, presence: true
end
