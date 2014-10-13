class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :family_name
      t.string :parent_first_name
      t.string :email
      t.string :phone
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
