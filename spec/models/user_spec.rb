require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'attributes' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:measures) }
  end

  subject { create(:user) }

  describe '#average_systolic' do
    it 'returns nil if there are fewer submissions than required' do
      2.times.each { create(:measure, user: subject) }
      expect(subject.average_systolic).to be_nil
    end

    it 'returns the average if there are enough submissions' do
      2.times.each { create(:measure, user: subject, systolic: 110) }
      2.times.each { create(:measure, user: subject, systolic: 120) }
      expect(subject.average_systolic).to eq(115.0)
    end
  end

  describe '#average_diastolic' do
    it 'returns nil if there are fewer submissions than required' do
      2.times.each { create(:measure, user: subject) }
      expect(subject.average_diastolic).to be_nil
    end

    it 'returns the average if there are enough submissions' do
      2.times.each { create(:measure, user: subject, diastolic: 80.5) }
      2.times.each { create(:measure, user: subject, diastolic: 90) }
      expect(subject.average_diastolic).to eq(85.25)
    end
  end


end
