class CreatePlayersComments < ActiveRecord::Migration[5.2]
  def change
    create_table :players_comments do |t|
      t.integer :user_id
      t.integer :recruit_player_id
      t.text :text
      t.timestamps
    end
  end
end
