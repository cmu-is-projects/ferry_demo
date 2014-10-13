class AddLocationIdToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :location_id, :integer 
  end
end
