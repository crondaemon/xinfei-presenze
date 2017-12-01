class PresenceController < ApplicationController
	def today
		@users = User.where(active: true)
	end
end
