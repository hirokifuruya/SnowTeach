class Reserve < ApplicationRecord
  belongs_to :recruit
  belongs_to :skiresot
  has_many :requests, dependent: :destroy
end
