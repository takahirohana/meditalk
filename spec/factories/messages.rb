FactoryBot.define do
  factory :message do
    content { Faker::Lorem.sentence}
    association :room
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/no-image.png'), filename: 'no-image.png')
    end
  end
end
