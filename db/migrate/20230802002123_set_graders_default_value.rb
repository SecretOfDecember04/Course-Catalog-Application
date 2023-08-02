class SetGradersDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:courses, :graders, from: nil, to: 0)
    change_column_default(:courses, :graders_required, from: nil, to: 0)
  end
  end
