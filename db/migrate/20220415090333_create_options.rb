class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :name
      t.text :description
      t.references :contract

      t.timestamps
    end
  end
end
