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
      introduction: 'マンガ大好きです。よろしくお願いします。'
    },
    {
      email: 'test2@member',
      password: 'testmember',
      first_name: '品川',
      last_name: '健太',
      first_name_kana: 'シナガワ',
      last_name_kana: 'ケンタ',
      nickname: 'ケン',
      is_deleted: 'true',
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
      introduction: 'Re：ゼロから始める異世界生活が好きです。異世界ものが好きなのでよろしくお願いします'
    },
    {
      email: 'test4@member',
      password: 'testmember',
      first_name: '小松',
      last_name: '卓也',
      first_name_kana: 'コマツ',
      last_name_kana: 'タクヤ',
      nickname: 'シャクソン',
    },
    {
      email: 'sora@member',
      password: 'testmember',
      first_name: '服部',
      last_name: '天',
      first_name_kana: 'ハットリ',
      last_name_kana: 'ソラ',
      nickname: 'ソラ',
      is_deleted: 'true',
      profile_image: File.open("./app/assets/images/22503868.jpg"),
      introduction: '日常系が好きです。特に学生系のマンガが好きです！'
    },
    {
      email: 'miyu@lovely',
      password: 'testmember',
      first_name: '新田',
      last_name: '美優',
      first_name_kana: 'ニッタ',
      last_name_kana: 'ミユ',
      nickname: 'ミユ',
      profile_image: File.open("./app/assets/images/22568612.jpg"),
      introduction: 'ラブコメやほのぼの系統のマンガが好きです！'
    },
    {
      email: 'tera@com',
      password: 'testmember',
      first_name: '寺本',
      last_name: '優希',
      first_name_kana: 'テラモト',
      last_name_kana: 'ユウキ',
      nickname: 'モニカ',
      is_deleted: 'true',
      profile_image: File.open("./app/assets/images/22565317.jpg"),
    },
    {
      email: 'wazubon@com',
      password: 'testmember',
      first_name: '野田',
      last_name: '悠斗',
      first_name_kana: 'ノダ',
      last_name_kana: 'ユウト',
      nickname: 'ワズボン',
      is_deleted: 'true',
      profile_image: File.open("./app/assets/images/22486164.jpg"),
      introduction: 'オススメあれば教えてください!'
    },
    {
      email: 'waiton@com',
      password: 'testmember',
      first_name: '小林',
      last_name: '佳奈',
      first_name_kana: 'コバヤシ',
      last_name_kana: 'カナ',
      nickname: 'ネム',
      is_deleted: 'true',
      profile_image: File.open("./app/assets/images/22472552.jpg"),
      introduction: 'ラブコメが好きなのでオススメがあれば教えてください'
    }
  ]
)

Manga.create!(
  [
    {
      member_id: 2,
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
      review: 2.5
    },
    {
      member_id: 6,
      title: 'かぐや様は告らせたい？～天才たちの恋愛頭脳戦～',
      introduction: '天才二人による壮絶な駆け引きがあるラブコメディー',
      impression: '二人の駆け引きが非常に面白いのでぜひ読んでください！',
      image: File.open("./app/assets/images/9784088904320_600.jpg"),
      review: 3.5
    },
    {
      member_id: 8,
      title: '魔法使いの嫁 ',
      introduction: '内容は少し暗いですが、物語の内容は非常に面白いです',
      impression: '人間と他種族の関わりが面白かったです',
      image: File.open("./app/assets/images/9784800002846_600.jpg"),
      review: 3.5
    },
    {
      member_id: 8,
      title: 'オーバーロード',
      introduction: 'まさしくダークファンタジーです！',
      impression: '内容は結構暗めです。自分は好きなので非常に面白かったです！',
      image: File.open("./app/assets/images/9784800002846_600.jpg"),
      review: 3.5
    },
    {
      member_id: 3,
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
  [
    {
      member_id:1,
      title: "白聖女と黒牧師#{n+1}",
      introduction: 'とある聖女と牧師のラブコメです。鈍感牧師が面白いのでぜひ読んでください',
      impression: '二人の距離感が読んでいてもどかしくなってしまいます',
      image: File.open("./app/assets/images/9784065105986_600.jpg"),
      review: 3.5
    },
    {
      member_id:4,
      title: "呪術廻戦#{n+1}",
      introduction: '今、流行っているマンガです！ぜひ皆さんも読んでください',
      impression: 'バトル系のマンガでキャラクターも魅力的です。',
      image: File.open("./app/assets/images/9784088815169_600.jpg"),
      review: 4.5
    },
    {
      member_id:5,
      title: "五等分の花嫁#{n+1}",
      introduction: '今年の夏に映画化が決まっているマンガです',
      impression: '五人の内一人が主人公の花嫁です。皆さんは誰を押しますか？',
      image: File.open("./app/assets/images/9784065186879_600.jpg"),
      review: 3
    }
  ]
  )
end

Relationship.create!(
  [
    {
      follower_id: 2,
      followed_id: 3
    },
    {
      follower_id: 2,
      followed_id: 4
    },
    {
      follower_id: 3,
      followed_id: 2
    },
    {
      follower_id: 3,
      followed_id: 4
    },
    {
      follower_id: 3,
      followed_id: 6
    },
    {
      follower_id: 3,
      followed_id: 7
    },
    {
      follower_id: 4,
      followed_id: 8
    },
    {
      follower_id: 4,
      followed_id: 5
    },
    {
      follower_id: 4,
      followed_id: 6
    },
    {
      follower_id: 7,
      followed_id: 8
    },
    {
      follower_id: 7,
      followed_id: 6
    },
    {
      follower_id: 9,
      followed_id: 2
    },
  ]
)