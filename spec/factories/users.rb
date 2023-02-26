FactoryBot.define do
  factory :admin_user, class: User do
    email { "admin@dive.com" }
    password { "123456" }
    password_confirmation { "123456" }
    role { association :admin }
  end

  factory :instructor_user, class: User do
    email { "user1@dive.com" }
    password { "222222" }
    password_confirmation { "222222" }
    role { association :instructor }
  end

    factory :instructor_user2, class: User do
      email { "user11@dive.com" }
      password { "222222" }
      password_confirmation { "222222" }
      role { :instructor }
    end

  factory :general_user, class: User do
    email { "user2@dive.com" }
    password { "333333" }
    password_confirmation { "333333" }
    role { association :general }
  end
end


