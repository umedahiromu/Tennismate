class Room < ApplicationRecord
  has_many :entries
  has_many :direct_messages
  has_many :users, through: :entries
  
  has_many :notifications, dependent: :destroy
end
