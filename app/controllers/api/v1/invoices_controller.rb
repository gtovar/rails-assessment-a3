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
        status = params[:status]
        return invalid_status_response if invalid_status?(status)

        amount_min, amount_max = parsed_amount_range
        return invalid_amount_response if invalid_amount?(amount_min, amount_max)

        scope = filtered_scope(amount_min, amount_max)
        render json: paginated_payload(scope)
      end

      def create
        invoice = Invoice.new(invoice_params)

        if invoice.save
          render json: { data: InvoiceSerializer.call(invoice) }, status: :created
        else
          render json: { errors: invoice.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        invoice = Invoice.find(params[:id])
        render json: { data: InvoiceSerializer.call(invoice) }
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

      def filtered_scope(amount_min, amount_max)
        Invoice.all
               .by_status(params[:status])
               .by_emitter_rfc(params[:emitter_rfc])
               .by_receiver_rfc(params[:receiver_rfc])
               .by_amount_range(amount_min, amount_max)
      end

      def invalid_status?(status)
        status.present? && !Invoice.statuses.key?(status)
      end

      def invalid_status_response
        render json: { errors: ['Status is invalid'] }, status: :unprocessable_entity
      end

      def parsed_amount_range
        [
          parse_integer_param(params[:amount_min]),
          parse_integer_param(params[:amount_max])
        ]
      end

      def paginated_payload(scope)
        total = scope.count
        page, per_page = pagination_params
        scope = paginate(scope)

        {
          data: serialize_collection(scope),
          meta: { page:, per_page:, total: }
        }
      end

      def parse_integer_param(value)
        return nil if value.blank?

        Integer(value)
      rescue ArgumentError, TypeError
        :invalid
      end

      def invalid_amount?(amount_min, amount_max)
        amount_min == :invalid || amount_max == :invalid
      end

      def invalid_amount_response
        render json: { errors: ['Amount range is invalid'] }, status: :unprocessable_entity
      end
    end
  end
end
