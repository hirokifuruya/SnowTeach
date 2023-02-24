FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
    role_id { 1 }

    trait :instructor do
      role_id { 2 }
    end

    trait :general do
      role_id { 3 }
    end
  end
end


