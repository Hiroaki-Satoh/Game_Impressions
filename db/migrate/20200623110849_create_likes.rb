class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id       # いいねしたユーザID
      t.integer :impression_id # いいねした投稿ID

      t.timestamps
    end
  end
end
