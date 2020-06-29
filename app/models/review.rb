class Review < ApplicationRecord

  belongs_to :user
  belongs_to :game_title

  # バリデーション
  validates :user_id, uniqueness: { scope: :game_title_id }
  validates :title, presence: true, length: { maximum: 25 }
  validates :body,  presence: true, length: { maximum: 250 }
  validates :graphic, presence: true,
            numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :sound, presence: true,
            numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :story, presence: true,
            numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :volume, presence: true,
            numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :recommended, presence: true,
            numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
end
