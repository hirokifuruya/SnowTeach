FactoryBot.define do
  factory :user, class: User do
    email { "admin@dive.com" }
    password { "123456" }
    password_confirmation { "123456" }
    role_id { 1 }
  end

  factory :instructor1, class: User do
    email { "user1@dive.com" }
    password { "222222" }
    password_confirmation { "222222" }
    role_id { 2 }
  end

  factory :general1, class: User do
    email { "user2@dive.com" }
    password { "333333" }
    password_confirmation { "333333" }
    role_id { 2 }
  end
end


