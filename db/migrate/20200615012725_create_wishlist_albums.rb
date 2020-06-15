class CreateWishlistAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlist_albums do |t|
      t.string :artist
      t.string :album_title

      t.timestamps
    end
  end
end
