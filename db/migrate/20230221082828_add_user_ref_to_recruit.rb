class AddUserRefToRecruit < ActiveRecord::Migration[6.1]
  def change
    add_reference :recruits, :user, null: false, foreign_key: true
  end
end
