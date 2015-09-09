class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_owner!, except: [:after_sign_up_path_for]

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    new_session_path(resource)
  end

  def after_inactive_sign_up_path_for
    new_session_path(resource)
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:company_name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email,   :password, :password_confirmation, :current_password, :company_name) }
    end

end
