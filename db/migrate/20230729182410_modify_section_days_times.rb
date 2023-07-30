class ModifySectionDaysTimes < ActiveRecord::Migration[7.0]
  def change
    remove_column(:sections, :days_times, :string)
    add_column(:sections, :days, :string)
    add_column(:sections, :start_time, :string)
    add_column(:sections, :end_time, :string)
  end
end
