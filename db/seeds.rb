# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'ab@ab',
   password: 'aaaaaa'
)

Customer.create!(
  first_name: "高坂",
  last_name: "匠",
  first_name_kana: "コウサカ",
  last_name_kana: "タクミ",
  postal_code: "1234567",
  telephone_number: "08011112222",
  address: "XXX県XXX市",
  email: "a@a",
  password: "aaaaaa"
)


# seedに何か追加した後は　railsdb:seedを実行するその際には今ある記述をコメントアウトしておく.または、リセットしてから行う

