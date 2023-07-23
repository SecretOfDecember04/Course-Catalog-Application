class SectionsCourseColumnAdd < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :course_id, :integer
  end
end
