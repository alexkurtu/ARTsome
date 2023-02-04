class CreateArts < ActiveRecord::Migration[7.0]
  def change
    create_table :arts do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :picture
      t.string :artist
      t.integer :year
      t.string :current_location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
