class AddConstraintsToSleeps < ActiveRecord::Migration
  def change
    change_column :sleeps, :hours, :integer, :null => false, :default => 1
    change_column :sleeps, :sleep_date, :date, :null => false, :default => Date.today
  end
end
