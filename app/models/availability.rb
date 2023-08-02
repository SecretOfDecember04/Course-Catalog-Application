class Availability < ApplicationRecord
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true
  enum day: { Sunday: 0, Monday: 1, Tuesday: 2, Wednesday: 3, Thursday: 4, Friday: 5, Saturday: 6 }
end
