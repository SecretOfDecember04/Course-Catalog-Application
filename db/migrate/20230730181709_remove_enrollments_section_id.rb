class RemoveEnrollmentsSectionId < ActiveRecord::Migration[7.0]
  def change
    remove_column(:enrollments, :section_id, :integer)
    remove_column(:enrollments, :course_id, :string)
    add_column(:enrollments, :course_id, :integer)
    add_foreign_key(:enrollments, :courses)
  end
end
