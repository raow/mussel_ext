require 'rails_helper'

RSpec.describe "service_orders/index", :type => :view do
  before(:each) do
    assign(:service_orders, [
      ServiceOrder.create!(
        :no => "No",
        :status => "Status",
        :service_vendor_id => 1,
        :customer_id => 2,
        :vendor_id => 3
      ),
      ServiceOrder.create!(
        :no => "No",
        :status => "Status",
        :service_vendor_id => 1,
        :customer_id => 2,
        :vendor_id => 3
      )
    ])
  end

  it "renders a list of service_orders" do
    render
    assert_select "tr>td", :text => "No".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
