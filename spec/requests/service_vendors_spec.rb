require 'rails_helper'

RSpec.describe "ServiceVendors", :type => :request do
  describe "GET /service_vendors" do
    it "works! (now write some real specs)" do
      get service_vendors_path
      expect(response.status).to be(200)
    end
  end
end
