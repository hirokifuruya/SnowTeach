class FavoritesController < ApplicationController
  before_action :authenticate_user!


  def create
    @user = User.find(params[:favorite][:followed_id])
    if current_user.id != @user.id # 自分自身をフォローできないようにする
      current_user.active_favorites.create(followed_id: @user.id)
    end
    redirect_to @user
  end



  def destroy
    @user = Favorite.find(params[:id]).followed
    current_user.active_favorites.find_by(followed_id: @user.id).destroy
    redirect_to @user
  end
end