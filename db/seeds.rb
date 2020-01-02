# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "hoge",
        password: "mariobaske13",
        password_confirmation: "mariobaske13"
        )

Tag.create([
        { name: '男女' },
        { name: '年収' },
        { name: '身長' },
        { name: '体重' },
        { name: '国勢調査' },
        { name: '平均' },
])