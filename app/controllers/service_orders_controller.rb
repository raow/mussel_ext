class ServiceOrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @service_orders = @service_orders.page(params[:page])
    @service_orders = @service_orders.where(status: params[:status]) unless params[:status].blank?
  end

  def show
  end

  def edit
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)

    if @service_order.save
      redirect_to @service_order, notice: 'Service order was successfully created.'
    else
      render :new
    end
  end

  def update
    if @service_order.update(service_order_params)
      redirect_to @service_order, notice: 'Service order was successfully updated.'
    else
      render :edit
    end
  end

  private
  def service_order_params
    params.require(:service_order).permit(:no, :status, :service_vendor_id, :customer_id, :vendor_id, :appointed_time)
  end
end