class AddCategoryIdToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :category_id, :integer
  end
end
