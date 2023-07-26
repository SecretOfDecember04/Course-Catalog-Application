json.extract!(section, :id, :section_number, :course, :term, :campus, :instructor, :days_times, :instruction_mode,
              :graders, :graders_required, :created_at, :updated_at)
json.url(section_url(section, format: :json))
