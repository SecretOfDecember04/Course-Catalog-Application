json.extract! course, :id, :course_number, :subject, :name, :description, :level, :created_at, :updated_at
json.url course_url(course, format: :json)
