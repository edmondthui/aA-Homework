class EditTrack < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :bonus
    add_column :tracks, :bonus, :boolean, default: false
  end
end
