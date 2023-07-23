class SectionsCourseColumnLink < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :sections, :courses, column: :course_id
  end
end
