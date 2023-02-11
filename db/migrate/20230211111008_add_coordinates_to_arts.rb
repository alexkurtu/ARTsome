class AddCoordinatesToArts < ActiveRecord::Migration[7.0]
  def change
    add_column :arts, :latitude, :float
    add_column :arts, :longitude, :float
  end
end
