require 'rails_helper'

RSpec.describe "MeasurePeriods", type: :request do
  describe "GET /measure_periods" do
    before :each do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end
    it "works! (now write some real specs)" do
      get measure_periods_path
      expect(response).to have_http_status(200)
    end
  end
end
