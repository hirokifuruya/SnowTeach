class Skiresot < ApplicationRecord
  has_many :reserves, dependent: :destroy
end
