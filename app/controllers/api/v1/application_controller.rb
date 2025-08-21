module Api
  module V1
    class ApplicationController < ActionController::API
      def health
        render json: { status: 'ok', version: 'v1' }
      end
    end
  end
end