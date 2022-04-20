# frozen_string_literal: true

class AddCustomersToContracts < ActiveRecord::Migration[6.1]
  def change
    add_reference :contracts, :customer, index: true
  end
end
