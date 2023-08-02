class Section < ApplicationRecord
  has_many :enrollments
  belongs_to :course
  validates :section_number, uniqueness: { scope: :term, message: "and term combination should be unique" }
end
