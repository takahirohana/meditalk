class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms
  # has_many :messages
  has_many :ratings, dependent: :destroy
  has_one_attached :avatar

  with_options presence: true do
    validates :name
    validates :area
    validates :speciality
    validates :word
    validates :email, uniqueness: { case_sensitive: false }
    validates :email, format: { with: /@.+/ }
  end

  def avg_score
    if ratings.empty?
      0.0
    else
      ratings.average(:score).round(2).to_f
    end
  end

  def rating_score_percentage
    if ratings.empty?
      0.0
    else
      ratings.average(:score).round(2).to_f * 100 / 5
    end
  end
end
