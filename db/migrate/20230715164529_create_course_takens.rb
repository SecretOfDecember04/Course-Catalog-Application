class CreateCourseTakens < ActiveRecord::Migration[7.0]
  def change
    create_table(:course_takens) do |t|
      t.string(:grader)
      t.string(:course)

      t.timestamps
    end
  end
end
