class AddNotesToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :notes, :text
  end
end
