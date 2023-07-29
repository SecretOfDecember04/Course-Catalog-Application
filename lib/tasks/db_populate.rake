namespace :db do
  desc "Populate the database with initial course data from the OSU Classes API"
  task populate: :environment do
    Course.delete_all
    Section.delete_all

    terms = { '1232' => 'Spring 2023', '1234' => 'Summer 2023', '1238' => 'Autumn 2023' }
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
        term_courses = term_code

        course_entry = Course.create(
          name:,
          course_number:,
          subject:,
          description:,
          level:,
          term: term_courses
        )

        sections = course['sections']
        sections&.each do |section|
          section_number = section['classNumber']
          term_sections = term_code
          instruction_mode = section['instructionMode']
          graders = 0
          graders_required = 0

          days_hash = { monday: 'Monday', tuesday: 'Tuesday', wednesday: 'Wednesday', thursday: 'Thursday', friday: 'Friday' }
          days = ""
          start_time = ""
          end_time = ""
          instructor = ""

          # Populate days
          meetings = section['meetings']
          meetings&.each do |meeting|
            days_hash.each do |day, day_name|
              days += "#{day_name}, " if meeting[day.to_s]
              start_time = meeting['startTime']
              end_time = meeting['endTime']
            end
          end
          days = days.chomp(', ')

          # Populate instructor
          instructors = section['instructors']
          instructors&.each do |single_instructor|
            instructor += "#{single_instructor['email']}, "
          end
          instructor = instructor.chomp(', ')

          course_entry.sections.create(
            section_number:,
            term: term_courses,
            instruction_mode:,
            graders:,
            graders_required:,
            days:,
            start_time:,
            end_time:,
            instructor:
          )
        end
      end
    end
  end
end
