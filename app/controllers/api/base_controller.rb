class Api::BaseController < ApplicationController
  skip_before_action :authenticate_user!

  attr_accessor :current_car_owner, :current_service_vendor, :current_user

  private
  def authenticate!
    unless params[:auth_token].blank?
      user = User.find_by_authentication_token(params[:auth_token])
      unless user.nil?
        # pass through
        @current_user = user
        @current_car_owner = user.car_owner
        @current_service_vendor = user.service_vendor
        @code = "0000"
      else
        render json: { code: "9999", message: "Token已经过期." }
      end
    else
      render json: { code: "9998", message: "Token不能为空." }
    end
  end
end