namespace :db do
	namespace :register do
		desc 'Get data from register'
		task read: :environment do
			host = 'hostingmysql296.register.it'
			username = 'sheets'
			password = 'nuovovolo.'
			database = 'xinfei_org_db'

			users = {}

			client = Mysql2::Client.new(host: host, username: username, password: password, database: database)
			results = client.query("SELECT * FROM presenze")
			
			results.each do |row|
				name = row['name']
				day = row['date']
				puts "Processing #{name} on #{day}"
				if users[name]
					user = users[name]
				else
					user = User.find_or_create_by(fullname: name)
					users[name] = user
				end
				Presence.find_or_create_by(user: user, when: day)
			end
		end
	end
end
