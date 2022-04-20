class Customer < ApplicationRecord
  validates :email, presence: true
  has_many :contracts
end
