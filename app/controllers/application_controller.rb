class ApplicationController < ActionController::Base
  before_action :check_admin_authorization

  def check_admin_authorization
    if request.path.start_with?('/admin')
    authorize! :access, :rails_admin
    end
  end
end
