class Section < ApplicationRecord
  has_many :enrollments
  belongs_to :course

end
