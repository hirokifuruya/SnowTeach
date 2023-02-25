class Role < ApplicationRecord
  has_many :users
  validates :name, presence: true

  def admin?
    name == 'admin'
  end
end