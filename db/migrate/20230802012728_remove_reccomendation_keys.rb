class RemoveReccomendationKeys < ActiveRecord::Migration[7.0]
  def change
    remove_column(:recommendations, :section_id, :integer)
    remove_column(:recommendations, :student_id, :integer)
    remove_column(:recommendations, :instructor_id, :integer)
    add_column :recommendations, :instructor, :string
    add_column :recommendations, :student, :string
    add_column :recommendations, :section_number, :integer
  end
end
