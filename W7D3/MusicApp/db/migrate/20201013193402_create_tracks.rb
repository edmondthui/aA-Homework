class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :album_id, null: false
      t.string :ord, null: false
      t.text :lyrics 
      t.boolean :bonus, null: false
    end
  end
end
