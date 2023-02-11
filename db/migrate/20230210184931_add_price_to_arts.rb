class AddPriceToArts < ActiveRecord::Migration[7.0]
  def change
    add_column :arts, :price, :float
  end
end
