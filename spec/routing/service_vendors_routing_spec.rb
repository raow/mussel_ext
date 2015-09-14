require "rails_helper"

RSpec.describe ServiceVendorsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/service_vendors").to route_to("service_vendors#index")
    end

    it "routes to #new" do
      expect(:get => "/service_vendors/new").to route_to("service_vendors#new")
    end

    it "routes to #show" do
      expect(:get => "/service_vendors/1").to route_to("service_vendors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_vendors/1/edit").to route_to("service_vendors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/service_vendors").to route_to("service_vendors#create")
    end

    it "routes to #update" do
      expect(:put => "/service_vendors/1").to route_to("service_vendors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_vendors/1").to route_to("service_vendors#destroy", :id => "1")
    end

  end
end
