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
		@pres_by_day_last_year = Presence.where(when: 1.year.ago..Date.today).group(:when).count
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

  def show
  	@from = params['from'] && !params['from'].empty? ? Date.parse(params['from']) : 3.months.ago
  	@to = params['to'] && !params['to'].empty? ? Date.parse(params['to']) : Date.today
  	@presence_persons = {}
  	presences = Presence.where(when: @from..@to)
  	presences.each do |presence|
  		@presence_persons[presence.user.fullname] = [] if !@presence_persons[presence.user.fullname]
  		@presence_persons[presence.user.fullname] << presence.when
  	end
  	@days = presences.pluck(:when).uniq
  	@presence_persons = @presence_persons.to_a.sort_by!{|e| e.first}.to_h
  end
end
