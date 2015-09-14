require 'rails_helper'

RSpec.describe "ServiceOrderItems", :type => :request do
  describe "GET /service_order_items" do
    it "works! (now write some real specs)" do
      get service_order_items_path
      expect(response.status).to be(200)
    end
  end
end
