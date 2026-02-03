# frozen_string_literal: true

module Api
  module V1
    class InvoicesController < BaseController
      PERMITTED_PARAMS = %i[
        invoice_uuid
        status
        emitter_name
        emitter_rfc
        receiver_name
        receiver_rfc
        amount_cents
        amount_currency
        emitted_at
        expires_at
        signed_at
        cfdi_digital_stamp
      ].freeze

      def index
        scope = Invoice.all
        total = scope.count
        page, per_page = pagination_params
        scope = paginate(scope)

        render json: {
          data: serialize_collection(scope),
          meta: { page:, per_page:, total: }
        }
      end

      def create
        invoice = Invoice.new(invoice_params)

        if invoice.save
          render json: { data: InvoiceSerializer.call(invoice) }, status: :created
        else
          render json: { errors: invoice.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        invoice = Invoice.find(params[:id])

        if invoice.update(invoice_params)
          render json: { data: InvoiceSerializer.call(invoice) }
        else
          render json: { errors: invoice.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        invoice = Invoice.find(params[:id])
        invoice.destroy
        head :no_content
      end

      private

      def invoice_params
        params.require(:invoice).permit(*PERMITTED_PARAMS)
      end
    end
  end
end
