class Api::ServiceOrdersController < Api::BaseController  
  protect_from_forgery except: [:index, :create]
  before_action :authenticate!
  before_action :load_service_order, only: [:show, :cancel, :complete, :refuse, :confirm]
  
  def index
    @service_orders = current_user.sale_orders.order("appointed_time desc").order("status desc")
  end

  def create
  end

  def show
  end

  def cancel
    @service_order.cancel unless @service_order.nil?
    render "show"
  end

  def complete
    @service_order.complete unless @service_order.nil?
    render "show"
  end

  def refuse
    @service_order.refuse unless @service_order.nil?
    render "show"
  end

  def confirm
    @service_order.confirm unless @service_order.nil?
    render "show"
  end

  private
  def load_service_order
    @service_order = current_user.sale_orders.find_by_no(params[:id])
    @code = "0000"
    @code = "8999" if @service_order.nil?
  end
end