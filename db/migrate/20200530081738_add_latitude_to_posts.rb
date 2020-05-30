class AddLatitudeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :latitude, :decimal, :precision => 9, :scale => 6
    add_column :posts, :longitude, :decimal, :precision => 9, :scale => 6
  end
end
