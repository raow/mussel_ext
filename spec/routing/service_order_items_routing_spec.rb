require "rails_helper"

RSpec.describe ServiceOrderItemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/service_order_items").to route_to("service_order_items#index")
    end

    it "routes to #new" do
      expect(:get => "/service_order_items/new").to route_to("service_order_items#new")
    end

    it "routes to #show" do
      expect(:get => "/service_order_items/1").to route_to("service_order_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_order_items/1/edit").to route_to("service_order_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/service_order_items").to route_to("service_order_items#create")
    end

    it "routes to #update" do
      expect(:put => "/service_order_items/1").to route_to("service_order_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_order_items/1").to route_to("service_order_items#destroy", :id => "1")
    end

  end
end
