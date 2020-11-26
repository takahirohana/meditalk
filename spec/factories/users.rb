FactoryBot.define do
  factory :user do
    nickname              { Gimei.last.kanji }
    email                 { Faker::Internet.free_email }
    password              { '123456asd' }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    age                   { 23 }
  end
end
