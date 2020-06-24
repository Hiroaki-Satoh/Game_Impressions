class Impression < ApplicationRecord

  belongs_to :user
  belongs_to :game_title

  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy

  # 感想の画像投稿：refile
  attachment :image, destroy: false

  #バリデーション
  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body,  presence: true, length: { maximum: 200 }

  def liked_by?(user)
	likes.where(user_id: user.id).exists?
  end
end
