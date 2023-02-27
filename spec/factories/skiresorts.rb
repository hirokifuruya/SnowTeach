FactoryBot.define do
  factory :kagura, class: Skiresort do
    name { 'かぐらスキー場' }
    address { '新潟県南魚沼郡湯沢町三俣742' }
  end

  factory :naeba, class: Skiresort do
    name { '苗場スキー場' }
    address { '新潟県南魚沼郡湯沢町三国山108-1' }
  end
end

