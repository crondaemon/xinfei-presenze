internal_users = [
	'cesarecornagliotto',
	'annaritaparis',
	'cristinalopiano',
	'lucatrecca',
	'ivocornagliotto'
]

namespace :db do
	desc 'Load admin users'
	task users: :environment do
		internal_users.each do |username|
			user = User.find_by_username(username)
			user.password = 'xfpres'
			user.roles = ['admin']
			if !user.save
				puts "ERROR: #{user.errors.messages}"
			else
				puts "Privileges raised for #{user.fullname}"
			end
		end
	end
end
