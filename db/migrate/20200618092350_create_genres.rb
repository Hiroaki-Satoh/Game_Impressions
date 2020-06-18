class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string  :name,     null: false                # ジャンル名
      t.boolean :is_valid, null: false, default: true # 有効かどうか（無効の場合はfalse）

      t.timestamps
    end
  end
end
