require 'rails_helper'

RSpec.describe "service_vendors/edit", :type => :view do
  before(:each) do
    @service_vendor = assign(:service_vendor, ServiceVendor.create!(
      :no => "MyString",
      :name => "MyString",
      :contact => "MyString",
      :phone => "MyString",
      :province => "MyString",
      :city => "MyString",
      :region => "MyString",
      :location_details => "MyString",
      :latitude => "9.99",
      :longtitude => "9.99"
    ))
  end

  it "renders the edit service_vendor form" do
    render

    assert_select "form[action=?][method=?]", service_vendor_path(@service_vendor), "post" do

      assert_select "input#service_vendor_no[name=?]", "service_vendor[no]"

      assert_select "input#service_vendor_name[name=?]", "service_vendor[name]"

      assert_select "input#service_vendor_contact[name=?]", "service_vendor[contact]"

      assert_select "input#service_vendor_phone[name=?]", "service_vendor[phone]"

      assert_select "input#service_vendor_province[name=?]", "service_vendor[province]"

      assert_select "input#service_vendor_city[name=?]", "service_vendor[city]"

      assert_select "input#service_vendor_region[name=?]", "service_vendor[region]"

      assert_select "input#service_vendor_location_details[name=?]", "service_vendor[location_details]"

      assert_select "input#service_vendor_latitude[name=?]", "service_vendor[latitude]"

      assert_select "input#service_vendor_longtitude[name=?]", "service_vendor[longtitude]"
    end
  end
end
