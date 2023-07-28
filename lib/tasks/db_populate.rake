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
    Section.delete_all

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

      sections = course['sections']
      sections&.each do |section|
        section_number = section.dig('sections', 'classNumber')
        term = '1238'
        instruction_mode = section.dig('sections', 'instructionMode')
        graders = nil
        graders_required = 0
        days = { monday: 'Monday', tuesday: 'Tuesday', wednesday: 'Wednesday', thursday: 'Thursday', friday: 'Friday' }
        
        days_times = ""
        instructor = ""

        # Populate days_times
        meetings = section.dig('sections', 'meetings')
        meetings&.each do |meeting|
          days.each do |day, day_name|
            days_times += "#{day_name}, " if meeting[day.to_s]
          end
          days_times += "#{meeting['startTime']} - #{meeting['endTime']}, "
          days_times = days_times.chomp(', ')
        end

        # Populate instructor
        instructors = section.dig('sections', 'instructors')
        instructors&.each do
          instructor += "#{section.dig('instructors', 'email')}, "
        end
        instructor = instructor.chomp(', ')
        
        Section.create(
          section_number:,
          term:,
          instruction_mode:,
          graders:,
          graders_required:,
          days_times:,
          instructor:
        )
      end
    end
  end
end
