class Genre < ApplicationRecord

  has_many :game_title

  # バリデーション
  validates :name, presence: true
end
