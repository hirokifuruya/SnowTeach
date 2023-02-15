class ToRecruit < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :start_day, :datetime

    add_column :recruits, :end_day, :datetime
  end
end
