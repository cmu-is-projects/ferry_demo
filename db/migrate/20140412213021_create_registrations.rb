class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :camp_id
      t.integer :student_id
      t.string :payment_status
      t.integer :points_earned, default: 0

      # t.timestamps
    end
  end
end
