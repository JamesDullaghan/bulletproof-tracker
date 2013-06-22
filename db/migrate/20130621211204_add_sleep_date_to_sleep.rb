class AddSleepDateToSleep < ActiveRecord::Migration
  def change
    add_column :sleeps, :sleep_date, :date
  end
end
