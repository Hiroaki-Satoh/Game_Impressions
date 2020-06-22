class Impression < ApplicationRecord

  belongs_to :user
  belongs_to :game_title

  # 感想の画像投稿：refile
  attachment :image, destroy: false

  #バリデーション
  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body,  presence: true, length: { maximum: 200 }
end
