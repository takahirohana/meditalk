class RoomUserDoctor < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :doctor
end