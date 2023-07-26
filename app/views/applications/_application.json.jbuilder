json.extract!(application, :id, :student, :course, :created_at, :updated_at)
json.url(application_url(application, format: :json))
