class CreateRabels < ActiveRecord::Migration[6.1]
  def change
    create_table :rabels do |t|
      t.string :name

      t.timestamps
    end
  end
end
