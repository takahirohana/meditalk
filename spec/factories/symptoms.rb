FactoryBot.define do
  factory :symptom do
    cc        { Faker::Lorem.sentence }
    from_when { Faker::Lorem.sentence }
    where     { Faker::Lorem.sentence }
    situation { Faker::Lorem.sentence }
    ph        { Faker::Lorem.sentence }
    allergies { Faker::Lorem.sentence }
    medicine  { Faker::Lorem.sentence }
    association :user
  end
end
