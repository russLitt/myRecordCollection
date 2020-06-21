class RemoveUserIdFromWishlistAlbums < ActiveRecord::Migration[6.0]
  def change
    remove_column :wishlist_albums, :user_id, :string
    remove_column :wishlist_albums, :integer, :string
  end
end
