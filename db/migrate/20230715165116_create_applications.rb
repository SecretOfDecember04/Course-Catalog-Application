class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :student
      t.string :course

      t.timestamps
    end
  end
end
