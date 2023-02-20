class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @instructor = User.find(params[:favorite][:followed_id])
    if current_user.id != @instructor.id # 自分自身をお気に入りできないようにする
      current_user.favorites.create(followed_id: @instructor.id)
    end
    redirect_to current_user
  end

  def destroy
    @instructor = Favorite.find(params[:id]).followed
    current_user.favorites.find_by(followed_id: @instructor.id).destroy
    redirect_to current_user
  end
end
