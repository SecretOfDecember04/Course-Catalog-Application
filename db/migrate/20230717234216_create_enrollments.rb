class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table(:enrollments) do |t|
      t.integer(:user_id)
      t.integer(:section_id)

      t.timestamps
    end
  end
end
