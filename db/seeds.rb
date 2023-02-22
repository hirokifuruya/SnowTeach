# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




#<userデータ>
User.create!(
  [
    {email: 'furuya@gmail.com', password: 'furuya@gmail.com', role_id: 1},
    {email: 'instructor1@gmail.com', password: 'instructor1@gmail.com', role_id: 2},
    {email: 'instructor2@gmail.com', password: 'finstructor2@gmail.com', role_id: 2},
    {email: 'general1@gmail.com', password: 'general1@gmail.com', role_id: 3},
    {email: 'general2@gmail.com', password: 'general2@gmail.com', role_id: 4}
  ]
    )

#<skirosortデータ>
Skiresort.create!(
  [
    {name:'かぐらスキー場', address: '新潟県南魚沼郡湯沢町三俣742'},
    {name:'GALA湯沢スキー場', address: '新潟県南魚沼郡湯沢町大字湯沢字茅平1039-2'},
    {name:'ルスツリゾート', address: '北海道虻田郡留寿都村字泉川13'},
    {name:'ニセコ東急 グラン・ヒラフ', address: '北海道虻田郡倶知安町ニセコひらふ1条2丁目9番1号'},
    {name:'グランデコスノーリゾート', address: '福島県耶麻郡北塩原村大字桧原字荒砂沢山1082番93'}
  ]
)

