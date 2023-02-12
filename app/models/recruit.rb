class Recruit < ApplicationRecord
  has_many :reserves, dependent: :destroy
end
