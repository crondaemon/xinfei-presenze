class PresenceController < ApplicationController
	before_action :authenticate_user!

	def day
		@users = User.where(active: true)
		@day = Date.today
	end

	def mark
		user = User.find(params['user_id'])
		day = params['day'] || Date.today
		if !user
			render plain: 'Utente non esistente', status: 422
			return
		end
		if user.presences.where(when: day).size == 0
			Presence.create(user: user, when: day)
		else
			Presence.where(user: user, when: day).destroy_all
		end
		render plain: user.id
	end
end
