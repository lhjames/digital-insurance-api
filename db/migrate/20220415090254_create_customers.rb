# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
