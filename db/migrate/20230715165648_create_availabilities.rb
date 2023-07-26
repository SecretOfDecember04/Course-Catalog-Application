class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table(:availabilities) do |t|
      t.string(:student)
      t.string(:term)
      t.string(:day)
      t.string(:start_time)
      t.string(:end_time)

      t.timestamps
    end
  end
end
