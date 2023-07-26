namespace :db do
  desc "Populate the database with initial course data from the OSU Classes API"
  task populate: :environment do
    api_service = ApiService.new
    search_params = {
      q: 'cse',
      campus: 'col',
      term: '1238'
    }
    response = api_service.courses(search_params)

    courses = response.dig('data', 'courses')

    courses&.each do |course|
      name = course.dig('course', 'title')
      course_number = course.dig('course', 'catalogNumber')
      subject = course.dig('course', 'subject')
      description = course.dig('course', 'description')
      level = course.dig('course', 'academicCareer')

      Course.create(
        name:,
        course_number:,
        subject:,
        description:,
        level:
      )
    end
  end
end
