class Symptom < ApplicationRecord
  belongs_to :user, optional:true
  has_many :messages

  with_options presence: true do
    validates :cc
    validates :from_when
    validates :where
    validates :situation
    validates :ph
    validates :allergies
    validates :medicine
  end
end
