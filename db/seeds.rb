# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 新增課程
5.times do |i|
    u = User.random
    u.courses.create(name: Faker::Movies::LordOfTheRings.character, 
                    price: Faker::Number.between(from: 10, to: 100), 
                    hour: Faker::Number.between(from: 1, to: 20))
end