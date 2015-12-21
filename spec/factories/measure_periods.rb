FactoryGirl.define do
  factory :measure_period do
    id 1
    starting_day { Date.today }
    number_of_days 3
    user
  end

  factory :measure_period_new, class: MeasurePeriod do
    starting_day nil
    number_of_days nil
    user
  end

end
