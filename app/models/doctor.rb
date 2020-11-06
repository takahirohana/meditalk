class Doctor < ApplicationRecord
    
    has_many :rooms
    has_many :messages

    validates :name, :area, :speciality, :word, presence: true
end
