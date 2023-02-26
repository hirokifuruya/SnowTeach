class Recruit < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :requests, dependent: :destroy
  belongs_to :skiresort
  belongs_to :user

  validates :name, presence: true
  validates :detail, presence: true
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :skiresort_id, presence: true
end
