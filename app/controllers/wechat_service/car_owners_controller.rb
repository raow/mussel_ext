class WechatService::CarOwnersController < ApplicationController
  skip_before_action :authenticate_user!
  #layout "wechat_service_application"
  
  def new
    @car_owner = CarOwner.new
    #render 'layouts/wechat_service_application'
  end

  def create
    @car_owner = CarOwner.new(car_owner_params)

    if @car_owner.save
      user = User.new
      user.email = "#{params[:open_id]}@weixin.com"
      user.car_owner = @car_owner
      user.save
      redirect_to success_car_owners_path
    else
      render action: 'new'
    end

  end

  def edit
    @car_owner = CarOwner.find_by_id(params[:id])
  end

  def update
    @car_owner = CarOwner.find_by_id(params[:id])
    if @car_owner.update_attributes(car_owner_params)
      redirect_to success_car_owners_path
    else
      render action: 'edit'
    end
  end

  def success
    render :layout => 'form'
  end

  private
  def car_owner_params
      params.require(:car_owner).permit(:name, :phone, :car_license_no)
  end

end