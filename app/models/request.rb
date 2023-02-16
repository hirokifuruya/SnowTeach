class Request < ApplicationRecord
  belongs_to :user
  belongs_to :recruit

  enum status:{"承認待ち": 0, "承認済み": 1, "拒否": 2 }

  def start_time
    self.start_day
  end

  def end_time
    self.end_day
  end
end
