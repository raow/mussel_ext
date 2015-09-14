require 'rails_helper'

RSpec.describe "service_items/new", :type => :view do
  before(:each) do
    assign(:service_item, ServiceItem.new(
      :no => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new service_item form" do
    render

    assert_select "form[action=?][method=?]", service_items_path, "post" do

      assert_select "input#service_item_no[name=?]", "service_item[no]"

      assert_select "input#service_item_name[name=?]", "service_item[name]"
    end
  end
end
