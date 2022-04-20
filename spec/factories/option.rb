FactoryBot.define do
  factory :option do
    contract
    contract_id { 1 }
    name { 'Assurance auto' }
    description { 'Assurance couvrant risques automobiles' }
  end
end