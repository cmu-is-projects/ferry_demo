class CreateCampInstructors < ActiveRecord::Migration
  def change
    create_table :camp_instructors do |t|
      t.integer :camp_id
      t.integer :instructor_id

      # t.timestamps
    end
  end
end
