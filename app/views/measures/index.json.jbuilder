json.array!(@measures) do |measure|
  json.extract! measure, :id, :systolic, :diastolic, :pulse, :user_id
  json.url measure_url(measure, format: :json)
end
