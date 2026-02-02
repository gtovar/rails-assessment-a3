# frozen_string_literal: true

require "rails_helper"

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it "is valid with required attributes" do
      invoice = build(:invoice)
      expect(invoice).to be_valid
    end

    it "requires invoice_uuid" do
      invoice = build(:invoice, invoice_uuid: nil)
      expect(invoice).not_to be_valid
    end

    it "requires unique invoice_uuid" do
      create(:invoice, invoice_uuid: "11111111-1111-1111-1111-111111111111")
      dup = build(:invoice, invoice_uuid: "11111111-1111-1111-1111-111111111111")
      expect(dup).not_to be_valid
    end

    it "requires amount_cents to be non-negative integer" do
      invoice = build(:invoice, amount_cents: -1)
      expect(invoice).not_to be_valid
    end

    it "requires amount_currency length 3" do
      invoice = build(:invoice, amount_currency: "MX")
      expect(invoice).not_to be_valid
    end

    it "requires status in allowed list" do
      expect { build(:invoice, status: "unknown") }.to raise_error(ArgumentError)
    end
  end
end
