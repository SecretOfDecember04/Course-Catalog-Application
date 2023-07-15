class RenameGradersToStudents < ActiveRecord::Migration[7.0]
  def change
    rename_column(:course_takens, :grader, :student)
  end
end
