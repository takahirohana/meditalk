class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages

  validates :room_name, presence: true
end