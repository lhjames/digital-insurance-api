class Contract < ApplicationRecord
  has_many :customers
  has_many :options, presence: true
end
