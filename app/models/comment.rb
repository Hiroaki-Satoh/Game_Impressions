class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :impression

  # バリデーション
  validates :body, presence: true
end
