class Course < ApplicationRecord
  validates(:course_number, :subject, :name, presence: true)
  has_many :applications, dependent: :destroy
  has_many :sections, dependent: :destroy

  def self.sorted_by_course_number(sort_order)
    if sort_order == 'desc'
      order("CAST(course_number AS INTEGER) DESC")
    else
      order("CAST(course_number AS INTEGER) ASC")
    end
  end

  def full_course
    "#{course_number} - #{name}"
  end
end


