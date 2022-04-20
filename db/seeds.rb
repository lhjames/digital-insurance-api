# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seed starts…"
Contract.create!([
  {
    contract_id: 1,
    start_date: DateTime.new(2022, 6, 22),
    end_date: DateTime.new(2025, 6, 20),
    aasm_state: "pending"
  },
  {
    contract_id: 2,
    start_date: DateTime.new(2022, 6, 22),
    end_date: DateTime.new(2025, 6, 20),
    aasm_state: "pending"
  },
])
Option.create!([
  {
    name: "Assurance auto",
    description: "Assurance couvrant risques automobiles",
    contract_id: 1
  },
  {
    name: "Incendie",
    description: "Assurance couvrant risques incendie",
    contract_id: 1
  },
  {
    name: "Assurance tout risque",
    description: "Assurance couvrant tout risque",
    contract_id: 2
  },
  {
    name: "Cambriolage",
    description: "Assurance couvrant risques cambriolage et casse",
    contract_id: 2
  },
  {
    name: "Assurance location",
    description: "Assurance couvrant risques locations biens immobiliers",
    contract_id: 2
  }
])
puts "DB seeded!"