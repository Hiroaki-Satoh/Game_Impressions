class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable => 登録、編集、削除機能
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :nickname, length: {maximum: 20, minimum: 4}
end
