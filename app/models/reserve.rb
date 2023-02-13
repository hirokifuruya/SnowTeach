class Reserve < ApplicationRecord
  belongs_to :recruit
  belongs_to :skiresort
  has_many :requests, dependent: :destroy
end
