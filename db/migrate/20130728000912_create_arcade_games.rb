class CreateArcadeGames < ActiveRecord::Migration
  def change
    create_table :arcade_games do |t|
      t.string :name
      t.integer :year
      t.string :manufacturer
      t.string :notes
      t.boolean :is_active

      t.timestamps
    end
  end
end
