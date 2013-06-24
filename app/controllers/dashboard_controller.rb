class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
