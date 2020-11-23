class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :rooms
    # has_many :messages
    has_many :ratings, dependent: :destroy
    has_one_attached :avatar

    validates :name, :area, :speciality, :word, presence: true

    def avg_score
        unless self.ratings.empty?
            ratings.average(:score).round(2).to_f
        else
            0.0
        end
    end
    def rating_score_percentage
        unless self.ratings.empty?
            ratings.average(:score).round(2).to_f*100/5
        else
            0.0
        end
    end
end
