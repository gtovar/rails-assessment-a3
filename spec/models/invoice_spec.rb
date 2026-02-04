# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it 'is valid with required attributes' do
      invoice = build(:invoice)
      expect(invoice).to be_valid
    end

    it 'requires invoice_uuid' do
      invoice = build(:invoice, invoice_uuid: nil)
      expect(invoice).not_to be_valid
    end

    it 'requires unique invoice_uuid' do
      create(:invoice, invoice_uuid: '11111111-1111-1111-1111-111111111111')
      dup = build(:invoice, invoice_uuid: '11111111-1111-1111-1111-111111111111')
      expect(dup).not_to be_valid
    end

    it 'requires amount_cents to be non-negative integer' do
      invoice = build(:invoice, amount_cents: -1)
      expect(invoice).not_to be_valid
    end

    it 'requires amount_currency length 3' do
      invoice = build(:invoice, amount_currency: 'MX')
      expect(invoice).not_to be_valid
    end

    it 'requires status in allowed list' do
      expect { build(:invoice, status: 'unknown') }.to raise_error(ArgumentError)
    end
  end

  describe 'scopes' do
    it 'filters by status' do
      create(:invoice, status: 'active')
      paid = create(:invoice, status: 'paid')

      expect(described_class.by_status('paid')).to contain_exactly(paid)
    end

    it 'filters by emitter_rfc' do
      create(:invoice, emitter_rfc: 'AAA010101AAA')
      target = create(:invoice, emitter_rfc: 'BBB010101BBB')

      expect(described_class.by_emitter_rfc('BBB010101BBB')).to contain_exactly(target)
    end

    it 'filters by receiver_rfc' do
      create(:invoice, receiver_rfc: 'CCC010101CCC')
      target = create(:invoice, receiver_rfc: 'DDD010101DDD')

      expect(described_class.by_receiver_rfc('DDD010101DDD')).to contain_exactly(target)
    end

    it 'filters by amount range' do
      create(:invoice, amount_cents: 10_000)
      target = create(:invoice, amount_cents: 50_000)
      create(:invoice, amount_cents: 200_000)

      result = described_class.by_amount_range(20_000, 100_000)
      expect(result).to contain_exactly(target)
    end
  end
end
