require 'rails_helper'

RSpec.describe "ServiceItems", :type => :request do
  describe "GET /service_items" do
    it "works! (now write some real specs)" do
      get service_items_path
      expect(response.status).to be(200)
    end
  end
end
