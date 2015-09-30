class WechatService::ServiceOrdersController < ApplicationController
  before_action :load_service_order, only: [:cancel, :complete, :refuse, :confirm]
  skip_before_action :authenticate_user!
  #layout "wechat_service_application"
  

  def index
    # @service_vendors = ServiceVendor.where('id in (select service_vendor_id from service_orders where customer_id = :customer_id)', :customer_id => params[:customer_id])
    @service_orders = ServiceOrder.where(customer_id: params[:wechat_user]).where.not(status: "已取消").order(appointed_time: :asc)
    @user = User.find_by_id(params[:wechat_user])

  end


  def create
    service_order = ServiceOrder.new

    user = User.find_by_id(params[:wechat_user])
    appointed_dt = Time.now
    unless params[:service_month].nil? && params[:service_day].nil? && params[:service_hour].nil? && params[:service_minute]
      appointed_dt = Time.local(Time.now.year, params[:service_month], params[:service_day], params[:service_hour], params[:service_minute]) 
    end

    service_vendor = ServiceVendor.find_by_id(params[:service_vendor_id])

    service_order.customer = user
    service_order.service_vendor = service_vendor
    service_order.service_item_id = params[:service_item_id]
    service_order.appointed_time = appointed_dt

    if service_order.save
      redirect_to request.referer
    end
  end

  def cancel
    @service_order.cancel unless @service_order.nil?
    redirect_to request.referer
  end

  def complete
    @service_order.complete unless @service_order.nil?
    redirect_to request.referer
  end

  def refuse
    @service_order.refuse unless @service_order.nil?
    redirect_to request.referer
  end

  def confirm
    @service_order.confirm unless @service_order.nil?
    redirect_to request.referer
  end

  private
  def load_service_order
    @service_order = ServiceOrder.find_by_id(params[:id])
  end


end
