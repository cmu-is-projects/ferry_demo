class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :name
      t.text :description
      t.integer :min_rating
      t.integer :max_rating
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
