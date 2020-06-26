# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者アカウント
Admin.create!(
	nickname: ENV['admin_nickname'],
	email:    ENV['admin_email'],
	password: ENV['admin_password']
)

Genre.create!(
	name:     "未分類"
	is_valid: true
	)

Genre.create!(
	name:     "RPG"
	is_valid: true
	)

Genre.create!(
	name:     "アクション"
	is_valid: true
	)

Genre.create!(
	name:     "シューティング"
	is_valid: true
	)

Genre.create!(
	name:     "シュミレーション"
	is_valid: true
	)

Genre.create!(
	name:     "パズル"
	is_valid: true
	)

Genre.create!(
	name:     "音楽"
	is_valid: true
	)
