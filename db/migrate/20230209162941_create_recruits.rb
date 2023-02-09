class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.string :name
      t.string :money
      t.text :detail

      t.timestamps
    end
  end
end
