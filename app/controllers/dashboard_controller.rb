class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  private

  def date
    Date.parse(params.fetch(:date, Date.today))
  end

  helper_method :date
end
