FactoryBot.define do
  factory :admin_user, class: User do
    name { "古谷"}
    email { "admin@dive.com" }
    password { "123456" }
    password_confirmation { "123456" }
    role { association :admin }
  end

  factory :instructor_user, class: User do
    name { "宮澤"}
    email { "user1@dive.com" }
    password { "222222" }
    password_confirmation { "222222" }
    role { association :instructor }
  end

    factory :instructor_user2, class: User do
      name { "箱崎"}
      email { "user11@dive.com" }
      password { "222222" }
      password_confirmation { "222222" }
      role { association :instructor }
    end

  factory :general_user, class: User do
    name { "鶴田" }
    email { "user2@dive.com" }
    password { "333333" }
    password_confirmation { "333333" }
    role { association :general }
  end
end


