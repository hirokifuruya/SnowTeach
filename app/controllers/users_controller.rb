class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:following, :followers, :instructors).find(params[:id])
    @user = User.find(params[:id])
    if @user.role_id == 2 # インストラクターの場合
      @favorite = current_user.favorites.new(followed: @user)
    end
  end
end

