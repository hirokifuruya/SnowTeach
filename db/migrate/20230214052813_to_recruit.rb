class ToRecruit < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :start_day, :date

    add_column :recruits, :end_day, :date
  end
end
