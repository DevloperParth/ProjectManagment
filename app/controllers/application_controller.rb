class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.role == "admin"
      admin_admin_index_path
    elsif resource.role == "employe"
      employee_users_path
    elsif resource.role == "employer"
      employers_url
    else
    end
  end

 # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :role)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :role)}
  end
end
