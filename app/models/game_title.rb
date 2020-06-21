class GameTitle < ApplicationRecord

  belongs_to :genre

  has_many :impressions

  # ゲーム画像投稿：refile
  attachment :game_image, destroy: false

  # バリデーション
  validates :name, presence: true
  validates :introduction, presence: true
end
