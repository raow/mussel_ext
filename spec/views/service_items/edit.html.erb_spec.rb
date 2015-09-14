require 'rails_helper'

RSpec.describe "service_items/edit", :type => :view do
  before(:each) do
    @service_item = assign(:service_item, ServiceItem.create!(
      :no => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit service_item form" do
    render

    assert_select "form[action=?][method=?]", service_item_path(@service_item), "post" do

      assert_select "input#service_item_no[name=?]", "service_item[no]"

      assert_select "input#service_item_name[name=?]", "service_item[name]"
    end
  end
end
