require "rails_helper"

RSpec.describe Api::SessionsController, :type => :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "api/sessions").to route_to("api/sessions#create")
    end
  end
end