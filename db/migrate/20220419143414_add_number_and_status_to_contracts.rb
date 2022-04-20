class AddNumberAndStatusToContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :contract_id, :bigint
    add_column :contracts, :aasm_state, :string
  end
end
