class AddBookIdToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :book_id, :integer
  end
end
