class PresenceController < ApplicationController
	before_action :authenticate_user!

	def day
		@users = User.where(active: true).order(:fullname)
		@day = params['day'] ? Date.parse(params['day']) : Date.today
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

	def stats
		@pres_by_day = Presence.group(:when).count
	end

  def disable
    user = User.find(params['id'])
    day = params['day']
    if !user
      flash[:error] = 'Utente non trovato'
    else
      user.active = false
      user.save
    end
    redirect_to presence_day_path(day: day)
  end

  def select
  end
end
