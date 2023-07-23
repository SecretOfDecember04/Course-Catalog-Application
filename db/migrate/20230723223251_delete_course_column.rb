class DeleteCourseColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :sections, :campus
  end
end
