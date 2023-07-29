namespace :db do
  desc "Populate the database with initial course data from the OSU Classes API"
  task populate: :environment do
    Course.delete_all
    Section.delete_all

    terms = { '1222' => 'Spring 2022', '1232' => 'Spring 2023', '1234' => 'Summer 2023', '1238' => 'Autumn 2023' }
    terms.each do |term_code, term_name|
      api_service = ApiService.new
      search_params = {
        q: 'cse',
        campus: 'col',
        term: term_code
      }

      response = api_service.courses(search_params)
    
      courses = response.dig('data', 'courses')

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
          term = term_code
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
          days_times = days_times.chomp(', ')

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
end
