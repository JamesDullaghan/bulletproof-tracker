class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name,                :null => false, :default => ""
      t.string :category,            :null => false, :default => ""
      t.integer :commitment,         :null => false, :default => 0
      t.integer :serving,            :null => false, :default => 0
      t.integer :calories,           :null => false, :default => 0
      t.decimal :total_fat,          :null => false, :default => 0, :precision => 5, :scale => 2
      t.decimal :saturated_fat,      :null => false, :default => 0, :precision => 5, :scale => 3
      t.integer :cholesterol,        :null => false, :default => 0
      t.integer :sodium,             :null => false, :default => 0
      t.decimal :total_carbohydrate, :null => false, :default => 0, :precision => 5, :scale => 2
      t.decimal :fiber,              :null => false, :default => 0, :precision => 5, :scale => 2
      t.decimal :sugar,              :null => false, :default => 0, :precision => 5, :scale => 2
      t.decimal :protein,            :null => false, :default => 0, :precision => 5, :scale => 2
      t.integer :ratio_fat,          :null => false, :default => 0
      t.integer :ratio_carb,         :null => false, :default => 0
      t.integer :ratio_protein,      :null => false, :default => 0

      t.timestamps
    end
  end
end
