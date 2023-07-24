class AddAvailabilityToUser < ActiveRecord::Migration[7.0]
  def change
    add_column(:users, :availabilities, :string)
  end
end
