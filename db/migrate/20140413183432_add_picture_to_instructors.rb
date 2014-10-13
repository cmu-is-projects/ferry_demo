class AddPictureToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :picture, :string
  end
end
