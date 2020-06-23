class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :impressions
  has_many :comments, dependent: :destroy

  # ユーザアイコンの投稿：refile
  attachment :icon_image, destroy: false

  # バリデーション
  validates :nickname, length: {maximum: 20, minimum: 4}
  validates :introduction, length: {maximum: 50}
end
