class CreateSkiresots < ActiveRecord::Migration[6.1]
  def change
    create_table :skiresots do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
