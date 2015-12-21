require "rails_helper"

RSpec.describe MeasurePeriodsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/measure_periods").to route_to("measure_periods#index")
    end

    it "routes to #new" do
      expect(:get => "/measure_periods/new").to route_to("measure_periods#new")
    end

    it "routes to #show" do
      expect(:get => "/measure_periods/1").to route_to("measure_periods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/measure_periods/1/edit").to route_to("measure_periods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/measure_periods").to route_to("measure_periods#create")
    end

    it "routes to #update" do
      expect(:put => "/measure_periods/1").to route_to("measure_periods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/measure_periods/1").to route_to("measure_periods#destroy", :id => "1")
    end

  end
end
