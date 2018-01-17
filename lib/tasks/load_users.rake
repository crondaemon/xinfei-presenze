userfile = 'users.txt'

namespace :db do
	namespace :users do
		desc "Load users from file #{userfile}"
		task load: :environment do
			if !File.exists?(userfile)
				puts "File #{userfile} must exist"
				exit 1
			end
			File.open(userfile).each_line do |line|
				username = line.gsub(/[\t ,]/,'').downcase.strip
				fullname = line.gsub(/[,]/,'').gsub(/[\t]/,' ').strip
				u = User.create(username: username, fullname: fullname, password: 'xfpres')
				if !u
					puts "Error saving #{line}: #{u.errors.messages}"
				else
					puts "User #{fullname} imported."
				end
			end
		end
	end
end
