class Room < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :doctor, dependent: :destroy
  has_many :messages, dependent: :destroy
end
