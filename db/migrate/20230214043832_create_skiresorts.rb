class CreateSkiresorts < ActiveRecord::Migration[6.1]
  def change
    create_table :skiresorts do |t|
      t.string :name
      t.string :address
      t.references :recruit, foreign_key: true

      t.timestamps
    end
  end
end
