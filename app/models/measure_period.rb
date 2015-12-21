class MeasurePeriod < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :starting_day, :number_of_days, presence: true
end
