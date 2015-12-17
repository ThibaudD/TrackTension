require 'rails_helper'

feature 'User add measure' do
  scenario 'with valid measure' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_measure_path
    fill_in 'measure[systolic]', with: 130.5
    fill_in 'measure[diastolic]', with: 80.5
    fill_in 'measure[pulse]', with: 80
    click_on 'Save'
    expect(page).to have_content('Listing Measures')
  end
end
