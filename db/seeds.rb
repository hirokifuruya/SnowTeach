# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#<roleデータ>
Role.create!(name: "admin") unless Role.exists?(name: "admin")
Role.create!(name: "instructor") unless Role.exists?(name: "instructor")
Role.create!(name: "general") unless Role.exists?(name: "general")



#<userデータ>
User.create!(
  [
    {email: 'furuya@gmail.com', password: 'furuya@gmail.com', role_id: 1},
    {email: 'instructor1@gmail.com', password: 'instructor1@gmail.com', role_id: 2},
    {email: 'instructor2@gmail.com', password: 'instructor2@gmail.com', role_id: 2},
    {email: 'general1@gmail.com', password: 'general1@gmail.com', role_id: 3},
    {email: 'general2@gmail.com', password: 'general2@gmail.com', role_id: 3}
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
  id: 1,
  name: '平野歩夢',
  money: '100,000円',
  detail: 'オリンピック金メダリスト',
  start_day: '2023/2/25',
  end_day: '2023/3/4',
  skiresort_id: 1,
  user_id: 2,
  labels: Label.where(id: [3, 4, 5, 6, 7, 8, 9])
)

