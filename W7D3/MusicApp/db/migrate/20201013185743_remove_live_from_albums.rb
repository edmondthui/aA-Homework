class RemoveLiveFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :live
  end
end
