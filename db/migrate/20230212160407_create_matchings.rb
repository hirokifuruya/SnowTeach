class CreateMatchings < ActiveRecord::Migration[6.1]
  def change
    create_table :matchings do |t|
      t.string :status

      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
