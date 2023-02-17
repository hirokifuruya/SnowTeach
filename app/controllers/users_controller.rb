class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:following, :followers).find(params[:id])
  end
end

