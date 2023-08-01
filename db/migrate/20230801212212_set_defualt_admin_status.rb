class SetDefualtAdminStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :is_approved, :boolean, :default => false
  end
end
