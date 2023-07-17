class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :section_number
      t.string :course
      t.string :term
      t.string :campus
      t.string :instructor
      t.string :days_times
      t.string :instruction_mode
      t.integer :graders
      t.integer :graders_required

      t.timestamps
    end
  end
end
