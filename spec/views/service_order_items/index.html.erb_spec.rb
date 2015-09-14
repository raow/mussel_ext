require 'rails_helper'

RSpec.describe "service_order_items/index", :type => :view do
  before(:each) do
    assign(:service_order_items, [
      ServiceOrderItem.create!(
        :service_order_id => 1,
        :service_item_id => 2
      ),
      ServiceOrderItem.create!(
        :service_order_id => 1,
        :service_item_id => 2
      )
    ])
  end

  it "renders a list of service_order_items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
