class ChangeDayColumnTypeInAvailabilities < ActiveRecord::Migration[7.0]
  def change
    change_column :availabilities, :day, :integer
  end
end
