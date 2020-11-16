class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :score, presence: true
end
