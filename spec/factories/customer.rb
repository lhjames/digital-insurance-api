# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "utilisateur-#{n}@exemple.com"
  end

  factory :customer do
    email
    password { 'mon_mot_de_passe1a-' }
  end
end
