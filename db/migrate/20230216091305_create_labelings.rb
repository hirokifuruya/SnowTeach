class CreateLabelings < ActiveRecord::Migration[6.1]
  def change
    create_table :labelings do |t|
      t.belongs_to :recruit, null: false, foreign_key: true
      t.belongs_to :label, null: false, foreign_key: true

      t.timestamps
    end

    add_index :labelings, [:recruit_id, :label_id], unique: true
  end
end
