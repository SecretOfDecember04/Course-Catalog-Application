class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :enrollments, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  validates(:email, format: { with: /\b[A-Z0-9._%a-z\-]+@osu\.edu\z/, message: "must be a @osu.edu account" })
  validates(:first_name, :last_name, :role, presence: true)
end
