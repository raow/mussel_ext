class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.build_service_vendor
    respond_with self.resource
  end

  # def after_sign_up_path_for(resource)
  #   "/admins/waiting_for_approve"
  # end

  # def after_inactive_sign_up_path_for(resource)
  #   "/admins/waiting_for_approve"
  # end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, 
      :service_vendor_attributes => [:name, :contact, :phone, :province, :city, :region, :location_details]]
    params.require(resource_name).permit(allow)
  end

end