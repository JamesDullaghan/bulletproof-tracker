class SleepsController < ApplicationController
  def index
    @sleeps = current_user.sleeps
    @sleeps_by_date = @sleeps.group_by(&:sleep_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    respond_to do |format|
      format.html { render action: 'index' }
      format.js
    end

    total_average_sleep_time = Array.new
    @sleeps.each do |average|
      average = average.hours
      total_average_sleep_time.push(average)
    end
    @total_average_sleep_time = median(total_average_sleep_time)

    month_range = current_user.sleeps.where(:sleep_date => @date.beginning_of_month..@date.end_of_month)
    monthly_average_sleep_time = Array.new
    month_range.each do |average|
      average = average.hours
      monthly_average_sleep_time.push(average)
    end
    @monthly_average_sleep_time = median(monthly_average_sleep_time)
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
    if array.empty?
      return 0
    else
      sorted = array.sort
      len = sorted.length
      return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
  end
end
