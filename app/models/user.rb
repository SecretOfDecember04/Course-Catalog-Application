class User < ApplicationRecord
  has_many :course_takens, dependent: :destroy
  validates(:email, :first_name, :last_name, :role, :is_approved, presence: true)
end
