class Section < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  belongs_to :course
end
