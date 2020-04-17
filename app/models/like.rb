class Like < ApplicationRecord
  belongs_to :recruit_player
  belongs_to :user
  
  validates_uniqueness_of :recruit_player_id, scope: :user_id
end
