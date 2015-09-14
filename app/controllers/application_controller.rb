class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :filter_params#, :set_current_user
  layout :layout_by_resource

  private
  def filter_params
    resource = controller_name.singularize.to_sym
    action = action_name.singularize.to_sym
    method_each_action = "#{action}_#{resource}_params"
    method_all_in_one = "#{resource}_params"
    params[resource] &&= (send(method_each_action) if respond_to?(method_each_action, true)) || (send(method_all_in_one) if respond_to?(method_all_in_one, true))
  end

  # def set_current_user
  #   User.current_user = current_user
  # end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
      # case action_name 
      # when 'index' then 'list'
      # when 'show', 'new', 'edit', 'update', 'create' then 'form'
      # else 'application' end if controller_name != 'home'
    end
  end
end
