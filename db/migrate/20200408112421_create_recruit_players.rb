class CreateRecruitPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_players do |t|
      t.integer :user_id
      t.text :text
      t.string :place
      t.integer :number
      t.datetime :start_time
      t.datetime :finish_time
      t.timestamps
    end
  end
end
