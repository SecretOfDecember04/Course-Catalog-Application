class ModifyApplications < ActiveRecord::Migration[7.0]
  def change
    add_column(:applications, :approved, :boolean)
  end
end
