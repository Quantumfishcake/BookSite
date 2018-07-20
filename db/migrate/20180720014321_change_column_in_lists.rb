class ChangeColumnInLists < ActiveRecord::Migration[5.2]
  def change
    change_column :lists, :user_id, :integer, array: false
  end
end
