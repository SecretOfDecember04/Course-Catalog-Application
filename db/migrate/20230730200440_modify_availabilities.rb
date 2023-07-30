class ModifyAvailabilities < ActiveRecord::Migration[7.0]
  def change
    remove_column(:availabilities, :student, :string)
    remove_column(:availabilities, :term, :string)
    remove_column(:availabilities, :instructor_id, :string)
    remove_column(:availabilities, :start_time, :string)
    remove_column(:availabilities, :end_time, :string)
    remove_column(:availabilities, :day, :string)

    add_column(:availabilities, :user_id, :integer)
    add_column(:availabilities, :start_time, :datetime)
    add_column(:availabilities, :end_time, :datetime)

    add_foreign_key(:availabilities, :users, column: :user_id)
  end
end
