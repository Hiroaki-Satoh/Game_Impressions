# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者アカウント
Admin.create!(
	nickname: ENV['admin_nickname'],
	email:    ENV['admin_email'],
	password: ENV['admin_password']
)

# ユーザアカウント
10.times do |n|
  User.create!(
    nickname:     "TestUser#{n + 1}",
    email:        "Mail#{n + 1}@Example",
    password:     "password",
    introduction: "Hi! I'm TestUser#{n + 1}!!"
  )
end

# ジャンルの初期データ
Genre.create!(
  name:     "未分類",
  is_valid: true
)

Genre.create!(
  name:     "RPG",
  is_valid: true
)

Genre.create!(
  name:     "アクション",
  is_valid: true
)

Genre.create!(
  name:     "アドベンチャー",
  is_valid: true
)

Genre.create!(
  name:     "シューティング",
  is_valid: true
)

Genre.create!(
  name:     "シュミレーション",
  is_valid: true
)

Genre.create!(
  name: "格闘",
  is_valid: true
)

Genre.create!(
  name:     "ホラー",
  is_valid: true
)

Genre.create!(
  name:     "パズル",
  is_valid: true
)

Genre.create!(
  name:     "音楽",
  is_valid: true
)

# ゲームタイトル初期データ
GameTitle.create!(
  genre_id:     1,
  name:         "SampleGame",
  introduction: "SampleSampleSampleSample"
)

GameTitle.create!(
  genre_id:     2,
  name:         "Snow World",
  introduction: "白銀世界を自由に探索しよう！！"
)

GameTitle.create!(
  genre_id:     3,
  name:         "Super Brothers",
  introduction: "赤の人と緑の人を操作し、ゴールを目指せ！！"
)

GameTitle.create!(
  genre_id:     4,
  name:         "Adventure Game",
  introduction: "AdventureAdventureAdventure"
)

GameTitle.create!(
  genre_id:     5,
  name:         "Shoooting Master",
  introduction: "迫りくる敵を撃ち落とせ！"
)

GameTitle.create!(
  genre_id:     6,
  name:         "Driving Simulator",
  introduction: "あらゆる乗り物を操縦しよう！"
)

GameTitle.create!(
  genre_id:     7,
  name:         "World Fighter",
  introduction: "俺より強い奴はいない..."
)

GameTitle.create!(
  genre_id:     8,
  name:         "Real Horror",
  introduction: "襲い来る恐怖に君は耐えきれるか..."
)

GameTitle.create!(
  genre_id:     9,
  name:         "Jigsaw pazzle Mania",
  introduction: "1000種以上のジグソーパズルを収録！"
)

GameTitle.create!(
  genre_id:     10,
  name:         "Music Star",
  introduction: "目指せトップアイドル"
)

# 投稿の初期データ
10.times do |n|
  Impression.create!(
    user_id:       "#{n + 1}",
    game_title_id: "#{n + 1}",
    image:         open("./app/assets/images/no_image.jpg"),
    title:         "#{n + 1}番目の投稿です",
    body:          "私が#{n + 1}番です！"
  )
end

# コメント初期データ
5.times do |n|
  Comment.create!(
    user_id:        "#{n + 1}",
    impression_id:  1,
    body:           "#{n + 1}番目のコメントです。"
  )
end

# レビュー初期データ
5.times do |n|
  Review.create!(
    user_id:       "#{n + 1}",
    game_title_id: 1,
    title:         "#{n + 1}番目の評価",
    body:          "#{n + 1}番目の評価です！",
    graphic:       "#{n + 1.0}",
    sound:         "#{n + 1.0}",
    story:         "#{n + 1.0}",
    volume:        "#{n + 1.0}",
    recommended:   "#{n + 1.0}"
  )
end
