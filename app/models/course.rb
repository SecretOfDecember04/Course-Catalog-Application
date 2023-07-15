class Course < ApplicationRecord
  validates(:course_number, :subject, :name, presence: true)
end
