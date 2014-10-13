class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :family_id
      t.date :date_of_birth
      t.integer :rating, default: 0
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
