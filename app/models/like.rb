class Like < ApplicationRecord

  belongs_to :user
  belongs_to :impression

  # バリデーション
  validates :user_id,       presence: true, uniqueness: {scope: :impression_id}
  validates :impression_id, presence: true
end
