class Skiresort < ApplicationRecord
  has_many :reserves, dependent: :destroy
end
