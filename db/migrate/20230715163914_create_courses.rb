class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table(:courses) do |t|
      t.string(:course_number)
      t.string(:subject)
      t.string(:name)
      t.text(:description)
      t.string(:level)

      t.timestamps
    end
  end
end
