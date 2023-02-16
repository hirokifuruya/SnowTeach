class Recruit < ApplicationRecord
  has_many :rabelings
  has_many :rabels, through: :rabelings
  has_many :requests, dependent: :destroy
  belongs_to :skiresort
end
