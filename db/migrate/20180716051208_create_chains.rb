class CreateChains < ActiveRecord::Migration[5.2]
  def change
    create_table :chains do |t|
      t.text :name
      t.integer :numbooks

      t.timestamps
    end
  end
end
