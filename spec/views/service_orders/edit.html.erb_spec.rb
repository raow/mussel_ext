require 'rails_helper'

RSpec.describe "service_orders/edit", :type => :view do
  before(:each) do
    @service_order = assign(:service_order, ServiceOrder.create!(
      :no => "MyString",
      :status => "MyString",
      :service_vendor_id => 1,
      :customer_id => 1,
      :vendor_id => 1
    ))
  end

  it "renders the edit service_order form" do
    render

    assert_select "form[action=?][method=?]", service_order_path(@service_order), "post" do

      assert_select "input#service_order_no[name=?]", "service_order[no]"

      assert_select "input#service_order_status[name=?]", "service_order[status]"

      assert_select "input#service_order_service_vendor_id[name=?]", "service_order[service_vendor_id]"

      assert_select "input#service_order_customer_id[name=?]", "service_order[customer_id]"

      assert_select "input#service_order_vendor_id[name=?]", "service_order[vendor_id]"
    end
  end
end
