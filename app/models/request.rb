class Request < ApplicationRecord
  belongs_to :user
  belongs_to :reserve
  belongs_to :matching
end
