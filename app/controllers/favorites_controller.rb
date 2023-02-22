class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:favorite][:followed_id])
    current_user.favorites.create(followed_id: @user.id)
    redirect_to current_user
  end

  def destroy
    @user = Favorite.find(params[:id]).followed
    current_user.favorites.find_by(followed_id: @user.id).destroy
    redirect_to current_user
  end
end