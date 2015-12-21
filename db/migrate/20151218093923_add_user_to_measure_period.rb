class AddUserToMeasurePeriod < ActiveRecord::Migration
  def change
    add_reference :measure_periods, :user, index: true, foreign_key: true
  end
end
