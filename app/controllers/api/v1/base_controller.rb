# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_api_token!

      private

      def authenticate_api_token!
        expected = ENV.fetch('API_TOKEN', nil)
        token = request.authorization&.split&.last
        return head :unauthorized if expected.blank? || token != expected
      end

      def pagination_params
        page = params[:page].to_i
        per_page = params[:per_page].to_i
        page = 1 if page <= 0
        per_page = 20 if per_page <= 0
        per_page = 100 if per_page > 100
        [page, per_page]
      end

      def paginate(scope)
        page, per_page = pagination_params
        scope.offset((page - 1) * per_page).limit(per_page)
      end

      def serialize_collection(scope)
        scope.map { |invoice| InvoiceSerializer.call(invoice) }
      end
    end
  end
end
