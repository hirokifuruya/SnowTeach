class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :active_favorites, class_name: "Favorite", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_favorites, class_name: "Favorite", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_favorites, source: :followed
  has_many :followers, through: :passive_favorites, source: :follower
  has_many :favorites, foreign_key: "follower_id", dependent: :destroy
  has_many :requests, dependent: :destroy

  def follow(other_user)
    active_favorites.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_favorites.find_by(followed_id: other_user.id).destroy
  end

  def following
    @following ||= active_favorites.includes(followed: :favorites).map(&:followed)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end