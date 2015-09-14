require 'rails_helper'

RSpec.describe "service_order_items/show", :type => :view do
  before(:each) do
    @service_order_item = assign(:service_order_item, ServiceOrderItem.create!(
      :service_order_id => 1,
      :service_item_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
