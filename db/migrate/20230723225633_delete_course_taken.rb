class DeleteCourseTaken < ActiveRecord::Migration[7.0]
  def change
    drop_table :course_takens
  end
end
