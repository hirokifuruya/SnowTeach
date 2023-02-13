class ApplicationController < ActionController::Base
  before_action :check_admin_authorization
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_admin_authorization
    if request.path.start_with?('/admin')
    authorize! :access, :rails_admin
    end

    protected_methods
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
    end
  end
end
