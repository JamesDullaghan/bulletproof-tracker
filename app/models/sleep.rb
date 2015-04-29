class Sleep < ActiveRecord::Base
  # attr_accessible :hours, :user_id, :sleep_date

  belongs_to :user

  validates_uniqueness_of :sleep_date, scope: :user_id
end
