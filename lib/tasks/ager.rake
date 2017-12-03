namespace :db do
	desc 'Make old user deactive'
	task age: :environment do
		User.find_each do |user|
			next if !user.active
			p = user.presences.order(:when).last
			next if !p
			if p.when < 2.months.ago
				puts "Deactivating #{user.fullname}"
				user.active = false
				user.save
			end
		end
	end
end
