FactoryBot.define do
  factory :admin, class: Role do
    name { 'admin' }
    id { 1 }
  end

  factory :instructor, class: Role do
    name { 'instructor' }
    id { 2 }
  end

  factory :general, class: Role do
    name { 'general' }
    id { 3 }
  end
end

