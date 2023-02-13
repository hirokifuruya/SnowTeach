class ChangeSkiresotsToSkiresorts < ActiveRecord::Migration[6.1]
  def change
    rename_table :skiresots, :skiresorts
  end
end
