require 'rails_helper'

RSpec.describe "service_orders/show", :type => :view do
  before(:each) do
    @service_order = assign(:service_order, ServiceOrder.create!(
      :no => "No",
      :status => "Status",
      :service_vendor_id => 1,
      :customer_id => 2,
      :vendor_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/No/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
