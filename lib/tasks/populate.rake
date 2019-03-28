namespace :db do
  desc 'Populate the db'
  task populate: :environment do
    User.active.find_each do |u|
      puts "Setting presences for #{u.fullname}"
      start = 3.month.ago
      today = Time.now
      while start < today
        if rand(10) < 4
          Presence.create(user: u, when: start)
        end
        start += 1.day
      end
    end
  end
end
