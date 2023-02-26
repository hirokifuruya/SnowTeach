FactoryBot.define do
  factory :admin, class: Role do
    name { 'admin' }
  end

  factory :instructor, class: Role do
    name { 'instructor' }
  end

  factory :general, class: Role do
    name { 'general' }
  end
end


