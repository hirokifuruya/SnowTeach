FactoryBot.define do
  factory :recruit do
    name { "テスト投稿" }
    money { "10000円" }
    detail { "テスト投稿の詳細" }
    start_day { Date.today + 1 }
    end_day { Date.today + 2 }
    association :user, factory: :instructor_user
    association :skiresort, factory: :naeba
  end

    factory :recruit_1, class: Recruit do
      name { "テスト投稿1" }
      money { "10000円" }
      detail { "テスト投稿1の詳細" }
      start_day { Date.today + 1 }
      end_day { Date.today + 2 }
      association :user, factory: :instructor_user2
      association :skiresort, factory: :naeba
    end
end
