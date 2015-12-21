require 'rails_helper'

describe 'Measure period features' do
  before :each do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  feature 'User add measure period' do
    scenario 'with valid measure period' do
      visit new_measure_period_path
      select '2015', :from => 'measure_period[starting_day(1i)]'
      select 'December', :from => 'measure_period[starting_day(2i)]'
      select '20', :from => 'measure_period[starting_day(3i)]'
      select '3', :from => 'measure_period[number_of_days]'
      click_on 'Save'
      expect(page).to have_content('December 20, 2015')
    end
  end

  feature 'User remove measure period' do
    scenario 'with valid ' do
      measure = FactoryGirl.create(:measure_period)
      visit measure_periods_path
      expect { page.first(".delete-link").click }.to change(MeasurePeriod, :count).by(-1)
    end
  end
end
