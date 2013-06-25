class Sleep < ActiveRecord::Base
  attr_accessible :hours, :user_id, :sleep_date

  belongs_to :user
  validates :sleep_date, :uniqueness => true

end
