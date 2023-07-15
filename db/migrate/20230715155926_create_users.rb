class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table(:users, id: false) do |t|
      t.string(:email, null: false, primary_key: true)
      t.string(:first_name)
      t.string(:last_name)
      t.string(:role)
      t.boolean(:is_approved)

      t.timestamps
    end
  end
end
