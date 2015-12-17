require 'rails_helper'

describe Measure, type: :model do

  describe 'attributes' do
    it { is_expected.to respond_to(:systolic) }
    it { is_expected.to respond_to(:diastolic) }
    it { is_expected.to respond_to(:pulse) }
    it { is_expected.to respond_to(:created_at) }
  end

  it '.valid' do
    expect(build(:measure)).to be_valid
  end

  describe 'is invalid' do
    it 'without user' do
      expect(build(:measure, user: nil)).to_not be_valid
    end

    it 'without systolic' do
      expect(build(:measure, systolic: nil)).to_not be_valid
    end

    it 'without diastolic' do
      expect(build(:measure, diastolic: nil)).to_not be_valid
    end
  end

end
