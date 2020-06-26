class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id,       null: false # コメントを投稿したユーザID
      t.integer :impression_id, null: false # コメントした投稿（impression）ID
      t.text    :body,          null: false # コメント本文

      t.timestamps
    end
  end
end
