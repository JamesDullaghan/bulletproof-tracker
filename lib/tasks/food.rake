require 'csv'

desc "Import csv list of foods from the bulletproof diet"
task :import_food => :environment do
  CSV.foreach(path, headers: true) do |row|
    Food.create! row.to_hash
  end
end

def path
  path = "lib/tasks/bulletproof_food_list_updated.csv"
end