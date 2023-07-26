class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table(:recommendations) do |t|
      t.string(:instructor)
      t.string(:student)
      t.string(:section_number)

      t.timestamps
    end
  end
end
