class AddColumnToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :room_id, :string
    
    add_index :notifications, :room_id
  end
end
