class AddShortDescriptionToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :short_description, :text
  end
end
