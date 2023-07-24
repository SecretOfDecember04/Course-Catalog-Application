class Section < ApplicationRecord
  has_many :enrollments, dependent: :destroy
end
