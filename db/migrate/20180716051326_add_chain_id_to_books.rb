class AddChainIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :chain_id, :integer
  end
end
