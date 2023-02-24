FactoryBot.define do
  factory :role do
    name { 'admin' }
    id { 1 }

    trait :instructor do
      name { 'instructor' }
      id { 2 }
    end

    trait :general do
      name { 'general' }
      id { 3 }
    end
  end
end

