# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Invoices API', type: :request do
  let(:api_token) { 'test-token' }

  before do
    allow(ENV).to receive(:fetch).and_call_original
    allow(ENV).to receive(:fetch).with('API_TOKEN', nil).and_return(api_token)
  end

  path '/api/v1/invoices' do
    post 'Create invoice' do
      tags 'Invoices'
      consumes 'application/json'
      produces 'application/json'
      security [{ bearerAuth: [] }]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer token'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          invoice: {
            type: :object,
            properties: {
              invoice_uuid: { type: :string, format: :uuid },
              status: { type: :string },
              emitter_name: { type: :string },
              emitter_rfc: { type: :string },
              receiver_name: { type: :string },
              receiver_rfc: { type: :string },
              amount_cents: { type: :integer },
              amount_currency: { type: :string },
              emitted_at: { type: :string, format: :date },
              expires_at: { type: :string, format: :date },
              signed_at: { type: :string, format: :date },
              cfdi_digital_stamp: { type: :string }
            },
            required: %i[
              invoice_uuid
              status
              emitter_name
              emitter_rfc
              receiver_name
              receiver_rfc
              amount_cents
              amount_currency
              emitted_at
            ]
          }
        },
        required: [:invoice]
      }

      response '201', 'created' do
        let(:Authorization) { "Bearer #{api_token}" }
        let(:payload) do
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

        run_test!
      end

      response '401', 'unauthorized' do
        let(:Authorization) { nil }
        let(:payload) { { invoice: { invoice_uuid: SecureRandom.uuid } } }

        run_test!
      end

      response '422', 'validation errors' do
        let(:Authorization) { "Bearer #{api_token}" }
        let(:payload) { { invoice: { invoice_uuid: nil } } }

        run_test!
      end
    end

    get 'List invoices' do
      tags 'Invoices'
      produces 'application/json'
      security [{ bearerAuth: [] }]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer token'
      parameter name: :page, in: :query, type: :integer, required: false
      parameter name: :per_page, in: :query, type: :integer, required: false

      response '200', 'ok' do
        let(:Authorization) { "Bearer #{api_token}" }

        before { create(:invoice) }

        run_test!
      end

      response '401', 'unauthorized' do
        let(:Authorization) { nil }

        run_test!
      end
    end
  end

  path '/api/v1/invoices/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true

    get 'Show invoice' do
      tags 'Invoices'
      produces 'application/json'
      security [{ bearerAuth: [] }]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer token'

      response '200', 'ok' do
        let(:Authorization) { "Bearer #{api_token}" }
        let(:id) { create(:invoice).id }

        run_test!
      end

      response '401', 'unauthorized' do
        let(:Authorization) { nil }
        let(:id) { create(:invoice).id }

        run_test!
      end
    end

    patch 'Update invoice' do
      tags 'Invoices'
      consumes 'application/json'
      produces 'application/json'
      security [{ bearerAuth: [] }]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer token'
      parameter name: :payload, in: :body, schema: {
        type: :object,
        properties: {
          invoice: {
            type: :object,
            properties: {
              status: { type: :string }
            }
          }
        }
      }

      response '200', 'ok' do
        let(:Authorization) { "Bearer #{api_token}" }
        let(:id) { create(:invoice).id }
        let(:payload) { { invoice: { status: 'cancelled' } } }

        run_test!
      end

      response '401', 'unauthorized' do
        let(:Authorization) { nil }
        let(:id) { create(:invoice).id }
        let(:payload) { { invoice: { status: 'cancelled' } } }

        run_test!
      end

      response '422', 'validation errors' do
        let(:Authorization) { "Bearer #{api_token}" }
        let(:id) { create(:invoice).id }
        let(:payload) { { invoice: { amount_cents: -1 } } }

        run_test!
      end
    end

    delete 'Delete invoice' do
      tags 'Invoices'
      security [{ bearerAuth: [] }]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer token'

      response '204', 'no content' do
        let(:Authorization) { "Bearer #{api_token}" }
        let(:id) { create(:invoice).id }

        run_test!
      end

      response '401', 'unauthorized' do
        let(:Authorization) { nil }
        let(:id) { create(:invoice).id }

        run_test!
      end
    end
  end
end
