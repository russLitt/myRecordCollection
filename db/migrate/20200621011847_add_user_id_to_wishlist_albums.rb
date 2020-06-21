class AddUserIdToWishlistAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :wishlist_albums, :user_id, :integer
  end
end
