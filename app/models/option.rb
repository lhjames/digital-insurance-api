class Option < ApplicationRecord
  belongs_to :contract, presence: true
end
