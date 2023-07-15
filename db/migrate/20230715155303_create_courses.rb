class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table(:courses, id: false) do |t|
      t.string(:course_number, null: false, primary_key: true)
      t.string(:name)
      t.string(:subject)
      t.text(:description)
      t.string(:level)

      t.timestamps
    end
  end
end
