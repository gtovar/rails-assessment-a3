# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Invoices API', type: :request do
  let(:api_token) { 'test-token' }
  let(:headers) { { 'Authorization' => "Bearer #{api_token}" } }

  let(:valid_payload) do
    {
      invoice: {
        invoice_uuid: SecureRandom.uuid,
        status: 'active',
        emitter_name: 'ACME SA',
        emitter_rfc: 'XAXX010101000',
        receiver_name: 'Gil Tovar',
        receiver_rfc: 'XEXX010101000',
        amount_cents: 125_000,
        amount_currency: 'MXN',
        emitted_at: Time.zone.today,
        expires_at: Time.zone.today + 30,
        signed_at: Time.zone.today,
        cfdi_digital_stamp: 'abc123'
      }
    }
  end

  before do
    allow(ENV).to receive(:fetch).and_call_original
    allow(ENV).to receive(:fetch).with('API_TOKEN', nil).and_return(api_token)
  end

  describe 'POST /api/v1/invoices' do
    it 'creates an invoice' do
      post '/api/v1/invoices', params: valid_payload, headers: headers
      expect(response).to have_http_status(:created)
    end

    it 'rejects without auth' do
      post '/api/v1/invoices', params: valid_payload
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns validation errors with 422' do
      invalid_payload = valid_payload.deep_merge(invoice: { invoice_uuid: nil })
      post '/api/v1/invoices', params: invalid_payload, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['errors']).to be_present
    end
  end

  describe 'GET /api/v1/invoices' do
    it 'lists invoices with pagination meta' do
      create(:invoice)
      get '/api/v1/invoices', headers: headers

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body['meta']).to include('page', 'per_page', 'total')
    end
  end

  describe 'PATCH /api/v1/invoices/:id' do
    it 'updates an invoice' do
      invoice = create(:invoice)
      patch "/api/v1/invoices/#{invoice.id}",
            params: { invoice: { status: 'cancelled' } },
            headers: headers
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /api/v1/invoices/:id' do
    it 'deletes an invoice' do
      invoice = create(:invoice)
      delete "/api/v1/invoices/#{invoice.id}", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
