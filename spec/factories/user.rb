FactoryBot.define do
  factory :user do
    email
    role { 'admin' }
    password { 'mon_mot_de_passe1a-' }
  end
end