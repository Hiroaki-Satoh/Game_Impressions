class CreateGameTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :game_titles do |t|
	  t.integer :genre_id,      null: false # ゲームのジャンル
	  t.string  :name,          null: false # ゲームタイトル名
	  t.string  :game_image_id              # ゲーム画像
	  t.text    :introduction,  null: false # ゲームの紹介文

      t.timestamps
    end
  end
end
