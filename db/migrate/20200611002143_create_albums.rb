class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :album_title
      t.integer :year_released
      t.string :genre

      t.timestamps
    end
  end
end
