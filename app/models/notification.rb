class Notification < ApplicationRecord
  default_scope -> { order("created_at DESC") }
  belongs_to :recruit_player, optional: true
  belongs_to :players_comment, optional: true
  belongs_to :room, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
