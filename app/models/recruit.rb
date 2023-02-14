class Recruit < ApplicationRecord
  has_many :requests, dependent: :destroy
  belongs_to :skiresorts
end
