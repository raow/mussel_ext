require 'rails_helper'

RSpec.describe "service_items/show", :type => :view do
  before(:each) do
    @service_item = assign(:service_item, ServiceItem.create!(
      :no => "No",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/No/)
    expect(rendered).to match(/Name/)
  end
end
