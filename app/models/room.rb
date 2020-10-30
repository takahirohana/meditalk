class Room < ApplicationRecord
  has_many :room_user_doctors
  has_many :users, through: :room_users, dependent: :destroy
  has_many :doctors, through: :room_user_doctors
  has_many :messages, dependent: :destroy

  validates :room_name, presence: true
end