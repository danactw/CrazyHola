#寫Rake是為了要某些繁瑣的事情
desc '重新計算 Review Count'
task :reset_review_count => :environment do   #=>相依性，要做reset_review_count前要先做environment
    Course.all.each do |course|
        Course.reset_counters(course.id, :reviews)
    end
end