class RecomendationsRemoveColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :recommendations, :instructor
    remove_column :recommendations, :student
    remove_column :recommendations, :section_number
    add_column :recommendations, :instructor_id, :integer
    add_column :recommendations, :student_id, :integer
    add_column :recommendations, :section_id, :integer
    add_foreign_key :recommendations, :users, column: :student_id
    add_foreign_key :recommendations, :users, column: :instructor_id
    add_foreign_key :recommendations, :sections, column: :section_id
  end
end
