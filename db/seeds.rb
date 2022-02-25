# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@admin',
  password: 'testadmin'
)

Member.create!(
  [
    {
      email: 'test@member',
      password: 'testmember',
      first_name: '長谷川',
      last_name: '京子',
      first_name_kana: 'ハセガワ',
      last_name_kana: 'キョウコ',
      nickname: 'ウサ丸',
      profile_image: File.open("./app/assets/images/rabit.jpg"),
      introduction: 'Re：ゼロから始める異世界生活が好きです。異世界ものが好きなのでよろしくお願いします'
    },
    {
      email: 'test2@member',
      password: 'testmember',
      first_name: '品川',
      last_name: '健太',
      first_name_kana: 'シナガワ',
      is_deleted: 'true',
      last_name_kana: 'ケンタ',
      nickname: 'ケン',
      profile_image: File.open("./app/assets/images/22486120.jpg"),
      introduction: '色んなジャンルを読みます。日常系やファンタジーなど。オススメがあればぜひ教えてください'

    },
    {
      email: 'test3@member',
      password: 'testmember',
      first_name: '最上',
      last_name: '唯',
      first_name_kana: 'モガミ',
      last_name_kana: 'ユイ',
      nickname: 'モニカ',
      profile_image: File.open("./app/assets/images/22503047.jpg"),
      introduction: 'ラブコメが好きなのでオススメがあれば教えてください'

    }
  ]
)

Manga.create!(
  [
    {
      member_id: 1,
      title: '夏目友人帳',
      introduction: '妖怪と人間が関わる物語。基本的に1話毎で完結するので読みやすいです',
      impression: '少女マンガに掲載されているものですが、男女問わず楽しんでいただける内容になっています！',
      image: File.open("./app/assets/images/9784592171584_600.jpg"),
      review: 4.5
    },
    {
      member_id: 2,
      title: 'この素晴らしい世界に祝福を！',
      introduction: 'お笑いがメインの異世界ファンタジー',
      impression: '内容が非常に明るいので楽しく読んでいただけます',
      image: File.open("./app/assets/images/9784040705392_600.jpg"),
      review: 3.5
    },
    {
      member_id: 1,
      title: 'Re：ゼロから始める異世界生活 第一章 王都の一日編１',
      introduction: '異世界生活のダークファンタジーです！ジャンルはタイムリープ系に当てはまると思います',
      impression: '一度はまると読み込んでしまう魅力があります',
      image: File.open("./app/assets/images/9784040668758_600.jpg"),
      review: 4
    }
  ]
)

9.times do |n|
  Manga.create(
    member_id:3,
    title: "白聖女と黒牧師#{n+1}",
    introduction: 'とある聖女と牧師のラブコメです。鈍感牧師が面白いのでぜひ読んでください',
    impression: '二人の距離感が読んでいてもどかしくなってしまいます',
    image: File.open("./app/assets/images/9784065105986_600.jpg"),
    review: 3.5
  )
end
