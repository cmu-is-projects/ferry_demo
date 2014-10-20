class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :max_capacity
      t.float :latitude
      t.float :longitude
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
