class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.integer :date
      t.references :recruit, foreign_key: true
      t.references :skiresot, foreign_key: true

      t.timestamps
    end
  end
end
