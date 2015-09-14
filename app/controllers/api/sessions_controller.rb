class Api::SessionsController < Api::BaseController
  #skip_before_action :authenticate_user!, only: :create
  protect_from_forgery except: [:create, :refrush, :destroy]
  before_action :authenticate!, except: [:create]

  def create
    return_data = { code: nil, message: nil }
    unless params[:login].blank? || params[:password].blank?
      user = User.find_by_email(params[:login])
      unless user.nil?
        if user.valid_password?(params[:password])
          user.generate_authentication_token
          user.save(validate: false)
          sign_in(:user, user)
          return_data[:session] = {}
          return_data[:session][:auth_token] = user.authentication_token
          return_data[:code] = "0000"
          return_data[:message] = "成功."
        else
          return_data[:code] = "9987"
          return_data[:message] = "密码错误."
        end
      else
        return_data[:code] = "9988"
        return_data[:message] = "找不到该用户."
      end
    else
      return_data[:code] = "9989"
      return_data[:message] = "用户名和密码都不能为空."
    end
    render json: return_data
  end

  def refrush
    current_user.generate_authentication_token
    current_user.save(validate: false)
    render json: { code: "0", message: "成功.", session: { auth_token: current_user.authentication_token } }
  end

  def destroy
    current_user.authentication_token = nil
    current_user.save(validate: false)
    sign_out(current_user)
    render json: { code: "0", message: "成功." }
  end
end