require 'rails_helper'

RSpec.describe "service_order_items/new", :type => :view do
  before(:each) do
    assign(:service_order_item, ServiceOrderItem.new(
      :service_order_id => 1,
      :service_item_id => 1
    ))
  end

  it "renders new service_order_item form" do
    render

    assert_select "form[action=?][method=?]", service_order_items_path, "post" do

      assert_select "input#service_order_item_service_order_id[name=?]", "service_order_item[service_order_id]"

      assert_select "input#service_order_item_service_item_id[name=?]", "service_order_item[service_item_id]"
    end
  end
end
