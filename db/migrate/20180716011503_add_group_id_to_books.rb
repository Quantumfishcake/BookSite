class AddGroupIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :group_id, :integer
  end
end
