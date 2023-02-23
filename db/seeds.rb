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
    {id: 1, name:'かぐらスキー場', address: '新潟県南魚沼郡湯沢町三俣742'},
    {id: 2, name:'GALA湯沢スキー場', address: '新潟県南魚沼郡湯沢町大字湯沢字茅平1039-2'},
    {id: 3, name:'ルスツリゾート', address: '北海道虻田郡留寿都村字泉川13'},
    {id: 4, name:'ニセコ東急 グラン・ヒラフ', address: '北海道虻田郡倶知安町ニセコひらふ1条2丁目9番1号'},
    {id: 5, name:'グランデコスノーリゾート', address: '福島県耶麻郡北塩原村大字桧原字荒砂沢山1082番93'}
  ]
)

#<labelデータ>
Label.create!(
  [
    {id: 1, name: '初心者' },
    {id: 2, name: '中級者' },
    {id: 3, name: '上級者' },
    {id: 4, name: 'グラトリ' },
    {id: 5, name: 'キッカー' },
    {id: 6, name: 'ハーフパイプ' },
    {id: 7, name: 'カービング' },
    {id: 8, name: 'スロープスタイル' },
    {id: 9, name: 'スノーボードクロス' },
    {id: 10, name: 'ジャイアントスラローム' },
    {id: 11, name: 'スーパージャイアントスラローム' },
    {id: 12, name: 'スラローム' },
    {id: 13, name: 'デュアルスラローム' },
    {id: 14, name: '小学生' },
    {id: 15, name: '中学生' },
    {id: 16, name: '高校生' }
  ]
)

#<recruitデータ>
Recruit.create!{
[
  {id: 1, name:'平野歩夢', money:'100,000円',detail: 'オリンピック金メダリスト',
    start_day: '2023/2/25', end_day: '2023/3/4', skiresort_id: '1',
    user_id: '2',label_id: '3,4,5,6,7,8,9' }
]
}