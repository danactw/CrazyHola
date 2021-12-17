namespace :db do
    desc "產生假課程"
    task :new_courses => :environment do
      u = User.random
      2.times do |i|
        u.courses.create(name: Faker::Name.name,
                         price: Faker::Number.between(from: 10, to: 100),
                         hour: Faker::Number.between(from: 1, to: 20))
      end
    end
  end