class WechatService::ServiceVendorsController < ApplicationController
  skip_before_action :authenticate_user!
  #layout "wechat_service_application"
  
  def index
    @service_vendors = ServiceVendor.all
    if params[:status] == "nearby"
      @service_vendors = ServiceVendor.where(province: "上海市")
    end
      
  end

  def show
    @service_vendor = ServiceVendor.find_by_id(params[:id])
  end
end
