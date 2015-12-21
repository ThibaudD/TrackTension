json.array!(@measure_periods) do |measure_period|
  json.extract! measure_period, :id, :starting_day, :number_of_days
  json.url measure_period_url(measure_period, format: :json)
end
