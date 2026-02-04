# frozen_string_literal: true

class Invoice < ApplicationRecord
  enum status: {
    active: 'active',
    cancelled: 'cancelled',
    paid: 'paid'
  }

  scope :by_status, ->(status) { status.present? ? where(status:) : all }
  scope :by_emitter_rfc, ->(rfc) { rfc.present? ? where(emitter_rfc: rfc) : all }
  scope :by_receiver_rfc, ->(rfc) { rfc.present? ? where(receiver_rfc: rfc) : all }
  scope :by_amount_range, ->(min, max) { amount_range_scope(min, max) }

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

  def self.amount_range_scope(min, max)
    scope = self
    scope = scope.where('amount_cents >= ?', min) if min.present?
    scope = scope.where('amount_cents <= ?', max) if max.present?
    scope
  end
end
