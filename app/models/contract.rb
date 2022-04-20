# frozen_string_literal: true

require 'aasm'

class Contract < ApplicationRecord
  include AASM

  has_many :customers
  has_many :options

  validates :start_date, presence: true
  validates :end_date, presence: true

  aasm do
    state :pending, initial: true
    state :active, :finished

    event :terminate do
      transitions from: :active, to: :finished
    end

    event :start do
      transitions from: :pending, to: :active
    end
  end
end
