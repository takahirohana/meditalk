class Doctor < ApplicationRecord
    has_many :room_user_doctors
    has_many :rooms, through: :room_user_doctors
    has_many :messages
end
