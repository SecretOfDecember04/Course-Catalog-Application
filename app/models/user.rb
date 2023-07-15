class User < ApplicationRecord
  validates(:email, :first_name, :last_name, :role, :is_approved, presence: true)
end
