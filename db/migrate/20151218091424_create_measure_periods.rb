class CreateMeasurePeriods < ActiveRecord::Migration
  def change
    create_table :measure_periods do |t|
      t.date :starting_day
      t.integer :number_of_days

      t.timestamps null: false
    end
  end
end
