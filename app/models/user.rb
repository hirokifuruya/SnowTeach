class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  belongs_to :role
  has_many :active_favorites, class_name: "Favorite", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_favorites, class_name: "Favorite", foreign_key: "followed_id", dependent: :destroy
  has_many :favorites, foreign_key: "follower_id", dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :recruit, dependent: :destroy


  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.email = 'guest@example.com'
      user.role_id = "3"
    end
  end

  def self.admin_guest
    find_or_create_by(email: 'admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.email = 'admin@example.com'
      user.role_id = "1"
    end
  end
end
