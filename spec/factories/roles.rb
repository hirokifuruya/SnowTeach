FactoryBot.define do
  factory :admin, class: Role do
    name { '管理者' }
  end

  factory :instructor, class: Role do
    name { 'インストラクター' }
  end

  factory :general, class: Role do
    name { '一般ユーザー' }
  end
end


