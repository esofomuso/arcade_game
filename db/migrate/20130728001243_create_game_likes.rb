class CreateGameLikes < ActiveRecord::Migration
  def change
    create_table :game_likes do |t|
      t.integer :game_id
      t.string :clicker_ip

      t.timestamps
    end
  end
end
