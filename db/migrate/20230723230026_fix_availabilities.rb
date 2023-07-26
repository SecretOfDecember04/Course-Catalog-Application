class FixAvailabilities < ActiveRecord::Migration[7.0]
  def change
    remove_column(:sections, :student)
    add_column(:sections, :student_id, :integer)
    add_foreign_key(:sections, :users, column: :student_id)
  end
end
