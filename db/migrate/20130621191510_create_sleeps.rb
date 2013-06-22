class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.integer :user_id
      t.integer :hours

      t.timestamps
    end
  end
end
