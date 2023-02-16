class AddRecruitToSkiresort < ActiveRecord::Migration[6.1]
  def change
    add_reference :recruits, :skiresort, foreign_key: true
  end
end
