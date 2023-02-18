class DeletePictureInArt < ActiveRecord::Migration[7.0]
  def change
    remove_column :arts, :picture
  end
end
