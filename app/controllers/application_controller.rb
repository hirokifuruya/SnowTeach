class ApplicationController < ActionController::Base
  before_action :check_admin_authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def check_admin_authorization
    if request.path.start_with?('/admin')
      authorize! :access, :rails_admin
    end
  end

  protected_methods

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end

  def after_sign_in_path_for(resource)
    current_user
  end

  def after_sign_out_path_for(resource)
    welcome_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to recruits_path, alert: "あなたは入れません。"
  end

  def not_authenticated
    redirect_to root_path
  end
end
