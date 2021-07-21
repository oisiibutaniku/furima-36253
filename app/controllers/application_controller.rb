class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private
  def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :c_family_name, :c_first_name, :k_family_name, :k_first_name, :birthday ])  
  end
end