json.extract! recommendation, :id, :instructor, :student, :section_number, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
