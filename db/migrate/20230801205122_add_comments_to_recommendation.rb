class AddCommentsToRecommendation < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :comments, :text
  end
end
