class RenameRabelsToLabels < ActiveRecord::Migration[6.1]
  def change
    rename_table :rabels, :labels
  end
end
