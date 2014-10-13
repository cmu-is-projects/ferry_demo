class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.integer :curriculum_id
      t.integer :cost
      t.date :start_date
      t.date :end_date
      t.string :time_slot
      t.integer :max_students
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
