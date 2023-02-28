# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#<roleデータ>
Role.create!(name: "管理者") unless Role.exists?(name: "管理者")
Role.create!(name: "インストラクター") unless Role.exists?(name: "インストラクター")
Role.create!(name: "一般ユーザー") unless Role.exists?(name: "一般ユーザー")



#<userデータ>
User.create!(
  [
    {name: '古谷 啓起', email: 'furuya@gmail.com', password: 'furuya@gmail.com', role_id: 1},
    {name: '平野 歩夢', email: 'instructor1@gmail.com', password: 'instructor1@gmail.com', role_id: 2},
    {name: '高橋 和載', email: 'instructor2@gmail.com', password: 'instructor2@gmail.com', role_id: 2},
    {name: '坂本 和樹', email: 'instructor3@gmail.com', password: 'instructor3@gmail.com', role_id: 2},
    {name: '箱崎 ふみあき', email: 'instructor4@gmail.com', password: 'instructor4@gmail.com', role_id: 2},
    {name: '鶴田 健', email: 'instructor5@gmail.com', password: 'instructor5@gmail.com', role_id: 2},
    {name: '田中 舞', email: 'general1@gmail.com', password: 'general1@gmail.com', role_id: 3},
    {name: '鈴木 広斗', email: 'general2@gmail.com', password: 'general2@gmail.com', role_id: 3}
  ].reject { |user| User.exists?(email: user[:email]) }
    )

#<skirosortデータ>
Skiresort.find_or_create_by(id: 1) do |s|
  s.name = 'かぐらスキー場'
  s.address = '新潟県南魚沼郡湯沢町三俣742'
end

Skiresort.find_or_create_by(id: 2) do |s|
  s.name = 'GALA湯沢スキー場'
  s.address = '新潟県南魚沼郡湯沢町大字湯沢字茅平1039-2'
end

Skiresort.find_or_create_by(id: 3) do |s|
  s.name = 'ルスツリゾート'
  s.address = '北海道虻田郡留寿都村字泉川13'
end

Skiresort.find_or_create_by(id: 4) do |s|
  s.name = 'ニセコ東急 グラン・ヒラフ'
  s.address = '北海道虻田郡倶知安町ニセコひらふ1条2丁目9番1号'
end

Skiresort.find_or_create_by(id: 5) do |s|
  s.name = 'グランデコスノーリゾート'
  s.address = '福島県耶麻郡北塩原村大字桧原字荒砂沢山1082番93'
end



#<labelデータ>
    Label.find_or_create_by(id: 1, name: '初心者' )
    Label.find_or_create_by(id: 2, name: '中級者' )
    Label.find_or_create_by(id: 3, name: '上級者' )
    Label.find_or_create_by(id: 4, name: 'グラトリ' )
    Label.find_or_create_by(id: 5, name: 'キッカー' )
    Label.find_or_create_by(id: 6, name: 'ハーフパイプ' )
    Label.find_or_create_by(id: 7, name: 'カービング' )
    Label.find_or_create_by(id: 8, name: 'スロープスタイル' )
    Label.find_or_create_by(id: 9, name: 'スノーボードクロス' )
    Label.find_or_create_by(id: 10, name: 'ジャイアントスラローム' )
    Label.find_or_create_by(id: 11, name: 'スーパージャイアントスラローム' )
    Label.find_or_create_by(id: 12, name: 'スラローム' )
    Label.find_or_create_by(id: 13, name: 'デュアルスラローム' )
    Label.find_or_create_by(id: 14, name: '小学生' )
    Label.find_or_create_by(id: 15, name: '中学生' )
    Label.find_or_create_by(id: 16, name: '高校生' )

#<recruitデータ>
Recruit.find_or_create_by(
  name: '平野 歩夢',
  money: '100,000円',
  detail: 'オリンピック金メダリスト',
  start_day: '2023/2/25',
  end_day: '2023/3/4',
  skiresort_id: 1,
  user_id: 2
).labels << Label.find_by(name: '初心者')

Recruit.find_or_create_by(
  name: '高橋 和載',
  money: '15,000円',
  detail: 'スノーボード歴5年,優しく教えます。',
  start_day: '2023/2/28',
  end_day: '2023/3/6',
  skiresort_id: 4,
  user_id: 3
).labels << Label.find_by(name: 'カービング')

Recruit.find_or_create_by(
  name: '坂本 和樹',
  money: '30,000円',
  detail: '真面目に教えますよ。',
  start_day: '2023/3/5',
  end_day: '2023/3/8',
  skiresort_id: 5,
  user_id: 4
).labels << Label.find_by(name: 'キッカー')

Recruit.find_or_create_by(
  name: '箱崎 ふみあき',
  money: '20,000円',
  detail: 'スノボ歴10年、優しいオーラ全開',
  start_day: '2023/2/25',
  end_day: '2023/3/3',
  skiresort_id: 3,
  user_id: 5
).labels << Label.find_by(name: 'スーパージャイアントスラローム')

Recruit.find_or_create_by(
  name: '鶴田 健',
  money: '50,000円',
  detail: 'スノボ歴15年、的確に教えます。',
  start_day: '2023/3/4',
  end_day: '2023/3/10',
  skiresort_id: 2,
  user_id: 6
).labels << Label.find_by(name: '上級者')

