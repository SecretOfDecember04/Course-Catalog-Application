namespace :db do
  desc "Populate the database with initial course data from the OSU Classes API"
  task populate: :environment do
    api_service = ApiService.new
    search_params = {
      q: 'cse',
      campus: 'col',
      term: '1238'
    }
    # TODO: Handle sections
    # TODO: Handle pagination
    response = api_service.courses(search_params)

    courses = response.dig('data', 'courses')

    Course.delete_all

    courses&.each do |course|
      name = course.dig('course', 'title')
      course_number = course.dig('course', 'catalogNumber')
      subject = course.dig('course', 'subject')
      description = course.dig('course', 'description')
      level = course.dig('course', 'catalogLevel')

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
