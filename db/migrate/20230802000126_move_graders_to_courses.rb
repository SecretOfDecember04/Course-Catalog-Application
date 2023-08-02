class MoveGradersToCourses < ActiveRecord::Migration[7.0]
  def change
    remove_column(:sections, :graders, :integer)
    remove_column(:sections, :graders_required, :integer)
    add_column(:courses, :graders, :integer)
    add_column(:courses, :graders_required, :integer)
  end
end
