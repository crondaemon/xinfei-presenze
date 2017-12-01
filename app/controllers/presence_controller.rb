class PresenceController < ApplicationController
	def day
		@users = User.where(active: true)
		@day = Date.today
	end
end
