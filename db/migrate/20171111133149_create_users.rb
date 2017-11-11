class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
