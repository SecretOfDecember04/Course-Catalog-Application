class ModifyAvailabilities2 < ActiveRecord::Migration[7.0]
  def change
    remove_column(:availabilities, :start_time, :datetime)
    remove_column(:availabilities, :end_time, :datetime)

    add_column(:availabilities, :start_time, :time)
    add_column(:availabilities, :end_time, :time)
    add_column(:availabilities, :day, :date)
  end
end
