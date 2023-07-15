class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table(:sections, id: false) do |t|
      t.string(:section_number, null: false, primary_key: true)
      t.string(:course)
      t.string(:term)
      t.string(:campus)
      t.string(:instructor)
      t.string(:days_times)
      t.string(:instruction_mode)
      t.integer(:graders_required)
      t.integer(:graders)

      t.timestamps
    end
  end
end
