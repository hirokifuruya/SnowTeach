class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :date
      t.integer :status

      t.references :recruit, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
