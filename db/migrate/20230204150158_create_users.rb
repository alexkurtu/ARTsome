class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :address
      t.text :bio

      t.timestamps
    end
  end
end
