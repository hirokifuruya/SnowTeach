class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    #@user = User.includes(:following, :followers, :instructors).find(params[:id])
    #@user = User.find(params[:id])
    @requests = current_user.requests
    #if current_user.role_id == 2
      #@favorite = current_user.favorites.new(followed: @user)
  #end
  end
end

