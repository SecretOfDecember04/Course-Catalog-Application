json.extract!(application, :id, :user, :course, :created_at, :updated_at)
json.url(application_url(application, format: :json))
