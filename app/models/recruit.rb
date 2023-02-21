class Recruit < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :requests, dependent: :destroy
  belongs_to :skiresort
  belongs_to :user
end
