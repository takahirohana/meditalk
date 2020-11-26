FactoryBot.define do
  factory :doctor do
    name       { Gimei.last.kanji }
    area       { '東京都渋谷区' }
    speciality { '膝部' }
    word       { '患者さんにあった治療法を選択していきたいです' }
    email      { Faker::Internet.free_email }
    password              { '123456asd' }
    password_confirmation { password }
  end
end
