class RemoveUserIdFromAlbums < ActiveRecord::Migration[6.0]
  def change
    remove_column :albums, :user_id, :string
    remove_column :albums, :integer, :string
  end
end
