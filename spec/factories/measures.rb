FactoryGirl.define do
  sequence :id do |n|
    n
  end

  factory :measure, class: Measure do
    id
    systolic 120.5
    diastolic 80
    pulse 70
    created_at { Time.current }
    user
  end

end
