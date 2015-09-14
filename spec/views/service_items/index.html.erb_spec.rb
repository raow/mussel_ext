require 'rails_helper'

RSpec.describe "service_items/index", :type => :view do
  before(:each) do
    assign(:service_items, [
      ServiceItem.create!(
        :no => "No",
        :name => "Name"
      ),
      ServiceItem.create!(
        :no => "No",
        :name => "Name"
      )
    ])
  end

  it "renders a list of service_items" do
    render
    assert_select "tr>td", :text => "No".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
