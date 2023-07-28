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
        section_number = section['classNumber']
        term = '1238'
        instruction_mode = section['instructionMode']
        graders = nil
        graders_required = 0
        days = { monday: 'Monday', tuesday: 'Tuesday', wednesday: 'Wednesday', thursday: 'Thursday', friday: 'Friday' }

        days_times = ""
        instructor = ""

        # Populate days_times
        meetings = section['meetings']
        meetings&.each do |meeting|
          days.each do |day, day_name|
            days_times += "#{day_name}: #{meeting['startTime']} - #{meeting['endTime']}, " if meeting[day.to_s]
          end
        end

        # Populate instructor
        instructors = section['instructors']
        instructors&.each do |single_instructor|
          instructor += "#{single_instructor['email']}, "
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
