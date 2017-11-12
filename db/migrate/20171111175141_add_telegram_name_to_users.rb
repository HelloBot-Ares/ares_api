class AddTelegramNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :telegram_id, :string
  end
end
