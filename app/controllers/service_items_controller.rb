class ServiceItemsController < ApplicationController
  load_and_authorize_resource

  def index
    @service_items = @service_items.page(params[:page])
  end

  def new
  end

  def edit
  end

  def create
    @service_item = ServiceItem.new(service_item_params)

    if @service_item.save
      redirect_to service_items_url, notice: 'Service item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @service_item.update(service_item_params)
      redirect_to service_items_url, notice: 'Service item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service_item.destroy
    redirect_to service_items_url, notice: 'Service item was successfully destroyed.'
  end

  private
  def service_item_params
    params.require(:service_item).permit(:no, :name)
  end
end