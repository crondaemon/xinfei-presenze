class CleaningController < ApplicationController
  before_action :authenticate_user!

  def today
    @cleaners = User.cleaners.shifts.order('shifts asc').joins(:presences).where('presences.when': Time.current).distinct.limit(2)
  end

  def confirm
    @cleaners_today = User.where(id: params[:ids])
    @rests_today = User.cleaners.today.where.not(id: @cleaners_today)

    @cleaners_today.update_all('cleaning_shifts = cleaning_shifts + 1')
    @rests_today.update_all('rest_shifts = rest_shifts + 1')
  end
end
