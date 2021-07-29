class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end
  def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :c_family_name, :c_first_name, :k_family_name, :k_first_name, :birthday ])  
  end
end