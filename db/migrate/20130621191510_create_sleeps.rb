class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.integer :user_id
      t.integer :hours, :null => :false, :default => 1

      t.timestamps
    end
  end
end
