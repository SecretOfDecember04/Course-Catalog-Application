class UserIsApprovedDefault < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :is_approved
    add_column :users, :is_approved, :boolean, default: false
  end
end
