require 'rails_helper'
require 'support/api_helpers'
require 'support/controller_helpers'

RSpec.describe 'Contracts', type: :request do
  describe 'POST /create' do
    context 'when creating a contract with valid parameters' do
      let!(:admin) { FactoryBot.create(:user, role: 'admin') }
      let!(:my_contract) { FactoryBot.create(:contract) }
      let(:customer) { FactoryBot.create(:customer)}

      before { login_as(admin) }

      before do
        post '/api/v1/contracts', params:
                          { post: {
                            customer: customer,
                            contract_id: my_contract.contract_id,
                            start_date: my_contract.start_date,
                            end_date: my_contract.end_date,
                            aasm_state: my_contract.aasm_state
                          } }
      end

      it 'returns the correct params' do
        expect(json(response.body)['customer']).to eq(my_contract.customer)
        expect(json(response.body)['start_date']).to eq(my_contract.start_date)
        expect(json(response.body)['end_date']).to eq(my_contract.end_date)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end