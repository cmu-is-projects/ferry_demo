class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :email
      t.string :phone
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
