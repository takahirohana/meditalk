class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

    has_many :sns_credentials
    has_many :room_users
    has_many :rooms, through: :room_users

    NAME_REGEX_KANJI = /\A[ぁ-んァ-ン一-龥]+\z/
    NAME_REGEX_KANA = /\A[ァ-ン]+\z/

    with_options presence: true do
      validates :nickname
      validates :email, uniqueness:{ case_sensitive: false }
      validates :email, format: { with: /@.+/ }
        # validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
        # validates :encrypted_password, confirmation: true
        # validates :encrypted_password
      validates :last_name, format: { with: NAME_REGEX_KANJI }
      validates :first_name, format: { with: NAME_REGEX_KANJI }
      validates :last_name_kana, format: { with: NAME_REGEX_KANA }
      validates :first_name_kana, format: { with: NAME_REGEX_KANA }
      validates :birthday
    end

  

    def self.from_omniauth(auth)
      sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
      user = User.where(email: auth.info.email).first_or_initialize(
        nickname: auth.info.name,
        email: auth.info.email
      ) 

      # userが登録済みか判断
      if user.persisted?
        sns.user = user
        sns.save
      end
      { user: user, sns: sns }
    end
end
