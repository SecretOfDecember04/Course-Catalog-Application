class FixAvailabilities < ActiveRecord::Migration[7.0]
  def change
    remove_column :sections, :instructor
    add_column :sections, :instructor_id, :integer
    add_foreign_key :sections, :users, column: :instructor_id
  end
end
