# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインのサンプルユーザーを1人作成する
User.create!(nickname:  "Example User",
  email: "hogehogehoge@gmail.com",
  password:              "foobar",
  password_confirmation: "foobar")

  # サンプルユーザーを追加で1人作成する
User.create!(nickname:  "Example User2",
  email: "hogehogehoge2@gmail.com",
  password:              "foobar2",
  password_confirmation: "foobar2")

  # サンプルユーザーを追記で1人作成する
User.create!(nickname:  "Example User3",
  email: "hogehogehoge3@gmail.com",
  password:              "foobar3",
  password_confirmation: "foobar3")

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2]
followers = users[3]
