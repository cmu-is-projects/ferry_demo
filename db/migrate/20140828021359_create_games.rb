class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.string :location
      t.datetime :time
      t.integer :week

      t.timestamps
    end
  end
end
