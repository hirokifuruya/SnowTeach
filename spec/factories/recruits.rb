FactoryBot.define do
  factory :recruit do
    association :skiresort
    association :user, factory: :user, traits: [:instructor]
    name { Faker::Lorem.word }
    detail { Faker::Lorem.sentence }
  end
end

