class Role < ApplicationRecord
  has_many :users
  validates :name, presence: true
  # attributes: name (string)

  def admin?
    name == 'admin'
  end
end