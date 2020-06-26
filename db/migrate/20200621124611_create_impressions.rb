class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.integer :user_id,       null: false # 投稿したユーザID
      t.integer :game_title_id, null: false # 感想を書くゲームタイトルのID
      t.string  :image_id                   # 画像の投稿
      t.string  :title,         null: false # 感想のタイトル
      t.text    :body,          null: false # 感想の本文

      t.timestamps
    end
  end
end
