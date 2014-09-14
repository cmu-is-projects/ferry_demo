class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :zone_id
      t.string :name

      t.timestamps
    end
  end
end
