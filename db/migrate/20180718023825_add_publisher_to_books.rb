class AddPublisherToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :publisher, :text
  end
end
