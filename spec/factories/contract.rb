FactoryBot.define do
  factory :contract do
    customer
    contract_id { 1 }
    start_date { DateTime.new(2022, 6, 22) }
    end_date { DateTime.new(2025, 6, 20) }
    aasm_state { 'pending' }
  end
end