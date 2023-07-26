json.extract!(course_taken, :id, :grader, :course, :created_at, :updated_at)
json.url(course_taken_url(course_taken, format: :json))
