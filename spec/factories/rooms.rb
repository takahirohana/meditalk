FactoryBot.define do
  factory :room do
  association :user
  association :doctor
  end
end