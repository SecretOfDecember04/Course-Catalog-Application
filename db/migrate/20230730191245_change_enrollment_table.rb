class ChangeEnrollmentTable < ActiveRecord::Migration[7.0]
  def change
    remove_column(:enrollments, :course_id, :integer)
    add_column(:enrollments, :course_name, :string)
    add_column(:enrollments, :grade, :string, limit: 1)
  end
end
