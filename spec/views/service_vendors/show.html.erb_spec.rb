require 'rails_helper'

RSpec.describe "service_vendors/show", :type => :view do
  before(:each) do
    @service_vendor = assign(:service_vendor, ServiceVendor.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/No/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Province/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/Location Details/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
