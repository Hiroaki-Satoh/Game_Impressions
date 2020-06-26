class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id,       null: false # レビュー投稿したユーザID
      t.integer :game_title_id, null: false # レビュー投稿したゲームタイトルID
      t.string  :title,         null: false # レビュータイトル
      t.text    :body,          null: false # レビュー本文
      # ↓↓↓ 評価項目 ↓↓↓
      t.float   :graphic,       null: false # グラフィック評価
      t.float   :sound,         null: false # サウンド評価
      t.float   :story,         null: false # ストーリー評価
      t.float   :volume,        null: false # ボリューム評価
      t.float   :recommended,   null: false # おすすめ度
      # ↑↑↑ 評価項目 ↑↑↑

      t.timestamps
    end
  end
end
