class ChangeTimeToTimeObjectInSection < ActiveRecord::Migration[7.0]
  def change
    remove_column(:sections, :start_time, :string)
    remove_column(:sections, :end_time, :string)
    add_column(:sections, :start_time, :time)
    add_column(:sections, :end_time, :time)
  end
end
