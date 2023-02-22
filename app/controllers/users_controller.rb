class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @requests = current_user.requests
  end
end

