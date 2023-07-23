class LinkEnrollmentsToUsersAndSections < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :enrollments, :users, column: :user_id
    add_foreign_key :enrollments, :sections, column: :section_id
  end
end
