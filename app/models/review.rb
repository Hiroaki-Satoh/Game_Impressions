class Review < ApplicationRecord

  belongs_to :user
  belongs_to :game_title

  # バリデーション
  validates :title, presence: true, length: { maximum: 25 }
  validates :body,  presence: true, length: { maximum: 250 }
end
