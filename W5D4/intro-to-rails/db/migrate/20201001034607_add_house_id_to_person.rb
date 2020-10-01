class AddHouseIdToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :house_id, :integer, null: false 
  end
end
