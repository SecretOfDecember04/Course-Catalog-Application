class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :campus
      t.string :term
      t.string :component
      t.integer :catalog_number
      t.string :instruction_mode

      t.timestamps
    end
  end
end
