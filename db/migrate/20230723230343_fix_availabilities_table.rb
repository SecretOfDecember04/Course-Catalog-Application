class FixAvailabilitiesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column(:availabilities, :instructor)
    add_column(:availabilities, :instructor_id, :integer)
    add_foreign_key(:availabilities, :users, column: :instructor_id)
  end
end
