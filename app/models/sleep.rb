class Sleep < ActiveRecord::Base
  # Name of this model is terrible!
  belongs_to :user

  validates_uniqueness_of :sleep_date, scope: :user_id

  scope :grouped_by_date, -> { group_by(&:sleep_date) }
  scope :sleep_months, -> {
    group_by { |sleep| sleep.sleep_date.beginning_of_month.sort { |a, b| a[0] <=> b[0] } }
  }
end
