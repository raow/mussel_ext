class ServiceVendorsController < ApplicationController
  load_and_authorize_resource

  def index
    @service_vendors = @service_vendors.page(params[:page])
  end

  def edit
  end

  def update
    if @service_vendor.update(service_vendor_params)
      redirect_to edit_service_vendor_url(@service_vendor), notice: '服务商信息更新成功.'
    else
      render :edit
    end
  end

  private
  def service_vendor_params
    params.require(:service_vendor).permit(:name, :contact, :province, :city, :region, :location_details, :latitude, :longtitude, :phone, :photo,
      { service_item_ids: [] })
  end

end