class Genre < ApplicationRecord
  # バリデーション
  validates :name, presence: true
end
