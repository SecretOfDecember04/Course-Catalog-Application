class ChangeEnrollmentsSectionId < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key(:enrollments, :sections)
    add_column(:enrollments, :course_id, :string)
    add_foreign_key(:enrollments, :courses)
  end
end
