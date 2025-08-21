require 'rails_helper'

RSpec.describe 'Health Check', type: :request do
  describe 'GET /health' do
    it 'returns success status' do
      get '/health'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({ 'status' => 'ok' })
    end
  end
end
