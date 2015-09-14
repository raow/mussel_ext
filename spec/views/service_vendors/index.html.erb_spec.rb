require 'rails_helper'

RSpec.describe "service_vendors/index", :type => :view do
  before(:each) do
    assign(:service_vendors, [
      ServiceVendor.create!(
        :no => "No",
        :name => "Name",
        :contact => "Contact",
        :phone => "Phone",
        :province => "Province",
        :city => "City",
        :region => "Region",
        :location_details => "Location Details",
        :latitude => "9.99",
        :longtitude => "9.99"
      ),
      ServiceVendor.create!(
        :no => "No",
        :name => "Name",
        :contact => "Contact",
        :phone => "Phone",
        :province => "Province",
        :city => "City",
        :region => "Region",
        :location_details => "Location Details",
        :latitude => "9.99",
        :longtitude => "9.99"
      )
    ])
  end

  it "renders a list of service_vendors" do
    render
    assert_select "tr>td", :text => "No".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => "Location Details".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
