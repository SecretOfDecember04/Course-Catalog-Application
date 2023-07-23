class Course < ApplicationRecord
  validates(:course_number, :subject, :name, presence: true)
  has_many :applications, dependent: :destroy
end
