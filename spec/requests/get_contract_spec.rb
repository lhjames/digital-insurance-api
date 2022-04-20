# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contracts', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:contract, 2)
      get '/api/v1/contracts'
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
