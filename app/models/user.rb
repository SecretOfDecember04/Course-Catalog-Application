class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :course_takens, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  validates(:email, :first_name, :last_name, :role, :is_approved, presence: true)
end
