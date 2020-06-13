class AddGradeToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :grade, :string
  end
end
