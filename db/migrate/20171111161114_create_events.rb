class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :subject
      t.string :place_address
      t.string :place_name
      t.datetime :starting_at
      t.integer :owner_id, index: true
      t.integer :topic_id, index: true

      t.timestamps
    end
  end
end
