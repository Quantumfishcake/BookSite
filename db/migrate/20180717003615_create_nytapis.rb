class CreateNytapis < ActiveRecord::Migration[5.2]
  def change
    create_table :nytapis do |t|

      t.timestamps
    end
  end
end
