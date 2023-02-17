class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end
    add_index :favorites, :follower_id
    add_index :favorites, :followed_id
    add_index :favorites, [:follower_id, :followed_id], unique: true
  end
end
