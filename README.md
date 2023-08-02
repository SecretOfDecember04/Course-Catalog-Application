# OSU CSE Course Catalog Application

## Overview

This project is a web-based system developed with Ruby and Rails that aims to automate and streamline the process of hiring qualified undergraduate students as graders at the CSE department. This application facilitates the seamless matching of students to course sections, thereby improving the consistency and efficiency of information gathering.

The program utilizes an API to fetch and process publicly available course and section information from the OSU course catalog, limiting retrieval to the CSE department courses. The application supports sign-up, log-in, and log-out functionality for Student, Instructor, and Admin users. The system also provides a view for reloading the database only accessible to an Admin user and a view for displaying the available courses and sections accessible to all users.

The application offers three key user functionalities:

1. **Student Functionality:** Students can log in and browse the course catalog.
2. **Instructor Functionality:** Similar to students, instructors can log in and explore the course catalog.
3. **Admin Functionality:** An Administrator can perform various tasks like browsing, editing, reloading the course catalog, and approving Instructor or Admin requests.

The application is extended with additional functionalities like application submission for grading positions, an administrator interface for hiring and assignment decisions, management of available courses or sections, and a standard form for instructor recommendations. The application is developed using gems like 'devise' (for login/logout functionality) and 'pagy' (for pagination).

While this system significantly reduces administrative efforts, it also empowers students and instructors, offering them a platform to view, apply, or recommend grader positions in a more organized and efficient manner.

## Installation Steps

### Prerequisites
Make sure that you have set up the developenvironment and have the following requests installed:
* Ruby v3.2.0
* Rails v7.0

### Configuration
1. Clone https://github.com/cse-3901-sharkey/2023-SU-Team-6-lab-2
2. Navigate to the application folder
   ```bash
   cd 2023-SU-Team-6-lab-2
   ```
3. Install the necessary gems
    ```bash
    bundle install
    ```
4. Create and initialize the database
    ```bash
    rails db:create db:migrate
    ```
5. Populate the database with the first pre-existing admin. This command will also generate courses from OSU API
    ```bash
    rails db:populate
    ```
6. Run the following command to launch the server
   ```bash
   rails server
   ```
   You can then visit [http://localhost:3000](http://localhost:3000) on your browser to see the application.
   At the same time, you will receive the following prompt in the console: 
   ```
   Default admin user created! 
   Email: admin@osu.edu, Password: password
   ```
    Use this default admin user to log in to the website.

### Load Course Data

After the user logs in as an administrator, click on the "Reload Courses" button located on the right side of the course search bar.

Click "Reload Courses". This will load all courses from the OSU API.

## Database Schema

![Database Schema](/media/schema.png)

Our database schema is created in Ruby on Rails using Active Record Migrations. The schema structures the data we store in our SQL database, defining each table's fields and data types. 

The database consists of eight tables:

1. **applications:** Stores the applications from students who want to be considered for grading positions. 

Fields include:
- `created_at`: Timestamps of when the application was created.
- `updated_at`: Timestamp of the last update of the application.
- `user_id`: The user's id. Foreign key related to 'users' table.
- `course_id`: The course's id for which the application is made. Foreign key related to 'courses' table.
- `approved`: Boolean value indicating whether the application is approved.

2. **availabilities:** Stores the available hours of the users.

Fields include:
- `created_at`: Timestamp when the record was created.
- `updated_at`: Timestamp when the data was last updated.
- `user_id`: Foreign key related to the 'users' table.
- `start_time`: The time at which the user's availability begins.
- `end_time`: The time at which the user's availability ends.
- `day`: Day of the week when the user is available.

3. **courses:** Contains data related to all the courses.

4. **enrollments:** Contains data related to the course enrolment of each user.

5. **recommendations:** Stores the recommendations given by instructors for students.

6. **sections:** Contains data related to the sections of each course.

7. **users:** Contains data for each user. All users have a role which is either Student, Instructor, or Admin, depending on the role

Each table has relationships defined with other tables in the system using foreign keys, enabling more complex queries and join operations. For example, the `sections` table has relationships with both `courses` and `users`. 

## User Guide

### Sign up

If you’re not already an admin, you’ll need to sign up for the app. Just hit the “Sign Up” button on the login page to get to the registration form. Fill in your details and specify your role as Admin, Student, or Instructor, then click “Sign Up” to create your account.

![Sign up](/media/Sign%20up%20page.png)

Only users with Ohio State University emails in the format `name.#@osu.edu` can sign up for the app. You must input an email and password to sign up successfully. Otherwise, you’ll receive an error. You can adjust these details later in the “Edit Account” section. New Admins and Instructors will initially have the same privileges as Students - solely browsing the database - because they must receive approval from an existing admin after signup.

### Login

![Login in](/media/Login%20Page.png)

You can log in from the landing page if you have an existing account. If the app detects a pre-existing session, it will auto-authenticate and direct you to the user's home page. If this isn’t the case, sign in using your email and password. Select “Remember Me” if your browser wishes to save your credentials.

### Admin Home Page

Upon signing in as an approved admin, your homepage will look like this:

![Admin Course Catalog](/media/Admin%20Course%20Catalog.png)

As an approved admin, you can browse and modify the course catalog, approve new instructor/admin requests, reload the courses, and authorize student graders. The top-right navigation bar enables you to visit different pages in this application.

By clicking “Home” on the screen, a paginated list of CSE courses in the database appears, displaying relevant course details.

To view specific course details, click “Show this course” next to that course. You can edit each course by clicking “Edit” on the same column or “Delete” to delete the course.

You can look for courses by number, name, term, or campus using the catalog’s search bar. Input your search and click the “Search” button.

For instance, typing “Software” and clicking the “Search” button will reveal courses with “Software” in their name.

![Search](/media/Search.png)

You can also filter courses by term.

![Sorting by Term](/media/Sorting%20by%20term.png)

To create a course, please click the “New Course” button to the right of the search box and enter the detailed information for the new course.

![New Course](/media/New%20Course.png)

### Student Home page 

![Student Home Page](/media/Student%20Home%20Page.png)

Upon signing as approved student. You will have many similar view as the admin. Where you can view all the courses within the course catalog, you will have the search functionality to help you search better with the specific course that you need. Furthermore, you will also have many other functionality such as Application where you can apply for becoming a specific courses grader. You will also have the course history where is a self report course history you can use it to record all the courses that you took. You will also have Availability section where you can select the time apvailiabity. Lastly, you will also have the profile page and the sign out functionality. However, a student view is very much different from a admin view. Which admin view can view all the pending application, approved application, and the courses needing graders tables. Admin also have the ability to approved the application. Furthermore, admin has some specific functionality such as modify courses, delete courses, and add courses that student view doesn't have.

### Request Approval

Already-approved admins can see and approve others - instructors and admins - currently pending. To view this list, select “Admin Portal” from the navigation bar.

![Admin Portal Users](/media/Admin%20portal%20users.png)

### Grader Application Management

![Application](/media/Application.png)

Admins can oversee student grader applications, including the approval or rejection process. By selecting “Admin Portal” from the navigation bar, admins can see a list of pending applications, each showing the individual’s email, applied term, and course and the options to view, approve or reject their application.

Besides the pending applications, a list of approved ones is also visible; Admins can delete approved applications if they decide to withdraw students’ acceptance.

![Show Application 1](/media/Show_Application_1.png)
![Show Application 2](/media/Show_Application_2.png)

Selecting “Show this application” for an application allows it to be viewed in detail, including personal information, applied term, availability, courses taken, along with sections requiring graders. After considering, admins can approve the application, reject the application, or return to the former page via options at the bottom.

### Recommendations

As an admin or instructor, you can also write recommendations for students for other instructors to refer to.

![Recommendation](/media/New%20Recommendation.png)


### Student Home Page

The Home Page seen by both students and admins is more or less the same, but students are not able to make any changes to courses and sections.

Upon signing as an approved student. You will have many similar views as the admin. Where you can view all the courses within the course catalog, you will have the search functionality to help you search better with the specific course that you need. Furthermore, you will also have many other functionality, such as Application where you can apply to become a particular grader. You will also have the course history, a self-report course history you can use to record all the courses you took. You will also have Availability section where you can select the time availability. Lastly, you will also have the profile page and the sign-out functionality. However, a student view is very much different from an admin view. Which admin view can view all the pending applications, approved applications, and the courses needing graders tables. Admin also can support the application. Furthermore, admin has specific functionality such as modifying courses, deleting courses, and adding systems that student view doesn't have.

![Student Home Page 1](/media/Course%20catalog.png)
![Student Home Page 2](/media/Course%20catalog2.png)

### Application

Students can directly click the Apply button on the Home Page to apply to become a grader for this course, or they can click on the navigation bar in the upper right corner to enter the Applications page and select course applications.

![Application](/media/Application%20page.png)
![Creating Application](/media/Creating%20application.png)

### Enrollment History

Students can self-report the courses they have taken and the grades they have received on the Course History page for instructors' reference. However, it is important to note that self-reporting does not guarantee authenticity.

![New Enrollment](/media/New%20Enrollemnt.png)

### Availability

Students can select their availability on the Availability page, and only students whose free time coincides with the course schedule will be selected as graders. Please note that due to the design, students need to individually select their available time for each day of the week.

![Availability](/media/Availability%20slot.png)