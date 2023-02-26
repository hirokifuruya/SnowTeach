FactoryBot.define do
  factory :recruit do
    name { "テスト投稿" }
    money { "10000円" }
    detail { "テスト投稿の詳細" }
    start_day { Date.today + 1 }
    end_day { Date.today + 2 }
    skiresort { association :kagura }
  end
end

