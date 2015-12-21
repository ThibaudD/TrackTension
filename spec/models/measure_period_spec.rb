require 'rails_helper'

RSpec.describe MeasurePeriod, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:starting_day) }
    it { is_expected.to respond_to(:number_of_days) }
  end

  it '.valid' do
    expect(build(:measure_period)).to be_valid
  end

  describe 'is invalid' do
    it 'without user' do
      expect(build(:measure_period, user: nil)).to_not be_valid
    end

    it 'without starting_day' do
      expect(build(:measure_period, starting_day: nil)).to_not be_valid
    end

    it 'without number_of_days' do
      expect(build(:measure_period, number_of_days: nil)).to_not be_valid
    end
  end
end
