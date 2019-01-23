class PresencesController < ApplicationController
	before_action :authenticate_user!

	def day
		@users = User.where(active: true).order(:fullname)
		@day = params['day'].present? ? Date.parse(params['day']) : Date.today
		@count = Presence.where(when: @day, user: @users).count
	end

	def mark
		user = User.find_by_id(params['user_id'])
		day = params['day'] || Date.today
		if !user
			render json: { message: 'utente non esistente' }.to_json, status: 422
			return
		end
		if user.presences.where(when: day).size == 0
			Presence.create(user: user, when: day)
			increment = 1
		else
			Presence.where(user: user, when: day).destroy_all
			increment = -1
		end
		render json: { increment: increment }.to_json
	end

	def stats
		@pres_by_day = Presence.group(:when).count
		@pres_by_day_last_year = Presence.where(when: 1.year.ago..Date.today).group(:when).count
	end

	def disable
		user = User.find_by_id(params['id'])
		day = params['day']
		if !user
			flash[:error] = 'Utente non trovato'
		else
			# Delete any presence of this user for the chosen day
			Presence.where(when: day, user: user).destroy_all

			user.active = false
			user.save
		end
		redirect_to presences_day_path(day: day)
	end

	def select
	end

	def show
		@from = params['from'].present? ? Date.parse(params['from']) : 3.months.ago
		@to = params['to'].present? ? Date.parse(params['to']) : Date.today
		@presence_persons = {}
		presences = Presence.where(when: @from..@to)
		presences.each do |presence|
			@presence_persons[presence.user.fullname] = [] if !@presence_persons[presence.user.fullname]
			@presence_persons[presence.user.fullname] << presence.when
		end
		@days = presences.pluck(:when).uniq.sort
		@presence_persons = @presence_persons.to_a.sort_by!{|e| e.first}.to_h

		respond_to do |format|
			format.html
			format.csv
		end
	end
end
