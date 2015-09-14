require 'rails_helper'
require 'api_test_helper'

RSpec.describe Api::ServiceOrdersController, type: :controller do
  include ApiTestHelper

  before(:each) do
    @order = build(:service_order)
    @order.vendor = create(:vendor_user)
    @order.customer = create(:car_owner_user)
    @order.save
  end

  describe "Get orders" do
    render_views
    it "get all orders" do
      get :index, attach_auth_info({}, @order.vendor)
      expect(get_data("service_orders").length).to eq(1)
    end

    it "show order" do
      get :show, attach_auth_info({ id: @order.no }, @order.vendor)
      expect(get_data("service_order")["id"]).to eq(@order.no)
    end

    it "cancel order" do
      expect {
        post :cancel, attach_auth_info({ id: @order.no }, @order.vendor)
        expect(get_data("service_order")["status"]).to eq("已取消")
      }.to change { @order.reload.status }.to("已取消")
    end

    it "confirm order" do
      expect {
        post :confirm, attach_auth_info({ id: @order.no }, @order.vendor)
        expect(get_data("service_order")["status"]).to eq("已确认")
      }.to change { @order.reload.status }.to("已确认")
    end

    it "complete order" do
      expect {
        post :complete, attach_auth_info({ id: @order.no }, @order.vendor)
        expect(get_data("service_order")["status"]).to eq("已完成")
      }.to change { @order.reload.status }.to("已完成")
    end

  end
end