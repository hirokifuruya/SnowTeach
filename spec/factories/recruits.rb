FactoryBot.define do
  factory :recruit do
    association :skiresort
    association :user
    name { Faker::Lorem.word }
    detail { Faker::Lorem.sentence }
  end
end
