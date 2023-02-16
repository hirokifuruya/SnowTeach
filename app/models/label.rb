class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :recruits, through: :labelings
end
