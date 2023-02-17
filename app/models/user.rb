class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :requests, dependent: :destroy
  has_many :active_relationships, class_name: "Favorite", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Favorite", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    active_favorites.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_favorites.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
