class PlayersComment < ApplicationRecord
  belongs_to :user
  belongs_to :recruit_player
  has_many :notifications, dependent: :destroy
end
