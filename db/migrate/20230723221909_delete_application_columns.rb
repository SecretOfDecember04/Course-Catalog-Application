class DeleteApplicationColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column(:applications, :student)
    remove_column(:applications, :course)
  end
end
