class SleepsController < ApplicationController
  include SleepsHelper
  before_filter :authenticate_user!

  def index

    # Sleep.all for current_user
    @sleeps = current_user.sleeps
    # Sleep grouped for use in calendar helper
    @sleeps_by_date = @sleeps.group_by(&:sleep_date)
    # Date used in calendar and month range
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    sleep_date = Date.today
    @month_range = @sleeps.where(:sleep_date => sleep_date.beginning_of_month..sleep_date.end_of_month)

    # Array of hours slept since recording began
    @total_sleep_array = @sleeps.map { |sleeps| sleeps.hours }
    @current_month_sleep_array = @month_range.map { |month_range| month_range.hours }

    # Used for sleep chart //
    # NEED TO FIX!!!
    @total_average_sleep_time = median(@total_sleep_array)
    @current_month_average_sleep_time = median(@current_month_sleep_array)

    respond_to do |format|
      format.html { render action: 'index' }
      format.js
    end
  end

  def new
    @sleep = current_user.sleeps.new
  end

  def edit
    @sleep = current_user.sleeps.find(params[:id])
  end

  def create
    @sleep = current_user.sleeps.new(params[:sleep])
    respond_to do |format|
      if @sleep.save
        format.html { redirect_to sleeps_url, notice: 'Sleep was successfully recorded.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @sleep = current_user.sleeps.find(params[:id])
    respond_to do |format|
      if @sleep.update_attributes(params[:sleep])
        format.html { redirect_to sleeps_url, notice: 'Sleep was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @sleep = current_user.sleeps.find(params[:id])
    @sleep.destroy
    respond_to do |format|
      format.html { redirect_to sleeps_url }
    end
  end

  private
  def median(array)
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
end