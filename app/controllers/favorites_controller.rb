class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:favorite][:follower_id])
    if current_user.id != @user.id # 自分自身をお気に入りできないようにする
      current_user.favorites.create(followed_id: @user.id)
    end
    redirect_to current_user
  end

  def destroy
    @user = Favorite.find(params[:id]).followed
    current_user.favorites.find_by(followed_id: @user.id).destroy
    redirect_to current_user
  end
end
